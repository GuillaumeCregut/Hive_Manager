<?php
/* Smarty version 3.1.30, created on 2021-07-12 20:57:25
  from "C:\wamp64\www\Gestion_Rucher\templates\save_carto.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_60ecacb5aa8210_77560491',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'd7a086474ddaeb7a254c53104b896995a629810d' => 
    array (
      0 => 'C:\\wamp64\\www\\Gestion_Rucher\\templates\\save_carto.tpl',
      1 => 1626114548,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:entete_carto_rucher.html' => 1,
  ),
),false)) {
function content_60ecacb5aa8210_77560491 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:entete_carto_rucher.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<link rel="stylesheet" href="style/default/rucher.css">
</head>
<body>
   <header>
		<h1 id="titre"> Gestion du rucher - Cartographie</h1>
	</header>
	<section>
		<?php if (isset($_smarty_tpl->tpl_vars['Nom_Fichier']->value)) {?>
		<p><a href=<?php echo $_smarty_tpl->tpl_vars['Nom_Fichier']->value;?>
><img src=<?php echo $_smarty_tpl->tpl_vars['Nom_Fichier']->value;?>
 alt=""></a><br>Cliquez sur l'image pour la t&eacute;l&eacute;charger</p>
		<?php }?>
		<?php if (isset($_smarty_tpl->tpl_vars['Erreur']->value)) {?>
		<p><?php echo $_smarty_tpl->tpl_vars['Erreur']->value;?>
</p>
		<?php }?>
		<p><a href="voir_rucher.php" id="LienRetour">Retour au rucher</a></p>
	</section><?php }
}
