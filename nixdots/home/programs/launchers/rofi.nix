
{ config, pkgs, ... }:{
programs.rofi = {
    enable = true;
    
    extraConfig = {
      modi = "drun,window,run";
      icon-theme = "Nordic-darker";
      show-icons = true;
      terminal = "alacritty";
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = false;
      sidebar-mode = false;
      display-drun = " ";
      display-run = " ";
      display-window = " ";
      
      # Vim keybindings
      kb-row-up = "Up,Control+k";
      kb-row-left = "Left,Control+h";
      kb-row-right = "Right,Control+l";
      kb-row-down = "Down,Control+j";
      kb-accept-entry = "Control+z,Control+y,Return,KP_Enter";
      
      # Fixes
      kb-remove-to-eol = "";
      kb-move-char-back = "Control+b";
      kb-remove-char-back = "BackSpace";
      kb-move-char-forward = "Control+f";
      kb-mode-complete = "Control+o";
    };
    
    # Frutiger Aero Theme
    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        bg = mkLiteral "#e3f2fd";           # светло-голубой фон
        hv = mkLiteral "#0689e4";           # яркий аква для highlight
        primary = mkLiteral "#64c8dc";      # светлый циан для borders
        ug = mkLiteral "#fbb905";           # оранжевый для urgent
        font = "Monospace 11";
        background-color = mkLiteral "@bg";
        border = mkLiteral "0px";
        kl = mkLiteral "#0064b4";           # темно-синий для текста
        black = mkLiteral "#003c78";        # очень темный синий
        transparent = mkLiteral "rgba(227,242,253,0)";
      };
      
      "window" = {
        width = mkLiteral "700";
        orientation = mkLiteral "horizontal";
        location = mkLiteral "center";
        anchor = mkLiteral "center";
        transparency = "screenshot";
        border-color = mkLiteral "@transparent";
        border = mkLiteral "0px";
        border-radius = mkLiteral "12px";   # более округлый для aero
        spacing = mkLiteral "0";
        children = map mkLiteral [ "mainbox" ];
      };
      
      "mainbox" = {
        spacing = mkLiteral "0";
        children = map mkLiteral [ "inputbar" "message" "listview" ];
      };
      
      "inputbar" = {
        color = mkLiteral "@kl";
        padding = mkLiteral "11px";
        border = mkLiteral "3px 3px 2px 3px";
        border-color = mkLiteral "@primary";
        border-radius = mkLiteral "12px 12px 0px 0px";
      };
      
      "message" = {
        padding = mkLiteral "0";
        border-color = mkLiteral "@primary";
        border = mkLiteral "0px 1px 1px 1px";
      };
      
      "entry, prompt, case-indicator" = {
        text-font = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };
      
      "entry" = {
        cursor = mkLiteral "pointer";
      };
      
      "prompt" = {
        margin = mkLiteral "0px 5px 0px 0px";
      };
      
      "listview" = {
        layout = mkLiteral "vertical";
        padding = mkLiteral "8px";
        lines = mkLiteral "7";
        columns = mkLiteral "2";
        border = mkLiteral "0px 3px 3px 3px";
        border-radius = mkLiteral "0px 0px 12px 12px";
        border-color = mkLiteral "@primary";
        dynamic = false;
      };
      
      "element" = {
        padding = mkLiteral "2px";
        vertical-align = mkLiteral "1";
        color = mkLiteral "@kl";
        font = mkLiteral "inherit";
      };
      
      "element-text" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
        vertical-align = mkLiteral "0.5";
      };
      
      "element selected.normal" = {
        color = mkLiteral "#ffffff";        # белый текст на highlight
        background-color = mkLiteral "@hv";
      };
      
      "element normal active" = {
        background-color = mkLiteral "@hv";
        color = mkLiteral "#ffffff";
      };
      
      "element-icon" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
        size = mkLiteral "2.5em";
      };
      
      "element normal urgent" = {
        background-color = mkLiteral "@ug";
      };
      
      "element selected active" = {
        background = mkLiteral "@hv";
        foreground = mkLiteral "#ffffff";
      };
      
      "button" = {
        padding = mkLiteral "6px";
        color = mkLiteral "@primary";
        horizonatal-align = mkLiteral "0.5";
        border = mkLiteral "2px 0px 2px 2px";
        border-radius = mkLiteral "4px 0px 0px 4px";
        border-color = mkLiteral "@primary";
      };
      
      "button selected normal" = {
        border = mkLiteral "2px 0px 2px 2px";
        border-color = mkLiteral "@primary";
      };
    };
  };
}
