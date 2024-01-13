Config {

  -- appearance
    font        = "Bitstream Vera Sans Mono Bold 9"
  , bgColor     = "black"
  , fgColor     = "#646464"
  , position    = Bottom
  , border      = TopB
  , borderColor = "#646464"

  -- layout
  , sepChar  = "%"
  , alignSep = "}{"
  , template = "%UnsafeStdinReader% }{ %memory% | %dynnetwork% | %battery% | %date%"

  -- general behavior
  , lowerOnStart     = True
  , hideOnStart      = False
  , allDesktops      = True
  , overrideRedirect = True
  , pickBroadest     = False
  , persistent       = True

  -- plugins
  , commands =
    
      -- battery monitor
      [ Run Battery    [ "--template" , "<fc=#F0E68C>BATT</fc> <acstatus>"
                       , "--Low"      , "20" --units: %
                       , "--High"     , "80" --units: %
                       , "--low"      , "#F44336"
                       , "--normal"   , "#8BC34A"
                       , "--high"     , "#4ACF50"
                       , "--"
                       , "-o"         , "<left>% (<timeleft>)"
                       , "-O"         , "<left>% <fc=#8BC34A>(charging)</fc>"
                       , "-i"         , "<left>% <fc=#4ACF50>(FULL)</fc>"
                       ] 50

      -- date and time
      , Run Date       "<fc=#607D8B>%a</fc> <fc=#009688>%F</fc> <fc=#2196F3>%T</fc>" "date" 10

      -- network monitor
      , Run DynNetwork [ "--template" , "<fc=#F0E68C><dev></fc> <rx> <tx>"
                       , "--High"     , "1000" -- units: B/s
                       , "--low"      , "#F1F1F1"
                       , "--normal"   , "#F1F1F1"
                       , "--high"     , "#2196F3"
                       , "-S"         , "true"
                       ] 10

      -- memory monitor
      , Run Memory     [ "--template" , "<fc=#F0E68C>MEM</fc> <usedratio>%"
                       , "--Low"      , "50" --units: %
                       , "--High"     , "80" --units: %
                       , "--low"      , "#4ACF50"
                       , "--normal"   , "#FF9800"
                       , "--high"     , "#F44336"
                       ] 10

      -- unsafe reader
      , Run UnsafeStdinReader
      ]
  }
