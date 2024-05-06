inherited FormPrincipal: TFormPrincipal
  Caption = 'Sistema SoftPlan - Menu Principal'
  ClientHeight = 179
  Menu = MainMenu
  WindowState = wsMaximized
  StyleElements = [seFont, seClient, seBorder]
  ExplicitHeight = 238
  TextHeight = 15
  object MainMenu: TMainMenu
    Left = 504
    Top = 32
    object mnuConsultas: TMenuItem
      Caption = 'Consulta'
      object mnuEndereo: TMenuItem
        Caption = 'Endere'#231'o'
        OnClick = mnuEndereoClick
      end
    end
  end
end
