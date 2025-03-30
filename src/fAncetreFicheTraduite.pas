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
/// File last update : 2025-03-30T10:05:30.199+02:00
/// Signature : 3cb4572ca81fc6612aea655bba823e05d2885d6c
/// ***************************************************************************
/// </summary>

unit fAncetreFicheTraduite;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  T_AncetreFicheTraduite = class(TForm)
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
    procedure TraduireTextes; virtual;
  end;

implementation

{$R *.fmx}

uses
  uDMTraductions;

{ TFormTraduite }

constructor T_AncetreFicheTraduite.Create(AOwner: TComponent);
begin
  inherited;
  tthread.ForceQueue(nil,
    procedure
    begin
      TraduireTextes;
    end);
end;

procedure T_AncetreFicheTraduite.TraduireTextes;
var
  i: integer;
begin
  for i := 0 to Componentcount-1 do
    if (components[i] is TPresentedTextControl) then
      (components[i] as TPresentedTextControl).text :=
        _(Name + '.' + components[i].Name,
        (components[i] as TPresentedTextControl).text);
end;

end.
