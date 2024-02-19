{ ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      shell = {
        program = "fish";
      };

      window = {
        opacity = 0.9;
        padding.x = 10;
        padding.y = 10;
      };

      font = {
        bold = {
          family = "Berkeley Mono Variable";
          style = "Bold";
        };
        bold_italic = {
          family = "Berkeley Mono Variable";
          style = "Bold Italic";
        };
        italic = {
          family = "Berkeley Mono Variable";
          style = "Italic";
        };
        normal = {
          family = "Berkeley Mono Variable";
          style = "Regular";
        };
        size = 14;
      };
    };
  };
}
