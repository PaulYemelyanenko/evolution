<?php
$settings['display'] = 'vertical';
$settings['fields'] = array(
    'image' => array(
        'caption' => 'Image',
        'type' => 'image'
    ),
    'thumb' => array(
        'caption' => 'Thumbnail',
        'type' => 'thumb',
        'thumbof' => 'image'
    ),
    'title' => array(
        'caption' => 'Заголовок',
        'type' => 'text'
    ),
    'content' => array(
        'caption' => 'Контент',
        'type' => 'text'
    )
);
$settings['templates'] = array(
    'outerTpl' => '<div id="content" class="left">[+wrapper+]</div>',
    'rowTpl' => ' <div class="post">
            <div class="post_header">
                <h2>[+title+]</h2>
            </div>
            <div class="post_date">
                [*createdon:date=`%d`*]
                <span class="month">[*createdon:date=`%m`*]</span>
                <span class="year">[*createdon:date=`%Y`*]</span>
            </div>
            <div class="clear h20"></div>
            <div class="img_frame img_frame_23 img_nom"><span></span><img src="[[phpthumb? &input=`[+image+]` &options=`w=616,h=216,zc=1,bg=FFFFFF`]]" /></div>
            <p>[+content+]</p>
            <a href="[+url+]" class="more">More</a>
        </div>'
);
