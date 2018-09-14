<?php
$settings['display'] = 'vertical';
$settings['fields'] = array(
    'image' => array(
        'caption' => 'Изображение',
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
    'outerTpl' => '<div class="container">[+wrapper+]</div>',
    'rowTpl' => '<div class="col one_third">
                <div class="img_frame img_frame_13 img_nom"><span></span>
                <img src="[[phpthumb? &input=`[+image+]` &options=`w=284,h=161,zc=1,bg=FFFFFF`]]" />
            </div>
            <h4>[+title+]</h4>
            <p>[+content+]</p>
            </div>'
);
