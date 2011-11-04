{-------------------------------------------------------------------------------
FlexPaper4Delphi
This unit implementation some functions of FlexPaper API/Params
you can use this unit and shockwaveFlash control flexpaper.

time:2011-11-04
author:hehf
mail:bond_hhf@hotmail.com

important:
  1¡¢Fisrt set FP_ShockwaveFlash
    FP_ShockwaveFlash is a global var, you can use like: FP_ShockwaveFlash = ShockwaveFlash instance
  2¡¢swf file path don't contians chinese
-------------------------------------------------------------------------------}
unit untFlexPaper4Delphi;

interface

uses
  Windows, Messages, SysUtils, ShockwaveFlashObjects_TLB;

type
  TFlexPaperSwitchMode = (fpsmPortrait, fpsmTwoPage, fpsmTile);
  TFlexPaperZoomTransition = (fpzteasenone, fpzteaseout, fpztlinear, fpzteaseoutquad);
  (*Sets the locale (language) to use. The following languages are currently supported:
  en_US (English)
  fr_FR (French)
  zh_CN (Chinese, Simple)
  es_ES (Spanish)
  pt_BR (Brazilian Portugese)
  ru_RU (Russian)
  fi_FN (Finnish)
  de_DE (German)
  nl_NL (Netherlands)
  tr_TR (Turkish)
  se_SE (Swedish)
  pt_PT (Portugese)
  el_EL (Greek)
  da_DN (Danish)
  cz_CS (Czech)
  it_IT (Italian)
  pl_PL (Polish)
  pv_FN (Finnish)
  hu_HU (Hungarian)   *)
  TFlexPaperLocaleChain = (en_US, fr_FR, zh_CN, es_ES, pt_BR, ru_RU, fi_FN,
                          de_DE, nl_NL, tr_TR, se_SE, pt_PT, el_EL, da_DN,
                          cz_CS, it_IT, pl_PL, pv_FN, hu_HU);
  //Call Function
  function CallFlexNoArg(aFuncName: string): string;
  function CallFlexOneArg(aFuncName, arg1: string): string; overload;
  function CallFlexOneArg(aFuncName: string; arg1: Integer): string; overload;
  //loadSwf
  function FP_loadSwf(SwfFile: string): string;

  //fitWidth
  function FP_fitWidth(): string;
  //fitHeight
  function FP_fitHeight(): string;

  //getCurrPage
  function FP_getCurrPage(): Integer;
  //nextPage
  function FP_nextPage(): string;
  //prevPage
  function FP_prevPage(): string;
  //gotoPage
  function FP_gotoPage(pageNumber: Integer): string;

  //setZoom
  function FP_setZoom(factor: Integer): string;
  //searchText
  function FP_searchText(text: string): string;
  //switchMode Allowed modes are "Portrait", "Two Page", "Tile"
  function FP_switchMode(switchMode: TFlexPaperSwitchMode): string;

  //printPaper
  function FP_printPaper(): string;
  //highlight
  function FP_highlight(url: string): string;
  //postSnapshot
  function FP_postSnapshot(url: string): string;

  //Set property
  function SetFlexPaperParam(paramName, value: string): string;
  //Set All ToolBar Visble
  function FP_SetFlexPaperToolBarView(value: Boolean): string;
  //The document FlexPaper should open
  function FP_SetSwfFile(SwfFile: string): string;
  //The initial zoom factor that should be used. Should be a number above 0 (1=100%)
  function FP_SetScale(Scale: Cardinal): string;
  //The zoom transition that should be used when zooming in FlexPaper.
  //It uses the same Transition modes as the Tweener.
  //The default value is easeOut. Some examples: easenone, easeout, linear, easeoutquad
  function FP_SetZoomTransition(ZoomTransition: TFlexPaperZoomTransition): string;
  //The time it should take for the zoom to reach the new zoom factor. Should be 0 or greater.
  function FP_SetZoomTime(ZoomTime: Double): string;
  //The interval which the zoom slider should be using.
  //Basically how big the "step" should be between each zoom factor.
  //The default value is 0.1. Should be a positive number.
  function FP_SetZoomInterval(ZoomInterval: Double): string;
  //Fits the page on initial load. Same effect as using the fit-page button in the toolbar.
  function FP_SetFitPageOnLoad(FitPageOnLoad: Boolean): string;
  //Fits the width on initial load. Same effect as using the fit-width button in the toolbar.
  function FP_SetFitWidthOnLoad(FitWidthOnLoad: Boolean): string;
  //Sets the locale (language) to use.
  function FP_SetlocaleChain(localeChain: TFlexPaperLocaleChain): string;
  //With this set to true, clicking on fullscreen will open a new browser window
  //with FlexPaper maximized instead of using true fullscreen.
  //This is a preferred setting when using FlexPaper as flash standalone as the security
  //limitations of the Flash player disables (for security reasons) most of the input
  //controls in true fullscreen.
  function FP_SetFullScreenAsMaxWindow(FullScreenAsMaxWindow: Boolean): string;
  //Will load and display the document progressively when set to true as opposed
  //to downloading the complete document before displaying the pages.
  //Documents need to be converted to at least Flash version 9 for this
  //to work (-T 9 flag using PDF2SWF)
  function FP_SetProgressiveLoading(ProgressiveLoading: Boolean): string;
  //Sets the maximum allowed zoom level
  function FP_SetMaxZoomSize(MaxZoomSize: Cardinal): string;
  //Sets the minimum allowed zoom level
  function FP_SetMinZoomSize(MinZoomSize: Cardinal): string;
  //When set to true, the viewer highlights all matches when performing searches in a document.
  function FP_SetSearchMatchAll(SearchMatchAll: Boolean): string;
  //Sets the start-up view mode. For example "Portrait" or "TwoPage".
  function FP_SetInitViewMode(InitViewMode: TFlexPaperSwitchMode): string;
  //Shows or hides view modes from the tool bar
  function FP_SetViewModeToolsVisible(ViewModeToolsVisible: Boolean): string;
  //Shows or hides zoom tools from the tool bar
  function FP_SetZoomToolsVisible(ZoomToolsVisible: Boolean): string;
  //Shows or hides nav tools from the tool bar
  function FP_SetNavToolsVisible(NavToolsVisible: Boolean): string;
  //Shows or hides cursor tools from the tool bar
  function FP_SetCursorToolsVisible(CursorToolsVisible: Boolean): string;
  //Shows or hides search tools from the tool bar
  function FP_SetSearchToolsVisible(SearchToolsVisible: Boolean): string;
  //PrintEnabled
  function FP_SetPrintEnabled(PrintEnabled: Boolean): string;
var
  FP_ShockwaveFlash: TShockwaveFlash;
  
implementation

const
  SwitchModeArray: array[0..2] of string = ('Portrait', 'Two Page', 'Tile');
  ZoomTransitionArray: array[0..3] of string = ('easenone', 'easeout', 'linear', 'easeoutquad');
  LocaleChainArray: array[0..18] of string = ('en_US', 'fr_FR', 'zh_CN', 'es_ES', 'pt_BR',
                                      'ru_RU', 'fi_FN', 'de_DE', 'nl_NL', 'tr_TR',
                                      'se_SE', 'pt_PT', 'el_EL', 'da_DN', 'cz_CS',
                                      'it_IT', 'pl_PL', 'pv_FN', 'hu_HU');
                                      
  InvalidShockwaveFlash = 'FP_ShockwaveFlash not defined, please set global FP_ShockwaveFlash pointer!';

function Boolean2String(value: Boolean): string;
begin
  if value then
    Result := 'true'
  else
    Result := 'false';
end;

function SetFlexPaperParam(paramName, value: string): string;
begin
  if FP_ShockwaveFlash <> nil then
  begin
    if Trim(FP_ShockwaveFlash.FlashVars) = '' then
      FP_ShockwaveFlash.FlashVars := paramName + '=' + value
    else
      FP_ShockwaveFlash.FlashVars := FP_ShockwaveFlash.FlashVars + '&' + paramName + '=' + value;
  end else
    Result := InvalidShockwaveFlash;
end;

function CallFlexNoArg(aFuncName: string): string;
var
  vFuncBody: string;
begin
  if FP_ShockwaveFlash <> nil then
  begin
    vFuncBody := '<invoke name="' + aFuncName + '" returntype="xml"></invoke>';
    Result := FP_ShockwaveFlash.CallFunction(vFuncBody);
  end else
    Result := InvalidShockwaveFlash;
end;
  
function CallFlexOneArg(aFuncName, arg1: string): string;
var
  vFuncBody: string;
begin
  if FP_ShockwaveFlash <> nil then
  begin
    vFuncBody := '<invoke name="' + aFuncName + '" returntype="xml"><arguments><string>'
                + arg1 + '</string></arguments></invoke>';
    Result := FP_ShockwaveFlash.CallFunction(vFuncBody);
  end else
    Result := InvalidShockwaveFlash;
end;

function CallFlexOneArg(aFuncName: string; arg1: Integer): string; overload;
var
  vFuncBody: string;
begin
  if FP_ShockwaveFlash <> nil then
  begin
    vFuncBody := '<invoke name="' + aFuncName + '" returntype="xml"><arguments><number>'
                + IntToStr(arg1) + '</number></arguments></invoke>';
    Result := FP_ShockwaveFlash.CallFunction(vFuncBody);
  end else
    Result := InvalidShockwaveFlash;
end;

//loadSwf
function FP_loadSwf(SwfFile: string): string;
begin
  Result := CallFlexOneArg('loadSwf', SwfFile);
end;

//gotoPage  
function FP_gotoPage(pageNumber: Integer): string;
begin
  Result := CallFlexOneArg('gotoPage', pageNumber);  
end;

//fitWidth
function FP_fitWidth(): string;
begin
  Result := CallFlexNoArg('fitWidth');  
end;

//fitHeight
function FP_fitHeight(): string;
begin
  Result := CallFlexNoArg('fitHeight');
end;

//getCurrPage
function FP_getCurrPage(): Integer;
var
  ARes    : WideString;
  CurrPage: Integer;
begin
  CurrPage := 0;
  ARes := CallFlexNoArg('getCurrPage');
  ARes := StringReplace(ARes, '<number>', '', []);
  ARes := StringReplace(ARes, '</number>', '', []);
  if TryStrToInt(ARes, CurrPage) then
    Result := CurrPage
  else
    Result := -1;
end;

//nextPage
function FP_nextPage(): string;
begin
  Result := CallFlexNoArg('nextPage');
end;

//prevPage
function FP_prevPage(): string;
begin
  Result := CallFlexNoArg('prevPage');
end;

//setZoom
function FP_setZoom(factor: Integer): string;
begin
  Result := CallFlexOneArg('setZoom', factor);
end;

//searchText
function FP_searchText(text: string): string;
begin
  Result := CallFlexOneArg('searchText', text);
end;

//switchMode Allowed modes are "Portrait", "Two Page", "Tile"
function FP_switchMode(switchMode: TFlexPaperSwitchMode): string;
begin
  Result := CallFlexOneArg('switchMode', SwitchModeArray[ord(TFlexPaperSwitchMode(switchMode))]);
end;

//printPaper
function FP_printPaper(): string;
begin
  Result := CallFlexNoArg('printPaper');
end;

//highlight
function FP_highlight(url: string): string;
begin
  Result := CallFlexOneArg('highlight', url);
end;

//postSnapshot
function FP_postSnapshot(url: string): string;
begin
  Result := CallFlexOneArg('postSnapshot', url);
end;

//The document FlexPaper should open
function FP_SetSwfFile(SwfFile: string): string;
begin
  Result := SetFlexPaperParam('SwfFile', SwfFile);
end;
  
//The initial zoom factor that should be used. Should be a number above 0 (1=100%)
function FP_SetScale(Scale: Cardinal): string;
begin
  Result := SetFlexPaperParam('Scale', IntToStr(Scale));
end;

//The zoom transition that should be used when zooming in FlexPaper.
//It uses the same Transition modes as the Tweener.
//The default value is easeOut. Some examples: easenone, easeout, linear, easeoutquad
function FP_SetZoomTransition(ZoomTransition: TFlexPaperZoomTransition): string;
begin
  Result := SetFlexPaperParam('ZoomTransition', ZoomTransitionArray[ord(TFlexPaperZoomTransition(ZoomTransition))]);
end;

//The time it should take for the zoom to reach the new zoom factor. Should be 0 or greater.
function FP_SetZoomTime(ZoomTime: Double): string;
begin
  Result := SetFlexPaperParam('ZoomTime', FloatToStr(ZoomTime));
end;

//The interval which the zoom slider should be using.
//Basically how big the "step" should be between each zoom factor.
//The default value is 0.1. Should be a positive number.
function FP_SetZoomInterval(ZoomInterval: Double): string;
begin
  Result := SetFlexPaperParam('ZoomInterval', FloatToStr(ZoomInterval));
end;

//Fits the page on initial load. Same effect as using the fit-page button in the toolbar.
function FP_SetFitPageOnLoad(FitPageOnLoad: Boolean): string;
begin
  Result := SetFlexPaperParam('FitPageOnLoad', Boolean2String(FitPageOnLoad));
end;

//Fits the width on initial load. Same effect as using the fit-width button in the toolbar.
function FP_SetFitWidthOnLoad(FitWidthOnLoad: Boolean): string;
begin
  Result := SetFlexPaperParam('FitWidthOnLoad', Boolean2String(FitWidthOnLoad));
end;

//Sets the locale (language) to use.
function FP_SetlocaleChain(localeChain: TFlexPaperLocaleChain): string;
//With this set to true, clicking on fullscreen will open a new browser window
//with FlexPaper maximized instead of using true fullscreen.
//This is a preferred setting when using FlexPaper as flash standalone as the security
//limitations of the Flash player disables (for security reasons) most of the input
//controls in true fullscreen.
begin
  Result := SetFlexPaperParam('localeChain', LocaleChainArray[Ord(TFlexPaperLocaleChain(localeChain))]);
end;

function FP_SetFullScreenAsMaxWindow(FullScreenAsMaxWindow: Boolean): string;
//Will load and display the document progressively when set to true as opposed
//to downloading the complete document before displaying the pages.
//Documents need to be converted to at least Flash version 9 for this
//to work (-T 9 flag using PDF2SWF)
begin
  Result := SetFlexPaperParam('FullScreenAsMaxWindow', Boolean2String(FullScreenAsMaxWindow));
end;

function FP_SetProgressiveLoading(ProgressiveLoading: Boolean): string;
begin
  Result := SetFlexPaperParam('ProgressiveLoading', Boolean2String(ProgressiveLoading));
end;

//Sets the maximum allowed zoom level
function FP_SetMaxZoomSize(MaxZoomSize: Cardinal): string;
begin
  Result := SetFlexPaperParam('MaxZoomSize', IntToStr(MaxZoomSize));
end;

//Sets the minimum allowed zoom level
function FP_SetMinZoomSize(MinZoomSize: Cardinal): string;
begin
  Result := SetFlexPaperParam('MinZoomSize', IntToStr(MinZoomSize));
end;

//When set to true, the viewer highlights all matches when performing searches in a document.
function FP_SetSearchMatchAll(SearchMatchAll: Boolean): string;
begin
  Result := SetFlexPaperParam('SearchMatchAll', Boolean2String(SearchMatchAll));
end;

//Sets the start-up view mode. For example "Portrait" or "TwoPage".
function FP_SetInitViewMode(InitViewMode: TFlexPaperSwitchMode): string;
begin
  Result := SetFlexPaperParam('InitViewMode', SwitchModeArray[ord(TFlexPaperSwitchMode(InitViewMode))]);
end;

//Shows or hides view modes from the tool bar
function FP_SetViewModeToolsVisible(ViewModeToolsVisible: Boolean): string;
begin
  Result := SetFlexPaperParam('ViewModeToolsVisible', Boolean2String(ViewModeToolsVisible));
end;

//Shows or hides zoom tools from the tool bar
function FP_SetZoomToolsVisible(ZoomToolsVisible: Boolean): string;
begin
  Result := SetFlexPaperParam('ZoomToolsVisible', Boolean2String(ZoomToolsVisible));
end;

//Shows or hides nav tools from the tool bar
function FP_SetNavToolsVisible(NavToolsVisible: Boolean): string;
begin
  Result := SetFlexPaperParam('NavToolsVisible', Boolean2String(NavToolsVisible));
end;

//Shows or hides cursor tools from the tool bar
function FP_SetCursorToolsVisible(CursorToolsVisible: Boolean): string;
begin
  Result := SetFlexPaperParam('CursorToolsVisible', Boolean2String(CursorToolsVisible));
end;

//Shows or hides search tools from the tool bar
function FP_SetSearchToolsVisible(SearchToolsVisible: Boolean): string;
begin
  Result := SetFlexPaperParam('SearchToolsVisible', Boolean2String(SearchToolsVisible));
end;

//Set All ToolBar Visble
function FP_SetFlexPaperToolBarView(value: Boolean): string;
begin
  Result := FP_SetFullScreenAsMaxWindow(value);
  Result := FP_SetViewModeToolsVisible(value);
  Result := FP_SetZoomToolsVisible(value);
  Result := FP_SetNavToolsVisible(value);
  Result := FP_SetCursorToolsVisible(value);
  Result := FP_SetSearchToolsVisible(value);
end;

//PrintEnabled
function FP_SetPrintEnabled(PrintEnabled: Boolean): string;
begin
  Result := SetFlexPaperParam('PrintEnable', Boolean2String(PrintEnabled));
end;

end.
