/// <summary>
/// ***************************************************************************
///
/// Colblor Translator
///
/// Copyright 2021-2025 Patrick PREMARTIN under AGPL 3.0 license.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
/// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
/// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
/// DEALINGS IN THE SOFTWARE.
///
/// ***************************************************************************
///
/// Author(s) :
/// Patrick PREMARTIN
///
/// Site :
/// https://colblor.gamolf.fr
///
/// Project site :
/// https://github.com/DeveloppeurPascal/Colblor-Translator
///
/// ***************************************************************************
/// File last update : 2025-03-30T17:47:26.000+02:00
/// Signature : b71dae258a5d84a158cb8260aaa923551cfd4f8e
/// ***************************************************************************
/// </summary>

program ColblorTranslator;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMain in 'fMain.pas' {frmMain},
  uDMTraductions in 'uDMTraductions.pas' {dmTraductions: TDataModule},
  fAncetreFicheTraduite in 'fAncetreFicheTraduite.pas' {_AncetreFicheTraduite},
  fAncetreCadreTraduit in 'fAncetreCadreTraduit.pas' {_AncetreCadreTraduit: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
