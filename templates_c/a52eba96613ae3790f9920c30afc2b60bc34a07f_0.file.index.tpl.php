<?php
/* Smarty version 3.1.30, created on 2021-07-12 20:56:30
  from "C:\wamp64\www\Gestion_Rucher\templates\index.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_60ecac7eef2d16_59244663',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'a52eba96613ae3790f9920c30afc2b60bc34a07f' => 
    array (
      0 => 'C:\\wamp64\\www\\Gestion_Rucher\\templates\\index.tpl',
      1 => 1626114549,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:entete_open.html' => 1,
  ),
),false)) {
function content_60ecac7eef2d16_59244663 (Smarty_Internal_Template $_smarty_tpl) {
?>
  <?php $_smarty_tpl->_subTemplateRender("file:entete_open.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

  <link rel="stylesheet" href="style/default/rucher.css">
  <?php echo '<script'; ?>
 src="script/rucher.js"><?php echo '</script'; ?>
> 
  </head>
  <body<?php echo $_smarty_tpl->tpl_vars['Ajout']->value;?>
>
    <h1 id="titre"> Assistant de gestion de rucher</h1>
	<div id="menu">
      <form name="loginform" action="index.php" method="post">
	  <ul>
	  <li><input name="login" type="text" value="login" onclick="vide_champ(this)"><input name="pass" type="password"><a href="#" onclick="submitlogin()">Login</a></li>
      <li><a href="signIn.php">Sign In</a></li>
	  </ul>
	  </form>
	  <p id="mdp"><a href="mdp_oubli.php">mot de passe oubli&eacute;</a></p>
    </div>
    <div id="presentation"><p>Bienvenue dans <?php echo $_smarty_tpl->tpl_vars['NomLogiciel']->value;?>
, un logiciel permettant de g&eacute;rer
      votre activit&eacute; d'apiculture.</p>
    <p>Ce logiciel est un environnement multi-utilisateur, ce qui permet
      &agrave; plusieurs apiculteurs d'utiliser le m&ecirc;me syst&egrave;me
      sans pour autant que leurs informations soient connues des autres
      utilisateurs.</p>
    <p>Avec cette application, vous serez capable de g&eacute;rer vos ruchers,
      vos ruches, ainsi que d'autres caract&eacute;ristiques li&eacute;es
      &agrave; votre activit&eacute;.</p>
    <p>Le syst&egrave;me est compatible avec l'enregisteur de donn&eacute;es de
      ruches (en cours de d&eacute;veloppement) permettant un import direct des
      informations de vos ruches dans l'outil de travail, ce qui apporte une
      analyse des statistiques de l'exploitation.</p>
    <p>Une aide est pr&eacute;sente dans les diff&eacute;rentes pages afin de
      faciliter l'utilisation.</p></div>
	  <div>
	  <p>Ce site utilise des cookies pour fonctionner. Ces cookies sont &agrave; r&ocirc;le de gestion de sessions, et aucun cookies publicitaire ou autre n'est utilis&eacute;.<br>
	  En utilisant ce logiciel, vous acceptez de fait ces cookies.</p>
	  </div>

<?php }
}
