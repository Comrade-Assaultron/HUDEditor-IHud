package
{
   import Shared.AS3.Data.*;
   import Shared.GlobalFunc;
   import flash.display.*;
   import flash.events.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.net.*;
   import flash.text.*;
   import flash.utils.*;
   import scaleform.gfx.*;
   
   public class HUDEditor extends MovieClip
   {
      private static var rightmetersColorMatrix:ColorMatrixFilter = null;
      
      private static var rightmetersInvColorMatrix:ColorMatrixFilter = null;
      
      private static var leftmetersColorMatrix:ColorMatrixFilter = null;
      
      private static var leftmetersInvColorMatrix:ColorMatrixFilter = null;
      
      private static var notiColorMatrix:ColorMatrixFilter = null;
      
      private static var frobberColorMatrix:ColorMatrixFilter = null;
      
      private static var topcenterColorMatrix:ColorMatrixFilter = null;
      
      private static var bottomcenterColorMatrix:ColorMatrixFilter = null;
      
      private static var bottomcenterInvColorMatrix:ColorMatrixFilter = null;
      
      private static var announceColorMatrix:ColorMatrixFilter = null;
      
      private static var announceInvColorMatrix:ColorMatrixFilter = null;
      
      private static var centerColorMatrix:ColorMatrixFilter = null;
      
      private static var trackerColorMatrix:ColorMatrixFilter = null;
      
      private static var teamColorMatrix:ColorMatrixFilter = null;
      
      private static var teamInvColorMatrix:ColorMatrixFilter = null;
      
      private static var teamradsColorMatrix:ColorMatrixFilter = null;
      
      private static var floatingColorMatrix:ColorMatrixFilter = null;
      
      private static var floatingInvColorMatrix:ColorMatrixFilter = null;
      
      private static var radsbarColorMatrix:ColorMatrixFilter = null;
      
      private static var sneakDangerColorMatrix:ColorMatrixFilter = null;
      
      private static var bccompassColorMatrix:ColorMatrixFilter = null;
      
      private static var bccompassInvColorMatrix:ColorMatrixFilter = null;
      
      private static var hudColorHitMarkerMatrix:ColorMatrixFilter = null;
      
      private var HUDMessageItemBox:Class = HUDEditor_HUDMessageItemBox;
      
      private var FlashLightWidget:Class = HUDEditor_FlashLightWidget;
      
      private const PercentMax:Number = 1;
      
      private var topLevel:* = null;
      
      private var xmlConfigHC:XML;
      
      private var xmlLoaderHC:URLLoader;
      
      private var textURL:URLRequest;
      
      private var textLoader:URLLoader;
      
      private var updateTimerHC:Timer;
      
      private var debugTextHC:TextField;
      
      private var watermark:TextField;
      
      private var thirst:TextField;
      
      private var hunger:TextField;
      
      private var showHealthText:TextField;
      
      private var rightmetersBrightness:Number = 0;
      
      private var rightmetersContrast:Number = 0;
      
      private var rightmetersSaturation:Number = 0;
      
      private var rightmetersRGB1:* = "00ff00";
      
      public var hudHUErightmeters:Number = 0;
      
      private var leftmetersBrightness:Number = 0;
      
      private var leftmetersContrast:Number = 0;
      
      private var leftmetersSaturation:Number = 0;
      
      private var leftmetersRGB1:* = "00ff00";
      
      public var hudHUEleftmeters:Number = 0;
      
      private var notiBrightness:Number = 0;
      
      private var notiContrast:Number = 0;
      
      private var notiSaturation:Number = 0;
      
      private var notiRGB1:* = "00ff00";
      
      public var hudHUEnoti:Number = 0;
      
      private var frobberBrightness:Number = 0;
      
      private var frobberContrast:Number = 0;
      
      private var frobberSaturation:Number = 0;
      
      private var frobberRGB1:* = "00ff00";
      
      public var hudHUEfrobber:Number = 0;
      
      private var trackerBrightness:Number = 0;
      
      private var trackerContrast:Number = 0;
      
      private var trackerSaturation:Number = 0;
      
      private var trackerRGB1:* = "00ff00";
      
      public var hudHUEtracker:Number = 0;
      
      private var topcenterBrightness:Number = 0;
      
      private var topcenterContrast:Number = 0;
      
      private var topcenterSaturation:Number = 0;
      
      private var topcenterRGB1:* = "00ff00";
      
      public var hudHUEtopcenter:Number = 0;
      
      private var bottomcenterBrightness:Number = 0;
      
      private var bottomcenterContrast:Number = 0;
      
      private var bottomcenterSaturation:Number = 0;
      
      private var bottomcenterRGB1:* = "00ff00";
      
      public var hudHUEbottomcenter:Number = 0;
      
      private var bccompassBrightness:Number = 0;
      
      private var bccompassContrast:Number = 0;
      
      private var bccompassSaturation:Number = 0;
      
      private var bccompassRGB1:* = "00ff00";
      
      public var hudHUEbccompass:Number = 0;
      
      private var radsbarBrightness:Number = 0;
      
      private var radsbarContrast:Number = 0;
      
      private var radsbarSaturation:Number = 0;
      
      private var radsbarRGB:* = "00ff00";
      
      public var hudHUEradsbar:Number = 0;
      
      private var announceBrightness:Number = 0;
      
      private var announceContrast:Number = 0;
      
      private var announceSaturation:Number = 0;
      
      private var announceRGB1:* = "00ff00";
      
      public var hudHUEannounce:Number = 0;
      
      private var centerBrightness:Number = 0;
      
      private var centerContrast:Number = 0;
      
      private var centerSaturation:Number = 0;
      
      private var centerRGB1:* = "00ff00";
      
      public var hudHUEcenter:Number = 0;
      
      private var teamBrightness:Number = 0;
      
      private var teamContrast:Number = 0;
      
      private var teamSaturation:Number = 0;
      
      private var teamRGB1:* = "00ff00";
      
      private var teamRadsBrightness:Number = 0;
      
      private var teamRadsContrast:Number = 0;
      
      private var teamRadsSaturation:Number = 0;
      
      private var teamRadsRGB:* = "ff0000";
      
      public var hudHUEteamrads:Number = 0;
      
      public var hudHUEteam:Number = 0;
      
      private var floatingBrightness:Number = 0;
      
      private var floatingContrast:Number = 0;
      
      private var floatingSaturation:Number = 0;
      
      private var floatingRGB1:* = "00ff00";
      
      public var hudHUEfloating:Number = 0;
      
      private var hmBrightness:Number = 0;
      
      private var hmContrast:Number = 0;
      
      private var hmSaturation:Number = 0;
      
      private var hudRGBHM:* = "00ff00";
      
      public var hudHUEHM:Number = 0;
      
      public var teamNum:Number;
      
      public var SneakMeterScale:* = 1;
      
      public var SneakMeterPos:Point = new Point();
      
      public var QuestScale:Number = 1;
      
      public var QuestPos:Point = new Point();
      
      public var NotificationScale:Number = 1;
      
      public var NotificationPos:Point = new Point();
      
      public var LeftMeterScale:Number = 1;
      
      public var LeftMeterPos:Point = new Point();
      
      public var APMeterScale:Number = 1;
      
      public var APMeterPos:Point = new Point();
      
      public var ActiveEffectsScale:Number = 1;
      
      public var ActiveEffectsPos:Point = new Point();
      
      public var HungerMeterScale:Number = 1;
      
      public var HungerMeterPos:Point = new Point();
      
      public var ThirstMeterScale:Number = 1;
      
      public var ThirstMeterPos:Point = new Point();
      
      public var AmmoCountScale:Number = 1;
      
      public var AmmoCountPos:Point = new Point();
      
      public var ExplosiveAmmoCountScale:Number = 1;
      
      public var ExplosiveAmmoCountPos:Point = new Point();
      
      public var FlashLightWidgetScale:Number = 1;
      
      public var FlashLightWidgetPos:Point = new Point();
      
      public var EmoteScale:Number = 1;
      
      public var EmotePos:Point = new Point();
      
      public var FusionScale:Number = 1;
      
      public var FusionPos:Point = new Point();
      
      public var CompassScale:Number = 1;
      
      public var CompassPos:Point = new Point();
      
      public var AnnounceScale:Number = 1;
      
      public var AnnouncePos:Point = new Point();
      
      public var QuickLootScale:Number = 1;
      
      public var QuickLootPos:Point = new Point();
      
      public var TeamPanelScale:Number = 1;
      
      public var TeamPanelPos:Point = new Point();
      
      public var FrobberScale:Number = 1;
      
      public var FrobberPos:Point = new Point();
      
      public var RollOverScale:Number = 1;
      
      public var RollOverPos:Point = new Point();
      
      public var SubtitlesScale:Number = 1;
      
      public var SubtitlesPos:Point = new Point();
      
      public var EnemyHealthScale:Number = 1;
      
      public var EnemyHealthPos:Point = new Point();
      
      public var XPBarScale:Number = 1;
      
      public var XPBarPos:Point = new Point();
      
      public var CritMeterScale:Number = 1;
      
      public var CritMeterPos:Point = new Point();
      
      public var CurrencyScale:Number = 1;
      
      public var CurrencyPos:Point = new Point();
      
      public var LevelUpAnimScale:Number = 1;
      
      public var LevelUpAnimPos:Point = new Point();
      
      public var RepUpdatesScale:Number = 1;
      
      public var RepUpdatesPos:Point = new Point();
      
      public var HitMarkerScale:Number = 1;
      
      public var HitMarkerPos:Point = new Point();
      
      public var TeamPanelPosPA:Point = new Point();
      
      public var HungerMeterPosPA:Point = new Point();
      
      public var ThirstMeterPosPA:Point = new Point();
      
      public var ExplosiveAmmoCountPosPA:Point = new Point();
      
      public var TeamPanelScalePA:Number = 1;
      
      public var HungerMeterScalePA:Number = 1;
      
      public var ThirstMeterScalePA:Number = 1;
      
      public var ExplosiveAmmoCountScalePA:Number = 1;
      
      public var PerkPopUpScale:Number = 1;
      
      public var PerkPopUpPos:Point = new Point();
      
      public var FusionPopUpScale:Number = 1;
      
      public var FusionPopUpPos:Point = new Point();
      
      public var RadCountScale:Number = 1;
      
      public var RadCountPos:Point = new Point();
      
      public var RadCountTextStorage:String;
      
      public var RadCountAlignStorage:Number;
      
      public var RadCountLock:int = 0;
      
      public var ImpHealthScale:Number = 1;
      
      public var ImpHealthPos:Point = new Point();
      
      public var ImpHealthLock:int = 0;
      
      private var reloadCount:int = 0;
      
      private var oLeftMeterPos:Point = new Point();
      
      private var oAPMeterPos:Point = new Point();
      
      private var oActiveEffectsPos:Point = new Point();
      
      private var oHungerMeterPos:Point = new Point();
      
      private var oThirstMeterPos:Point = new Point();
      
      private var oAmmoCountPos:Point = new Point();
      
      private var oExplosiveAmmoCountPos:Point = new Point();
      
      private var oFlashLightWidgetPos:Point = new Point();
      
      private var oEmotePos:Point = new Point();
      
      private var oCompassPos:Point = new Point();
      
      private var oAnnouncePos:Point = new Point();
      
      private var oNotificationPos:Point = new Point();
      
      private var oQuestPos:Point = new Point();
      
      private var oSneakPos:Point = new Point();
      
      private var oQuickLootPos:Point = new Point();
      
      private var oFrobberPos:Point = new Point();
      
      private var oTeamPanelPos:Point = new Point();
      
      private var oFusionPos:Point = new Point();
      
      private var oRollOverPos:Point = new Point();
      
      private var oSubtitlePos:Point = new Point();
      
      private var oEnemyHealthPos:Point = new Point();
      
      private var oXPBarPos:Point = new Point();
      
      private var oCritMeterPos:Point = new Point();
      
      private var oCurrencyPos:Point = new Point();
      
      private var oLevelUpAnimPos:Point = new Point();
      
      private var oRepUpdatesPos:Point = new Point();
      
      private var oPerkPopUpPos:Point = new Point();
      
      private var oFusionPopUpPos:Point = new Point();
      
      private var oRadCountPos:Point = new Point();
      
      private var oImpHealthPos:Point = new Point();
      
      private var VisibilityChanged:int = 0;
      
      private var oHitMarkerPos:Point = new Point();
      
      private var iniLoader:URLLoader;
      
      private var _CharInfo:Object;
      
      private var thpShow:String = "";
      
      private var thirstPC:Number = 0;
      
      private var hungerPC:Number = 0;
      
      private var inPowerArmor:Boolean = false;
      
      private var powerArmorHUDEnabled:Boolean = false;
      
      private const maxScale:Number = 1.5;
      
      private var HUDNotification_mc:Object = new this.HUDMessageItemBox();
      
      private var FlashLightRestored_mc:Object = new this.FlashLightWidget();
      
      private var EventCloseTimer:Timer;
      
      private var reloadCountNukeCodes:Number = 0;
      
      public function HUDEditor()
      {
         super();
         this.updateTimerHC = new Timer(20,0);
         this.EventCloseTimer = new Timer(15000,0);
         this.initDebugText();
         this.initWatermarkText();
         this.initThirstText();
         this.initHungerText();
         addEventListener(Event.ADDED_TO_STAGE,this.addedToStageHandler);
         trace("HUDEditor Started");
      }
      
      private function addedToStageHandler(e:Event) : void
      {
         this.topLevel = stage.getChildAt(0);
         if(this.topLevel != null && getQualifiedClassName(this.topLevel) == "HUDMenu")
         {
            this.initShowHealthText();
            this.oLeftMeterPos.x = this.topLevel.LeftMeters_mc.x;
            this.oLeftMeterPos.y = this.topLevel.LeftMeters_mc.y;
            this.oRepUpdatesPos.x = this.topLevel.ReputationUpdates_mc.x;
            this.oRepUpdatesPos.y = this.topLevel.ReputationUpdates_mc.y;
            this.oLevelUpAnimPos.x = this.topLevel.LevelUpAnimation_mc.x;
            this.oLevelUpAnimPos.y = this.topLevel.LevelUpAnimation_mc.y;
            this.oAPMeterPos.x = this.topLevel.RightMeters_mc.ActionPointMeter_mc.x;
            this.oAPMeterPos.y = this.topLevel.RightMeters_mc.ActionPointMeter_mc.y;
            this.oActiveEffectsPos.x = this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.x;
            this.oActiveEffectsPos.y = this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.y;
            this.oHungerMeterPos.x = this.topLevel.RightMeters_mc.HUDHungerMeter_mc.x;
            this.oHungerMeterPos.y = this.topLevel.RightMeters_mc.HUDHungerMeter_mc.y;
            this.oThirstMeterPos.x = this.topLevel.RightMeters_mc.HUDThirstMeter_mc.x;
            this.oThirstMeterPos.y = this.topLevel.RightMeters_mc.HUDThirstMeter_mc.y;
            this.oAmmoCountPos.x = this.topLevel.RightMeters_mc.AmmoCount_mc.x;
            this.oAmmoCountPos.y = this.topLevel.RightMeters_mc.AmmoCount_mc.y;
            this.oExplosiveAmmoCountPos.x = this.topLevel.RightMeters_mc.ExplosiveAmmoCount_mc.x;
            this.oExplosiveAmmoCountPos.y = this.topLevel.RightMeters_mc.ExplosiveAmmoCount_mc.y;
            this.oFlashLightWidgetPos.x = this.topLevel.RightMeters_mc.FlashLightWidget_mc.x;
            this.oFlashLightWidgetPos.y = this.topLevel.RightMeters_mc.FlashLightWidget_mc.y;
            this.oEmotePos.x = this.topLevel.RightMeters_mc.LocalEmote_mc.x;
            this.oEmotePos.y = this.topLevel.RightMeters_mc.LocalEmote_mc.y;
            this.oCompassPos.x = this.topLevel.BottomCenterGroup_mc.CompassWidget_mc.x;
            this.oCompassPos.y = this.topLevel.BottomCenterGroup_mc.CompassWidget_mc.y;
            this.oAnnouncePos.x = this.topLevel.AnnounceEventWidget_mc.x;
            this.oAnnouncePos.y = this.topLevel.AnnounceEventWidget_mc.y;
            this.oNotificationPos.x = this.topLevel.HUDNotificationsGroup_mc.Messages_mc.x;
            this.oNotificationPos.y = this.topLevel.HUDNotificationsGroup_mc.Messages_mc.y;
            this.oQuestPos.x = this.topLevel.TopRightGroup_mc.NewQuestTracker_mc.x;
            this.oQuestPos.y = this.topLevel.TopRightGroup_mc.NewQuestTracker_mc.y;
            this.oSneakPos.x = this.topLevel.TopCenterGroup_mc.StealthMeter_mc.x;
            this.oSneakPos.y = this.topLevel.TopCenterGroup_mc.StealthMeter_mc.y;
            this.oQuickLootPos.x = this.topLevel.CenterGroup_mc.QuickContainerWidget_mc.x;
            this.oQuickLootPos.y = this.topLevel.CenterGroup_mc.QuickContainerWidget_mc.y;
            this.oTeamPanelPos.x = this.topLevel.getChildAt(16).x;
            this.oTeamPanelPos.y = this.topLevel.getChildAt(16).y;
            this.oFrobberPos.x = this.topLevel.FrobberWidget_mc.x;
            this.oFrobberPos.y = this.topLevel.FrobberWidget_mc.y;
            this.oPerkPopUpPos.x = this.topLevel.BottomCenterGroup_mc.PerkVaultBoy_mc.x;
            this.oPerkPopUpPos.y = this.topLevel.BottomCenterGroup_mc.PerkVaultBoy_mc.y;
            this.oFusionPopUpPos.x = this.topLevel.RightMeters_mc.PowerArmorLowBatteryWarning_mc.x;
            this.oFusionPopUpPos.y = this.topLevel.RightMeters_mc.PowerArmorLowBatteryWarning_mc.y;
            this.oRadCountPos.x = this.topLevel.LeftMeters_mc.RadsMeter_mc.x;
            this.oRadCountPos.y = this.topLevel.LeftMeters_mc.RadsMeter_mc.y;
            this.oRollOverPos.x = this.topLevel.CenterGroup_mc.RolloverWidget_mc.x;
            this.oRollOverPos.y = this.topLevel.CenterGroup_mc.RolloverWidget_mc.y;
            this.oFusionPos.x = this.topLevel.RightMeters_mc.HUDFusionCoreMeter_mc.x;
            this.oFusionPos.y = this.topLevel.RightMeters_mc.HUDFusionCoreMeter_mc.y;
            this.oSubtitlePos.x = this.topLevel.BottomCenterGroup_mc.SubtitleText_mc.x;
            this.oSubtitlePos.y = this.topLevel.BottomCenterGroup_mc.SubtitleText_mc.y;
            this.oXPBarPos.x = this.topLevel.HUDNotificationsGroup_mc.XPMeter_mc.x;
            this.oXPBarPos.y = this.topLevel.HUDNotificationsGroup_mc.XPMeter_mc.y;
            this.oCritMeterPos.x = this.topLevel.BottomCenterGroup_mc.CritMeter_mc.x;
            this.oCritMeterPos.y = this.topLevel.BottomCenterGroup_mc.CritMeter_mc.y;
            this.oCurrencyPos.x = this.topLevel.HUDNotificationsGroup_mc.CurrencyUpdates_mc.x;
            this.oCurrencyPos.y = this.topLevel.HUDNotificationsGroup_mc.CurrencyUpdates_mc.y;
            this.oEnemyHealthPos.x = this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.x;
            this.oEnemyHealthPos.y = this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.y;
            this.oHitMarkerPos.x = this.topLevel.CenterGroup_mc.HitIndicator_mc.x;
            this.oHitMarkerPos.y = this.topLevel.CenterGroup_mc.HitIndicator_mc.y;
            this.topLevel.RightMeters_mc.HUDThirstMeter_mc.addChild(this.thirst);
            this.topLevel.RightMeters_mc.HUDHungerMeter_mc.addChild(this.hunger);
            this.topLevel.HUDNotificationsGroup_mc.Messages_mc.addChild(this.HUDNotification_mc);
            this.topLevel.RightMeters_mc.FlashLightWidget_mc.addChild(this.FlashLightRestored_mc);
            this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.addChild(this.showHealthText);
            this.HUDNotification_mc.y += 150;
            this.HUDNotification_mc.addFrameScript(0,this.frame1,5,this.frame2,15,this.frame3,16,this.frame3,170,this.frame4);
            this.HUDNotification_mc.gotoAndStop("Reset");
            this.hunger.x = 240;
            this.thirst.x = 240;
            BSUIDataManager.Subscribe("HUDRightMetersData",this.onCharInfoUpd);
            BSUIDataManager.Subscribe("HUDModeData",this.onHudModeDataChange);
            this.init();
         }
         else if(this.topLevel != null && getQualifiedClassName(this.topLevel) == "MainMenu")
         {
            this.init();
         }
         else
         {
            this.displayText("Not injected into supported SWF. Current: " + getQualifiedClassName(this.topLevel));
         }
      }
      
      private function init() : void
      {
         stage.addChild(this.debugTextHC);
         stage.addChild(this.watermark);
         this.xmlLoaderHC = new URLLoader();
         this.xmlLoaderHC.addEventListener(Event.COMPLETE,this.onFileLoad);
         this.loadConfig();
      }
      
      private function initDebugText() : void
      {
         var debugTextHCShadow:DropShadowFilter = new DropShadowFilter(1,45,0,0.75,4,4,1,BitmapFilterQuality.HIGH,false,false,false);
         this.debugTextHC = new TextField();
         var debugTextHCFormat:TextFormat = new TextFormat("$MAIN_Font_Light",20,15790320);
         debugTextHCFormat.align = "left";
         this.debugTextHC.defaultTextFormat = debugTextHCFormat;
         this.debugTextHC.setTextFormat(debugTextHCFormat);
         this.debugTextHC.multiline = true;
         this.debugTextHC.width = 1920;
         this.debugTextHC.height = 1080;
         this.debugTextHC.name = "debugTextHC";
         this.debugTextHC.text = "";
         this.debugTextHC.filters = [debugTextHCShadow];
         this.debugTextHC.visible = true;
      }
      
      private function initShowHealthText() : void
      {
         var showHealthTextShadow:DropShadowFilter = new DropShadowFilter(2,45,0,1,0,0,1,1);
         this.showHealthText = new TextField();
         this.showHealthText.setTextFormat(this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.DisplayText_mc.DisplayText_tf.getTextFormat());
         this.showHealthText.defaultTextFormat = this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.DisplayText_mc.DisplayText_tf.getTextFormat();
         this.showHealthText.width = 1920;
         this.showHealthText.height = 1080;
         this.showHealthText.name = "showHealthText";
         this.showHealthText.filters = [showHealthTextShadow];
         this.showHealthText.visible = true;
         this.showHealthText.text = "HEALTH TEXT ERROR";
         TextFieldEx.setTextAutoSize(this.showHealthText,TextFieldEx.TEXTAUTOSZ_SHRINK);
         this.showHealthText.autoSize = TextFieldAutoSize.CENTER;
         this.showHealthText.embedFonts = true;
         this.showHealthText.mouseEnabled = false;
      }
      
      private function initWatermarkText() : void
      {
         var watermarkShadow:DropShadowFilter = new DropShadowFilter(1,45,0,0.75,4,4,1,BitmapFilterQuality.HIGH,false,false,false);
         var watermarkFormat:TextFormat = new TextFormat("$Typewriter_Font",18,15790320);
         this.watermark = new TextField();
         watermarkFormat.align = "left";
         this.watermark.name = "watermark";
         this.watermark.defaultTextFormat = watermarkFormat;
         this.watermark.setTextFormat(watermarkFormat);
         this.watermark.filters = [watermarkShadow];
         this.watermark.autoSize = TextFieldAutoSize.LEFT;
         this.watermark.alpha = 0.65;
      }
      
      private function initThirstText() : void
      {
         var thirstShadow:DropShadowFilter = new DropShadowFilter(1,45,0,0.9,3,3,1,BitmapFilterQuality.HIGH,false,false,false);
         var thirstFormat:TextFormat = new TextFormat("$MAIN_Font_Bold",20,16777163);
         this.thirst = new TextField();
         thirstFormat.align = "center";
         this.thirst.name = "thirst";
         this.thirst.defaultTextFormat = thirstFormat;
         this.thirst.setTextFormat(thirstFormat);
         this.thirst.filters = [thirstShadow];
         this.thirst.autoSize = TextFieldAutoSize.CENTER;
      }
      
      private function initHungerText() : void
      {
         var hungerShadow:DropShadowFilter = new DropShadowFilter(1,45,0,0.9,3,3,1,BitmapFilterQuality.HIGH,false,false,false);
         var hungerFormat:TextFormat = new TextFormat("$MAIN_Font_Bold",20,16777163);
         this.hunger = new TextField();
         hungerFormat.align = "center";
         this.hunger.name = "hunger";
         this.hunger.defaultTextFormat = hungerFormat;
         this.hunger.setTextFormat(hungerFormat);
         this.hunger.filters = [hungerShadow];
         this.hunger.autoSize = TextFieldAutoSize.CENTER;
      }
      
      private function loadConfig() : void
      {
         try
         {
            this.xmlLoaderHC.load(new URLRequest("../HUDEditor.xml"));
            return;
         }
         catch(error:Error)
         {
            displayText("Error finding HUDEditor configuration file. " + error.message.toString());
            return;
         }
      }
      
      private function onFileLoad(e:Event) : void
      {
         this.initCommands(e.target.data);
         this.updateTimerHC.addEventListener(TimerEvent.TIMER_COMPLETE,this.update);
         this.updateTimerHC.start();
         this.xmlLoaderHC.removeEventListener(Event.COMPLETE,this.onFileLoad);
      }
      
      private function onCharInfoUpd(_arg1:FromClientDataEvent) : *
      {
         this._CharInfo = _arg1.data;
      }
      
      private function findChildrenOf(mc:MovieClip) : Array
      {
         var children:Array = new Array();
         var i:int = 0;
         while(i < mc.numChildren)
         {
            children.push(mc.getChildAt(i));
            i++;
         }
         return children;
      }
      
      private function update(event:TimerEvent) : void
      {
         var isVisible:Boolean;
         var isCrouched:Boolean;
         var isNotConfigCrouchOrVats:Boolean;
         var isVats:Boolean;
         var isAboveXHp:Boolean;
         var isAboveXAp:Boolean;
         var isAboveXFc:Boolean;
         var FcLevel:Number;
         var negativeEffects:int;
         var CurrentTeamCount:Number;
         var DmgNumbScale:Number;
         var HiddenText:String = String(this.xmlConfigHC.ImmersiveTweaks.StealthMeter.CustomText.HiddenText.toString());
         var DetectedText:String = String(this.xmlConfigHC.ImmersiveTweaks.StealthMeter.CustomText.DetectedText.toString());
         var CautionText:String = String(this.xmlConfigHC.ImmersiveTweaks.StealthMeter.CustomText.CautionText.toString());
         var DangerText:String = String(this.xmlConfigHC.ImmersiveTweaks.StealthMeter.CustomText.DangerText.toString());
         var LowBtryText:String = String(this.xmlConfigHC.ImmersiveTweaks.FusionCoreWarning.CustomText.LowBtry.toString());
         var NoBtryText:String = String(this.xmlConfigHC.ImmersiveTweaks.FusionCoreWarning.CustomText.NoBtry.toString());
         var linenum:* = undefined;
         var jj:int = 0;
         var jjj:int = 0;
         var thirstFinal:Number = NaN;
         var hungerFinal:Number = NaN;
         var thirTemp:Number = NaN;
         var hungTemp:Number = NaN;
         var iiii:int = 0;
         var iii:int = 0;
         var ii:int = 0;
         var i:int = 0;
         var di:int = 0;
         var dii:int = 0;
         var tfTemp:* = undefined;
         var color1:* = undefined;
         if(this.xmlConfigHC.ImmersiveTweaks)
         {
            isVisible = true;
            isCrouched = Boolean(this.topLevel.TopCenterGroup_mc.StealthMeter_mc.visible);
            isVats = Boolean(this.topLevel.BottomCenterGroup_mc.CritMeter_mc.visible);
            isNotConfigCrouchOrVats = false;
            isAboveXHp = this.topLevel.LeftMeters_mc.HPMeter_mc.MeterBar_mc.Percent * 100 > Number(this.xmlConfigHC.ImmersiveTweaks.Hp.FadePer);
            isAboveXAp = this.topLevel.RightMeters_mc.ActionPointMeter_mc.MeterBar_mc.Percent * 100 > Number(this.xmlConfigHC.ImmersiveTweaks.Ap.FadePer);
            isAboveXFc = this.topLevel.RightMeters_mc.HUDFusionCoreMeter_mc.Meter_mc.currentFrame / this.topLevel.RightMeters_mc.HUDFusionCoreMeter_mc.Meter_mc.totalFrames * 100 > Number(this.xmlConfigHC.ImmersiveTweaks.FusionCore.FadePer);
            FcLevel = this.topLevel.RightMeters_mc.HUDFusionCoreMeter_mc.Meter_mc.currentFrame / this.topLevel.RightMeters_mc.HUDFusionCoreMeter_mc.Meter_mc.totalFrames * 100;
            this.debugTextHC.text = "";
            if(this.xmlConfigHC.ImmersiveTweaks.Debug.Display == "true")
            {
               this.displayText("IT: " + Boolean(this.xmlConfigHC.ImmersiveTweaks) + ", (b)Hp.Hide:" + Boolean(this.xmlConfigHC.ImmersiveTweaks.Hp.Hide) + ", Hp.Hide:" + (this.xmlConfigHC.ImmersiveTweaks.Hp.Hide == "true"));
               this.displayText("crouched: " + this.topLevel.TopCenterGroup_mc.StealthMeter_mc.visible + ", Hp.Crouch:" + (this.xmlConfigHC.ImmersiveTweaks.Hp.Crouch == "true") + ", !Hp.Crouch:" + (this.xmlConfigHC.ImmersiveTweaks.Hp.Crouch != "true"));
               this.displayText("crit: " + this.topLevel.BottomCenterGroup_mc.CritMeter_mc.visible + ", Hp.VaTs:" + (this.xmlConfigHC.ImmersiveTweaks.Hp.VaTs == "true") + ", !Hp.VaTs:" + (this.xmlConfigHC.ImmersiveTweaks.Hp.VaTs != "true"));
               this.displayText("hp%: " + this.topLevel.LeftMeters_mc.HPMeter_mc.MeterBar_mc.Percent * 100 + ", Hp.Fade:" + (this.xmlConfigHC.ImmersiveTweaks.Hp.Fade == "true") + ", Hp.FadePer:" + Number(this.xmlConfigHC.ImmersiveTweaks.Hp.FadePer));
               this.displayText("Fusion Core%: " + FcLevel);
               this.displayText("Test Element: " + this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(10));
               di = 0;
               while(di < this.topLevel.LeftMeters_mc.HPMeter_mc.numChildren)
               {
                  displayText(di + ":" + getQualifiedClassName(this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(di)));
                  di++;
               }
            }
            if(this.xmlConfigHC.ImmersiveTweaks.Compass.Hide == "true")
            {
               this.CompassScale = 0;
               this.topLevel.BottomCenterGroup_mc.CompassWidget_mc.scaleX = 0;
               this.topLevel.BottomCenterGroup_mc.CompassWidget_mc.scaleY = 0;
            }
            else if(!isCrouched && this.xmlConfigHC.ImmersiveTweaks.Compass.Crouch == "true")
            {
               this.CompassScale = 0;
               this.topLevel.BottomCenterGroup_mc.CompassWidget_mc.scaleX = 0;
               this.topLevel.BottomCenterGroup_mc.CompassWidget_mc.scaleY = 0;
            }
            else
            {
               this.CompassScale = this.CompassScale = this.xmlConfigHC.Elements.Compass.Scale;
               this.topLevel.BottomCenterGroup_mc.CompassWidget_mc.scaleX = this.CompassScale;
               this.topLevel.BottomCenterGroup_mc.CompassWidget_mc.scaleY = this.CompassScale;
            }
            isVisible = true;
            isNotConfigCrouchOrVats = false;
            if(this.xmlConfigHC.ImmersiveTweaks.Hp.Hide == "true")
            {
               isVisible = false;
            }
            else
            {
               if(this.xmlConfigHC.ImmersiveTweaks.Hp.Crouch == "true")
               {
                  if(this.xmlConfigHC.ImmersiveTweaks.Hp.VaTs == "true")
                  {
                     isVisible = isCrouched || isVats;
                  }
                  else
                  {
                     isVisible = isCrouched;
                  }
               }
               else if(this.xmlConfigHC.ImmersiveTweaks.Hp.VaTs == "true")
               {
                  isVisible = isVats;
               }
               else
               {
                  isNotConfigCrouchOrVats = true;
               }
               if(this.xmlConfigHC.ImmersiveTweaks.Hp.Fade == "true")
               {
                  if(isVisible)
                  {
                     if(isNotConfigCrouchOrVats && isAboveXHp)
                     {
                        isVisible = false;
                     }
                  }
                  else if(!isAboveXHp)
                  {
                     isVisible = true;
                  }
               }
            }
            this.topLevel.LeftMeters_mc.HPMeter_mc.visible = isVisible;
            isVisible = true;
            isNotConfigCrouchOrVats = false;
            if(this.xmlConfigHC.ImmersiveTweaks.Ap.Hide == "true")
            {
               isVisible = false;
            }
            else
            {
               if(this.xmlConfigHC.ImmersiveTweaks.Ap.Crouch == "true")
               {
                  if(this.xmlConfigHC.ImmersiveTweaks.Ap.VaTs == "true")
                  {
                     isVisible = isCrouched || isVats;
                  }
                  else
                  {
                     isVisible = isCrouched;
                  }
               }
               else if(this.xmlConfigHC.ImmersiveTweaks.Ap.VaTs == "true")
               {
                  isVisible = isVats;
               }
               else
               {
                  isNotConfigCrouchOrVats = true;
               }
               if(this.xmlConfigHC.ImmersiveTweaks.Ap.Fade == "true")
               {
                  if(isVisible)
                  {
                     if(isNotConfigCrouchOrVats && isAboveXAp)
                     {
                        isVisible = false;
                     }
                  }
                  else if(!isAboveXAp)
                  {
                     isVisible = true;
                  }
               }
            }
            this.topLevel.RightMeters_mc.ActionPointMeter_mc.visible = isVisible;
            isVisible = true;
            isNotConfigCrouchOrVats = false;
            if(this.xmlConfigHC.ImmersiveTweaks.FusionCoreMeter.Hide == "true")
            {
               isVisible = false;
            }
            else
            {
               if(this.xmlConfigHC.ImmersiveTweaks.FusionCoreMeter.Crouch == "true")
               {
                  if(this.xmlConfigHC.ImmersiveTweaks.FusionCoreMeter.VaTs == "true")
                  {
                     isVisible = isCrouched || isVats;
                  }
                  else
                  {
                     isVisible = isCrouched;
                  }
               }
               else if(this.xmlConfigHC.ImmersiveTweaks.FusionCoreMeter.VaTs == "true")
               {
                  isVisible = isVats;
               }
               else
               {
                  isNotConfigCrouchOrVats = true;
               }
               if(this.xmlConfigHC.ImmersiveTweaks.FusionCoreMeter.Fade == "true")
               {
                  if(isVisible)
                  {
                     if(isNotConfigCrouchOrVats && isAboveXFc)
                     {
                        isVisible = false;
                     }
                  }
                  else if(!isAboveXFc)
                  {
                     isVisible = true;
                  }
               }
            }
            this.topLevel.RightMeters_mc.HUDFusionCoreMeter_mc.visible = isVisible;
            if(this.xmlConfigHC.ImmersiveTweaks.HungerThirst.Hide == "true")
            {
               this.topLevel.RightMeters_mc.HUDThirstMeter_mc.visible = false;
               this.topLevel.RightMeters_mc.HUDHungerMeter_mc.visible = false;
            }
            else if(!isCrouched && this.xmlConfigHC.ImmersiveTweaks.HungerThirst.Crouch == "true")
            {
               this.topLevel.RightMeters_mc.HUDThirstMeter_mc.visible = false;
               this.topLevel.RightMeters_mc.HUDHungerMeter_mc.visible = false;
            }
            else
            {
               this.topLevel.RightMeters_mc.HUDThirstMeter_mc.visible = true;
               this.topLevel.RightMeters_mc.HUDHungerMeter_mc.visible = true;
            }
            isVisible = true;
            isNotConfigCrouchOrVats = false;
            if(this.xmlConfigHC.ImmersiveTweaks.TeamPanel.Hide == "true")
            {
               isVisible = false;
            }
            else if(this.xmlConfigHC.ImmersiveTweaks.TeamPanel.Crouch == "true")
            {
               isVisible = isCrouched;
            }
            else
            {
               isVisible = true;
               isNotConfigCrouchOrVats = true;
            }
            if(this.xmlConfigHC.ImmersiveTweaks.TeamPanel.HideEmptyTeam == "true")
            {
               CurrentTeamCount = Number(this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).numChildren);
               if(isVisible)
               {
                  if(isNotConfigCrouchOrVats && CurrentTeamCount <= 1)
                  {
                     isVisible = false;
                  }
               }
               else if(CurrentTeamCount > 1)
               {
                  isVisible = true;
               }
            }
            this.topLevel.PartyResolutionContainer_mc.visible = isVisible;
            this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.AreaVoiceList_mc.visible = true;
            isVisible = true;
            isNotConfigCrouchOrVats = false;
            if(this.xmlConfigHC.ImmersiveTweaks.ActiveEffects.Hide == "true")
            {
               isVisible = false;
            }
            else if(this.xmlConfigHC.ImmersiveTweaks.ActiveEffects.Crouch == "true")
            {
               isVisible = isCrouched;
            }
            else
            {
               isVisible = true;
            }
            if(this.xmlConfigHC.ImmersiveTweaks.ActiveEffects.OnlyNegativeEffects == "true")
            {
               iii = 0;
               negativeEffects = 0;
               while(iii < this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.ClipHolderInternal.numChildren)
               {
                  if(this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.ClipHolderInternal.getChildAt(iii).currentFrame == 2)
                  {
                     if(this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.ClipHolderInternal.getChildAt(iii).visible)
                     {
                        negativeEffects++;
                        this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.ClipHolderInternal.getChildAt(iii).x = 4 - negativeEffects * 39;
                     }
                  }
                  else
                  {
                     this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.ClipHolderInternal.getChildAt(iii).visible = false;
                  }
                  iii++;
               }
            }
            this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.visible = isVisible;
            isVisible = true;
            isNotConfigCrouchOrVats = false;
            if(this.xmlConfigHC.ImmersiveTweaks.StealthMeter.CustomText.Enable == "true")
            {
               HiddenText = String(this.xmlConfigHC.ImmersiveTweaks.StealthMeter.CustomText.HiddenText.toString());
               DetectedText = String(this.xmlConfigHC.ImmersiveTweaks.StealthMeter.CustomText.DetectedText.toString());
               CautionText = String(this.xmlConfigHC.ImmersiveTweaks.StealthMeter.CustomText.CautionText.toString());
               DangerText = String(this.xmlConfigHC.ImmersiveTweaks.StealthMeter.CustomText.DangerText.toString());
               if(this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == "HIDDEN" || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == HiddenText)
               {
                  this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text = HiddenText;
               }
               if(this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == "DETECTED" || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == DetectedText)
               {
                  this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text = DetectedText;
               }
               if(this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == "CAUTION" || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == CautionText)
               {
                  this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text = CautionText;
               }
               if(this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == "DANGER" || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == DangerText)
               {
                  this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text = DangerText;
               }
            }
            else
            {
               if(this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == "HIDDEN" || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == HiddenText)
               {
                  this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text = "HIDDEN";
               }
               if(this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == "DETECTED" || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == DetectedText)
               {
                  this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text = "DETECTED";
               }
               if(this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == "CAUTION" || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == CautionText)
               {
                  this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text = "CAUTION";
               }
               if(this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == "DANGER" || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == DangerText)
               {
                  this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text = "DANGER";
               }
            }
            if(this.xmlConfigHC.ImmersiveTweaks.StealthMeter.Hide == "true")
            {
               isVisible = false;
            }
            else if(this.xmlConfigHC.ImmersiveTweaks.StealthMeter.SpiderSense == "true")
            {
               if(this.xmlConfigHC.ImmersiveTweaks.StealthMeter.ThiefSense == "true")
               {
                  if(this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == "DETECTED" || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == "CAUTION" || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == "DANGER" || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates
                  .StealthTextInstance.text == DetectedText || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == CautionText || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == DangerText)
                  {
                     isVisible = true;
                  }
                  else if(this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == "HIDDEN" || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == HiddenText)
                  {
                     isVisible = false;
                  }
               }
               else if(this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == "CAUTION" || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == "DANGER" || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == CautionText || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates
               .stealthTextAnimStates.StealthTextInstance.text == DangerText)
               {
                  isVisible = true;
               }
               else if(this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == "HIDDEN" || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == "DETECTED" || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == HiddenText || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates
               .stealthTextAnimStates.StealthTextInstance.text == DetectedText)
               {
                  isVisible = false;
               }
            }
            else if(this.xmlConfigHC.ImmersiveTweaks.StealthMeter.ThiefSense == "true")
            {
               if(this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == "DETECTED" || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == DetectedText)
               {
                  isVisible = true;
               }
               else
               {
                  isVisible = false;
               }
            }
            else
            {
               isNotConfigCrouchOrVats = true;
            }
            if(isNotConfigCrouchOrVats && this.xmlConfigHC.ImmersiveTweaks.StealthMeter.Hide == "false")
            {
               this.SneakMeterScale = this.xmlConfigHC.Elements.StealthMeter.Scale;
               this.topLevel.TopCenterGroup_mc.StealthMeter_mc.scaleX = this.SneakMeterScale;
               this.topLevel.TopCenterGroup_mc.StealthMeter_mc.scaleY = this.SneakMeterScale;
            }
            else if(!isVisible)
            {
               this.SneakMeterScale = 0;
               this.topLevel.TopCenterGroup_mc.StealthMeter_mc.scaleX = 0;
               this.topLevel.TopCenterGroup_mc.StealthMeter_mc.scaleY = 0;
            }
            else if(isVisible)
            {
               this.SneakMeterScale = this.xmlConfigHC.Elements.StealthMeter.Scale;
               this.topLevel.TopCenterGroup_mc.StealthMeter_mc.scaleX = this.SneakMeterScale;
               this.topLevel.TopCenterGroup_mc.StealthMeter_mc.scaleY = this.SneakMeterScale;
            }
            if(this.xmlConfigHC.ImmersiveTweaks.StealthMeter.DisableBrackets == "true")
            {
               this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.BracketRightInstance.visible = false;
               this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.BracketLeftInstance.visible = false;
            }
            else
            {
               this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.BracketRightInstance.visible = true;
               this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.BracketLeftInstance.visible = true;
            }
            if(this.xmlConfigHC.ImmersiveTweaks.Xp.Hide == "true")
            {
               this.XPBarScale = 0;
               this.topLevel.HUDNotificationsGroup_mc.XPMeter_mc.scaleX = 0;
               this.topLevel.HUDNotificationsGroup_mc.XPMeter_mc.scaleY = 0;
            }
            else if(this.xmlConfigHC.ImmersiveTweaks.Xp.Hide == "false")
            {
               this.XPBarScale = this.xmlConfigHC.Elements.XPBar.Scale;
               this.topLevel.HUDNotificationsGroup_mc.XPMeter_mc.scaleX = this.XPBarScale;
               this.topLevel.HUDNotificationsGroup_mc.XPMeter_mc.scaleY = this.XPBarScale;
            }
            if(this.xmlConfigHC.ImmersiveTweaks.InteractPrompts.QuickLoot.Hide == "true")
            {
               this.QuickLootScale = 0;
               this.topLevel.CenterGroup_mc.QuickContainerWidget_mc.scaleX = 0;
               this.topLevel.CenterGroup_mc.QuickContainerWidget_mc.scaleY = 0;
            }
            else if(!isCrouched && this.xmlConfigHC.ImmersiveTweaks.InteractPrompts.QuickLoot.Crouch == "true")
            {
               this.QuickLootScale = 0;
               this.topLevel.CenterGroup_mc.QuickContainerWidget_mc.scaleX = 0;
               this.topLevel.CenterGroup_mc.QuickContainerWidget_mc.scaleY = 0;
            }
            else
            {
               this.QuickLootScale = this.xmlConfigHC.Elements.QuickLoot.Scale;
               this.topLevel.CenterGroup_mc.QuickContainerWidget_mc.scaleX = this.QuickLootScale;
               this.topLevel.CenterGroup_mc.QuickContainerWidget_mc.scaleY = this.QuickLootScale;
            }
            if(this.xmlConfigHC.ImmersiveTweaks.InteractPrompts.Frobber.Hide == "true")
            {
               this.FrobberScale = 0;
               this.topLevel.FrobberWidget_mc.scaleX = 0;
               this.topLevel.FrobberWidget_mc.scaleY = 0;
            }
            else if(!isCrouched && this.xmlConfigHC.ImmersiveTweaks.InteractPrompts.Frobber.Crouch == "true")
            {
               this.FrobberScale = 0;
               this.topLevel.FrobberWidget_mc.scaleX = 0;
               this.topLevel.FrobberWidget_mc.scaleY = 0;
            }
            else
            {
               this.FrobberScale = this.xmlConfigHC.Elements.Frobber.Scale;
               this.topLevel.FrobberWidget_mc.scaleX = this.FrobberScale;
               this.topLevel.FrobberWidget_mc.scaleY = this.FrobberScale;
            }
            if(this.xmlConfigHC.ImmersiveTweaks.InteractPrompts.RollOver.Hide == "true")
            {
               this.RollOverScale = 0;
               this.topLevel.CenterGroup_mc.RolloverWidget_mc.scaleX = 0;
               this.topLevel.CenterGroup_mc.RolloverWidget_mc.scaleY = 0;
            }
            else if(!isCrouched && this.xmlConfigHC.ImmersiveTweaks.InteractPrompts.RollOver.Crouch == "true")
            {
               this.RollOverScale = 0;
               this.topLevel.CenterGroup_mc.RolloverWidget_mc.scaleX = 0;
               this.topLevel.CenterGroup_mc.RolloverWidget_mc.scaleY = 0;
            }
            else
            {
               this.RollOverScale = this.xmlConfigHC.Elements.RollOver.Scale;
               this.topLevel.CenterGroup_mc.RolloverWidget_mc.scaleX = this.RollOverScale;
               this.topLevel.CenterGroup_mc.RolloverWidget_mc.scaleY = this.RollOverScale;
            }
            if(this.xmlConfigHC.ImmersiveTweaks.PerkPopUp.Hide == "true")
            {
               this.PerkPopUpScale = 0;
               this.topLevel.BottomCenterGroup_mc.PerkVaultBoy_mc.scaleX = 0;
               this.topLevel.BottomCenterGroup_mc.PerkVaultBoy_mc.scaleY = 0;
            }
            else
            {
               this.PerkPopUpScale = this.xmlConfigHC.ImmersiveTweaks.PerkPopUp.Scale;
               this.topLevel.BottomCenterGroup_mc.PerkVaultBoy_mc.scaleX = this.PerkPopUpScale;
               this.topLevel.BottomCenterGroup_mc.PerkVaultBoy_mc.scaleY = this.PerkPopUpScale;
            }
            if(this.xmlConfigHC.ImmersiveTweaks.Emote.HideEmoteWidget == "true")
            {
               this.topLevel.RightMeters_mc.LocalEmote_mc.visible = false;
            }
            else
            {
               this.topLevel.RightMeters_mc.LocalEmote_mc.visible = true;
            }
            if(this.xmlConfigHC.ImmersiveTweaks.Emote.HidePlayerEmoteBubble == "true")
            {
               iiii = 0;
               while(iiii < topLevel.TeammateMarkerBase.TeamNameplates.length)
               {
                  this.topLevel.TeammateMarkerBase.TeamNameplates[iiii].Emote_mc.visible = false;
                  iiii++;
               }
            }
            else
            {
               iiii = 0;
               while(iiii < topLevel.TeammateMarkerBase.TeamNameplates.length)
               {
                  this.topLevel.TeammateMarkerBase.TeamNameplates[iiii].Emote_mc.visible = true;
                  iiii++;
               }
            }
            if(this.xmlConfigHC.ImmersiveTweaks.FusionCoreWarning.Hide == "true")
            {
               this.FusionPopUpScale = 0;
               this.topLevel.RightMeters_mc.PowerArmorLowBatteryWarning_mc.scaleX = 0;
               this.topLevel.RightMeters_mc.PowerArmorLowBatteryWarning_mc.scaleY = 0;
            }
            else
            {
               this.FusionPopUpScale = this.xmlConfigHC.ImmersiveTweaks.FusionCoreWarning.Scale;
               this.topLevel.RightMeters_mc.PowerArmorLowBatteryWarning_mc.scaleX = this.FusionPopUpScale;
               this.topLevel.RightMeters_mc.PowerArmorLowBatteryWarning_mc.scaleY = this.FusionPopUpScale;
            }
            if(this.xmlConfigHC.ImmersiveTweaks.FusionCoreWarning.CustomText.Enable == "true")
            {
               LowBtryText = String(this.xmlConfigHC.ImmersiveTweaks.FusionCoreWarning.CustomText.LowBtry.toString());
               NoBtryText = String(this.xmlConfigHC.ImmersiveTweaks.FusionCoreWarning.CustomText.NoBtry.toString());
               if(FcLevel != 0.2)
               {
                  this.topLevel.RightMeters_mc.PowerArmorLowBatteryWarning_mc.WarningTextHolder_mc.PowerArmorLowBatteryWarning_tf.text = LowBtryText;
               }
               else
               {
                  this.topLevel.RightMeters_mc.PowerArmorLowBatteryWarning_mc.WarningTextHolder_mc.PowerArmorLowBatteryWarning_tf.text = NoBtryText;
               }
            }
            if(this.xmlConfigHC.ImmersiveTweaks.Indicators.HideExplosiveIndicators == "true")
            {
               this.topLevel.CenterGroup_mc.ExplosiveIndicatorBase_mc.visible = false;
            }
            else
            {
               this.topLevel.CenterGroup_mc.ExplosiveIndicatorBase_mc.visible = true;
            }
            if(this.xmlConfigHC.ImmersiveTweaks.Indicators.HideDirectionalHitIndicator == "true")
            {
               this.topLevel.CenterGroup_mc.DirectionalHitIndicatorBase_mc.visible = false;
            }
            else
            {
               this.topLevel.CenterGroup_mc.DirectionalHitIndicatorBase_mc.visible = true;
            }
            if(this.xmlConfigHC.ImmersiveTweaks.RadDamageIndicator.Hide == "true")
            {
               this.RadCountScale = 0;
               this.topLevel.LeftMeters_mc.RadsMeter_mc.scaleX = 0;
               this.topLevel.LeftMeters_mc.RadsMeter_mc.scaleY = 0;
            }
            else
            {
               this.RadCountScale = this.xmlConfigHC.ImmersiveTweaks.RadDamageIndicator.Scale;
               this.topLevel.LeftMeters_mc.RadsMeter_mc.scaleX = this.RadCountScale;
               this.topLevel.LeftMeters_mc.RadsMeter_mc.scaleY = this.RadCountScale;
            }
            if(this.xmlConfigHC.ImmersiveTweaks.RadDamageIndicator.OnlyHideSymbol == "true")
            {
               this.topLevel.LeftMeters_mc.RadsMeter_mc.RadsIcon_mc.visible = false;
            }
            else
            {
               this.topLevel.LeftMeters_mc.RadsMeter_mc.RadsIcon_mc.visible = true;
            }
            if(this.xmlConfigHC.ImmersiveTweaks.RadDamageIndicator.OnlyHideText == "true")
            {
               this.topLevel.LeftMeters_mc.RadsMeter_mc.RADS_tf.visible = false;
               this.topLevel.LeftMeters_mc.RadsMeter_mc.RadsNumber_tf.visible = false;
            }
            else
            {
               RadCountScale;
               this.topLevel.LeftMeters_mc.RadsMeter_mc.RADS_tf.visible = true;
               this.topLevel.LeftMeters_mc.RadsMeter_mc.RadsNumber_tf.visible = true;
            }
            if(this.xmlConfigHC.ImmersiveTweaks.RadDamageIndicator.CustomText.Enable == "true")
            {
               if(RadCountLock == 0)
               {
                  RadCountTextStorage = this.topLevel.LeftMeters_mc.RadsMeter_mc.RADS_tf.text;
                  RadCountAlignStorage = this.topLevel.LeftMeters_mc.RadsMeter_mc.RADS_tf.x;
                  RadCountLock = 1;
               }
               this.topLevel.LeftMeters_mc.RadsMeter_mc.RADS_tf.autoSize = "right";
               this.topLevel.LeftMeters_mc.RadsMeter_mc.RADS_tf.text = String(this.xmlConfigHC.ImmersiveTweaks.RadDamageIndicator.CustomText.Text.toString());
               this.topLevel.LeftMeters_mc.RadsMeter_mc.RadsNumber_tf.visible = false;
               if(RadCountLock == 1)
               {
                  RadCountLock = 2;
               }
            }
            else if(RadCountLock == 2)
            {
               this.topLevel.LeftMeters_mc.RadsMeter_mc.RADS_tf.text = RadCountTextStorage;
               this.topLevel.LeftMeters_mc.RadsMeter_mc.RADS_tf.autoSize = "left";
               this.topLevel.LeftMeters_mc.RadsMeter_mc.RADS_tf.x = RadCountAlignStorage;
               this.topLevel.LeftMeters_mc.RadsMeter_mc.RadsNumber_tf.visible = true;
               RadCountLock = 1;
            }
            if(!isNaN(this.xmlConfigHC.ImmersiveTweaks.Indicators.FloatingDmgNumbScale))
            {
               dii = 0;
               DmgNumbScale = Number(this.xmlConfigHC.ImmersiveTweaks.Indicators.FloatingDmgNumbScale);
               while(dii < this.topLevel.DamageNumbers_mc.numChildren)
               {
                  this.topLevel.DamageNumbers_mc.getChildAt(dii).scaleX = DmgNumbScale;
                  this.topLevel.DamageNumbers_mc.getChildAt(dii).scaleY = DmgNumbScale;
                  dii++;
               }
            }
            if(this.xmlConfigHC.ImmersiveTweaks.ImprovedHealthBar.Enable == "true")
            {
               if(ImpHealthLock == 0)
               {
                  this.oImpHealthPos.x = this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(10).x;
                  this.oImpHealthPos.y = this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(10).y;
                  ImpHealthLock = 1;
               }
               this.ImpHealthPos.x = this.xmlConfigHC.ImmersiveTweaks.ImprovedHealthBar.X;
               this.ImpHealthPos.y = this.xmlConfigHC.ImmersiveTweaks.ImprovedHealthBar.Y;
               this.ImpHealthScale = this.xmlConfigHC.ImmersiveTweaks.ImprovedHealthBar.Scale;
               this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(10).x = this.oImpHealthPos.x + this.ImpHealthPos.x;
               this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(10).y = this.oImpHealthPos.y + this.ImpHealthPos.y;
               if(this.ImpHealthScale <= this.maxScale)
               {
                  this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(10).scaleX = this.ImpHealthScale;
                  this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(10).scaleY = this.ImpHealthScale;
               }
               else
               {
                  this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(10).scaleX = 1;
                  this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(10).scaleY = 1;
               }
            }
            else if(ImpHealthLock == 1)
            {
               this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(10).x = this.oImpHealthPos.x;
               this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(10).y = this.oImpHealthPos.y;
               this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(10).scaleX = 1;
               this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(10).scaleY = 1;
               ImpHealthLock = 0;
            }
         }
         if(this.xmlConfigHC.Elements.LeftMeter.ShowHPLabel == "false")
         {
            this.topLevel.LeftMeters_mc.HPMeter_mc.DisplayText_mc.DisplayText_tf.text = "";
         }
         else if(this.xmlConfigHC.Elements.LeftMeter.ShowHPLabel == "true")
         {
            this.topLevel.LeftMeters_mc.HPMeter_mc.DisplayText_mc.DisplayText_tf.text = "HP";
         }
         if(this.xmlConfigHC.Elements.RightMeter.Parts.APMeter.ShowAPLabel == "false")
         {
            this.topLevel.RightMeters_mc.ActionPointMeter_mc.DisplayText_mc.DisplayText_tf.text = "";
         }
         else if(this.xmlConfigHC.Elements.RightMeter.Parts.APMeter.ShowAPLabel == "true")
         {
            this.topLevel.RightMeters_mc.ActionPointMeter_mc.DisplayText_mc.DisplayText_tf.text = "AP";
         }
         if(this.xmlConfigHC.Elements.LeftMeter.ShowBarBG == "false")
         {
            this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(0).visible = false;
         }
         else if(this.xmlConfigHC.Elements.LeftMeter.ShowBarBG == "true")
         {
            this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(0).visible = true;
         }
         if(this.xmlConfigHC.Elements.RightMeter.Parts.APMeter.ShowBarBG == "false")
         {
            this.topLevel.RightMeters_mc.ActionPointMeter_mc.APBarFrame_mc.visible = false;
         }
         else if(this.xmlConfigHC.Elements.RightMeter.Parts.APMeter.ShowBarBG == "true")
         {
            this.topLevel.RightMeters_mc.ActionPointMeter_mc.APBarFrame_mc.visible = true;
         }
         if(this.xmlConfigHC.Elements.LeftMeter.HPLabelSide == "left")
         {
            this.topLevel.LeftMeters_mc.HPMeter_mc.DisplayText_mc.x = -45;
         }
         else if(this.xmlConfigHC.Elements.LeftMeter.HPLabelSide == "right")
         {
            this.topLevel.LeftMeters_mc.HPMeter_mc.DisplayText_mc.x = 325;
         }
         if(this.xmlConfigHC.Elements.RightMeter.Parts.APMeter.APLabelSide == "left")
         {
            this.topLevel.RightMeters_mc.ActionPointMeter_mc.DisplayText_mc.x = -321;
         }
         else if(this.xmlConfigHC.Elements.RightMeter.Parts.APMeter.APLabelSide == "right")
         {
            this.topLevel.RightMeters_mc.ActionPointMeter_mc.DisplayText_mc.x = 43;
         }
         if(this.xmlConfigHC.dbg.e != undefined && this.xmlConfigHC.dbg.e == "191x7")
         {
            this.debugTextHC.text = "";
            this.displayText("DEBUG MODE");
            this.displayText("----------");
            this.displayText("reloadCount: " + this.reloadCount.toString());
            this.displayText("----------");
         }
         this.topLevel.BottomCenterGroup_mc.CompassWidget_mc.filters = [bccompassColorMatrix];
         this.ShowHealth(0);
         if(this.xmlConfigHC.Colors.HUD.TZMapMarkers == "true")
         {
            this.topLevel.BottomCenterGroup_mc.CompassWidget_mc.QuestMarkerHolder_mc.filters = [bccompassInvColorMatrix];
            jj = 5;
            while(jj < this.topLevel.BottomCenterGroup_mc.CompassWidget_mc.OtherMarkerHolder_mc.numChildren)
            {
               this.topLevel.BottomCenterGroup_mc.CompassWidget_mc.OtherMarkerHolder_mc.getChildAt(jj).filters = [bccompassInvColorMatrix];
               jj++;
            }
         }
         else if(this.xmlConfigHC.Colors.HUD.TZMapMarkers == "false")
         {
            this.topLevel.BottomCenterGroup_mc.CompassWidget_mc.QuestMarkerHolder_mc.filters = null;
            jjj = 5;
            while(jjj < this.topLevel.BottomCenterGroup_mc.CompassWidget_mc.OtherMarkerHolder_mc.numChildren)
            {
               if(this.topLevel.BottomCenterGroup_mc.CompassWidget_mc.OtherMarkerHolder_mc.getChildAt(jjj).currentFrameLabel == "Enemy")
               {
                  this.topLevel.BottomCenterGroup_mc.CompassWidget_mc.OtherMarkerHolder_mc.getChildAt(jjj).filters = [bccompassInvColorMatrix];
               }
               else
               {
                  this.topLevel.BottomCenterGroup_mc.CompassWidget_mc.OtherMarkerHolder_mc.getChildAt(jjj).filters = null;
               }
               jjj++;
            }
         }
         this.thpShow = this.xmlConfigHC.Colors.HUD.ThirstHungerPercentShow;
         if(this.xmlConfigHC.Colors.HUD.AlwaysShowThirstHunger == "true")
         {
            this.topLevel.RightMeters_mc.HUDThirstMeter_mc.gotoAndStop(7);
            this.topLevel.RightMeters_mc.HUDHungerMeter_mc.gotoAndStop(7);
            this.VisibilityChanged = 1;
         }
         else if(this.xmlConfigHC.Colors.HUD.AlwaysShowThirstHunger == "false" && this.VisibilityChanged == 1)
         {
            this.topLevel.RightMeters_mc.HUDThirstMeter_mc.gotoAndStop("rollOff");
            this.topLevel.RightMeters_mc.HUDHungerMeter_mc.gotoAndStop("rollOff");
            this.VisibilityChanged = 0;
         }
         linenum = 0;
         try
         {
            if(this.thpShow == "true")
            {
               linenum = 1;
               this.thirstPC = this._CharInfo.thirstPercent;
               linenum = 2;
               this.hungerPC = this._CharInfo.hungerPercent;
               linenum = 3;
               thirstFinal = GlobalFunc.Clamp(this.thirstPC,0,this.PercentMax) / this.PercentMax;
               linenum = 4;
               hungerFinal = GlobalFunc.Clamp(this.hungerPC,0,this.PercentMax) / this.PercentMax;
               linenum = 5;
               thirTemp = Math.round(Math.ceil(this.thirstPC * this.topLevel.RightMeters_mc.HUDThirstMeter_mc.Meter_mc.totalFrames) * 2 / 10);
               this.thirst.text = thirTemp.toString() + "%";
               linenum = 6;
               hungTemp = Math.round(Math.ceil(this.hungerPC * this.topLevel.RightMeters_mc.HUDHungerMeter_mc.Meter_mc.totalFrames) * 2 / 10);
               this.hunger.text = hungTemp.toString() + "%";
               linenum = 7;
               if(this.topLevel.RightMeters_mc.HUDThirstMeter_mc.currentFrame == 11)
               {
                  this.thirst.visible = false;
               }
               linenum = 8;
               if(this.topLevel.RightMeters_mc.HUDHungerMeter_mc.currentFrame == 11)
               {
                  this.hunger.visible = false;
               }
               linenum = 9;
               if(this.topLevel.RightMeters_mc.HUDThirstMeter_mc.currentFrame == 12)
               {
                  this.thirst.visible = false;
               }
               linenum = 10;
               if(this.topLevel.RightMeters_mc.HUDHungerMeter_mc.currentFrame == 12)
               {
                  this.hunger.visible = false;
               }
               linenum = 11;
               if(this.topLevel.RightMeters_mc.HUDThirstMeter_mc.currentFrame == 13)
               {
                  this.thirst.visible = false;
               }
               linenum = 12;
               if(this.topLevel.RightMeters_mc.HUDHungerMeter_mc.currentFrame == 13)
               {
                  this.hunger.visible = false;
               }
               linenum = 13;
               if(this.topLevel.RightMeters_mc.HUDThirstMeter_mc.currentFrame == 5)
               {
                  this.thirst.visible = true;
               }
               linenum = 14;
               if(this.topLevel.RightMeters_mc.HUDHungerMeter_mc.currentFrame == 5)
               {
                  this.hunger.visible = true;
               }
               linenum = 15;
               if(this.topLevel.RightMeters_mc.HUDThirstMeter_mc.currentFrame == 6)
               {
                  this.thirst.visible = true;
               }
               linenum = 16;
               if(this.topLevel.RightMeters_mc.HUDHungerMeter_mc.currentFrame == 6)
               {
                  this.hunger.visible = true;
               }
               linenum = 17;
               if(this.topLevel.RightMeters_mc.HUDThirstMeter_mc.currentFrame == 7)
               {
                  this.thirst.visible = true;
               }
               linenum = 18;
               if(this.topLevel.RightMeters_mc.HUDHungerMeter_mc.currentFrame == 7)
               {
                  this.hunger.visible = true;
               }
            }
            else if(this.thpShow == "false")
            {
               this.thirst.visible = false;
               this.hunger.visible = false;
               this.thirst.text = "";
               this.hunger.text = "";
            }
         }
         catch(e:Error)
         {
            if(e.toString() != "TypeError: Error #1009")
            {
               displayText("XML problem (resourcemeters): " + e.toString() + "," + linenum);
            }
         }
         if(this.xmlConfigHC.Colors.HUD.EnableRecoloring == "true")
         {
            ii = 0;
            while(ii < this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.ClipHolderInternal.numChildren)
            {
               if(this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.ClipHolderInternal.getChildAt(ii).getChildAt(2).currentFrame == 50)
               {
                  this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.ClipHolderInternal.getChildAt(ii).getChildAt(0).filters = [rightmetersInvColorMatrix];
                  this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.ClipHolderInternal.getChildAt(ii).getChildAt(1).filters = [rightmetersInvColorMatrix];
               }
               else if(this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.ClipHolderInternal.getChildAt(ii).getChildAt(2).currentFrame == 2)
               {
                  this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.ClipHolderInternal.getChildAt(ii).getChildAt(0).filters = [rightmetersInvColorMatrix];
                  this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.ClipHolderInternal.getChildAt(ii).getChildAt(1).filters = [rightmetersInvColorMatrix];
               }
               else if(this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.ClipHolderInternal.getChildAt(ii).getChildAt(2).currentFrame == 43)
               {
                  this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.ClipHolderInternal.getChildAt(ii).getChildAt(0).filters = [rightmetersInvColorMatrix];
                  this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.ClipHolderInternal.getChildAt(ii).getChildAt(1).filters = [rightmetersInvColorMatrix];
               }
               else if(this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.ClipHolderInternal.getChildAt(ii).getChildAt(2).currentFrame == 66)
               {
                  this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.ClipHolderInternal.getChildAt(ii).getChildAt(0).filters = [rightmetersInvColorMatrix];
                  this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.ClipHolderInternal.getChildAt(ii).getChildAt(1).filters = [rightmetersInvColorMatrix];
               }
               else
               {
                  this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.ClipHolderInternal.getChildAt(ii).getChildAt(0).filters = null;
                  this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.ClipHolderInternal.getChildAt(ii).getChildAt(1).filters = null;
               }
               ii++;
            }
            if(this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.currentFrame < 5)
            {
               this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.OwnerInfo_mc.AccountIcon_mc.filters = null;
               this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.filters = [sneakDangerColorMatrix];
            }
            else if(this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.currentFrame > 5)
            {
               this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.OwnerInfo_mc.AccountIcon_mc.filters = [sneakDangerColorMatrix];
               this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.filters = null;
            }
            if(this.topLevel.TopCenterGroup_mc.getChildAt(0).getChildAt(0).getChildAt(0).getChildAt(0).getChildAt(0).text == "CAUTION" || this.topLevel.TopCenterGroup_mc.getChildAt(0).getChildAt(0).getChildAt(0).getChildAt(0).getChildAt(0).text == "DANGER")
            {
               this.topLevel.TopCenterGroup_mc.getChildAt(0).filters = [sneakDangerColorMatrix];
            }
            else if(this.topLevel.TopCenterGroup_mc.getChildAt(0).getChildAt(0).getChildAt(0).getChildAt(0).getChildAt(0).text == "HIDDEN" || this.topLevel.TopCenterGroup_mc.getChildAt(0).getChildAt(0).getChildAt(0).getChildAt(0).getChildAt(0).text == "DETECTED")
            {
               this.topLevel.TopCenterGroup_mc.getChildAt(0).filters = null;
            }
            this.teamNum = this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).numChildren;
            if(this.teamNum == 1)
            {
               this.topLevel.PartyResolutionContainer_mc.filters = [teamColorMatrix];
               this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PTPartyListHeader_mc.getChildAt(1).getChildAt(0).textColor = 16108379;
               this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PTPartyListHeader_mc.getChildAt(1).getChildAt(1).textColor = 16108379;
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(9).filters = [teamradsColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(3).filters = [teamInvColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(7).filters = [teamInvColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(15).filters = [teamInvColorMatrix];
            }
            else if(this.teamNum == 2)
            {
               this.topLevel.PartyResolutionContainer_mc.filters = [teamColorMatrix];
               this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PTPartyListHeader_mc.getChildAt(1).getChildAt(0).textColor = 16108379;
               this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PTPartyListHeader_mc.getChildAt(1).getChildAt(1).textColor = 16108379;
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(9).filters = [teamradsColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(3).filters = [teamInvColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(7).filters = [teamInvColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(15).filters = [teamInvColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(1).getChildAt(9).filters = [teamradsColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(1).getChildAt(3).filters = [teamInvColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(1).getChildAt(7).filters = [teamInvColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(1).getChildAt(15).filters = [teamInvColorMatrix];
            }
            else if(this.teamNum == 3)
            {
               this.topLevel.PartyResolutionContainer_mc.filters = [teamColorMatrix];
               this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PTPartyListHeader_mc.getChildAt(1).getChildAt(0).textColor = 16108379;
               this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PTPartyListHeader_mc.getChildAt(1).getChildAt(1).textColor = 16108379;
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(9).filters = [teamradsColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(3).filters = [teamInvColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(7).filters = [teamInvColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(15).filters = [teamInvColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(1).getChildAt(9).filters = [teamradsColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(1).getChildAt(3).filters = [teamInvColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(1).getChildAt(7).filters = [teamInvColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(1).getChildAt(15).filters = [teamInvColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(2).getChildAt(9).filters = [teamradsColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(2).getChildAt(3).filters = [teamInvColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(2).getChildAt(7).filters = [teamInvColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(2).getChildAt(15).filters = [teamInvColorMatrix];
            }
            else if(this.teamNum == 4)
            {
               this.topLevel.PartyResolutionContainer_mc.filters = [teamColorMatrix];
               this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PTPartyListHeader_mc.getChildAt(1).getChildAt(0).textColor = 16108379;
               this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PTPartyListHeader_mc.getChildAt(1).getChildAt(1).textColor = 16108379;
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(9).filters = [teamradsColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(3).filters = [teamInvColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(7).filters = [teamInvColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(15).filters = [teamInvColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(1).getChildAt(9).filters = [teamradsColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(1).getChildAt(3).filters = [teamInvColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(1).getChildAt(7).filters = [teamInvColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(1).getChildAt(15).filters = [teamInvColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(2).getChildAt(9).filters = [teamradsColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(2).getChildAt(3).filters = [teamInvColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(2).getChildAt(7).filters = [teamInvColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(2).getChildAt(15).filters = [teamInvColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(3).getChildAt(9).filters = [teamradsColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(3).getChildAt(3).filters = [teamInvColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(3).getChildAt(7).filters = [teamInvColorMatrix];
               this.topLevel.getChildAt(16).getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(1).getChildAt(3).getChildAt(15).filters = [teamInvColorMatrix];
            }
            this.topLevel.TeammateMarkerBase.filters = [floatingColorMatrix];
            if(this.topLevel.TeammateMarkerBase.numChildren > 1)
            {
               i = 1;
               while(i < this.topLevel.TeammateMarkerBase.numChildren)
               {
                  this.topLevel.TeammateMarkerBase.getChildAt(i).getChildAt(3).filters = [floatingInvColorMatrix];
                  i++;
               }
            }
         }
         if(this.xmlConfigHC.Elements != undefined)
         {
            if(this.inPowerArmor == true && this.powerArmorHUDEnabled == true)
            {
               this.topLevel.RightMeters_mc.HUDHungerMeter_mc.x = this.oHungerMeterPos.x + this.HungerMeterPosPA.x;
               this.topLevel.RightMeters_mc.HUDHungerMeter_mc.y = this.oHungerMeterPos.y + this.HungerMeterPosPA.y;
               this.topLevel.RightMeters_mc.HUDThirstMeter_mc.x = this.oThirstMeterPos.x + this.ThirstMeterPosPA.x;
               this.topLevel.RightMeters_mc.HUDThirstMeter_mc.y = this.oThirstMeterPos.y + this.ThirstMeterPosPA.y;
               this.topLevel.RightMeters_mc.ExplosiveAmmoCount_mc.x = this.oExplosiveAmmoCountPos.x + this.ExplosiveAmmoCountPosPA.x;
               this.topLevel.RightMeters_mc.ExplosiveAmmoCount_mc.y = this.oExplosiveAmmoCountPos.y + this.ExplosiveAmmoCountPosPA.y;
               this.topLevel.getChildAt(16).x = this.oTeamPanelPos.x + this.TeamPanelPosPA.x;
               this.topLevel.getChildAt(16).y = this.oTeamPanelPos.y + this.TeamPanelPosPA.y;
            }
            else
            {
               this.topLevel.RightMeters_mc.HUDHungerMeter_mc.x = this.oHungerMeterPos.x + this.HungerMeterPos.x;
               this.topLevel.RightMeters_mc.HUDHungerMeter_mc.y = this.oHungerMeterPos.y + this.HungerMeterPos.y;
               this.topLevel.RightMeters_mc.HUDThirstMeter_mc.x = this.oThirstMeterPos.x + this.ThirstMeterPos.x;
               this.topLevel.RightMeters_mc.HUDThirstMeter_mc.y = this.oThirstMeterPos.y + this.ThirstMeterPos.y;
               this.topLevel.RightMeters_mc.ExplosiveAmmoCount_mc.x = this.oExplosiveAmmoCountPos.x + this.ExplosiveAmmoCountPos.x;
               this.topLevel.RightMeters_mc.ExplosiveAmmoCount_mc.y = this.oExplosiveAmmoCountPos.y + this.ExplosiveAmmoCountPos.y;
               this.topLevel.getChildAt(16).x = this.oTeamPanelPos.x + this.TeamPanelPos.x;
               this.topLevel.getChildAt(16).y = this.oTeamPanelPos.y + this.TeamPanelPos.y;
            }
            if(this.inPowerArmor == true && this.powerArmorHUDEnabled == true)
            {
               if(this.HungerMeterScalePA <= this.maxScale)
               {
                  this.topLevel.RightMeters_mc.HUDHungerMeter_mc.scaleX = this.HungerMeterScalePA;
                  this.topLevel.RightMeters_mc.HUDHungerMeter_mc.scaleY = this.HungerMeterScalePA;
               }
               else
               {
                  this.topLevel.RightMeters_mc.HUDHungerMeter_mc.scaleX = 1;
                  this.topLevel.RightMeters_mc.HUDHungerMeter_mc.scaleY = 1;
               }
               if(this.ThirstMeterScalePA <= this.maxScale)
               {
                  this.topLevel.RightMeters_mc.HUDThirstMeter_mc.scaleX = this.ThirstMeterScalePA;
                  this.topLevel.RightMeters_mc.HUDThirstMeter_mc.scaleY = this.ThirstMeterScalePA;
               }
               else
               {
                  this.topLevel.RightMeters_mc.HUDThirstMeter_mc.scaleX = 1;
                  this.topLevel.RightMeters_mc.HUDThirstMeter_mc.scaleY = 1;
               }
               if(this.ExplosiveAmmoCountScalePA <= this.maxScale)
               {
                  this.topLevel.RightMeters_mc.ExplosiveAmmoCount_mc.scaleX = this.ExplosiveAmmoCountScalePA;
                  this.topLevel.RightMeters_mc.ExplosiveAmmoCount_mc.scaleY = this.ExplosiveAmmoCountScalePA;
               }
               else
               {
                  this.topLevel.RightMeters_mc.ExplosiveAmmoCount_mc.scaleX = 1;
                  this.topLevel.RightMeters_mc.ExplosiveAmmoCount_mc.scaleY = 1;
               }
               if(this.TeamPanelScalePA <= this.maxScale)
               {
                  this.topLevel.getChildAt(16).scaleX = this.TeamPanelScalePA;
                  this.topLevel.getChildAt(16).scaleY = this.TeamPanelScalePA;
               }
               else
               {
                  this.topLevel.getChildAt(16).scaleX = 1;
                  this.topLevel.getChildAt(16).scaleY = 1;
               }
            }
            else
            {
               if(this.HungerMeterScale <= this.maxScale)
               {
                  this.topLevel.RightMeters_mc.HUDHungerMeter_mc.scaleX = this.HungerMeterScale;
                  this.topLevel.RightMeters_mc.HUDHungerMeter_mc.scaleY = this.HungerMeterScale;
               }
               else
               {
                  this.topLevel.RightMeters_mc.HUDHungerMeter_mc.scaleX = 1;
                  this.topLevel.RightMeters_mc.HUDHungerMeter_mc.scaleY = 1;
               }
               if(this.ThirstMeterScale <= this.maxScale)
               {
                  this.topLevel.RightMeters_mc.HUDThirstMeter_mc.scaleX = this.ThirstMeterScale;
                  this.topLevel.RightMeters_mc.HUDThirstMeter_mc.scaleY = this.ThirstMeterScale;
               }
               else
               {
                  this.topLevel.RightMeters_mc.HUDThirstMeter_mc.scaleX = 1;
                  this.topLevel.RightMeters_mc.HUDThirstMeter_mc.scaleY = 1;
               }
               if(this.ExplosiveAmmoCountScale <= this.maxScale)
               {
                  this.topLevel.RightMeters_mc.ExplosiveAmmoCount_mc.scaleX = this.ExplosiveAmmoCountScale;
                  this.topLevel.RightMeters_mc.ExplosiveAmmoCount_mc.scaleY = this.ExplosiveAmmoCountScale;
               }
               else
               {
                  this.topLevel.RightMeters_mc.ExplosiveAmmoCount_mc.scaleX = 1;
                  this.topLevel.RightMeters_mc.ExplosiveAmmoCount_mc.scaleY = 1;
               }
               if(this.TeamPanelScale <= this.maxScale)
               {
                  this.topLevel.getChildAt(16).scaleX = this.TeamPanelScale;
                  this.topLevel.getChildAt(16).scaleY = this.TeamPanelScale;
               }
               else
               {
                  this.topLevel.getChildAt(16).scaleX = 1;
                  this.topLevel.getChildAt(16).scaleY = 1;
               }
            }
            this.topLevel.TopCenterGroup_mc.getChildAt(0).x = this.oSneakPos.x + this.SneakMeterPos.x;
            this.topLevel.TopCenterGroup_mc.getChildAt(0).y = this.oSneakPos.y + this.SneakMeterPos.y;
            this.topLevel.LeftMeters_mc.x = this.oLeftMeterPos.x + this.LeftMeterPos.x;
            this.topLevel.LeftMeters_mc.y = this.oLeftMeterPos.y + this.LeftMeterPos.y;
            this.topLevel.RightMeters_mc.ActionPointMeter_mc.x = this.oAPMeterPos.x + this.APMeterPos.x;
            this.topLevel.RightMeters_mc.ActionPointMeter_mc.y = this.oAPMeterPos.y + this.APMeterPos.y;
            this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.x = this.oActiveEffectsPos.x + this.ActiveEffectsPos.x;
            this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.y = this.oActiveEffectsPos.y + this.ActiveEffectsPos.y;
            this.topLevel.RightMeters_mc.AmmoCount_mc.x = this.oAmmoCountPos.x + this.AmmoCountPos.x;
            this.topLevel.RightMeters_mc.AmmoCount_mc.y = this.oAmmoCountPos.y + this.AmmoCountPos.y;
            this.topLevel.RightMeters_mc.FlashLightWidget_mc.x = this.oFlashLightWidgetPos.x + this.FlashLightWidgetPos.x;
            this.topLevel.RightMeters_mc.FlashLightWidget_mc.y = this.oFlashLightWidgetPos.y + this.FlashLightWidgetPos.y;
            this.topLevel.RightMeters_mc.LocalEmote_mc.x = this.oEmotePos.x + this.EmotePos.x;
            this.topLevel.RightMeters_mc.LocalEmote_mc.y = this.oEmotePos.y + this.EmotePos.y;
            this.topLevel.LevelUpAnimation_mc.x = this.oLevelUpAnimPos.x + this.LevelUpAnimPos.x;
            this.topLevel.LevelUpAnimation_mc.y = this.oLevelUpAnimPos.y + this.LevelUpAnimPos.y;
            this.topLevel.ReputationUpdates_mc.x = this.oRepUpdatesPos.x + this.RepUpdatesPos.x;
            this.topLevel.ReputationUpdates_mc.y = this.oRepUpdatesPos.y + this.RepUpdatesPos.y;
            this.topLevel.CenterGroup_mc.HitIndicator_mc.x = this.oHitMarkerPos.x + this.HitMarkerPos.x;
            this.topLevel.CenterGroup_mc.HitIndicator_mc.y = this.oHitMarkerPos.y + this.HitMarkerPos.y;
            tfTemp = this.topLevel.CenterGroup_mc.QuickContainerWidget_mc.ListHeaderAndBracket_mc.ContainerName_mc.textField_tf.getTextFormat();
            if(tfTemp.align == "left")
            {
               this.topLevel.CenterGroup_mc.QuickContainerWidget_mc.x = this.oQuickLootPos.x + this.QuickLootPos.x;
               this.topLevel.CenterGroup_mc.QuickContainerWidget_mc.y = this.oQuickLootPos.y + this.QuickLootPos.y;
            }
            else if(tfTemp.align == "center")
            {
               this.topLevel.CenterGroup_mc.QuickContainerWidget_mc.x = this.oQuickLootPos.x - 50 + this.QuickLootPos.x;
               this.topLevel.CenterGroup_mc.QuickContainerWidget_mc.y = this.oQuickLootPos.y - 100 + this.QuickLootPos.y;
            }
            this.topLevel.FrobberWidget_mc.x = this.oFrobberPos.x + this.FrobberPos.x;
            this.topLevel.FrobberWidget_mc.y = this.oFrobberPos.y + this.FrobberPos.y;
            this.topLevel.BottomCenterGroup_mc.PerkVaultBoy_mc.x = this.oPerkPopUpPos.x + this.PerkPopUpPos.x;
            this.topLevel.BottomCenterGroup_mc.PerkVaultBoy_mc.y = this.oPerkPopUpPos.y + this.PerkPopUpPos.y;
            this.topLevel.RightMeters_mc.PowerArmorLowBatteryWarning_mc.x = this.oFusionPopUpPos.x + this.FusionPopUpPos.x;
            this.topLevel.RightMeters_mc.PowerArmorLowBatteryWarning_mc.y = this.oFusionPopUpPos.y + this.FusionPopUpPos.y;
            this.topLevel.CenterGroup_mc.RolloverWidget_mc.x = this.oRollOverPos.x + this.RollOverPos.x;
            this.topLevel.CenterGroup_mc.RolloverWidget_mc.y = this.oRollOverPos.y + this.RollOverPos.y;
            this.topLevel.BottomCenterGroup_mc.CompassWidget_mc.x = this.oCompassPos.x + this.CompassPos.x;
            this.topLevel.BottomCenterGroup_mc.CompassWidget_mc.y = this.oCompassPos.y + this.CompassPos.y;
            this.topLevel.AnnounceEventWidget_mc.x = this.oAnnouncePos.x + this.AnnouncePos.x;
            this.topLevel.AnnounceEventWidget_mc.y = this.oAnnouncePos.y + this.AnnouncePos.y;
            this.topLevel.HUDNotificationsGroup_mc.Messages_mc.x = this.oNotificationPos.x + this.NotificationPos.x;
            this.topLevel.HUDNotificationsGroup_mc.Messages_mc.y = this.oNotificationPos.y + this.NotificationPos.y;
            this.topLevel.LeftMeters_mc.RadsMeter_mc.x = this.oRadCountPos.x + this.RadCountPos.x;
            this.topLevel.LeftMeters_mc.RadsMeter_mc.y = this.oRadCountPos.y + this.RadCountPos.y;
            this.topLevel.HUDNotificationsGroup_mc.CurrencyUpdates_mc.x = this.oCurrencyPos.x + this.CurrencyPos.x;
            this.topLevel.HUDNotificationsGroup_mc.CurrencyUpdates_mc.y = this.oCurrencyPos.y + this.CurrencyPos.y;
            this.topLevel.TopRightGroup_mc.NewQuestTracker_mc.x = this.oQuestPos.x + this.QuestPos.x;
            this.topLevel.TopRightGroup_mc.NewQuestTracker_mc.y = this.oQuestPos.y + this.QuestPos.y;
            this.topLevel.RightMeters_mc.HUDFusionCoreMeter_mc.x = this.oFusionPos.x + this.FusionPos.x;
            this.topLevel.RightMeters_mc.HUDFusionCoreMeter_mc.y = this.oFusionPos.y + this.FusionPos.y;
            this.topLevel.BottomCenterGroup_mc.SubtitleText_mc.x = this.oSubtitlePos.x + this.SubtitlesPos.x;
            this.topLevel.BottomCenterGroup_mc.SubtitleText_mc.y = this.oSubtitlePos.y + this.SubtitlesPos.y;
            this.topLevel.HUDNotificationsGroup_mc.XPMeter_mc.x = this.oXPBarPos.x + this.XPBarPos.x;
            this.topLevel.HUDNotificationsGroup_mc.XPMeter_mc.y = this.oXPBarPos.y + this.XPBarPos.y;
            this.topLevel.BottomCenterGroup_mc.CritMeter_mc.x = this.oCritMeterPos.x + this.CritMeterPos.x;
            this.topLevel.BottomCenterGroup_mc.CritMeter_mc.y = this.oCritMeterPos.y + this.CritMeterPos.y;
            this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.x = this.oEnemyHealthPos.x + this.EnemyHealthPos.x;
            this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.y = this.oEnemyHealthPos.y + this.EnemyHealthPos.y;
         }
         if(this.xmlConfigHC.Colors.HUD.EditMode != undefined)
         {
            this.watermark.x = stage.stageWidth - (this.watermark.width + 4);
            this.watermark.y = 0;
            color1 = "0x" + this.rightmetersRGB1;
            this.watermark.textColor = color1;
            if(this.xmlConfigHC.Colors.HUD.EditMode == "true" && this.reloadCount == 150)
            {
               this.reloadXML();
               if(this.xmlConfigHC.ImmersiveTweaks.WaterMark.HideEditMode == "true")
               {
                  this.watermark.visible = false;
               }
               else
               {
                  this.watermark.visible = true;
               }
               if(this.xmlConfigHC.ImmersiveTweaks.WaterMark.CustomEditMark == "true")
               {
                  this.watermark.text = String(this.xmlConfigHC.ImmersiveTweaks.WaterMark.CustomEditMarkEntry.toString());
               }
               else
               {
                  this.watermark.text = "HUDEditor ***BETA*** EDIT MODE";
               }
            }
            else if(this.xmlConfigHC.Colors.HUD.EditMode == "false")
            {
               if(this.xmlConfigHC.ImmersiveTweaks.WaterMark.HideDefaultMode == "true")
               {
                  this.watermark.visible = false;
               }
               else
               {
                  this.watermark.visible = false;
               }
               this.watermark.alpha = 0.3;
               this.reloadCount = 0;
               if(this.xmlConfigHC.ImmersiveTweaks.WaterMark.CustomWaterMark == "true")
               {
                  this.watermark.text = String(this.xmlConfigHC.ImmersiveTweaks.WaterMark.CustomEditMarkEntry.toString());
               }
               else
               {
                  this.watermark.text = "HUDEditor ***BETA***";
               }
            }
            else
            {
               ++this.reloadCount;
            }
         }
      }
      
      private function initCommands(wholeFileStr:String) : void
      {
         XML.ignoreComments = true;
         this.xmlConfigHC = new XML(wholeFileStr);
         this.rightmetersBrightness = Number(this.xmlConfigHC.Colors.RightMeters.Brightness);
         this.rightmetersContrast = Number(this.xmlConfigHC.Colors.RightMeters.Contrast);
         this.rightmetersSaturation = Number(this.xmlConfigHC.Colors.RightMeters.Saturation);
         this.rightmetersRGB1 = this.xmlConfigHC.Colors.RightMeters.RGB;
         this.leftmetersBrightness = Number(this.xmlConfigHC.Colors.LeftMeters.Brightness);
         this.leftmetersContrast = Number(this.xmlConfigHC.Colors.LeftMeters.Contrast);
         this.leftmetersSaturation = Number(this.xmlConfigHC.Colors.LeftMeters.Saturation);
         this.leftmetersRGB1 = this.xmlConfigHC.Colors.LeftMeters.RGB;
         this.radsbarBrightness = Number(this.xmlConfigHC.Colors.LeftMeters.RadsBarBrightness);
         this.radsbarContrast = Number(this.xmlConfigHC.Colors.LeftMeters.RadsBarContrast);
         this.radsbarSaturation = Number(this.xmlConfigHC.Colors.LeftMeters.RadsBarSaturation);
         this.radsbarRGB = this.xmlConfigHC.Colors.LeftMeters.RadsBarRGB;
         this.notiBrightness = Number(this.xmlConfigHC.Colors.Noti.Brightness);
         this.notiContrast = Number(this.xmlConfigHC.Colors.Noti.Contrast);
         this.notiSaturation = Number(this.xmlConfigHC.Colors.Noti.Saturation);
         this.notiRGB1 = this.xmlConfigHC.Colors.Noti.RGB;
         this.frobberBrightness = Number(this.xmlConfigHC.Colors.HudFrobber.Brightness);
         this.frobberContrast = Number(this.xmlConfigHC.Colors.HudFrobber.Contrast);
         this.frobberSaturation = Number(this.xmlConfigHC.Colors.HudFrobber.Saturation);
         this.frobberRGB1 = this.xmlConfigHC.Colors.HudFrobber.RGB;
         this.trackerBrightness = Number(this.xmlConfigHC.Colors.QuestTracker.Brightness);
         this.trackerContrast = Number(this.xmlConfigHC.Colors.QuestTracker.Contrast);
         this.trackerSaturation = Number(this.xmlConfigHC.Colors.QuestTracker.Saturation);
         this.trackerRGB1 = this.xmlConfigHC.Colors.QuestTracker.RGB;
         this.topcenterBrightness = Number(this.xmlConfigHC.Colors.TopCenter.Brightness);
         this.topcenterContrast = Number(this.xmlConfigHC.Colors.TopCenter.Contrast);
         this.topcenterSaturation = Number(this.xmlConfigHC.Colors.TopCenter.Saturation);
         this.topcenterRGB1 = this.xmlConfigHC.Colors.TopCenter.RGB;
         this.bottomcenterBrightness = Number(this.xmlConfigHC.Colors.BottomCenter.Brightness);
         this.bottomcenterContrast = Number(this.xmlConfigHC.Colors.BottomCenter.Contrast);
         this.bottomcenterSaturation = Number(this.xmlConfigHC.Colors.BottomCenter.Saturation);
         this.bottomcenterRGB1 = this.xmlConfigHC.Colors.BottomCenter.RGB;
         if(this.xmlConfigHC.Colors.BottomCenter.CompassRGB != undefined)
         {
            this.bccompassBrightness = Number(this.xmlConfigHC.Colors.BottomCenter.CompassBrightness);
            this.bccompassContrast = Number(this.xmlConfigHC.Colors.BottomCenter.CompassContrast);
            this.bccompassSaturation = Number(this.xmlConfigHC.Colors.BottomCenter.CompassSaturation);
            this.bccompassRGB1 = this.xmlConfigHC.Colors.BottomCenter.CompassRGB;
         }
         else
         {
            this.bccompassBrightness = Number(this.xmlConfigHC.Colors.BottomCenter.Brightness);
            this.bccompassContrast = Number(this.xmlConfigHC.Colors.BottomCenter.Contrast);
            this.bccompassSaturation = Number(this.xmlConfigHC.Colors.BottomCenter.Saturation);
            this.bccompassRGB1 = this.xmlConfigHC.Colors.BottomCenter.RGB;
         }
         this.announceBrightness = Number(this.xmlConfigHC.Colors.Announce.Brightness);
         this.announceContrast = Number(this.xmlConfigHC.Colors.Announce.Contrast);
         this.announceSaturation = Number(this.xmlConfigHC.Colors.Announce.Saturation);
         this.announceRGB1 = this.xmlConfigHC.Colors.Announce.RGB;
         this.centerBrightness = Number(this.xmlConfigHC.Colors.Center.Brightness);
         this.centerContrast = Number(this.xmlConfigHC.Colors.Center.Contrast);
         this.centerSaturation = Number(this.xmlConfigHC.Colors.Center.Saturation);
         this.centerRGB1 = this.xmlConfigHC.Colors.Center.RGB;
         this.teamBrightness = Number(this.xmlConfigHC.Colors.Team.Brightness);
         this.teamContrast = Number(this.xmlConfigHC.Colors.Team.Contrast);
         this.teamSaturation = Number(this.xmlConfigHC.Colors.Team.Saturation);
         this.teamRGB1 = this.xmlConfigHC.Colors.Team.RGB;
         this.teamRadsBrightness = Number(this.xmlConfigHC.Colors.Team.RadsBarBrightness);
         this.teamRadsContrast = Number(this.xmlConfigHC.Colors.Team.RadsBarContrast);
         this.teamRadsSaturation = Number(this.xmlConfigHC.Colors.Team.RadsBarSaturation);
         this.teamRadsRGB = this.xmlConfigHC.Colors.Team.RadsBarRGB;
         this.teamRGB1 = this.xmlConfigHC.Colors.Team.RGB;
         this.teamRadsRGB = this.xmlConfigHC.Colors.Team.RadsBarRGB;
         this.floatingBrightness = Number(this.xmlConfigHC.Colors.Floating.Brightness);
         this.floatingContrast = Number(this.xmlConfigHC.Colors.Floating.Contrast);
         this.floatingSaturation = Number(this.xmlConfigHC.Colors.Floating.Saturation);
         this.floatingRGB1 = this.xmlConfigHC.Colors.Floating.RGB;
         this.hmBrightness = Number(this.xmlConfigHC.Colors.HitMarkerTint.Brightness);
         this.hmContrast = Number(this.xmlConfigHC.Colors.HitMarkerTint.Contrast);
         this.hmSaturation = Number(this.xmlConfigHC.Colors.HitMarkerTint.Saturation);
         this.hudRGBHM = this.xmlConfigHC.Colors.HitMarkerTint.RGB;
         this.hudHUErightmeters = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.RightMeters.RGB))[0];
         this.hudHUEleftmeters = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.LeftMeters.RGB))[0];
         this.hudHUEnoti = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.Notifications.RGB))[0];
         this.hudHUEfrobber = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.HudFrobber.RGB))[0];
         this.hudHUEtracker = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.QuestTracker.RGB))[0];
         this.hudHUEtopcenter = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.TopCenter.RGB))[0];
         this.hudHUEbottomcenter = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.BottomCenter.RGB))[0];
         this.hudHUEbccompass = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.BottomCenter.CompassRGB))[0];
         this.hudHUEannounce = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.AnnounceAvailable.RGB))[0];
         this.hudHUEcenter = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.Center.RGB))[0];
         this.hudHUEteam = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.Team.RGB))[0];
         this.hudHUEfloating = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.Floating.RGB))[0];
         this.hudHUEteamrads = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.Team.RadsBarRGB))[0];
         this.hudHUEradsbar = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.LeftMeters.RadsBarRGB))[0];
         this.hudHUEHM = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.HitMarkerTint.RGB))[0];
         if(this.xmlConfigHC.Elements != undefined)
         {
            if(!this.xmlConfigHC.ImmersiveTweaks.StealthMeter)
            {
               this.SneakMeterScale = this.xmlConfigHC.Elements.StealthMeter.Scale;
            }
            this.SneakMeterPos.x = this.xmlConfigHC.Elements.StealthMeter.X;
            this.SneakMeterPos.y = this.xmlConfigHC.Elements.StealthMeter.Y;
            this.QuestScale = this.xmlConfigHC.Elements.QuestTracker.Scale;
            this.QuestPos.x = this.xmlConfigHC.Elements.QuestTracker.X;
            this.QuestPos.y = this.xmlConfigHC.Elements.QuestTracker.Y;
            this.LeftMeterScale = this.xmlConfigHC.Elements.LeftMeter.Scale;
            this.LeftMeterPos.x = this.xmlConfigHC.Elements.LeftMeter.X;
            this.LeftMeterPos.y = this.xmlConfigHC.Elements.LeftMeter.Y;
            this.APMeterScale = this.xmlConfigHC.Elements.RightMeter.Parts.APMeter.Scale;
            this.APMeterPos.x = this.xmlConfigHC.Elements.RightMeter.Parts.APMeter.X;
            this.APMeterPos.y = this.xmlConfigHC.Elements.RightMeter.Parts.APMeter.Y;
            this.ActiveEffectsScale = this.xmlConfigHC.Elements.RightMeter.Parts.ActiveEffects.Scale;
            this.ActiveEffectsPos.x = this.xmlConfigHC.Elements.RightMeter.Parts.ActiveEffects.X;
            this.ActiveEffectsPos.y = this.xmlConfigHC.Elements.RightMeter.Parts.ActiveEffects.Y;
            this.HungerMeterScale = this.xmlConfigHC.Elements.RightMeter.Parts.HungerMeter.Scale;
            this.HungerMeterPos.x = this.xmlConfigHC.Elements.RightMeter.Parts.HungerMeter.X;
            this.HungerMeterPos.y = this.xmlConfigHC.Elements.RightMeter.Parts.HungerMeter.Y;
            this.ThirstMeterScale = this.xmlConfigHC.Elements.RightMeter.Parts.ThirstMeter.Scale;
            this.ThirstMeterPos.x = this.xmlConfigHC.Elements.RightMeter.Parts.ThirstMeter.X;
            this.ThirstMeterPos.y = this.xmlConfigHC.Elements.RightMeter.Parts.ThirstMeter.Y;
            this.HungerMeterPosPA.x = this.xmlConfigHC.Elements.RightMeter.Parts.HungerMeter.PowerArmor.X;
            this.HungerMeterPosPA.y = this.xmlConfigHC.Elements.RightMeter.Parts.HungerMeter.PowerArmor.Y;
            this.ThirstMeterPosPA.x = this.xmlConfigHC.Elements.RightMeter.Parts.ThirstMeter.PowerArmor.X;
            this.ThirstMeterPosPA.y = this.xmlConfigHC.Elements.RightMeter.Parts.ThirstMeter.PowerArmor.Y;
            this.ExplosiveAmmoCountPosPA.x = this.xmlConfigHC.Elements.RightMeter.Parts.ExplosiveAmmoCount.PowerArmor.X;
            this.ExplosiveAmmoCountPosPA.y = this.xmlConfigHC.Elements.RightMeter.Parts.ExplosiveAmmoCount.PowerArmor.Y;
            this.TeamPanelPosPA.x = this.xmlConfigHC.Elements.TeamPanel.PowerArmor.X;
            this.TeamPanelPosPA.y = this.xmlConfigHC.Elements.TeamPanel.PowerArmor.Y;
            this.HungerMeterScalePA = this.xmlConfigHC.Elements.RightMeter.Parts.HungerMeter.PowerArmor.Scale;
            this.ThirstMeterScalePA = this.xmlConfigHC.Elements.RightMeter.Parts.ThirstMeter.PowerArmor.Scale;
            this.ExplosiveAmmoCountScalePA = this.xmlConfigHC.Elements.RightMeter.Parts.ExplosiveAmmoCount.PowerArmor.Scale;
            this.TeamPanelScalePA = this.xmlConfigHC.Elements.TeamPanel.PowerArmor.Scale;
            this.AmmoCountScale = this.xmlConfigHC.Elements.RightMeter.Parts.AmmoCount.Scale;
            this.AmmoCountPos.x = this.xmlConfigHC.Elements.RightMeter.Parts.AmmoCount.X;
            this.AmmoCountPos.y = this.xmlConfigHC.Elements.RightMeter.Parts.AmmoCount.Y;
            this.ExplosiveAmmoCountScale = this.xmlConfigHC.Elements.RightMeter.Parts.ExplosiveAmmoCount.Scale;
            this.ExplosiveAmmoCountPos.x = this.xmlConfigHC.Elements.RightMeter.Parts.ExplosiveAmmoCount.X;
            this.ExplosiveAmmoCountPos.y = this.xmlConfigHC.Elements.RightMeter.Parts.ExplosiveAmmoCount.Y;
            this.FlashLightWidgetScale = this.xmlConfigHC.Elements.RightMeter.Parts.FlashLightWidget.Scale;
            this.FlashLightWidgetPos.x = this.xmlConfigHC.Elements.RightMeter.Parts.FlashLightWidget.X;
            this.FlashLightWidgetPos.y = this.xmlConfigHC.Elements.RightMeter.Parts.FlashLightWidget.Y;
            this.EmoteScale = this.xmlConfigHC.Elements.RightMeter.Parts.Emote.Scale;
            this.EmotePos.x = this.xmlConfigHC.Elements.RightMeter.Parts.Emote.X;
            this.EmotePos.y = this.xmlConfigHC.Elements.RightMeter.Parts.Emote.Y;
            this.AnnounceScale = this.xmlConfigHC.Elements.Announce.Scale;
            this.AnnouncePos.x = this.xmlConfigHC.Elements.Announce.X;
            this.AnnouncePos.y = this.xmlConfigHC.Elements.Announce.Y;
            this.HitMarkerScale = this.xmlConfigHC.Elements.HitMarker.Scale;
            this.HitMarkerPos.x = this.xmlConfigHC.Elements.HitMarker.X;
            this.HitMarkerPos.y = this.xmlConfigHC.Elements.HitMarker.Y;
            if(!this.xmlConfigHC.ImmersiveTweaks.Compass)
            {
               this.CompassScale = this.xmlConfigHC.Elements.Compass.Scale;
            }
            this.CompassPos.x = this.xmlConfigHC.Elements.Compass.X;
            this.CompassPos.y = this.xmlConfigHC.Elements.Compass.Y;
            this.NotificationScale = this.xmlConfigHC.Elements.Notification.Scale;
            this.NotificationPos.x = this.xmlConfigHC.Elements.Notification.X;
            this.NotificationPos.y = this.xmlConfigHC.Elements.Notification.Y;
            if(!this.xmlConfigHC.ImmersiveTweaks.InteractPrompts.QuickLoot)
            {
               this.QuickLootScale = this.xmlConfigHC.Elements.QuickLoot.Scale;
            }
            this.QuickLootPos.x = this.xmlConfigHC.Elements.QuickLoot.X;
            this.QuickLootPos.y = this.xmlConfigHC.Elements.QuickLoot.Y;
            this.TeamPanelScale = this.xmlConfigHC.Elements.TeamPanel.Scale;
            this.TeamPanelPos.x = this.xmlConfigHC.Elements.TeamPanel.X;
            this.TeamPanelPos.y = this.xmlConfigHC.Elements.TeamPanel.Y;
            this.FusionScale = this.xmlConfigHC.Elements.FusionCoreMeter.Scale;
            this.FusionPos.x = this.xmlConfigHC.Elements.FusionCoreMeter.X;
            this.FusionPos.y = this.xmlConfigHC.Elements.FusionCoreMeter.Y;
            if(!this.xmlConfigHC.ImmersiveTweaks.InteractPrompts.Frobber)
            {
               this.FrobberScale = this.xmlConfigHC.Elements.Frobber.Scale;
            }
            this.FrobberPos.x = this.xmlConfigHC.Elements.Frobber.X;
            this.FrobberPos.y = this.xmlConfigHC.Elements.Frobber.Y;
            if(!this.xmlConfigHC.ImmersiveTweaks.InteractPrompts.RollOver)
            {
               this.RollOverScale = this.xmlConfigHC.Elements.RollOver.Scale;
            }
            this.RollOverPos.x = this.xmlConfigHC.Elements.RollOver.X;
            this.RollOverPos.y = this.xmlConfigHC.Elements.RollOver.Y;
            if(this.xmlConfigHC.ImmersiveTweaks.PerkPopUp)
            {
               this.PerkPopUpPos.x = this.xmlConfigHC.ImmersiveTweaks.PerkPopUp.X;
               this.PerkPopUpPos.y = this.xmlConfigHC.ImmersiveTweaks.PerkPopUp.Y;
            }
            else if(!this.xmlConfigHC.ImmersiveTweaks.PerkPopUp)
            {
               this.PerkPopUpScale = 1;
               this.PerkPopUpPos.x = 0;
               this.PerkPopUpPos.y = 0;
            }
            if(this.xmlConfigHC.ImmersiveTweaks.FusionCoreWarning)
            {
               this.FusionPopUpPos.x = this.xmlConfigHC.ImmersiveTweaks.FusionCoreWarning.X;
               this.FusionPopUpPos.y = this.xmlConfigHC.ImmersiveTweaks.FusionCoreWarning.Y;
            }
            else if(!this.xmlConfigHC.ImmersiveTweaks.FusionCoreWarning)
            {
               this.FusionPopUpScale = 1;
               this.FusionPopUpPos.x = 0;
               this.FusionPopUpPos.y = 0;
            }
            if(this.xmlConfigHC.ImmersiveTweaks.RadDamageIndicator)
            {
               this.RadCountPos.x = this.xmlConfigHC.ImmersiveTweaks.RadDamageIndicator.X;
               this.RadCountPos.y = this.xmlConfigHC.ImmersiveTweaks.RadDamageIndicator.Y;
            }
            else if(!this.xmlConfigHC.ImmersiveTweaks.RadDamageIndicator)
            {
               this.RadCountScale = 1;
               this.RadCountPos.x = 0;
               this.RadCountPos.y = 0;
            }
            this.RepUpdatesScale = this.xmlConfigHC.Elements.ReputationUpdates.Scale;
            this.RepUpdatesPos.x = this.xmlConfigHC.Elements.ReputationUpdates.X;
            this.RepUpdatesPos.y = this.xmlConfigHC.Elements.ReputationUpdates.Y;
            this.LevelUpAnimScale = this.xmlConfigHC.Elements.LevelUpAnimation.Scale;
            this.LevelUpAnimPos.x = this.xmlConfigHC.Elements.LevelUpAnimation.X;
            this.LevelUpAnimPos.y = this.xmlConfigHC.Elements.LevelUpAnimation.Y;
            if(this.xmlConfigHC.Elements.Subtitles.Scale != undefined)
            {
               this.SubtitlesScale = this.xmlConfigHC.Elements.Subtitles.Scale;
            }
            if(this.xmlConfigHC.Elements.Subtitles.X != undefined)
            {
               this.SubtitlesPos.x = this.xmlConfigHC.Elements.Subtitles.X;
            }
            else
            {
               this.SubtitlesPos.x = 0;
            }
            if(this.xmlConfigHC.Elements.Subtitles.Y != undefined)
            {
               this.SubtitlesPos.y = this.xmlConfigHC.Elements.Subtitles.Y;
            }
            else
            {
               this.SubtitlesPos.y = 0;
            }
            if(this.xmlConfigHC.Elements.XPBar.Scale != undefined)
            {
               if(!this.xmlConfigHC.ImmersiveTweaks.Xp)
               {
                  this.XPBarScale = this.xmlConfigHC.Elements.XPBar.Scale;
               }
            }
            if(this.xmlConfigHC.Elements.XPBar.X != undefined)
            {
               this.XPBarPos.x = this.xmlConfigHC.Elements.XPBar.X;
            }
            else
            {
               this.XPBarPos.x = 0;
            }
            if(this.xmlConfigHC.Elements.XPBar.Y != undefined)
            {
               this.XPBarPos.y = this.xmlConfigHC.Elements.XPBar.Y;
            }
            else
            {
               this.XPBarPos.y = 0;
            }
            if(this.xmlConfigHC.Elements.CritMeter.Scale != undefined)
            {
               this.CritMeterScale = this.xmlConfigHC.Elements.CritMeter.Scale;
            }
            if(this.xmlConfigHC.Elements.CritMeter.X != undefined)
            {
               this.CritMeterPos.x = this.xmlConfigHC.Elements.CritMeter.X;
            }
            else
            {
               this.CritMeterPos.x = 0;
            }
            if(this.xmlConfigHC.Elements.CritMeter.Y != undefined)
            {
               this.CritMeterPos.y = this.xmlConfigHC.Elements.CritMeter.Y;
            }
            else
            {
               this.CritMeterPos.y = 0;
            }
            if(this.xmlConfigHC.Elements.CurrencyUpdates.Scale != undefined)
            {
               this.CurrencyScale = this.xmlConfigHC.Elements.CurrencyUpdates.Scale;
            }
            if(this.xmlConfigHC.Elements.CurrencyUpdates.X != undefined)
            {
               this.CurrencyPos.x = this.xmlConfigHC.Elements.CurrencyUpdates.X;
            }
            else
            {
               this.CurrencyPos.x = 0;
            }
            if(this.xmlConfigHC.Elements.CurrencyUpdates.Y != undefined)
            {
               this.CurrencyPos.y = this.xmlConfigHC.Elements.CurrencyUpdates.Y;
            }
            else
            {
               this.CurrencyPos.y = 0;
            }
            if(this.xmlConfigHC.Elements.EnemyHealthMeter.Scale != undefined)
            {
               this.EnemyHealthScale = this.xmlConfigHC.Elements.EnemyHealthMeter.Scale;
            }
            if(this.xmlConfigHC.Elements.EnemyHealthMeter.X != undefined)
            {
               this.EnemyHealthPos.x = this.xmlConfigHC.Elements.EnemyHealthMeter.X;
            }
            else
            {
               this.EnemyHealthPos.x = 0;
            }
            if(this.xmlConfigHC.Elements.EnemyHealthMeter.Y != undefined)
            {
               this.EnemyHealthPos.y = this.xmlConfigHC.Elements.EnemyHealthMeter.Y;
            }
            else
            {
               this.EnemyHealthPos.y = 0;
            }
         }
         var hudHUEradsbarfinal:* = this.hudHUEradsbar - this.hudHUEleftmeters;
         var hudHUEteamradsbarfinal:* = this.hudHUEteamrads - this.hudHUEteam;
         var tempSatRM:Number = 0;
         if(this.rightmetersSaturation >= 75)
         {
            tempSatRM = -(this.rightmetersSaturation - 25);
         }
         else
         {
            tempSatRM = -this.rightmetersSaturation;
         }
         rightmetersInvColorMatrix = ColorMath.getColorChangeFilter(-this.rightmetersBrightness,-this.rightmetersContrast,tempSatRM,-this.hudHUErightmeters + 60);
         rightmetersColorMatrix = ColorMath.getColorChangeFilter(this.rightmetersBrightness,this.rightmetersContrast,this.rightmetersSaturation,this.hudHUErightmeters - 60);
         leftmetersColorMatrix = ColorMath.getColorChangeFilter(this.leftmetersBrightness,this.leftmetersContrast,this.leftmetersSaturation,this.hudHUEleftmeters - 60);
         var tempSatLM:Number = 0;
         if(this.leftmetersSaturation >= 75)
         {
            tempSatLM = -(this.leftmetersSaturation - 25);
         }
         else
         {
            tempSatLM = -this.leftmetersSaturation;
         }
         leftmetersInvColorMatrix = ColorMath.getColorChangeFilter(-this.leftmetersBrightness,-this.leftmetersContrast,tempSatLM,-this.hudHUEleftmeters + 60);
         notiColorMatrix = ColorMath.getColorChangeFilter(this.notiBrightness,this.notiContrast,this.notiSaturation,this.hudHUEnoti - 60);
         frobberColorMatrix = ColorMath.getColorChangeFilter(this.frobberBrightness,this.frobberContrast,this.frobberSaturation,this.hudHUEfrobber - 60);
         trackerColorMatrix = ColorMath.getColorChangeFilter(this.trackerBrightness,this.trackerContrast,this.trackerSaturation,this.hudHUEtracker - 60);
         topcenterColorMatrix = ColorMath.getColorChangeFilter(this.topcenterBrightness,this.topcenterContrast,this.topcenterSaturation,this.hudHUEtopcenter - 60);
         var tempSat:Number = 0;
         if(this.topcenterSaturation >= 75)
         {
            tempSat = -(this.topcenterSaturation - 25);
         }
         else
         {
            tempSat = -this.topcenterSaturation;
         }
         var tempSatTeam:Number = 0;
         if(this.teamSaturation >= 75)
         {
            tempSatTeam = -(this.teamSaturation - 25);
         }
         else
         {
            tempSatTeam = -this.teamSaturation;
         }
         sneakDangerColorMatrix = ColorMath.getColorChangeFilter(-this.topcenterBrightness,-this.topcenterContrast,tempSat,-this.hudHUEtopcenter + 60);
         bottomcenterColorMatrix = ColorMath.getColorChangeFilter(this.bottomcenterBrightness,this.bottomcenterContrast,this.bottomcenterSaturation,this.hudHUEbottomcenter - 60);
         bccompassColorMatrix = ColorMath.getColorChangeFilter(this.bccompassBrightness,this.bccompassContrast,this.bccompassSaturation,this.hudHUEbccompass - 60);
         var tempSatBCC:Number = 0;
         if(this.bccompassSaturation >= 75)
         {
            tempSatBCC = -(this.bccompassSaturation - 25);
         }
         else
         {
            tempSatBCC = -this.bccompassSaturation;
         }
         bccompassInvColorMatrix = ColorMath.getColorChangeFilter(-this.bccompassBrightness,-this.bccompassContrast,tempSatBCC,-this.hudHUEbccompass + 60);
         bottomcenterInvColorMatrix = ColorMath.getColorChangeFilter(-this.bottomcenterBrightness,-this.bottomcenterContrast,-this.bottomcenterSaturation,-this.hudHUEbottomcenter + 60);
         announceColorMatrix = ColorMath.getColorChangeFilter(this.announceBrightness,this.announceContrast,this.announceSaturation,this.hudHUEannounce - 60);
         announceInvColorMatrix = ColorMath.getColorChangeFilter(-this.announceBrightness,-this.announceContrast,-this.announceSaturation,-this.hudHUEannounce + 60);
         centerColorMatrix = ColorMath.getColorChangeFilter(this.centerBrightness,this.centerContrast,this.centerSaturation,this.hudHUEcenter - 60);
         teamColorMatrix = ColorMath.getColorChangeFilter(this.teamBrightness,this.teamContrast,this.teamSaturation,this.hudHUEteam - 60);
         teamInvColorMatrix = ColorMath.getColorChangeFilter(-this.teamBrightness,-this.teamContrast,tempSatTeam,-this.hudHUEteam + 60);
         teamradsColorMatrix = ColorMath.getColorChangeFilter(this.teamRadsBrightness,this.teamRadsContrast,this.teamRadsSaturation,hudHUEteamradsbarfinal + 60);
         floatingColorMatrix = ColorMath.getColorChangeFilter(this.floatingBrightness,this.floatingContrast,this.floatingSaturation,this.hudHUEfloating - 60);
         floatingInvColorMatrix = ColorMath.getColorChangeFilter(-this.floatingBrightness,-this.floatingContrast,-this.floatingSaturation,-this.hudHUEfloating + 60);
         radsbarColorMatrix = ColorMath.getColorChangeFilter(this.radsbarBrightness - this.leftmetersBrightness,this.radsbarContrast - this.leftmetersContrast,this.radsbarSaturation - this.leftmetersSaturation,hudHUEradsbarfinal + 60);
         hudColorHitMarkerMatrix = ColorMath.getColorChangeFilter(this.hmBrightness,this.hmContrast,this.hmSaturation,this.hudHUEHM);
         this.initializeStaticElementsProps();
      }
      
      private function initializeStaticElementsProps() : void
      {
         if(this.xmlConfigHC.Elements != undefined)
         {
            if(this.SneakMeterScale <= this.maxScale)
            {
               this.topLevel.TopCenterGroup_mc.StealthMeter_mc.scaleX = this.SneakMeterScale;
               this.topLevel.TopCenterGroup_mc.StealthMeter_mc.scaleY = this.SneakMeterScale;
            }
            else
            {
               this.topLevel.TopCenterGroup_mc.StealthMeter_mc.scaleX = 1;
               this.topLevel.TopCenterGroup_mc.StealthMeter_mc.scaleY = 1;
            }
            if(this.FusionScale <= this.maxScale)
            {
               this.topLevel.RightMeters_mc.HUDFusionCoreMeter_mc.scaleX = this.FusionScale;
               this.topLevel.RightMeters_mc.HUDFusionCoreMeter_mc.scaleY = this.FusionScale;
            }
            else
            {
               this.topLevel.RightMeters_mc.HUDFusionCoreMeter_mc.scaleX = 1;
               this.topLevel.RightMeters_mc.HUDFusionCoreMeter_mc.scaleY = 1;
            }
            if(this.APMeterScale <= this.maxScale)
            {
               this.topLevel.RightMeters_mc.ActionPointMeter_mc.scaleX = this.APMeterScale;
               this.topLevel.RightMeters_mc.ActionPointMeter_mc.scaleY = this.APMeterScale;
            }
            else
            {
               this.topLevel.RightMeters_mc.ActionPointMeter_mc.scaleX = 1;
               this.topLevel.RightMeters_mc.ActionPointMeter_mc.scaleY = 1;
            }
            if(this.ActiveEffectsScale <= this.maxScale)
            {
               this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.scaleX = this.ActiveEffectsScale;
               this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.scaleY = this.ActiveEffectsScale;
            }
            else
            {
               this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.scaleX = 1;
               this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.scaleY = 1;
            }
            if(this.AmmoCountScale <= this.maxScale)
            {
               this.topLevel.RightMeters_mc.AmmoCount_mc.scaleX = this.AmmoCountScale;
               this.topLevel.RightMeters_mc.AmmoCount_mc.scaleY = this.AmmoCountScale;
            }
            else
            {
               this.topLevel.RightMeters_mc.AmmoCount_mc.scaleX = 1;
               this.topLevel.RightMeters_mc.AmmoCount_mc.scaleY = 1;
            }
            if(this.LevelUpAnimScale <= this.maxScale)
            {
               this.topLevel.LevelUpAnimation_mc.scaleX = this.LevelUpAnimScale;
               this.topLevel.LevelUpAnimation_mc.scaleY = this.LevelUpAnimScale;
            }
            else
            {
               this.topLevel.LevelUpAnimation_mc.scaleX = 1;
               this.topLevel.LevelUpAnimation_mc.scaleY = 1;
            }
            if(this.RepUpdatesScale <= this.maxScale)
            {
               this.topLevel.ReputationUpdates_mc.scaleX = this.RepUpdatesScale;
               this.topLevel.ReputationUpdates_mc.scaleY = this.RepUpdatesScale;
            }
            else
            {
               this.topLevel.ReputationUpdates_mc.scaleX = 1;
               this.topLevel.ReputationUpdates_mc.scaleY = 1;
            }
            if(this.HitMarkerScale <= this.maxScale)
            {
               this.topLevel.CenterGroup_mc.HitIndicator_mc.scaleX = this.HitMarkerScale;
               this.topLevel.CenterGroup_mc.HitIndicator_mc.scaleY = this.HitMarkerScale;
            }
            else
            {
               this.topLevel.CenterGroup_mc.HitIndicator_mc.scaleX = 1;
               this.topLevel.CenterGroup_mc.HitIndicator_mc.scaleY = 1;
            }
            if(this.FlashLightWidgetScale <= this.maxScale)
            {
               this.topLevel.RightMeters_mc.FlashLightWidget_mc.scaleX = this.FlashLightWidgetScale;
               this.topLevel.RightMeters_mc.FlashLightWidget_mc.scaleY = this.FlashLightWidgetScale;
            }
            else
            {
               this.topLevel.RightMeters_mc.FlashLightWidget_mc.scaleX = 1;
               this.topLevel.RightMeters_mc.FlashLightWidget_mc.scaleY = 1;
            }
            if(this.EmoteScale <= this.maxScale)
            {
               this.topLevel.RightMeters_mc.LocalEmote_mc.scaleX = this.EmoteScale;
               this.topLevel.RightMeters_mc.LocalEmote_mc.scaleY = this.EmoteScale;
            }
            else
            {
               this.topLevel.RightMeters_mc.LocalEmote_mc.scaleX = 1;
               this.topLevel.RightMeters_mc.LocalEmote_mc.scaleY = 1;
            }
            if(this.QuickLootScale <= this.maxScale)
            {
               this.topLevel.CenterGroup_mc.QuickContainerWidget_mc.scaleX = this.QuickLootScale;
               this.topLevel.CenterGroup_mc.QuickContainerWidget_mc.scaleY = this.QuickLootScale;
            }
            else
            {
               this.topLevel.CenterGroup_mc.QuickContainerWidget_mc.scaleX = 1;
               this.topLevel.CenterGroup_mc.QuickContainerWidget_mc.scaleY = 1;
            }
            if(this.FrobberScale <= this.maxScale)
            {
               this.topLevel.FrobberWidget_mc.scaleX = this.FrobberScale;
               this.topLevel.FrobberWidget_mc.scaleY = this.FrobberScale;
            }
            else
            {
               this.topLevel.FrobberWidget_mc.scaleX = 1;
               this.topLevel.FrobberWidget_mc.scaleY = 1;
            }
            if(this.PerkPopUpScale <= this.maxScale)
            {
               this.topLevel.BottomCenterGroup_mc.PerkVaultBoy_mc.scaleX = this.PerkPopUpScale;
               this.topLevel.BottomCenterGroup_mc.PerkVaultBoy_mc.scaleY = this.PerkPopUpScale;
            }
            else
            {
               this.topLevel.BottomCenterGroup_mc.PerkVaultBoy_mc.scaleX = 1;
               this.topLevel.BottomCenterGroup_mc.PerkVaultBoy_mc.scaleY = 1;
            }
            if(this.FusionPopUpScale <= this.maxScale)
            {
               this.topLevel.RightMeters_mc.PowerArmorLowBatteryWarning_mc.scaleX = this.FusionPopUpScale;
               this.topLevel.RightMeters_mc.PowerArmorLowBatteryWarning_mc.scaleY = this.FusionPopUpScale;
            }
            else
            {
               this.topLevel.RightMeters_mc.PowerArmorLowBatteryWarning_mc.scaleX = 1;
               this.topLevel.RightMeters_mc.PowerArmorLowBatteryWarning_mc.scaleY = 1;
            }
            if(this.RadCountScale <= this.maxScale)
            {
               this.topLevel.LeftMeters_mc.RadsMeter_mc.scaleX = this.RadCountScale;
               this.topLevel.LeftMeters_mc.RadsMeter_mc.scaleY = this.RadCountScale;
            }
            else
            {
               this.topLevel.LeftMeters_mc.RadsMeter_mc.scaleX = 1;
               this.topLevel.LeftMeters_mc.RadsMeter_mc.scaleY = 1;
            }
            if(this.RollOverScale <= this.maxScale)
            {
               this.topLevel.CenterGroup_mc.RolloverWidget_mc.scaleX = this.RollOverScale;
               this.topLevel.CenterGroup_mc.RolloverWidget_mc.scaleY = this.RollOverScale;
            }
            else
            {
               this.topLevel.CenterGroup_mc.RolloverWidget_mc.scaleX = 1;
               this.topLevel.CenterGroup_mc.RolloverWidget_mc.scaleY = 1;
            }
            if(this.CompassScale <= this.maxScale)
            {
               this.topLevel.BottomCenterGroup_mc.CompassWidget_mc.scaleX = this.CompassScale;
               this.topLevel.BottomCenterGroup_mc.CompassWidget_mc.scaleY = this.CompassScale;
            }
            else
            {
               this.topLevel.BottomCenterGroup_mc.CompassWidget_mc.scaleX = 1;
               this.topLevel.BottomCenterGroup_mc.CompassWidget_mc.scaleY = 1;
            }
            if(this.xmlConfigHC.Elements.Subtitles.Scale != undefined)
            {
               if(this.SubtitlesScale <= this.maxScale)
               {
                  this.topLevel.BottomCenterGroup_mc.SubtitleText_mc.scaleX = this.SubtitlesScale;
                  this.topLevel.BottomCenterGroup_mc.SubtitleText_mc.scaleY = this.SubtitlesScale;
               }
               else
               {
                  this.topLevel.BottomCenterGroup_mc.SubtitleText_mc.scaleX = 1;
                  this.topLevel.BottomCenterGroup_mc.SubtitleText_mc.scaleY = 1;
               }
            }
            if(this.xmlConfigHC.Elements.CritMeter.Scale != undefined)
            {
               if(this.CritMeterScale <= this.maxScale)
               {
                  this.topLevel.BottomCenterGroup_mc.CritMeter_mc.scaleX = this.CritMeterScale;
                  this.topLevel.BottomCenterGroup_mc.CritMeter_mc.scaleY = this.CritMeterScale;
               }
               else
               {
                  this.topLevel.BottomCenterGroup_mc.CritMeter_mc.scaleX = 1;
                  this.topLevel.BottomCenterGroup_mc.CritMeter_mc.scaleY = 1;
               }
            }
            if(this.xmlConfigHC.Elements.CurrencyUpdates.Scale != undefined)
            {
               if(this.CurrencyScale <= this.maxScale)
               {
                  this.topLevel.HUDNotificationsGroup_mc.CurrencyUpdates_mc.scaleX = this.CurrencyScale;
                  this.topLevel.HUDNotificationsGroup_mc.CurrencyUpdates_mc.scaleY = this.CurrencyScale;
               }
               else
               {
                  this.topLevel.HUDNotificationsGroup_mc.CurrencyUpdates_mc.scaleX = 1;
                  this.topLevel.HUDNotificationsGroup_mc.CurrencyUpdates_mc.scaleY = 1;
               }
            }
            if(this.xmlConfigHC.Elements.XPBar.Scale != undefined)
            {
               if(this.CritMeterScale <= this.maxScale)
               {
                  this.topLevel.HUDNotificationsGroup_mc.XPMeter_mc.scaleX = this.XPBarScale;
                  this.topLevel.HUDNotificationsGroup_mc.XPMeter_mc.scaleY = this.XPBarScale;
               }
               else
               {
                  this.topLevel.HUDNotificationsGroup_mc.XPMeter_mc.scaleX = 1;
                  this.topLevel.HUDNotificationsGroup_mc.XPMeter_mc.scaleY = 1;
               }
            }
            if(this.xmlConfigHC.Elements.EnemyHealthMeter.Scale != undefined)
            {
               if(this.EnemyHealthScale <= this.maxScale)
               {
                  this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.scaleX = this.EnemyHealthScale;
                  this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.scaleY = this.EnemyHealthScale;
               }
               else
               {
                  this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.scaleX = 1;
                  this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.scaleY = 1;
               }
            }
            if(this.LeftMeterScale <= this.maxScale)
            {
               this.topLevel.LeftMeters_mc.scaleX = this.LeftMeterScale;
               this.topLevel.LeftMeters_mc.scaleY = this.LeftMeterScale;
            }
            else
            {
               this.topLevel.LeftMeters_mc.scaleX = 1;
               this.topLevel.LeftMeters_mc.scaleY = 1;
            }
            if(this.NotificationScale <= this.maxScale)
            {
               this.topLevel.HUDNotificationsGroup_mc.Messages_mc.scaleX = this.NotificationScale;
               this.topLevel.HUDNotificationsGroup_mc.Messages_mc.scaleY = this.NotificationScale;
            }
            else
            {
               this.topLevel.HUDNotificationsGroup_mc.Messages_mc.scaleX = 1;
               this.topLevel.HUDNotificationsGroup_mc.Messages_mc.scaleY = 1;
            }
            if(this.QuestScale <= this.maxScale)
            {
               this.topLevel.TopRightGroup_mc.NewQuestTracker_mc.scaleX = this.QuestScale;
               this.topLevel.TopRightGroup_mc.NewQuestTracker_mc.scaleY = this.QuestScale;
            }
            else
            {
               this.topLevel.TopRightGroup_mc.NewQuestTracker_mc.scaleX = 1;
               this.topLevel.TopRightGroup_mc.NewQuestTracker_mc.scaleY = 1;
            }
            if(this.AnnounceScale <= this.maxScale)
            {
               this.topLevel.AnnounceEventWidget_mc.scaleX = this.AnnounceScale;
               this.topLevel.AnnounceEventWidget_mc.scaleY = this.AnnounceScale;
            }
            else
            {
               this.topLevel.AnnounceEventWidget_mc.scaleX = 1;
               this.topLevel.AnnounceEventWidget_mc.scaleY = 1;
            }
         }
         if(this.xmlConfigHC.Elements.EnemyHealthMeter.HealthPercentLocation != undefined)
         {
            if(this.xmlConfigHC.Elements.EnemyHealthMeter.HealthPercentLocation == "top")
            {
               this.showHealthText.y = this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.DisplayText_mc.y - this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.DisplayText_mc.height;
               this.showHealthText.autoSize = TextFieldAutoSize.CENTER;
               this.showHealthText.x = 0 - this.showHealthText.width * 0.5;
            }
            else if(this.xmlConfigHC.Elements.EnemyHealthMeter.HealthPercentLocation == "bottom")
            {
               this.showHealthText.y = this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.DisplayText_mc.y + this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.DisplayText_mc.height + 40;
               this.showHealthText.autoSize = TextFieldAutoSize.CENTER;
               this.showHealthText.x = 0 - this.showHealthText.width * 0.5;
            }
            else if(this.xmlConfigHC.Elements.EnemyHealthMeter.HealthPercentLocation == "right")
            {
               this.showHealthText.y = this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.DisplayText_mc.y + this.showHealthText.height - this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.MeterBar_mc.height / 2;
               this.showHealthText.autoSize = TextFieldAutoSize.LEFT;
               this.showHealthText.x = this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.DisplayText_mc.x + this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.width / 4 + 75;
            }
            else if(this.xmlConfigHC.Elements.EnemyHealthMeter.HealthPercentLocation == "left")
            {
               this.showHealthText.y = this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.DisplayText_mc.y + this.showHealthText.height - this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.MeterBar_mc.height / 2;
               this.showHealthText.autoSize = TextFieldAutoSize.RIGHT;
               this.showHealthText.x = this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.DisplayText_mc.x - this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.width / 2;
            }
            else
            {
               this.showHealthText.y = this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.DisplayText_mc.y - this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.DisplayText_mc.height;
               this.showHealthText.autoSize = TextFieldAutoSize.CENTER;
               this.showHealthText.x = 0 - this.showHealthText.width * 0.5;
            }
         }
         if(this.xmlConfigHC.Colors.HUD.EnableRecoloring == "true")
         {
            this.topLevel.TopCenterGroup_mc.filters = [topcenterColorMatrix];
            this.topLevel.RightMeters_mc.filters = [rightmetersColorMatrix];
            this.topLevel.RightMeters_mc.LocalEmote_mc.filters = [rightmetersInvColorMatrix];
            this.topLevel.CenterGroup_mc.HitIndicator_mc.filters = [hudColorHitMarkerMatrix];
            this.topLevel.CenterGroup_mc.getChildAt(0).filters = [centerColorMatrix];
            if(this.xmlConfigHC.Elements.RightMeter.Parts.FlashLightWidget.RestoreFlashLightIcon != undefined)
            {
               if(this.xmlConfigHC.Elements.RightMeter.Parts.FlashLightWidget.RestoreFlashLightIcon == "true")
               {
                  this.FlashLightRestored_mc.visible = true;
               }
               else if(this.xmlConfigHC.Elements.RightMeter.Parts.FlashLightWidget.RestoreFlashLightIcon == "false")
               {
                  this.FlashLightRestored_mc.visible = false;
               }
            }
            if(this.xmlConfigHC.Colors.HUD.CustomCrosshair == "true")
            {
               this.topLevel.CenterGroup_mc.HUDCrosshair_mc.filters = null;
            }
            else if(this.xmlConfigHC.Colors.HUD.CustomCrosshair == "false")
            {
               this.topLevel.CenterGroup_mc.HUDCrosshair_mc.filters = [centerColorMatrix];
            }
            this.topLevel.CenterGroup_mc.getChildAt(5).filters = [centerColorMatrix];
            this.topLevel.CenterGroup_mc.getChildAt(1).alpha = Number(this.xmlConfigHC.Colors.HUD.CrosshairOpacity);
            this.topLevel.DamageNumbers_mc.filters = [floatingColorMatrix];
            this.topLevel.FloatingTargetManager_mc.filters = [floatingColorMatrix];
            this.topLevel.FrobberWidget_mc.filters = [frobberColorMatrix];
            this.topLevel.BottomCenterGroup_mc.SubtitleText_mc.filters = [bottomcenterColorMatrix];
            this.topLevel.BottomCenterGroup_mc.CritMeter_mc.filters = [bottomcenterColorMatrix];
            this.topLevel.TopRightGroup_mc.NewQuestTracker_mc.filters = [trackerColorMatrix];
            this.topLevel.HUDNotificationsGroup_mc.Messages_mc.filters = [notiColorMatrix];
            this.topLevel.HUDNotificationsGroup_mc.XPMeter_mc.filters = [notiColorMatrix];
            this.topLevel.LeftMeters_mc.getChildAt(0).getChildAt(2).getChildAt(0).getChildAt(0).filters = [radsbarColorMatrix];
            this.topLevel.LeftMeters_mc.RadsMeter_mc.filters = [leftmetersInvColorMatrix];
            this.topLevel.LeftMeters_mc.filters = [leftmetersColorMatrix];
         }
         this.reloadCount = 0;
      }
      
      private function reloadXML() : void
      {
         try
         {
            this.xmlLoaderHC.load(new URLRequest("../HUDEditor.xml"));
            this.initCommands(this.xmlLoaderHC.data.toString());
         }
         catch(error:Error)
         {
            displayText("Error finding HUDEditor configuration file. " + error.message.toString() + this.FusionPopUpScale);
         }
      }
      
      private function displayText(_text:String) : void
      {
         this.debugTextHC.appendText(_text + "\n");
      }
      
      private function displayHENotification(header:String, title:String, body:String) : void
      {
         this.HUDNotification_mc.Internal_mc.messageBoxStarContainer.visible = false;
         this.HUDNotification_mc.Internal_mc.HeaderText_tf.text = header;
         this.HUDNotification_mc.Internal_mc.TitleText_tf.text = " " + title;
         this.HUDNotification_mc.Internal_mc.BodyText_tf.text = " " + body;
         this.HUDNotification_mc.gotoAndPlay("FadeIn");
         this.EventCloseTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.closePromptHandler);
         this.timerResetAndStart(this.EventCloseTimer);
      }
      
      private function timerResetAndStart(timer:Timer) : *
      {
         timer.reset();
         timer.start();
      }
      
      public function closePromptHandler() : void
      {
         this.HUDNotification_mc.gotoAndPlay("FadeOut");
      }
      
      private function onHudModeDataChange(param1:FromClientDataEvent) : *
      {
         this.inPowerArmor = param1.data.inPowerArmor;
         this.powerArmorHUDEnabled = param1.data.powerArmorHUDEnabled;
      }
      
      private function frame1() : *
      {
         stop();
         this.HUDNotification_mc.visible = false;
      }
      
      private function frame2() : *
      {
         stop();
         this.HUDNotification_mc.visible = true;
      }
      
      private function frame3() : *
      {
         stop();
      }
      
      private function frame4() : *
      {
         stop();
         this.HUDNotification_mc.visible = false;
      }
      
      public function set levelUpVisible(param1:Boolean) : void
      {
         if(param1)
         {
            this.topLevel.HUDNotificationsGroup_mc.XPMeter_mc.gotoAndStop("levelup");
            this.topLevel.HUDNotificationsGroup_mc.XPMeter_mc.NumberText.visible = false;
         }
         else
         {
            this.topLevel.HUDNotificationsGroup_mc.XPMeter_mc.gotoAndStop("xp");
            this.topLevel.HUDNotificationsGroup_mc.XPMeter_mc.NumberText.visible = true;
         }
      }
      
      private function ShowHealth(param1:int) : *
      {
         var isEnemy:Boolean = false;
         var healthPercent:Number = NaN;
         this.showHealthText.visible = true;
         if(this.xmlConfigHC.Elements.EnemyHealthMeter.ShowHealthPercent == "true")
         {
            isEnemy = false;
            if(this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.currentFrame < 5)
            {
               isEnemy = true;
            }
            else if(this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.currentFrame > 5)
            {
               isEnemy = false;
            }
            healthPercent = isEnemy ? Number(this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.MeterBarEnemy_mc.Percent) : Number(this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.MeterBar_mc.Percent);
            if(param1 > 0)
            {
               this.showHealthText.text = "[" + Math.round(param1 * healthPercent).toString() + " - " + (healthPercent * 100).toFixed(2).toString() + "%]";
            }
            else
            {
               this.showHealthText.text = "[" + (healthPercent * 100).toFixed(2).toString() + "%]";
            }
            this.showHealthText.textColor = isEnemy ? uint(16741472) : uint(16777163);
         }
         else if(this.xmlConfigHC.Elements.EnemyHealthMeter.ShowHealthPercent == "false")
         {
            this.showHealthText.visible = false;
         }
         else if(this.xmlConfigHC.Elements.EnemyHealthMeter.ShowHealthPercent == undefined)
         {
            this.showHealthText.visible = false;
         }
      }
   }
}
