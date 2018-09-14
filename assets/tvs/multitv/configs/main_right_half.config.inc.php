<?php
$settings['display'] = 'vertical';
$settings['fields'] = array(
    'title' => array(
        'caption' => 'Заголовок',
        'type' => 'text'
    ),
    'undertitle' => array(
        'caption' => 'Подзаголовок',
        'type' => 'text'
    ),
    'content' => array(
        'caption' => 'Контент',
        'type' => 'text'
    )
);
$settings['templates'] = array(
    'outerTpl' => '<div class="half right">[+wrapper+]</div>',
    'rowTpl' => '<h2>[+title+]</h2>
            <p><em>[+undertitle+]</em></p> 
            <p>[+content+]</p>
            <ul class="list_bullet">
          <li class="flow"> Cum sociis natoque penatibus et magnis dis parturient</li>
                <li class="flow"> Donec et dui malesuada neque malesuada</li>
                <li class="flow"> Suspendisse faucibus placerat risus</li>
                <li class="flow"> Aliquam bibendum tortor ac ipsum euismod cursus</li>
                <li class="flow"> Quisque elementum ipsum eu justo iaculis</li>
            </ul>'
);
