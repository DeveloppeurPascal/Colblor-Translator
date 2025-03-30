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
/// File last update : 2025-03-30T17:21:12.000+02:00
/// Signature : b69d8ad2dd9e5795dcf11e11d38eba1e685e6e4c
/// ***************************************************************************
/// </summary>

unit fMain;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  System.Rtti,
  FMX.Grid.Style,
  Data.Bind.Controls,
  Data.Bind.EngExt,
  FMX.Bind.DBEngExt,
  FMX.Bind.Grid,
  System.Bindings.Outputs,
  FMX.Bind.Editors,
  Data.Bind.Components,
  Data.Bind.Grid,
  Data.Bind.DBScope,
  Data.DB,
  FMX.Layouts,
  FMX.Bind.Navigator,
  FMX.Controls.Presentation,
  FMX.ScrollBox,
  FMX.Grid,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.Stan.StorageBin,
  FMX.StdCtrls;

type
  TfrmMain = class(TForm)
    FDMemTable1: TFDMemTable;
    StringGrid1: TStringGrid;
    BindNavigator1: TBindNavigator;
    FDMemTable1id: TStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDMemTable1fr: TMemoField;
    FDMemTable1en: TMemoField;
    btnSaveData: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FDMemTable1BeforeOpen(DataSet: TDataSet);
    procedure btnSaveDataClick(Sender: TObject);
  private
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses
  System.IOUtils;

procedure TfrmMain.btnSaveDataClick(Sender: TObject);
begin
  if FDMemTable1.State in [TDataSetState.dsInsert, TDataSetState.dsEdit] then
    FDMemTable1.Post;
  FDMemTable1.Close;
  FDMemTable1.Open;
end;

procedure TfrmMain.FDMemTable1BeforeOpen(DataSet: TDataSet);
begin
  FDMemTable1.ResourceOptions.Persistent := true;
  FDMemTable1.ResourceOptions.PersistentFileName :=
    tpath.combine(tpath.GetDirectoryName(paramstr(0)), '..\..\..\colblor.bin');
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDMemTable1.Close;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FDMemTable1.Open;
end;

end.
