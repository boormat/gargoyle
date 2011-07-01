#!/usr/bin/haserl
<?
#
#       Copyright (c) 2011 Cezary Jackiewicz <cezary@eko.one.pl>
#
#      This program is free software; you can redistribute it and/or modify
#      it under the terms of the GNU General Public License as published by
#      the Free Software Foundation; either version 2 of the License, or
#      (at your option) any later version.
#
#      This program is distributed in the hope that it will be useful,
#      but WITHOUT ANY WARRANTY; without even the implied warranty of
#      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#      GNU General Public License for more details.
#
#      You should have received a copy of the GNU General Public License
#      along with this program; if not, write to the Free Software
#      Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#      MA 02110-1301, USA.

	eval $( gargoyle_session_validator -c "$COOKIE_hash" -e "$COOKIE_exp" -a "$HTTP_USER_AGENT" -i "$REMOTE_ADDR" -r "login.sh" -t $(uci get gargoyle.global.session_timeout) -b "$COOKIE_browser_time"  )
	gargoyle_header_footer -h -s "system" -p "themes" -c "internal.css" -j "table.js themes.js"
?>

<script>
<!--
<?
	echo "var themes = new Array();"
	ls /www/themes | grep -v "default" | awk '{print "themes.push(\""$0"\");" ;}'
	ls -ld /www/themes/default | awk -F/ '/->/{print "var currentTheme=\""$NF"\";"}'
?>
//-->
</script>

<form>
	<fieldset>
		<legend class="sectionheader">Themes manager</legend>
		<div class='indent'>
		<div id="themes_table_container"></div>
		</div>
	</fieldset>

	<span id="update_container" >Plase wait while new settings are applied...</span>
</form>

<script>
<!--
	resetData();
//-->
</script>

<?
	gargoyle_header_footer -f -s "system" -p "themes"
?>