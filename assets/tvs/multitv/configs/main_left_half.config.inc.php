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
    'name' => array(
        'caption' => 'Имя автора',
        'type' => 'text'
    ),
    'part1' => array(
        'caption' => 'Часть 1',
        'type' => 'text'
    ),
    'part2' => array(
        'caption' => 'Часть 2',
        'type' => 'text'
    )
);
$settings['templates'] = array(
    'outerTpl' => '<div class="half left">[+wrapper+]</div>',
    'rowTpl' => '<h2>[+title+]</h2>
            <p>[+name+]</p>
            <div class="img_frame img_frame_14 img_fl"><span></span>
                <img src="[[phpthumb? &input=`[+image+]` &options=`w=203,h=108,zc=1,bg=FFFFFF`]]" />
            </div>
            <p><em>[+part1+]</em></p>
            <p>[+part2+]</p>'
);
