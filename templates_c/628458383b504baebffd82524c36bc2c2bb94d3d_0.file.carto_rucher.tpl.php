<?php
/* Smarty version 3.1.30, created on 2021-07-12 20:57:17
  from "C:\wamp64\www\Gestion_Rucher\templates\carto_rucher.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_60ecacad7642b5_68059032',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '628458383b504baebffd82524c36bc2c2bb94d3d' => 
    array (
      0 => 'C:\\wamp64\\www\\Gestion_Rucher\\templates\\carto_rucher.tpl',
      1 => 1626114549,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:entete_carto_rucher.html' => 1,
  ),
),false)) {
function content_60ecacad7642b5_68059032 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:entete_carto_rucher.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

	<link rel="stylesheet" href="style/default/rucher_rucher.css">
	<link rel="stylesheet" href="style/default/rucher.css">
	<link rel="stylesheet" href="style/default/carto.css">
	<?php echo '<script'; ?>
  src="script/classes/ruche.js"><?php echo '</script'; ?>
>
	<?php echo '<script'; ?>
  src="script/classes/rucher.js"><?php echo '</script'; ?>
>
	<?php echo '<script'; ?>
  src="script/loader_rucher.js"><?php echo '</script'; ?>
>
</head>
<body>
   <header>
		<h1 id="titre"> Gestion du rucher - Cartographie</h1>
	</header>
	<section>
	<canvas id="canvas">Votre navigateur ne supporte pas le canvas</canvas>
	<form name="monform" id="monform" method="post" action="save_carto.php">
		<p><input type="button" name="Btn_Save" id="Btn_Save" value="Sauvegarder" onclick="Sauvegarde()"></p>
		<input type="hidden" name="Image_Ruche" value="" id="Image_Ruche">
	</form>
	<p><a href="voir_rucher.php" id="LienRetour">Retour au rucher</a></p>
	</section><?php }
}
