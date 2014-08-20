# @author ben7th

class FitImage
  constructor: (@$elm)->
    @$elm.addClass('initialized')

    @src = @$elm.data('src')
    @alt = @$elm.data('alt') || ''

    @loaded = false

  ###
    检查图片容器是否在屏幕内
    只要有一点在屏幕内都算在屏幕内
    用于支持 lazy load
  ###
  is_in_screen: ->
    width  = @$elm.width()
    height = @$elm.height()
    offset = @$elm.offset()

    $win = jQuery(window)
    window_width  = $win.width()
    window_height = $win.height()
    scroll_left   = $win.scrollLeft()
    scroll_top    = $win.scrollTop()
    
    left   = offset.left - scroll_left
    top    = offset.top - scroll_top
    right  = left + width
    bottom = top + height

    return false if right < 0
    return false if bottom < 0
    return false if left > window_width
    return false if top > window_height

    return true


  # 根据 url 加载图片
  load_image: ->
    return if !@is_in_screen()
    return if @loaded

    @$elm.css('overflow', 'hidden')

    if !@src
      console.log('simple-images: fit_image_load() need data-src attr.')
      return

    @$img = jQuery("<img style='display:none;'/>")
            .attr('src', @src)
            .attr('alt', @alt)
            .one 'load', =>
              @loaded = true
              @resize_image()
              @$img.fadeIn(250)
            .appendTo(@$elm.empty().show())

  resize_image: ->
    return if !@loaded

    box_width  = @$elm.width()
    box_height = @$elm.height()

    img_width  = @$img.width()
    img_height = @$img.height()

    # step 1 如果宽度不等，调齐宽度，计算高度
    w1 = box_width
    if img_width != box_width
      h1 = img_height * box_width / img_width
    else
      h1 = img_height
    
    # step 2 如果此时高度不足，补齐高度
    if h1 < box_height
      rh = box_height
      rw = w1 * box_height / h1
    else
      rh = h1
      rw = w1

    # set position
    left = (box_width  - rw) / 2
    top  = (box_height - rh) / 2

    @$img.css
      'width'       : rw
      'height'      : rh
      'margin-left' : left
      'margin-top'  : top

# ----------------

fit_images = []

refresh_fit_image = ->
  jQuery('div.page-fit-image[data-src]').not('.initialized').each ->
    $elm = jQuery(this)
    fit_image = new FitImage($elm)
    fit_image.load_image()
    fit_images.push fit_image

jQuery(document).on 'ready page:load mindpin:new-content-appended', ->
  refresh_fit_image()

  jQuery('[data-scroller]')
    .off 'scroll'
    .on 'scroll', ->
      for fi in fit_images
        fi.load_image()

jQuery(window).resize ->
  for fi in fit_images
    fi.load_image()
    fi.resize_image()

jQuery(window).scroll ->
  for fi in fit_images
    fi.load_image()