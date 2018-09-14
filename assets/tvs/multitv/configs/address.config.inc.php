<?php
$settings['display'] = 'vertical';
$settings['fields'] = array(
    'title' => array(
        'caption' => 'Заголовок',
        'type' => 'text'
    ),
    'company' => array(
        'caption' => 'Имя компании',
        'type' => 'text'
    ),
    'address' => array(
        'caption' => 'Адрес',
        'type' => 'text'
    ),
    'phone' => array(
        'caption' => 'Телефон',
        'type' => 'text'
    ),
    'email' => array(
        'caption' => 'Email',
        'type' => 'text'
    )
);
$settings['templates'] = array(
    'outerTpl' => '<div class="half right">[+wrapper+]</div>',
    'rowTpl' => '<h4>[+title+]</h4>
        <h6><strong>[+company+]</strong></h6>
          	[+address+]<br /><br />
				
		<strong>Phone:</strong> [+phone+] <br />
        <strong>Email:</strong> <a href="mailto:[+email+]">[+email+]</a>  <br />
        <div class="cleaner h40"></div>'
);
