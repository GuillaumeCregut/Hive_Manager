<?php
/* Smarty version 3.1.30, created on 2021-07-12 20:56:59
  from "C:\wamp64\www\Gestion_Rucher\templates\voir_rucher.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_60ecac9b4b0d67_31407346',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '5e081affaee194617bc194387762fae92452c9f8' => 
    array (
      0 => 'C:\\wamp64\\www\\Gestion_Rucher\\templates\\voir_rucher.tpl',
      1 => 1626114547,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:entete_open.html' => 1,
  ),
),false)) {
function content_60ecac9b4b0d67_31407346 (Smarty_Internal_Template $_smarty_tpl) {
?>
 <?php $_smarty_tpl->_subTemplateRender("file:entete_open.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

 <?php echo '<script'; ?>
 src="script/rucher_ruche.js"><?php echo '</script'; ?>
>
 <link rel="stylesheet" href="style/default/rucher_rucher.css">
 <link rel="stylesheet" href="style/default/rucher.css">
  </head>
<body>
    <h1 id="titre"> Gestion du rucher</h1>
    <p>Nom : <?php echo $_smarty_tpl->tpl_vars['NomRucher']->value;?>
</p>
	<p>Num&eacute;ro : <?php echo $_smarty_tpl->tpl_vars['NumRucher']->value;?>
</p>
    <p>Etat : <img src="images/<?php echo $_smarty_tpl->tpl_vars['EtatRucher']->value;?>
.png"></p>
    <div id="contenu_rucher">
      <p class="item">Ruches</p>
	  <form name="visuRuche" method="post" action="voir_ruche.php">
	  <input type="hidden" name="id_ruche" value="0">
      <ul>
	  <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['liste_ruche']->value, 'infos');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['infos']->value) {
?>
        <li>
          <span class="logo"><a href="#" onclick="ouvre_ruche(<?php echo $_smarty_tpl->tpl_vars['infos']->value['ID_R'];?>
)"><img src="images/<?php echo $_smarty_tpl->tpl_vars['infos']->value['Photo'];?>
.png"><?php echo $_smarty_tpl->tpl_vars['infos']->value['Nom_R'];?>
</a></span>
        </li>
		<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

        <li>
          <p><span class="logo"><a href="ajout_ruche.php"><img src="images/ruche_add.png">Ajouter une ruche</a></span></p>
        </li>
      </ul>
	  </form>
      <hr>
      <p class="item">Divers</p>
      <ul>
        <li>
          <p><span class="logo"><a href="info_rucher.php"><img src="images/information.png">Informations</a></span></p>
        </li>
		<li>
          <p><span class="logo"><a href="edit_rucher.php"><img src="images/edit1.png">Editions</a></span></p>
        </li>
		<li>
		 <p><span class="logo"><a href="carto_rucher.php"><img src="images/carto.png">Cartographie</a></span></p>
		<li>
          <p><span class="logo"><a href="aide.php?Id_Page=2" target="_blank"><img src="images/help.png">Aide</a></span></p>
        </li>
      </ul>
    </div>
	<p><a href="index.php" id="LienRetour">Retour &agrave; l'accueil</a></p>
 <?php }
}
