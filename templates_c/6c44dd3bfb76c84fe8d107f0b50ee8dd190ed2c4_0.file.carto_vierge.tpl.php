<?php
/* Smarty version 3.1.30, created on 2021-07-12 20:57:02
  from "C:\wamp64\www\Gestion_Rucher\templates\carto_vierge.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_60ecac9e3da2e1_91505518',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '6c44dd3bfb76c84fe8d107f0b50ee8dd190ed2c4' => 
    array (
      0 => 'C:\\wamp64\\www\\Gestion_Rucher\\templates\\carto_vierge.tpl',
      1 => 1626114549,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:entete_carto_rucher.html' => 1,
  ),
),false)) {
function content_60ecac9e3da2e1_91505518 (Smarty_Internal_Template $_smarty_tpl) {
?>
 <?php $_smarty_tpl->_subTemplateRender("file:entete_carto_rucher.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

 <link rel="stylesheet" href="style/default/rucher_rucher.css">
 <link rel="stylesheet" href="style/default/rucher.css">
 <link rel="stylesheet" href="style/default/carto.css">
  </head>
<body>
    <header>
		<h1 id="titre"> Gestion du rucher - Cartographie</h1>
	</header>
	<section id="LaSection">
	<article id="Larticle">
		<?php if (isset($_smarty_tpl->tpl_vars['Resultat']->value)) {?>
		<p><strong><?php echo $_smarty_tpl->tpl_vars['Resultat']->value;?>
</strong></p>
		<?php }?>
		<p>Nom : <?php echo $_smarty_tpl->tpl_vars['NomRucher']->value;?>
</p>
		<p>Num&eacute;ro : <?php echo $_smarty_tpl->tpl_vars['NumRucher']->value;?>
</p>
		<?php if (isset($_smarty_tpl->tpl_vars['NomPhoto']->value)) {?>
		<p>Photo actuelle</p>
		<p><img src="<?php echo $_smarty_tpl->tpl_vars['NomPhoto']->value;?>
" alt="photo du rucher"></p>
		<?php }?>
		<form name="Add_photo" method="post" action="" enctype="multipart/form-data">
			<fieldset>
				<legend>Ajouter une photo du rucher.</legend>
				<p><label for="chem_fiche">Chemin de la photo : </label><input type="file" id="chem_fiche" name="chem_fiche"></p>
				<p><label for="nom_fiche">Nom du fichier (sans extension) : </label><input type="text" id="nom_fiche" name="nom_fiche"></p>
				<p><input type="submit" name="valider" value="valider"></p>
			</fieldset>
		</form>
	</article>
	<aside id="Laside">
		<p><a href="voir_carto_rucher.php" id="LienCarto">Voir la cartographie du rucher</a></p>
	</aside>
	</section>
 <p><a href="voir_rucher.php" id="LienRetour">Retour au rucher</a></p><?php }
}
