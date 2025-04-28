package
{
   import Shared.*;
   import Shared.AS3.*;
   import Shared.AS3.Data.*;
   import Shared.AS3.Events.*;
   import fl.motion.*;
   import flash.display.*;
   import flash.events.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.net.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import scaleform.gfx.*;
   
   public class HUDEditor extends MovieClip
   {
      
      private static const SWFQUIRY_ImprovedHealthBars:String = "ImprovedHealthBars";
      
      private static const SWFQUIRY_LOADER:String = "flash.display::Loader";
      
      private static var FcmetersColorMatrix:ColorMatrixFilter = null;
      
      private static var HpmetersColorMatrix:ColorMatrixFilter = null;
      
      private static var HpmetersInvColorMatrix:ColorMatrixFilter = null;
      
      private static var GlmetersColorMatrix:ColorMatrixFilter = null;
      
      private static var radsbarColorMatrix:ColorMatrixFilter = null;
      
      private static var ActiveEffectsColorMatrix:ColorMatrixFilter = null;
      
      private static var ActiveEffectsInvColorMatrix:ColorMatrixFilter = null;
      
      private static var AmmoCountColorMatrix:ColorMatrixFilter = null;
      
      private static var APMeterColorMatrix:ColorMatrixFilter = null;
      
      private static var ExplosiveAmmoCountColorMatrix:ColorMatrixFilter = null;
      
      private static var FeralMeterColorMatrix:ColorMatrixFilter = null;
      
      private static var HungerMeterColorMatrix:ColorMatrixFilter = null;
      
      private static var ThirstMeterColorMatrix:ColorMatrixFilter = null;
      
      private static var AnnounceColorMatrix:ColorMatrixFilter = null;
      
      private static var AreaVoiceListColorMatrix:ColorMatrixFilter = null;
      
      private static var LowFusionCoreWarningColorMatrix:ColorMatrixFilter = null;
      
      private static var NoFusionCoreWarningColorMatrix:ColorMatrixFilter = null;
      
      private static var NotificationColorMatrix:ColorMatrixFilter = null;
      
      private static var RadDamageIndicatorColorMatrix:ColorMatrixFilter = null;
      
      private static var SubtitlesColorMatrix:ColorMatrixFilter = null;
      
      private static var XPBarColorMatrix:ColorMatrixFilter = null;
      
      private static var QuickLootColorMatrix:ColorMatrixFilter = null;
      
      private static var FrobberColorMatrix:ColorMatrixFilter = null;
      
      private static var RollOverColorMatrix:ColorMatrixFilter = null;
      
      private static var HitMarkerColorMatrix:ColorMatrixFilter = null;
      
      private static var DmgNumbColorMatrix:ColorMatrixFilter = null;
      
      private static var floatingColorMatrix:ColorMatrixFilter = null;
      
      private static var floatingInvColorMatrix:ColorMatrixFilter = null;
      
      private static var TeamGlowColorMatrix:ColorMatrixFilter = null;
      
      private static var TeamHpColorMatrix:ColorMatrixFilter = null;
      
      private static var TeamNameColorMatrix:ColorMatrixFilter = null;
      
      private static var TeamRadColorMatrix:ColorMatrixFilter = null;
      
      private static var TeamTypeColorMatrix:ColorMatrixFilter = null;
      
      private static var TeamPerkColorMatrix:ColorMatrixFilter = null;
      
      private static var QuestTrackerColorMatrix:ColorMatrixFilter = null;
      
      private static var SMHiddenColorMatrix:ColorMatrixFilter = null;
      
      private static var SMDetectedColorMatrix:ColorMatrixFilter = null;
      
      private static var SMCautionColorMatrix:ColorMatrixFilter = null;
      
      private static var SMDangerColorMatrix:ColorMatrixFilter = null;
      
      private static var CompassColorMatrix:ColorMatrixFilter = null;
      
      private static var CompassInvColorMatrix:ColorMatrixFilter = null;
      
      private static var CritMeterColorMatrix:ColorMatrixFilter = null;
      
      private static var EnemyHealthMeterColorMatrix:ColorMatrixFilter = null;
       
      
      private var HUDMessageItemBox:Class;
      
      private var FlashLightWidget:Class;
      
      private const PercentMax:Number = 1;
      
      private var topLevel = null;
      
      private var xmlConfigHC:XML;
      
      private var xmlLoaderHC:URLLoader;
      
      private var textURL:URLRequest;
      
      private var textLoader:URLLoader;
      
      private var updateTimerHC:Timer;
      
      private var updateGlowTimer:Timer;
      
      private var debugTextHC:TextField;
      
      private var watermark:TextField;
      
      private var thirst:TextField;
      
      private var hunger:TextField;
      
      private var HPText:TextField;
      
      private var APText:TextField;
      
      private var showHealthText:TextField;
      
      private var TeamObfuscateText:TextField;
      
      private var ActiveEffectsBrightness:Number = 0;
      
      private var ActiveEffectsContrast:Number = 0;
      
      private var ActiveEffectsSaturation:Number = 0;
      
      private var ActiveEffectsRGB1 = "00ff00";
      
      public var hudHUEActiveEffects:Number = 0;
      
      private var AmmoCountBrightness:Number = 0;
      
      private var AmmoCountContrast:Number = 0;
      
      private var AmmoCountSaturation:Number = 0;
      
      private var AmmoCountRGB1 = "00ff00";
      
      public var hudHUEAmmoCount:Number = 0;
      
      private var APMeterBrightness:Number = 0;
      
      private var APMeterContrast:Number = 0;
      
      private var APMeterSaturation:Number = 0;
      
      private var APMeterRGB1 = "00ff00";
      
      public var hudHUEAPMeter:Number = 0;
      
      private var ExplosiveAmmoCountBrightness:Number = 0;
      
      private var ExplosiveAmmoCountContrast:Number = 0;
      
      private var ExplosiveAmmoCountSaturation:Number = 0;
      
      private var ExplosiveAmmoCountRGB1 = "00ff00";
      
      public var hudHUEExplosiveAmmoCount:Number = 0;
      
      private var FeralMeterBrightness:Number = 0;
      
      private var FeralMeterContrast:Number = 0;
      
      private var FeralMeterSaturation:Number = 0;
      
      private var FeralMeterRGB1 = "00ff00";
      
      public var hudHUEFeralMeter:Number = 0;
      
      private var HungerMeterBrightness:Number = 0;
      
      private var HungerMeterContrast:Number = 0;
      
      private var HungerMeterSaturation:Number = 0;
      
      private var HungerMeterRGB1 = "00ff00";
      
      public var hudHUEHungerMeter:Number = 0;
      
      private var ThirstMeterBrightness:Number = 0;
      
      private var ThirstMeterContrast:Number = 0;
      
      private var ThirstMeterSaturation:Number = 0;
      
      private var ThirstMeterRGB1 = "00ff00";
      
      public var hudHUEThirstMeter:Number = 0;
      
      private var FcmetersBrightness:Number = 0;
      
      private var FcmetersContrast:Number = 0;
      
      private var FcmetersSaturation:Number = 0;
      
      private var FcmetersRGB1 = "00ff00";
      
      private var HpmetersBrightness:Number = 0;
      
      private var HpmetersContrast:Number = 0;
      
      private var HpmetersSaturation:Number = 0;
      
      private var HpmetersRGB1 = "00ff00";
      
      private var GlmetersBrightness:Number = 0;
      
      private var GlmetersContrast:Number = 0;
      
      private var GlmetersSaturation:Number = 0;
      
      private var GlmetersRGB1 = "00ff00";
      
      private var radsbarBrightness:Number = 0;
      
      private var radsbarContrast:Number = 0;
      
      private var radsbarSaturation:Number = 0;
      
      private var radsbarRGB = "00ff00";
      
      public var hudHUEFcmeters:Number = 0;
      
      public var hudHUEHpmeters:Number = 0;
      
      public var hudHUEGlmeters:Number = 0;
      
      public var hudHUEradsbar:Number = 0;
      
      private var AnnounceBrightness:Number = 0;
      
      private var AnnounceContrast:Number = 0;
      
      private var AnnounceSaturation:Number = 0;
      
      private var AnnounceRGB1 = "00ff00";
      
      public var hudHUEAnnounce:Number = 0;
      
      private var AreaVoiceListBrightness:Number = 0;
      
      private var AreaVoiceListContrast:Number = 0;
      
      private var AreaVoiceListSaturation:Number = 0;
      
      private var AreaVoiceListRGB1 = "00ff00";
      
      public var hudHUEAreaVoiceList:Number = 0;
      
      private var LowFusionCoreWarningBrightness:Number = 0;
      
      private var LowFusionCoreWarningContrast:Number = 0;
      
      private var LowFusionCoreWarningSaturation:Number = 0;
      
      private var LowFusionCoreWarningRGB1 = "00ff00";
      
      public var hudHUELowFusionCoreWarning:Number = 0;
      
      private var NoFusionCoreWarningBrightness:Number = 0;
      
      private var NoFusionCoreWarningContrast:Number = 0;
      
      private var NoFusionCoreWarningSaturation:Number = 0;
      
      private var NoFusionCoreWarningRGB1 = "00ff00";
      
      public var hudHUENoFusionCoreWarning:Number = 0;
      
      private var NotificationBrightness:Number = 0;
      
      private var NotificationContrast:Number = 0;
      
      private var NotificationSaturation:Number = 0;
      
      private var NotificationRGB1 = "00ff00";
      
      public var hudHUENotification:Number = 0;
      
      private var RadDamageIndicatorBrightness:Number = 0;
      
      private var RadDamageIndicatorContrast:Number = 0;
      
      private var RadDamageIndicatorSaturation:Number = 0;
      
      private var RadDamageIndicatorRGB1 = "00ff00";
      
      public var hudHUERadDamageIndicator:Number = 0;
      
      private var SubtitlesBrightness:Number = 0;
      
      private var SubtitlesContrast:Number = 0;
      
      private var SubtitlesSaturation:Number = 0;
      
      private var SubtitlesRGB1 = "00ff00";
      
      public var hudHUESubtitles:Number = 0;
      
      private var XPBarBrightness:Number = 0;
      
      private var XPBarContrast:Number = 0;
      
      private var XPBarSaturation:Number = 0;
      
      private var XPBarRGB1 = "00ff00";
      
      public var hudHUEXPBar:Number = 0;
      
      private var QuickLootBrightness:Number = 0;
      
      private var QuickLootContrast:Number = 0;
      
      private var QuickLootSaturation:Number = 0;
      
      private var QuickLootRGB1 = "00ff00";
      
      public var hudHUEQuickLoot:Number = 0;
      
      private var FrobberBrightness:Number = 0;
      
      private var FrobberContrast:Number = 0;
      
      private var FrobberSaturation:Number = 0;
      
      private var FrobberRGB1 = "00ff00";
      
      public var hudHUEFrobber:Number = 0;
      
      private var RollOverBrightness:Number = 0;
      
      private var RollOverContrast:Number = 0;
      
      private var RollOverSaturation:Number = 0;
      
      private var RollOverRGB1 = "00ff00";
      
      public var hudHUERollOver:Number = 0;
      
      private var HitMarkerBrightness:Number = 0;
      
      private var HitMarkerContrast:Number = 0;
      
      private var HitMarkerSaturation:Number = 0;
      
      private var HitMarkerRGB1 = "00ff00";
      
      public var hudHUEHitMarker:Number = 0;
      
      private var DmgNumbBrightness:Number = 0;
      
      private var DmgNumbContrast:Number = 0;
      
      private var DmgNumbSaturation:Number = 0;
      
      private var DmgNumbRGB1 = "00ff00";
      
      public var hudHUEDmgNumb:Number = 0;
      
      private var floatingBrightness:Number = 0;
      
      private var floatingContrast:Number = 0;
      
      private var floatingSaturation:Number = 0;
      
      private var floatingRGB1 = "00ff00";
      
      public var hudHUEfloating:Number = 0;
      
      public var teamNum:Number;
      
      private var TeamGlowBrightness:Number = 0;
      
      private var TeamGlowContrast:Number = 0;
      
      private var TeamGlowSaturation:Number = 0;
      
      private var TeamGlowRGB1 = "00ff00";
      
      public var hudHUETeamGlow:Number = 0;
      
      private var TeamHpBrightness:Number = 0;
      
      private var TeamHpContrast:Number = 0;
      
      private var TeamHpSaturation:Number = 0;
      
      private var TeamHpRGB1 = "00ff00";
      
      public var hudHUETeamHp:Number = 0;
      
      private var TeamNameBrightness:Number = 0;
      
      private var TeamNameContrast:Number = 0;
      
      private var TeamNameSaturation:Number = 0;
      
      private var TeamNameRGB1 = "00ff00";
      
      public var hudHUETeamName:Number = 0;
      
      private var TeamRadBrightness:Number = 0;
      
      private var TeamRadContrast:Number = 0;
      
      private var TeamRadSaturation:Number = 0;
      
      private var TeamRadRGB1 = "00ff00";
      
      public var hudHUETeamRad:Number = 0;
      
      private var TeamTypeBrightness:Number = 0;
      
      private var TeamTypeContrast:Number = 0;
      
      private var TeamTypeSaturation:Number = 0;
      
      private var TeamTypeRGB1 = "00ff00";
      
      public var hudHUETeamType:Number = 0;
      
      private var TeamPerkBrightness:Number = 0;
      
      private var TeamPerkContrast:Number = 0;
      
      private var TeamPerkSaturation:Number = 0;
      
      private var TeamPerkRGB1 = "00ff00";
      
      public var hudHUETeamPerk:Number = 0;
      
      private var QuestTrackerBrightness:Number = 0;
      
      private var QuestTrackerContrast:Number = 0;
      
      private var QuestTrackerSaturation:Number = 0;
      
      private var QuestTrackerRGB1 = "00ff00";
      
      public var hudHUEQuestTracker:Number = 0;
      
      private var SMHiddenBrightness:Number = 0;
      
      private var SMHiddenContrast:Number = 0;
      
      private var SMHiddenSaturation:Number = 0;
      
      private var SMHiddenRGB1 = "00ff00";
      
      public var hudHUESMHidden:Number = 0;
      
      private var SMDetectedBrightness:Number = 0;
      
      private var SMDetectedContrast:Number = 0;
      
      private var SMDetectedSaturation:Number = 0;
      
      private var SMDetectedRGB1 = "00ff00";
      
      public var hudHUESMDetected:Number = 0;
      
      private var SMCautionBrightness:Number = 0;
      
      private var SMCautionContrast:Number = 0;
      
      private var SMCautionSaturation:Number = 0;
      
      private var SMCautionRGB1 = "00ff00";
      
      public var hudHUESMCaution:Number = 0;
      
      private var SMDangerBrightness:Number = 0;
      
      private var SMDangerContrast:Number = 0;
      
      private var SMDangerSaturation:Number = 0;
      
      private var SMDangerRGB1 = "00ff00";
      
      public var hudHUESMDanger:Number = 0;
      
      private var CompassBrightness:Number = 0;
      
      private var CompassContrast:Number = 0;
      
      private var CompassSaturation:Number = 0;
      
      private var CompassRGB1 = "00ff00";
      
      public var hudHUECompass:Number = 0;
      
      private var CritMeterBrightness:Number = 0;
      
      private var CritMeterContrast:Number = 0;
      
      private var CritMeterSaturation:Number = 0;
      
      private var CritMeterRGB1 = "00ff00";
      
      public var hudHUECritMeter:Number = 0;
      
      private var EnemyHealthMeterBrightness:Number = 0;
      
      private var EnemyHealthMeterContrast:Number = 0;
      
      private var EnemyHealthMeterSaturation:Number = 0;
      
      private var EnemyHealthMeterRGB1 = "00ff00";
      
      public var hudHUEEnemyHealthMeter:Number = 0;
      
      public var SneakMeterScale = 1;
      
      public var SneakMeterPos:Point;
      
      public var QuestScale:Number = 1;
      
      public var QuestPos:Point;
      
      public var NotificationScale:Number = 1;
      
      public var NotificationPos:Point;
      
      public var HpMeterScale:Number = 1;
      
      public var HpMeterPos:Point;
      
      public var APMeterScale:Number = 1;
      
      public var APMeterPos:Point;
      
      public var ActiveEffectsScale:Number = 1;
      
      public var ActiveEffectsPos:Point;
      
      public var HungerMeterScale:Number = 1;
      
      public var HungerMeterPos:Point;
      
      public var ThirstMeterScale:Number = 1;
      
      public var ThirstMeterPos:Point;
      
      public var AmmoCountScale:Number = 1;
      
      public var AmmoCountPos:Point;
      
      public var ExplosiveAmmoCountScale:Number = 1;
      
      public var ExplosiveAmmoCountPos:Point;
      
      public var FlashLightWidgetScale:Number = 1;
      
      public var FlashLightWidgetPos:Point;
      
      public var EmoteScale:Number = 1;
      
      public var EmotePos:Point;
      
      public var FusionScale:Number = 1;
      
      public var FusionPos:Point;
      
      public var CompassScale:Number = 1;
      
      public var CompassPos:Point;
      
      public var AnnounceScale:Number = 1;
      
      public var AnnouncePos:Point;
      
      public var QuickLootScale:Number = 1;
      
      public var QuickLootPos:Point;
      
      public var TeamPanelScale:Number = 1;
      
      public var TeamPanelPos:Point;
      
      public var FrobberScale:Number = 1;
      
      public var FrobberPos:Point;
      
      public var RollOverScale:Number = 1;
      
      public var RollOverPos:Point;
      
      public var SubtitlesScale:Number = 1;
      
      public var SubtitlesPos:Point;
      
      public var EnemyHealthScale:Number = 1;
      
      public var EnemyHealthPos:Point;
      
      public var XPBarScale:Number = 1;
      
      public var XPBarPos:Point;
      
      public var CritMeterScale:Number = 1;
      
      public var CritMeterPos:Point;
      
      public var CurrencyScale:Number = 1;
      
      public var CurrencyPos:Point;
      
      public var LevelUpAnimScale:Number = 1;
      
      public var LevelUpAnimPos:Point;
      
      public var RepUpdatesScale:Number = 1;
      
      public var RepUpdatesPos:Point;
      
      public var HitMarkerScale:Number = 1;
      
      public var HitMarkerPos:Point;
      
      public var TeamPanelPosPA:Point;
      
      public var HungerMeterPosPA:Point;
      
      public var ThirstMeterPosPA:Point;
      
      public var ExplosiveAmmoCountPosPA:Point;
      
      public var TeamPanelScalePA:Number = 1;
      
      public var HungerMeterScalePA:Number = 1;
      
      public var ThirstMeterScalePA:Number = 1;
      
      public var ExplosiveAmmoCountScalePA:Number = 1;
      
      public var PerkPopUpScale:Number = 1;
      
      public var PerkPopUpPos:Point;
      
      public var FusionPopUpScale:Number = 1;
      
      public var FusionPopUpPos:Point;
      
      public var RadCountScale:Number = 1;
      
      public var RadCountPos:Point;
      
      public var RadCountTextStorage:String;
      
      public var RadCountAlignStorage:Number;
      
      public var RadCountLock:int = 0;
      
      public var ImpHealthScale:Number = 1;
      
      public var ImpHealthPos:Point;
      
      public var ImpHealthLock:int = 0;
      
      public var FeralMScale:Number = 1;
      
      public var FeralMPos:Point;
      
      public var GlowMeterScale:Number = 1;
      
      public var GlowMeterPos:Point;
      
      public var MicPos:Point;
      
      public var MicScale:Number = 1;
      
      public var MicScaleTmp:Number = 1;
      
      public var HPTextPos:Point;
      
      public var HPTextScale:Number = 1;
      
      public var APTextPos:Point;
      
      public var APTextScale:Number = 1;
      
      public var ImprovedHealthBarStateLock:int = 0;
      
      public var ImprovedHealthBarVisualSync:Boolean = false;
      
      public var HpVisualSync:Boolean = false;
      
      public var ApVisualSync:Boolean = false;
      
      public var FeralVisualSync:Boolean = false;
      
      public var FeralSkullVisualSync = false;
      
      public var FeralSkullVisualPassThru = false;
      
      public var GlowVisualSync:Boolean = false;
      
      public var GlowPerVisualSync:Boolean = true;
      
      public var FusionVisualSync:Boolean = false;
      
      public var FusionCountVisualSync = false;
      
      public var FusionCountVisualPassThru = false;
      
      public var HiddenText:String;
      
      public var DetectedText:String;
      
      public var CautionText:String;
      
      public var DangerText:String;
      
      private var reloadCount:int = 0;
      
      private var oHpMeterPos:Point;
      
      private var oAPMeterPos:Point;
      
      private var oActiveEffectsPos:Point;
      
      private var oHungerMeterPos:Point;
      
      private var oThirstMeterPos:Point;
      
      private var oAmmoCountPos:Point;
      
      private var oExplosiveAmmoCountPos:Point;
      
      private var oFlashLightWidgetPos:Point;
      
      private var oEmotePos:Point;
      
      private var oCompassPos:Point;
      
      private var oAnnouncePos:Point;
      
      private var oNotificationPos:Point;
      
      private var oQuestPos:Point;
      
      private var oSneakPos:Point;
      
      private var oQuickLootPos:Point;
      
      private var oFrobberPos:Point;
      
      private var oTeamPanelPos:Point;
      
      private var oFusionPos:Point;
      
      private var oRollOverPos:Point;
      
      private var oSubtitlePos:Point;
      
      private var oEnemyHealthPos:Point;
      
      private var oXPBarPos:Point;
      
      private var oCritMeterPos:Point;
      
      private var oCurrencyPos:Point;
      
      private var oLevelUpAnimPos:Point;
      
      private var oRepUpdatesPos:Point;
      
      private var oPerkPopUpPos:Point;
      
      private var oFusionPopUpPos:Point;
      
      private var oRadCountPos:Point;
      
      private var oImpHealthPos:Point;
      
      private var oFeralMPos:Point;
      
      private var oGlowMeterPos:Point;
      
      private var oMicPos:Point;
      
      private var oHPTextPos:Point;
      
      private var oAPTextPos:Point;
      
      private var VisibilityChanged:int = 0;
      
      private var oHitMarkerPos:Point;
      
      private var iniLoader:URLLoader;
      
      private var _CharInfo:Object;
      
      private var thpShow:String = "";
      
      private var thirstPC:Number = 0;
      
      private var hungerPC:Number = 0;
      
      private var PAData;
      
      private var inPowerArmor:Boolean;
      
      private var powerArmorHUDEnabled:Boolean;
      
      private var inPowerArmorwthPAHUD:Boolean;
      
      private var isGhoul:Boolean = false;
      
      private var FeralperLevel:Number = 0;
      
      private var GlowLevel:Number = 0;
      
      private var FcLevel:Number = 0;
      
      private var HUDModeData;
      
      private var HpBckGrdTgl:Boolean = false;
      
      private var ApBckGrdTgl:Boolean = false;
      
      private var pi:int = 0;
      
      public var maxScale:Number;
      
      private var HUDNotification_mc:Object;
      
      private var FlashLightRestored_mc:Object;
      
      private var EventCloseTimer:Timer;
      
      private var reloadCountNukeCodes:Number = 0;
      
      private var ImprovedHealthBars;
      
      private var isHudMenu:Boolean = false;
      
      public function HUDEditor()
      {
         this.HUDMessageItemBox = HUDEditor_HUDMessageItemBox;
         this.FlashLightWidget = HUDEditor_FlashLightWidget;
         this.SneakMeterPos = new Point();
         this.QuestPos = new Point();
         this.NotificationPos = new Point();
         this.HpMeterPos = new Point();
         this.APMeterPos = new Point();
         this.ActiveEffectsPos = new Point();
         this.HungerMeterPos = new Point();
         this.ThirstMeterPos = new Point();
         this.AmmoCountPos = new Point();
         this.ExplosiveAmmoCountPos = new Point();
         this.FlashLightWidgetPos = new Point();
         this.EmotePos = new Point();
         this.FusionPos = new Point();
         this.CompassPos = new Point();
         this.AnnouncePos = new Point();
         this.QuickLootPos = new Point();
         this.TeamPanelPos = new Point();
         this.FrobberPos = new Point();
         this.RollOverPos = new Point();
         this.SubtitlesPos = new Point();
         this.EnemyHealthPos = new Point();
         this.XPBarPos = new Point();
         this.CritMeterPos = new Point();
         this.CurrencyPos = new Point();
         this.LevelUpAnimPos = new Point();
         this.RepUpdatesPos = new Point();
         this.HitMarkerPos = new Point();
         this.TeamPanelPosPA = new Point();
         this.HungerMeterPosPA = new Point();
         this.ThirstMeterPosPA = new Point();
         this.ExplosiveAmmoCountPosPA = new Point();
         this.PerkPopUpPos = new Point();
         this.FusionPopUpPos = new Point();
         this.RadCountPos = new Point();
         this.ImpHealthPos = new Point();
         this.FeralMPos = new Point();
         this.GlowMeterPos = new Point();
         this.MicPos = new Point();
         this.HPTextPos = new Point();
         this.APTextPos = new Point();
         this.oHpMeterPos = new Point();
         this.oAPMeterPos = new Point();
         this.oActiveEffectsPos = new Point();
         this.oHungerMeterPos = new Point();
         this.oThirstMeterPos = new Point();
         this.oAmmoCountPos = new Point();
         this.oExplosiveAmmoCountPos = new Point();
         this.oFlashLightWidgetPos = new Point();
         this.oEmotePos = new Point();
         this.oCompassPos = new Point();
         this.oAnnouncePos = new Point();
         this.oNotificationPos = new Point();
         this.oQuestPos = new Point();
         this.oSneakPos = new Point();
         this.oQuickLootPos = new Point();
         this.oFrobberPos = new Point();
         this.oTeamPanelPos = new Point();
         this.oFusionPos = new Point();
         this.oRollOverPos = new Point();
         this.oSubtitlePos = new Point();
         this.oEnemyHealthPos = new Point();
         this.oXPBarPos = new Point();
         this.oCritMeterPos = new Point();
         this.oCurrencyPos = new Point();
         this.oLevelUpAnimPos = new Point();
         this.oRepUpdatesPos = new Point();
         this.oPerkPopUpPos = new Point();
         this.oFusionPopUpPos = new Point();
         this.oRadCountPos = new Point();
         this.oImpHealthPos = new Point();
         this.oImpHealthPos.x = 0;
         this.oImpHealthPos.y = 0;
         this.oFeralMPos = new Point();
         this.oGlowMeterPos = new Point();
         this.oMicPos = new Point();
         this.oHitMarkerPos = new Point();
         this.oHPTextPos = new Point();
         this.oAPTextPos = new Point();
         this.HUDNotification_mc = new this.HUDMessageItemBox();
         this.FlashLightRestored_mc = new this.FlashLightWidget();
         super();
         this.updateTimerHC = new Timer(20,0);
         this.updateGlowTimer = new Timer(150,0);
         this.EventCloseTimer = new Timer(15000,0);
         this.initDebugText();
         this.initWatermarkText();
         this.initThirstText();
         this.initHungerText();
         this.initHPText();
         this.initAPText();
         addEventListener(Event.ADDED_TO_STAGE,this.addedToStageHandler);
         trace("HUDEditor Started");
      }
      
      private function addedToStageHandler(e:Event) : void
      {
         this.topLevel = stage.getChildAt(0);
         if(this.topLevel != null && getQualifiedClassName(this.topLevel) == "HUDMenu")
         {
            this.initShowHealthText();
            this.initTeamObfuscateText();
            this.oRepUpdatesPos.x = this.topLevel.ReputationUpdates_mc.x;
            this.oRepUpdatesPos.y = this.topLevel.ReputationUpdates_mc.y;
            this.oLevelUpAnimPos.x = this.topLevel.LevelUpAnimation_mc.x;
            this.oLevelUpAnimPos.y = this.topLevel.LevelUpAnimation_mc.y;
            this.oHpMeterPos.x = this.topLevel.LeftMeters_mc.HPMeter_mc.x;
            this.oHpMeterPos.y = this.topLevel.LeftMeters_mc.HPMeter_mc.y;
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
            this.oFrobberPos.x = this.topLevel.FrobberWidget_mc.x;
            this.oFrobberPos.y = this.topLevel.FrobberWidget_mc.y;
            this.oPerkPopUpPos.x = this.topLevel.BottomCenterGroup_mc.PerkVaultBoy_mc.x;
            this.oPerkPopUpPos.y = this.topLevel.BottomCenterGroup_mc.PerkVaultBoy_mc.y;
            this.oFusionPopUpPos.x = this.topLevel.RightMeters_mc.PowerArmorLowBatteryWarning_mc.x;
            this.oFusionPopUpPos.y = this.topLevel.RightMeters_mc.PowerArmorLowBatteryWarning_mc.y;
            this.oRadCountPos.x = this.topLevel.LeftMeters_mc.RadsMeter_mc.x;
            this.oRadCountPos.y = this.topLevel.LeftMeters_mc.RadsMeter_mc.y;
            this.oFeralMPos.x = this.topLevel.RightMeters_mc.FeralMeter_mc.x;
            this.oFeralMPos.y = this.topLevel.RightMeters_mc.FeralMeter_mc.y;
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
            this.oTeamPanelPos.x = this.topLevel.PartyResolutionContainer_mc.x;
            this.oTeamPanelPos.y = this.topLevel.PartyResolutionContainer_mc.y;
            this.oHPTextPos.x = this.topLevel.LeftMeters_mc.HPMeter_mc.DisplayText_mc.x;
            this.oHPTextPos.y = this.topLevel.LeftMeters_mc.HPMeter_mc.DisplayText_mc.y;
            this.oAPTextPos.x = this.topLevel.RightMeters_mc.ActionPointMeter_mc.DisplayText_mc.x;
            this.oAPTextPos.y = this.topLevel.RightMeters_mc.ActionPointMeter_mc.DisplayText_mc.y;
            this.topLevel.RightMeters_mc.HUDThirstMeter_mc.addChild(this.thirst);
            this.topLevel.RightMeters_mc.HUDHungerMeter_mc.addChild(this.hunger);
            this.topLevel.LeftMeters_mc.HPMeter_mc.DisplayText_mc.addChild(this.HPText);
            this.topLevel.RightMeters_mc.ActionPointMeter_mc.DisplayText_mc.addChild(this.APText);
            this.topLevel.HUDNotificationsGroup_mc.Messages_mc.addChild(this.HUDNotification_mc);
            this.topLevel.RightMeters_mc.FlashLightWidget_mc.addChild(this.FlashLightRestored_mc);
            this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.addChild(this.showHealthText);
            this.topLevel.PartyResolutionContainer_mc.addChild(this.TeamObfuscateText);
            this.HUDNotification_mc.y += 150;
            this.HUDNotification_mc.addFrameScript(0,this.frame1,5,this.frame2,15,this.frame3,16,this.frame3,170,this.frame4);
            this.HUDNotification_mc.gotoAndStop("Reset");
            this.hunger.x = 240;
            this.thirst.x = 240;
            BSUIDataManager.Subscribe("HUDRightMetersData",this.onCharInfoUpd);
            this.PAData = BSUIDataManager.GetDataFromClient("PowerArmorInfoData");
            this.HUDModeData = BSUIDataManager.GetDataFromClient("HUDModeData");
            this.isHudMenu = true;
            this.init();
         }
         else if(this.topLevel != null && getQualifiedClassName(this.topLevel) == "MainMenu")
         {
            this.init();
            this.isHudMenu = false;
         }
         else
         {
            this.displayText("Not injected into supported SWF. Current: " + getQualifiedClassName(this.topLevel));
            this.isHudMenu = false;
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
      
      private function initHPText() : void
      {
         var HPTextShadow:DropShadowFilter = new DropShadowFilter(1,45,0,0.9,3,3,1,BitmapFilterQuality.HIGH,false,false,false);
         var HPTextFormat:TextFormat = new TextFormat("$MAIN_Font_Bold",20,16777163);
         this.HPText = new TextField();
         HPTextFormat.align = "center";
         this.HPText.name = "HP";
         this.HPText.defaultTextFormat = HPTextFormat;
         this.HPText.setTextFormat(HPTextFormat);
         this.HPText.filters = [HPTextShadow];
         this.HPText.autoSize = TextFieldAutoSize.CENTER;
      }
      
      private function initAPText() : void
      {
         var APTextShadow:DropShadowFilter = new DropShadowFilter(1,45,0,0.9,3,3,1,BitmapFilterQuality.HIGH,false,false,false);
         var APTextFormat:TextFormat = new TextFormat("$MAIN_Font_Bold",20,16777163);
         this.APText = new TextField();
         APTextFormat.align = "center";
         this.APText.name = "AP";
         this.APText.defaultTextFormat = APTextFormat;
         this.APText.setTextFormat(APTextFormat);
         this.APText.filters = [APTextShadow];
         this.APText.autoSize = TextFieldAutoSize.CENTER;
      }
      
      private function initTeamObfuscateText() : void
      {
         var TeamObfuscateTextShadow:DropShadowFilter = new DropShadowFilter(1,45,0,0.9,3,3,1,BitmapFilterQuality.HIGH,false,false,false);
         var TeamObfuscateTextFormat:TextFormat = new TextFormat("$MAIN_Font_Bold",20,16777163);
         this.TeamObfuscateText = new TextField();
         this.TeamObfuscateText.name = "TeamObfuscateText";
         this.TeamObfuscateText.filters = [TeamObfuscateTextShadow];
         this.TeamObfuscateText.defaultTextFormat = TeamObfuscateTextFormat;
         this.TeamObfuscateText.width = 1920;
         this.TeamObfuscateText.height = 1080;
         TextFieldEx.setTextAutoSize(this.TeamObfuscateText,TextFieldEx.TEXTAUTOSZ_SHRINK);
         this.TeamObfuscateText.embedFonts = true;
         this.TeamObfuscateText.mouseEnabled = false;
         this.TeamObfuscateText.visible = false;
         this.TeamObfuscateText.text = "";
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
         this.updateGlowTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.GlowUpdate);
         this.updateGlowTimer.start();
         this.xmlLoaderHC.removeEventListener(Event.COMPLETE,this.onFileLoad);
      }
      
      private function onCharInfoUpd(_arg1:FromClientDataEvent) : *
      {
         this._CharInfo = _arg1.data;
         this.isGhoul = _arg1.data.feralPercent != -1;
         this.FeralperLevel = _arg1.data.feralPercent * 100;
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
      
      private function GlowUpdate(event:TimerEvent) : void
      {
         GlowLevel = this.topLevel.LeftMeters_mc.HPMeter_mc.GlowMeter_mc.Meter_mc.Fill_mc.x / 312 * 100;
      }
      
      public function SWFQUIRY2() : void
      {
         if(!this.isHudMenu || !this.topLevel)
         {
            return;
         }
         var sq:int = this.topLevel.numChildren - 1;
         while(sq >= 0)
         {
            if(getQualifiedClassName(this.topLevel.getChildAt(sq)) == SWFQUIRY_LOADER)
            {
               if(getQualifiedClassName(this.topLevel.getChildAt(sq).content) == SWFQUIRY_ImprovedHealthBars)
               {
                  this.ImprovedHealthBars = this.topLevel.getChildAt(sq).content;
                  break;
               }
            }
            sq--;
         }
      }
      
      private function update(event:TimerEvent) : void
      {
         var _childName:String;
         var isVisible:Boolean;
         var isVisibleHP:Boolean;
         var isCrouched:Boolean;
         var isNotConfigCrouchOrVats:Boolean;
         var isVats:Boolean;
         var isAboveXHp:Boolean;
         var isAboveXAp:Boolean;
         var isAboveXFc:Boolean;
         var isAboveXFm:Boolean;
         var isAboveXGmP:Boolean;
         var TeamToggle:Boolean;
         var HpperLevel:Number;
         var ApperLevel:Number;
         var negativeEffects:int;
         var CurrentTeamCount:Number;
         var DmgNumbScale:Number;
         var LowBtryText:String;
         var NoBtryText:String;
         var PL1Text:String;
         var PL2Text:String;
         var PL3Text:String;
         var PL4Text:String;
         var linenum:*;
         var jj:int;
         var jjj:int;
         var thirstFinal:Number;
         var hungerFinal:Number;
         var thirTemp:Number;
         var hungTemp:Number;
         var iiiiii:int;
         var iiiii:int;
         var iiii:int;
         var iii:int;
         var ii:int;
         var i:int;
         var di:int;
         var dii:int;
         var diii:int;
         var diiii:int;
         var diiiii:int;
         var diiiiii:int;
         var tfTemp:*;
         var color1:*;
         var Teststr:String = String(this.xmlConfigHC.ImmersiveTweaks.Debug.Element.toString());
         var TestResults:Array = Teststr.split(".");
         var child:Object = this.topLevel;
         this.inPowerArmor = Boolean(this.HUDModeData.data.inPowerArmor);
         this.powerArmorHUDEnabled = Boolean(this.HUDModeData.data.powerArmorHUDEnabled);
         this.inPowerArmorwthPAHUD = Boolean(this.HUDModeData.data.inPowerArmor && this.HUDModeData.data.powerArmorHUDEnabled);
         HiddenText = String(this.xmlConfigHC.ImmersiveTweaks.StealthMeter.CustomText.HiddenText.toString());
         DetectedText = String(this.xmlConfigHC.ImmersiveTweaks.StealthMeter.CustomText.DetectedText.toString());
         CautionText = String(this.xmlConfigHC.ImmersiveTweaks.StealthMeter.CustomText.CautionText.toString());
         DangerText = String(this.xmlConfigHC.ImmersiveTweaks.StealthMeter.CustomText.DangerText.toString());
         LowBtryText = String(this.xmlConfigHC.ImmersiveTweaks.FusionCoreWarning.CustomText.LowBtry.toString());
         NoBtryText = String(this.xmlConfigHC.ImmersiveTweaks.FusionCoreWarning.CustomText.NoBtry.toString());
         linenum = undefined;
         jj = 0;
         jjj = 0;
         thirstFinal = NaN;
         hungerFinal = NaN;
         thirTemp = NaN;
         hungTemp = NaN;
         iiiii = 0;
         iiii = 0;
         iii = 0;
         ii = 0;
         i = 0;
         di = 0;
         dii = 0;
         diii = 0;
         diiii = 0;
         diiiii = 0;
         tfTemp = undefined;
         color1 = undefined;
         isVisible = true;
         isCrouched = Boolean(this.topLevel.TopCenterGroup_mc.StealthMeter_mc.visible);
         isVats = Boolean(this.topLevel.BottomCenterGroup_mc.CritMeter_mc.visible);
         isNotConfigCrouchOrVats = false;
         HpperLevel = this.topLevel.LeftMeters_mc.HPMeter_mc.MeterBar_mc.Percent * 100;
         ApperLevel = this.topLevel.RightMeters_mc.ActionPointMeter_mc.MeterBar_mc.Percent * 100;
         isAboveXHp = HpperLevel > Number(this.xmlConfigHC.ImmersiveTweaks.Hp.FadePer);
         isAboveXAp = ApperLevel > Number(this.xmlConfigHC.ImmersiveTweaks.Ap.FadePer);
         if(!this.ImprovedHealthBars)
         {
            this.SWFQUIRY2();
         }
         if(this.inPowerArmor)
         {
            FcLevel = Number(this.PAData.data.fusionCorePercent) * 100;
            isAboveXFc = FcLevel > Number(this.xmlConfigHC.ImmersiveTweaks.FusionCoreMeter.FadePer);
         }
         if(this.isGhoul)
         {
            isAboveXFm = this.FeralperLevel > Number(this.xmlConfigHC.ImmersiveTweaks.FeralMeter.FadePer);
            isAboveXGmP = GlowLevel > Number(this.xmlConfigHC.ImmersiveTweaks.GlowMeter.FadePer);
         }
         this.debugTextHC.text = "";
         if(this.xmlConfigHC.ImmersiveTweaks.Debug.Display == "true")
         {
            this.displayText("ImT XML Loaded: " + Boolean(this.xmlConfigHC.ImmersiveTweaks));
            this.displayText("crouched [In Sneak]: " + this.topLevel.TopCenterGroup_mc.StealthMeter_mc.visible);
            this.displayText("crit visible [In Vats]: " + this.topLevel.BottomCenterGroup_mc.CritMeter_mc.visible);
            this.displayText("hp%: " + HpperLevel + ", Hp.Fade:" + (this.xmlConfigHC.ImmersiveTweaks.Hp.Fade == "true") + ", Hp.FadePer:" + Number(this.xmlConfigHC.ImmersiveTweaks.Hp.FadePer) + ", Hp Fade Above % Level: " + isAboveXHp);
            this.displayText("Ap%: " + ApperLevel + ", Ap.Fade:" + (this.xmlConfigHC.ImmersiveTweaks.Ap.Fade == "true") + ", Ap.FadePer:" + Number(this.xmlConfigHC.ImmersiveTweaks.Ap.FadePer) + ", Ap Fade Above % Level: " + isAboveXAp);
            if(this.isGhoul)
            {
               this.displayText("Feral Meter%: " + FeralperLevel + ", Feral.Fade:" + (this.xmlConfigHC.ImmersiveTweaks.FeralMeter.Fade == "true") + ", Feral.FadePer:" + Number(this.xmlConfigHC.ImmersiveTweaks.FeralMeter.FadePer) + ", Feral Fade Above % Level: " + isAboveXFm);
               this.displayText("Glow Level% " + GlowLevel + ", Glow.Fade:" + (this.xmlConfigHC.ImmersiveTweaks.GlowMeter.Fade == "true") + ", Glow.FadePer:" + Number(this.xmlConfigHC.ImmersiveTweaks.GlowMeter.FadePer) + ", Is Above Glow Fade: " + isAboveXFc);
            }
            this.displayText("In PA: " + this.inPowerArmor + ", PA HuD: " + this.powerArmorHUDEnabled + ", PowerArmor&PAHUD: " + this.inPowerArmorwthPAHUD);
            if(this.inPowerArmor)
            {
               this.displayText("Fusion Core%: " + FcLevel + ", Fusion.Fade:" + (this.xmlConfigHC.ImmersiveTweaks.FusionCoreMeter.Fade == "true") + ", Fusion.FadePer:" + Number(this.xmlConfigHC.ImmersiveTweaks.FusionCoreMeter.FadePer) + ", Is Above Fusion Fade: " + isAboveXGmP);
            }
            this.displayText("ImprovedHealthBarVisualSync: " + ImprovedHealthBarVisualSync);
            this.displayText("HpVisualSync: " + HpVisualSync);
            this.displayText("ApVisualSync: " + ApVisualSync);
            this.displayText("FeralVisualSync: " + FeralVisualSync);
            this.displayText("FeralSkullVisualSync: " + FeralSkullVisualSync);
            this.displayText("GlowVisualSync: " + GlowVisualSync);
            this.displayText("FusionVisualSync: " + FusionVisualSync);
            for each(childName in TestResults)
            {
               if(!child[childName])
               {
                  this.displayText(childName + " child doesn\'t exist");
                  break;
               }
               _childName = String(childName);
               child = child[childName];
               this.displayText("childrenByIds: " + child.numChildren);
               di = 0;
               while(di < child.numChildren)
               {
                  this.displayText(di + ":" + getQualifiedClassName(child.getChildAt(di)));
                  di++;
               }
               this.displayText("childrenByNames:");
               for(ch in child)
               {
                  this.displayText(ch + ":" + (child[ch] != null ? getQualifiedClassName(child[ch]) : "null"));
               }
            }
            this.displayText("last found child: " + _childName + " : " + getQualifiedClassName(child));
         }
         if(!this.inPowerArmorwthPAHUD)
         {
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
               this.CompassScale = Number(this.xmlConfigHC.Reposition_Elements.Compass.Scale);
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
            if(this.isGhoul)
            {
               if(this.xmlConfigHC.ImmersiveTweaks.GlowMeter.Separate == "true")
               {
                  isVisibleHP = isVisible;
                  diii = 0;
                  while(diii < this.topLevel.LeftMeters_mc.HPMeter_mc.numChildren)
                  {
                     if(!this.ImprovedHealthBars)
                     {
                        if(this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(diii) != this.topLevel.LeftMeters_mc.HPMeter_mc.GlowMeter_mc)
                        {
                           this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(diii).visible = isVisibleHP;
                        }
                     }
                     else if(this.ImprovedHealthBars)
                     {
                        if(this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(diii) != this.topLevel.LeftMeters_mc.HPMeter_mc.GlowMeter_mc && this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(diii) != this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(10))
                        {
                           this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(diii).visible = isVisibleHP;
                        }
                     }
                     if(this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(diii) == this.topLevel.LeftMeters_mc.HPMeter_mc.GlowMeter_mc)
                     {
                        isVisible = true;
                        isNotConfigCrouchOrVats = false;
                        if(this.xmlConfigHC.ImmersiveTweaks.GlowMeter.Hide == "true")
                        {
                           isVisible = false;
                        }
                        else
                        {
                           if(this.xmlConfigHC.ImmersiveTweaks.GlowMeter.Crouch == "true")
                           {
                              if(this.xmlConfigHC.ImmersiveTweaks.GlowMeter.VaTs == "true")
                              {
                                 isVisible = isCrouched || isVats;
                              }
                              else
                              {
                                 isVisible = isCrouched;
                              }
                           }
                           else if(this.xmlConfigHC.ImmersiveTweaks.GlowMeter.VaTs == "true")
                           {
                              isVisible = isVats;
                           }
                           else
                           {
                              isNotConfigCrouchOrVats = true;
                           }
                           if(this.xmlConfigHC.ImmersiveTweaks.GlowMeter.Fade == "true")
                           {
                              if(isVisible)
                              {
                                 if(isNotConfigCrouchOrVats && isAboveXGmP)
                                 {
                                    isVisible = false;
                                 }
                              }
                              else if(!isAboveXGmP)
                              {
                                 isVisible = true;
                              }
                           }
                           this.GlowPerVisualSync = isVisible;
                           if(isVisible == true)
                           {
                              if(this.xmlConfigHC.Reposition_Elements.LeftMeters.GlowMeter)
                              {
                                 this.GlowMeterPos.x = Number(this.xmlConfigHC.Reposition_Elements.LeftMeters.GlowMeter.X) - Number(this.xmlConfigHC.Reposition_Elements.LeftMeters.HpMeter.X);
                                 this.GlowMeterPos.y = Number(this.xmlConfigHC.Reposition_Elements.LeftMeters.GlowMeter.Y) - Number(this.xmlConfigHC.Reposition_Elements.LeftMeters.HpMeter.Y);
                                 this.GlowMeterScale = Number(this.xmlConfigHC.Reposition_Elements.LeftMeters.GlowMeter.Scale);
                              }
                              else
                              {
                                 this.GlowMeterScale = 1;
                                 this.GlowMeterPos.x = 0;
                                 this.GlowMeterPos.y = 0;
                              }
                           }
                           else
                           {
                              this.GlowMeterPos.x = 0;
                              this.GlowMeterPos.y = 0;
                              this.GlowMeterScale = 0;
                           }
                        }
                     }
                     diii++;
                  }
               }
               else
               {
                  this.GlowPerVisualSync = isVisible;
                  diii = 0;
                  while(diii < this.topLevel.LeftMeters_mc.HPMeter_mc.numChildren)
                  {
                     if(!this.ImprovedHealthBars)
                     {
                        if(this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(diii) != this.topLevel.LeftMeters_mc.HPMeter_mc.GlowMeter_mc)
                        {
                           this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(diii).visible = isVisible;
                        }
                     }
                     else if(this.ImprovedHealthBars)
                     {
                        if(this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(diii) != this.topLevel.LeftMeters_mc.HPMeter_mc.GlowMeter_mc && this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(diii) != this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(10))
                        {
                           this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(diii).visible = isVisible;
                        }
                     }
                     if(this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(diii) == this.topLevel.LeftMeters_mc.HPMeter_mc.GlowMeter_mc)
                     {
                        this.GlowPerVisualSync = isVisible;
                        if(isVisible == true)
                        {
                           if(this.xmlConfigHC.Reposition_Elements.LeftMeters.GlowMeter)
                           {
                              this.GlowMeterPos.x = Number(this.xmlConfigHC.Reposition_Elements.LeftMeters.GlowMeter.X) - Number(this.xmlConfigHC.Reposition_Elements.LeftMeters.HpMeter.X);
                              this.GlowMeterPos.y = Number(this.xmlConfigHC.Reposition_Elements.LeftMeters.GlowMeter.Y) - Number(this.xmlConfigHC.Reposition_Elements.LeftMeters.HpMeter.Y);
                              this.GlowMeterScale = Number(this.xmlConfigHC.Reposition_Elements.LeftMeters.GlowMeter.Scale);
                           }
                           else
                           {
                              this.GlowMeterScale = 1;
                              this.GlowMeterPos.x = 0;
                              this.GlowMeterPos.y = 0;
                           }
                        }
                        else
                        {
                           this.GlowMeterPos.x = 0;
                           this.GlowMeterPos.y = 0;
                           this.GlowMeterScale = 0;
                        }
                     }
                     diii++;
                  }
               }
            }
            else
            {
               this.GlowPerVisualSync = isVisible;
               diii = 0;
               while(diii < this.topLevel.LeftMeters_mc.HPMeter_mc.numChildren)
               {
                  if(!this.ImprovedHealthBars)
                  {
                     if(this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(diii) != this.topLevel.LeftMeters_mc.HPMeter_mc.GlowMeter_mc)
                     {
                        this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(diii).visible = isVisible;
                     }
                  }
                  else if(this.ImprovedHealthBars)
                  {
                     if(this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(diii) != this.topLevel.LeftMeters_mc.HPMeter_mc.GlowMeter_mc && this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(diii) != this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(10))
                     {
                        this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(diii).visible = isVisible;
                     }
                  }
                  diii++;
               }
            }
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
         }
         if(!this.isGhoul)
         {
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
            CurrentTeamCount = Number(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(1).numChildren);
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
         if(isVisible)
         {
            if(this.inPowerArmorwthPAHUD)
            {
               if(this.TeamPanelScalePA <= this.maxScale)
               {
                  this.topLevel.PartyResolutionContainer_mc.scaleX = this.TeamPanelScalePA;
                  this.topLevel.PartyResolutionContainer_mc.scaleY = this.TeamPanelScalePA;
               }
               else
               {
                  this.topLevel.PartyResolutionContainer_mc.scaleX = 1;
                  this.topLevel.PartyResolutionContainer_mc.scaleY = 1;
               }
            }
            else if(!this.inPowerArmorwthPAHUD)
            {
               if(this.TeamPanelScale <= this.maxScale)
               {
                  this.topLevel.PartyResolutionContainer_mc.scaleX = this.TeamPanelScale;
                  this.topLevel.PartyResolutionContainer_mc.scaleY = this.TeamPanelScale;
               }
               else
               {
                  this.topLevel.PartyResolutionContainer_mc.scaleX = 1;
                  this.topLevel.PartyResolutionContainer_mc.scaleY = 1;
               }
            }
         }
         else if(!isVisible)
         {
            this.topLevel.PartyResolutionContainer_mc.scaleX = 0;
            this.topLevel.PartyResolutionContainer_mc.scaleY = 0;
         }
         if(this.xmlConfigHC.ImmersiveTweaks.TeamPanel.Glow.Enable == "true")
         {
            diiiii = 0;
            while(diiiii < this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.numChildren)
            {
               if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(diiiii).Meter_mc)
               {
                  this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(diiiii).Meter_mc.alpha = 0.7;
               }
               diiiii++;
            }
         }
         else
         {
            diiiii = 0;
            while(diiiii < this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.numChildren)
            {
               if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(diiiii).Meter_mc)
               {
                  this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(diiiii).Meter_mc.alpha = 1;
               }
               diiiii++;
            }
         }
         if(this.xmlConfigHC.ImmersiveTweaks.TeamPanel.TeamObfuscate.Enable == "true" || this.xmlConfigHC.ImmersiveTweaks.TeamPanel.TeamObliterate.Enable == "true")
         {
            if(this.xmlConfigHC.ImmersiveTweaks.TeamPanel.TeamObfuscate.Enable == "false")
            {
               this.TeamObfuscateText.visible = false;
               this.TeamObfuscateText.text = "";
            }
            if(!TeamToggle)
            {
               TeamToggle = true;
            }
            PL1Text = String(this.xmlConfigHC.ImmersiveTweaks.TeamPanel.TeamObfuscate.Member1.toString());
            PL2Text = String(this.xmlConfigHC.ImmersiveTweaks.TeamPanel.TeamObfuscate.Member2.toString());
            PL3Text = String(this.xmlConfigHC.ImmersiveTweaks.TeamPanel.TeamObfuscate.Member3.toString());
            PL4Text = String(this.xmlConfigHC.ImmersiveTweaks.TeamPanel.TeamObfuscate.Member4.toString());
            this.TeamObfuscateText.visible = this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.visible;
            if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.numChildren > 0)
            {
               iiiiii = 0;
               while(iiiiii < this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.numChildren)
               {
                  if(iiiiii == 0)
                  {
                     this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).nameField_mc.scaleX = 0;
                     this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).nameField_mc.scaleY = 0;
                     if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SharedPerk_mc)
                     {
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SharedPerk_mc.scaleX = 0;
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SharedPerk_mc.scaleY = 0;
                     }
                     if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SpeakerIcon_mc)
                     {
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SpeakerIcon_mc.scaleX = 0;
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SpeakerIcon_mc.scaleY = 0;
                     }
                     if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).Emote_mc)
                     {
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).Emote_mc.scaleX = 0;
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).Emote_mc.scaleY = 0;
                     }
                     if(this.xmlConfigHC.ImmersiveTweaks.TeamPanel.TeamObfuscate.Enable == "true")
                     {
                        TeamObfuscateText.alpha = Number(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.alpha);
                        TeamObfuscateText.x = this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.x + 48 + Number(this.xmlConfigHC.ImmersiveTweaks.TeamPanel.TeamObfuscate.X);
                        TeamObfuscateText.y = this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.y + 265 + Number(this.xmlConfigHC.ImmersiveTweaks.TeamPanel.TeamObfuscate.Y);
                        this.TeamObfuscateText.setTextFormat(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).nameField_mc.textField.getTextFormat());
                        this.TeamObfuscateText.text = PL1Text;
                     }
                  }
                  if(iiiiii == 1)
                  {
                     this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).nameField_mc.scaleX = 0;
                     this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).nameField_mc.scaleY = 0;
                     if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SharedPerk_mc)
                     {
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SharedPerk_mc.scaleX = 0;
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SharedPerk_mc.scaleY = 0;
                     }
                     if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SpeakerIcon_mc)
                     {
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SpeakerIcon_mc.scaleX = 0;
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SpeakerIcon_mc.scaleY = 0;
                     }
                     if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).Emote_mc)
                     {
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).Emote_mc.scaleX = 0;
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).Emote_mc.scaleY = 0;
                     }
                     if(this.xmlConfigHC.ImmersiveTweaks.TeamPanel.TeamObfuscate.Enable == "true")
                     {
                        TeamObfuscateText.x = this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.x + 48 + Number(this.xmlConfigHC.ImmersiveTweaks.TeamPanel.TeamObfuscate.X);
                        TeamObfuscateText.y = this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.y + 235 + Number(this.xmlConfigHC.ImmersiveTweaks.TeamPanel.TeamObfuscate.Y);
                        this.TeamObfuscateText.text = PL1Text + "\n \n" + PL2Text;
                     }
                  }
                  if(iiiiii == 2)
                  {
                     this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).nameField_mc.scaleX = 0;
                     this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).nameField_mc.scaleY = 0;
                     if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SharedPerk_mc)
                     {
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SharedPerk_mc.scaleX = 0;
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SharedPerk_mc.scaleY = 0;
                     }
                     if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SpeakerIcon_mc)
                     {
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SpeakerIcon_mc.scaleX = 0;
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SpeakerIcon_mc.scaleY = 0;
                     }
                     if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).Emote_mc)
                     {
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).Emote_mc.scaleX = 0;
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).Emote_mc.scaleY = 0;
                     }
                     if(this.xmlConfigHC.ImmersiveTweaks.TeamPanel.TeamObfuscate.Enable == "true")
                     {
                        TeamObfuscateText.x = this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.x + 48 + Number(this.xmlConfigHC.ImmersiveTweaks.TeamPanel.TeamObfuscate.X);
                        TeamObfuscateText.y = this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.y + 204 + Number(this.xmlConfigHC.ImmersiveTweaks.TeamPanel.TeamObfuscate.Y);
                        this.TeamObfuscateText.text = PL1Text + "\n \n" + PL2Text + "\n \n" + PL3Text;
                     }
                  }
                  if(iiiiii == 3)
                  {
                     this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).nameField_mc.scaleX = 0;
                     this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).nameField_mc.scaleY = 0;
                     if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SharedPerk_mc)
                     {
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SharedPerk_mc.scaleX = 0;
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SharedPerk_mc.scaleY = 0;
                     }
                     if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SpeakerIcon_mc)
                     {
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SpeakerIcon_mc.scaleX = 0;
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SpeakerIcon_mc.scaleY = 0;
                     }
                     if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).Emote_mc)
                     {
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).Emote_mc.scaleX = 0;
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).Emote_mc.scaleY = 0;
                     }
                     if(this.xmlConfigHC.ImmersiveTweaks.TeamPanel.TeamObfuscate.Enable == "true")
                     {
                        TeamObfuscateText.x = this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.x + 48 + Number(this.xmlConfigHC.ImmersiveTweaks.TeamPanel.TeamObfuscate.X);
                        TeamObfuscateText.y = this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.y + 174 + Number(this.xmlConfigHC.ImmersiveTweaks.TeamPanel.TeamObfuscate.Y);
                        this.TeamObfuscateText.text = PL1Text + "\n \n" + PL2Text + "\n \n" + PL3Text + "\n \n" + PL4Text;
                     }
                  }
                  iiiiii++;
               }
            }
            else
            {
               this.TeamObfuscateText.visible = false;
               this.TeamObfuscateText.text = "";
            }
         }
         else
         {
            this.TeamObfuscateText.text = "";
            this.TeamObfuscateText.visible = false;
            if(TeamToggle)
            {
               iiiiii = 0;
               while(iiiiii < this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.numChildren)
               {
                  if(iiiiii == 0)
                  {
                     this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).nameField_mc.scaleX = 1;
                     this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).nameField_mc.scaleY = 1;
                     if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SharedPerk_mc)
                     {
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SharedPerk_mc.scaleX = this.TeamPanelScale;
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SharedPerk_mc.scaleY = this.TeamPanelScale;
                     }
                     if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SpeakerIcon_mc)
                     {
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SpeakerIcon_mc.scaleX = this.TeamPanelScale / 4;
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SpeakerIcon_mc.scaleY = this.TeamPanelScale / 4;
                     }
                     if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).Emote_mc)
                     {
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).Emote_mc.scaleX = this.TeamPanelScale;
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).Emote_mc.scaleY = this.TeamPanelScale;
                     }
                  }
                  if(iiiiii == 1)
                  {
                     this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).nameField_mc.scaleX = 1;
                     this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).nameField_mc.scaleY = 1;
                     if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SharedPerk_mc)
                     {
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SharedPerk_mc.scaleX = this.TeamPanelScale;
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SharedPerk_mc.scaleY = this.TeamPanelScale;
                     }
                     if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SpeakerIcon_mc)
                     {
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SpeakerIcon_mc.scaleX = this.TeamPanelScale / 4;
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SpeakerIcon_mc.scaleY = this.TeamPanelScale / 4;
                     }
                     if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).Emote_mc)
                     {
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).Emote_mc.scaleX = this.TeamPanelScale;
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).Emote_mc.scaleY = this.TeamPanelScale;
                     }
                  }
                  if(iiiiii == 2)
                  {
                     this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).nameField_mc.scaleX = 1;
                     this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).nameField_mc.scaleY = 1;
                     if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SharedPerk_mc)
                     {
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SharedPerk_mc.scaleX = this.TeamPanelScale;
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SharedPerk_mc.scaleY = this.TeamPanelScale;
                     }
                     if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SpeakerIcon_mc)
                     {
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SpeakerIcon_mc.scaleX = this.TeamPanelScale / 4;
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SpeakerIcon_mc.scaleY = this.TeamPanelScale / 4;
                     }
                     if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).Emote_mc)
                     {
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).Emote_mc.scaleX = this.TeamPanelScale;
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).Emote_mc.scaleY = this.TeamPanelScale;
                     }
                  }
                  if(iiiiii == 3)
                  {
                     this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).nameField_mc.scaleX = 1;
                     this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).nameField_mc.scaleY = 1;
                     if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SharedPerk_mc)
                     {
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SharedPerk_mc.scaleX = this.TeamPanelScale;
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SharedPerk_mc.scaleY = this.TeamPanelScale;
                     }
                     if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SpeakerIcon_mc)
                     {
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SpeakerIcon_mc.scaleX = this.TeamPanelScale / 4;
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).SpeakerIcon_mc.scaleY = this.TeamPanelScale / 4;
                     }
                     if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).Emote_mc)
                     {
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).Emote_mc.scaleX = this.TeamPanelScale;
                        this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(iiiiii).Emote_mc.scaleY = this.TeamPanelScale;
                     }
                  }
                  iiiiii++;
               }
               TeamToggle = false;
            }
         }
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
            while(iii < this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.getChildAt(1).numChildren)
            {
               if(this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.getChildAt(1).getChildAt(iii).getChildAt(3).currentFrame == 69 || this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.getChildAt(1).getChildAt(iii).currentFrame == 2)
               {
                  if(this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.getChildAt(1).getChildAt(iii).visible)
                  {
                     negativeEffects++;
                     this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.getChildAt(1).getChildAt(iii).x = 4 - negativeEffects * 39;
                  }
               }
               else
               {
                  this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.getChildAt(1).getChildAt(iii).visible = false;
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
               if(this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == "DETECTED" || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == "CAUTION" || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == "DANGER" || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == DetectedText || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == CautionText || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == DangerText)
               {
                  isVisible = true;
               }
               else if(this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == "HIDDEN" || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == HiddenText)
               {
                  isVisible = false;
               }
            }
            else if(this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == "CAUTION" || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == "DANGER" || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == CautionText || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == DangerText)
            {
               isVisible = true;
            }
            else if(this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == "HIDDEN" || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == "DETECTED" || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == HiddenText || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == DetectedText)
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
            this.SneakMeterScale = Number(this.xmlConfigHC.Reposition_Elements.StealthMeter.Scale);
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
            this.SneakMeterScale = Number(this.xmlConfigHC.Reposition_Elements.StealthMeter.Scale);
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
            this.XPBarScale = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.XPBar.Scale);
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
            this.QuickLootScale = Number(this.xmlConfigHC.Reposition_Elements.InteractPrompts.QuickLoot.Scale);
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
            this.FrobberScale = Number(this.xmlConfigHC.Reposition_Elements.InteractPrompts.Frobber.Scale);
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
            this.RollOverScale = Number(this.xmlConfigHC.Reposition_Elements.InteractPrompts.RollOver.Scale);
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
            this.PerkPopUpScale = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.PerkPopUp.Scale);
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
            this.topLevel.LeftMeters_mc.RadsMeter_mc.scaleX = this.RadCountScale;
            this.topLevel.LeftMeters_mc.RadsMeter_mc.scaleY = this.RadCountScale;
         }
         else if(this.xmlConfigHC.ImmersiveTweaks.RadDamageIndicator)
         {
            this.RadCountScale = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.RadDamageIndicator.Scale);
            this.topLevel.LeftMeters_mc.RadsMeter_mc.scaleX = this.RadCountScale;
            this.topLevel.LeftMeters_mc.RadsMeter_mc.scaleY = this.RadCountScale;
         }
         else
         {
            this.RadCountScale = 1;
            this.topLevel.LeftMeters_mc.RadsMeter_mc.scaleX = 1;
            this.topLevel.LeftMeters_mc.RadsMeter_mc.scaleY = 1;
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
            if(this.isGhoul)
            {
               this.topLevel.LeftMeters_mc.RadsMeter_mc.RADS_tf.text = String(this.xmlConfigHC.ImmersiveTweaks.RadDamageIndicator.CustomText.Ghoul.Text.toString());
            }
            else
            {
               this.topLevel.LeftMeters_mc.RadsMeter_mc.RADS_tf.text = String(this.xmlConfigHC.ImmersiveTweaks.RadDamageIndicator.CustomText.Human.Text.toString());
            }
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
         if(!this.ImprovedHealthBarVisualSync)
         {
            if(this.xmlConfigHC.OtherMods.ImprovedHealthBar.EnableEditing == "true")
            {
               if(this.ImprovedHealthBars)
               {
                  if(this.ImpHealthLock != 0)
                  {
                     this.ImpHealthLock = 0;
                  }
                  if(this.topLevel.LeftMeters_mc.HPMeter_mc.numChildren > 10)
                  {
                     this.ImpHealthPos.x = Number(this.xmlConfigHC.OtherMods.ImprovedHealthBar.X);
                     this.ImpHealthPos.y = Number(this.xmlConfigHC.OtherMods.ImprovedHealthBar.Y);
                     this.ImpHealthScale = Number(this.xmlConfigHC.OtherMods.ImprovedHealthBar.Scale);
                     if(this.oImpHealthPos.x != this.ImpHealthPos.x)
                     {
                        this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(10).x = Number(this.topLevel.LeftMeters_mc.HPMeter_mc.GlowMeter_mc.x) - this.oImpHealthPos.x;
                        this.oImpHealthPos.x = this.ImpHealthPos.x;
                        this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(10).x = Number(this.topLevel.LeftMeters_mc.HPMeter_mc.GlowMeter_mc.x) + this.ImpHealthPos.x;
                     }
                     if(this.oImpHealthPos.y != this.ImpHealthPos.y)
                     {
                        this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(10).y = Number(this.topLevel.LeftMeters_mc.HPMeter_mc.GlowMeter_mc.y) - this.oImpHealthPos.y;
                        this.oImpHealthPos.y = this.ImpHealthPos.y;
                        this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(10).y = Number(this.topLevel.LeftMeters_mc.HPMeter_mc.GlowMeter_mc.y) + this.ImpHealthPos.y;
                     }
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
                     if(this.xmlConfigHC.OtherMods.ImprovedHealthBar.Hide == "true")
                     {
                        if(ImprovedHealthBarStateLock != 1)
                        {
                           ImprovedHealthBarStateLock = 1;
                           this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(10).visible = false;
                        }
                     }
                  }
               }
            }
         }
         else if(this.ImprovedHealthBars)
         {
            if(this.ImpHealthLock != 1)
            {
               if(this.oImpHealthPos.x != 0)
               {
                  this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(10).x = Number(this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(10).x) - this.oImpHealthPos.x;
                  this.oImpHealthPos.x = 0;
               }
               if(this.oImpHealthPos.y != 0)
               {
                  this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(10).y = Number(this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(10).y) - this.oImpHealthPos.y;
                  this.oImpHealthPos.y = 0;
               }
               if(this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(10).scaleX != 1)
               {
                  this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(10).scaleX = 1;
                  this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(10).scaleY = 1;
               }
               if(ImprovedHealthBarStateLock == 1)
               {
                  if(this.topLevel.LeftMeters_mc.HPMeter_mc.numChildren > 10)
                  {
                     this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(10).visible = true;
                  }
                  ImprovedHealthBarStateLock = 0;
               }
               this.ImpHealthLock = 1;
            }
         }
         if(this.xmlConfigHC.ImmersiveTweaks.AreaVoiceList.Hide == "true")
         {
            this.MicScale = 0;
            this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.AreaVoiceList_mc.scaleX = 0;
            this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.AreaVoiceList_mc.scaleY = 0;
         }
         else if(!isCrouched && this.xmlConfigHC.ImmersiveTweaks.AreaVoiceList.Crouch == "true")
         {
            this.MicScale = 0;
            this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.AreaVoiceList_mc.scaleX = 0;
            this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.AreaVoiceList_mc.scaleY = 0;
         }
         else
         {
            if(this.inPowerArmorwthPAHUD)
            {
               this.MicScale = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.AreaVoiceList.Scale) / this.TeamPanelScalePA;
            }
            else if(!this.inPowerArmorwthPAHUD)
            {
               this.MicScale = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.AreaVoiceList.Scale) / this.TeamPanelScale;
            }
            this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.AreaVoiceList_mc.scaleX = this.MicScale;
            this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.AreaVoiceList_mc.scaleY = this.MicScale;
         }
         if(this.isGhoul)
         {
            isVisible = true;
            isNotConfigCrouchOrVats = false;
            if(this.xmlConfigHC.ImmersiveTweaks.FeralMeter.Hide == "true")
            {
               isVisible = false;
            }
            else
            {
               if(this.xmlConfigHC.ImmersiveTweaks.FeralMeter.Crouch == "true")
               {
                  if(this.xmlConfigHC.ImmersiveTweaks.FeralMeter.VaTs == "true")
                  {
                     isVisible = isCrouched || isVats;
                  }
                  else
                  {
                     isVisible = isCrouched;
                  }
               }
               else if(this.xmlConfigHC.ImmersiveTweaks.FeralMeter.VaTs == "true")
               {
                  isVisible = isVats;
               }
               else
               {
                  isNotConfigCrouchOrVats = true;
               }
               if(this.xmlConfigHC.ImmersiveTweaks.FeralMeter.Fade == "true")
               {
                  if(isVisible)
                  {
                     if(isNotConfigCrouchOrVats && isAboveXFm)
                     {
                        isVisible = false;
                     }
                  }
                  else if(!isAboveXFm)
                  {
                     isVisible = true;
                  }
               }
            }
            if(this.FeralSkullVisualSync)
            {
               this.FeralSkullVisualPassThru = isVisible;
            }
            else if(this.xmlConfigHC.ImmersiveTweaks.FeralMeter.SkullOnly == "true")
            {
               this.topLevel.RightMeters_mc.FeralMeter_mc.FeralMeterInternal_mc.getChildAt(0).visible = isVisible;
               this.topLevel.RightMeters_mc.FeralMeter_mc.FeralMeterInternal_mc.getChildAt(1).visible = false;
               this.topLevel.RightMeters_mc.FeralMeter_mc.FeralMeterInternal_mc.getChildAt(2).visible = false;
            }
            else
            {
               this.topLevel.RightMeters_mc.FeralMeter_mc.FeralMeterInternal_mc.getChildAt(0).visible = isVisible;
               this.topLevel.RightMeters_mc.FeralMeter_mc.FeralMeterInternal_mc.getChildAt(1).visible = isVisible;
               this.topLevel.RightMeters_mc.FeralMeter_mc.FeralMeterInternal_mc.getChildAt(2).visible = isVisible;
            }
         }
         if(this.inPowerArmor)
         {
            if(!this.powerArmorHUDEnabled)
            {
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
               if(this.FusionCountVisualSync)
               {
                  this.FusionCountVisualPassThru = isVisible;
               }
               else if(this.xmlConfigHC.ImmersiveTweaks.FusionCoreMeter.FusionCountOnly == "true")
               {
                  this.topLevel.RightMeters_mc.HUDFusionCoreMeter_mc.getChildAt(0).visible = false;
                  this.topLevel.RightMeters_mc.HUDFusionCoreMeter_mc.getChildAt(1).visible = false;
                  this.topLevel.RightMeters_mc.HUDFusionCoreMeter_mc.getChildAt(2).visible = isVisible;
                  this.topLevel.RightMeters_mc.HUDFusionCoreMeter_mc.getChildAt(3).visible = isVisible;
               }
               else
               {
                  this.topLevel.RightMeters_mc.HUDFusionCoreMeter_mc.getChildAt(0).visible = isVisible;
                  this.topLevel.RightMeters_mc.HUDFusionCoreMeter_mc.getChildAt(1).visible = isVisible;
                  this.topLevel.RightMeters_mc.HUDFusionCoreMeter_mc.getChildAt(2).visible = isVisible;
                  this.topLevel.RightMeters_mc.HUDFusionCoreMeter_mc.getChildAt(3).visible = isVisible;
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
               this.FusionPopUpScale = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.FusionCoreWarning.Scale);
               this.topLevel.RightMeters_mc.PowerArmorLowBatteryWarning_mc.scaleX = this.FusionPopUpScale;
               this.topLevel.RightMeters_mc.PowerArmorLowBatteryWarning_mc.scaleY = this.FusionPopUpScale;
            }
            if(this.xmlConfigHC.ImmersiveTweaks.FusionCoreWarning.CustomText.Enable == "true")
            {
               LowBtryText = String(this.xmlConfigHC.ImmersiveTweaks.FusionCoreWarning.CustomText.LowBtry.toString());
               NoBtryText = String(this.xmlConfigHC.ImmersiveTweaks.FusionCoreWarning.CustomText.NoBtry.toString());
               if(FcLevel == 0)
               {
                  this.topLevel.RightMeters_mc.PowerArmorLowBatteryWarning_mc.WarningTextHolder_mc.PowerArmorLowBatteryWarning_tf.text = NoBtryText;
               }
               else
               {
                  this.topLevel.RightMeters_mc.PowerArmorLowBatteryWarning_mc.WarningTextHolder_mc.PowerArmorLowBatteryWarning_tf.text = LowBtryText;
               }
            }
         }
         if(this.xmlConfigHC.OtherImprovements.HpMeter.ShowHPLabel == "false")
         {
            this.topLevel.LeftMeters_mc.HPMeter_mc.DisplayText_mc.DisplayText_tf.visible = false;
            this.HPText.visible = false;
         }
         else if(this.xmlConfigHC.OtherImprovements.HpMeter.CustomText.Enable == "true")
         {
            this.topLevel.LeftMeters_mc.HPMeter_mc.DisplayText_mc.DisplayText_tf.visible = false;
            this.HPText.visible = true;
            this.HPText.text = String(this.xmlConfigHC.OtherImprovements.HpMeter.CustomText.Text.toString());
         }
         else if(this.xmlConfigHC.OtherImprovements.HpMeter.ShowHPLabel == "true")
         {
            this.topLevel.LeftMeters_mc.HPMeter_mc.DisplayText_mc.DisplayText_tf.visible = true;
            this.HPText.visible = false;
         }
         if(this.xmlConfigHC.OtherImprovements.APMeter.ShowAPLabel == "false")
         {
            this.topLevel.RightMeters_mc.ActionPointMeter_mc.DisplayText_mc.DisplayText_tf.visible = false;
            this.APText.visible = false;
         }
         else if(this.xmlConfigHC.OtherImprovements.APMeter.CustomText.Enable == "true")
         {
            this.topLevel.RightMeters_mc.ActionPointMeter_mc.DisplayText_mc.DisplayText_tf.visible = false;
            this.APText.visible = true;
            this.APText.text = String(this.xmlConfigHC.OtherImprovements.APMeter.CustomText.Text.toString());
         }
         else if(this.xmlConfigHC.OtherImprovements.APMeter.ShowAPLabel == "true")
         {
            this.topLevel.RightMeters_mc.ActionPointMeter_mc.DisplayText_mc.DisplayText_tf.visible = true;
            this.APText.visible = false;
         }
         if(this.xmlConfigHC.OtherImprovements.HpMeter.ShowBarBG == "false")
         {
            if(HpBckGrdTgl)
            {
               HpBckGrdTgl = false;
            }
            this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(0).visible = false;
         }
         else if(this.xmlConfigHC.OtherMods.ImprovedHealthBar.Enable == "true" && this.xmlConfigHC.OtherMods.ImprovedHealthBar.OnlyShow == "true")
         {
            if(HpBckGrdTgl)
            {
               HpBckGrdTgl = false;
            }
            this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(0).visible = false;
         }
         else if(!HpBckGrdTgl)
         {
            HpBckGrdTgl = true;
            this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(0).visible = true;
         }
         if(this.xmlConfigHC.OtherImprovements.APMeter.ShowBarBG == "false")
         {
            if(ApBckGrdTgl)
            {
               ApBckGrdTgl = false;
            }
            this.topLevel.RightMeters_mc.ActionPointMeter_mc.APBarFrame_mc.visible = false;
         }
         else if(this.xmlConfigHC.OtherImprovements.APMeter.ShowBarBG == "true")
         {
            if(!ApBckGrdTgl)
            {
               ApBckGrdTgl = true;
               this.topLevel.RightMeters_mc.ActionPointMeter_mc.APBarFrame_mc.visible = true;
            }
         }
         if(this.xmlConfigHC.dbg.e != undefined && this.xmlConfigHC.dbg.e == "191x7")
         {
            this.debugTextHC.text = "";
            this.displayText("DEBUG MODE");
            this.displayText("----------");
            this.displayText("reloadCount: " + this.reloadCount.toString());
            this.displayText("----------");
         }
         this.ShowHealth(0);
         this.thpShow = this.xmlConfigHC.OtherImprovements.Hunger_ThirstTweaks.ThirstHungerPercentShow;
         if(this.xmlConfigHC.OtherImprovements.Hunger_ThirstTweaks.AlwaysShowThirstHunger == "true")
         {
            this.topLevel.RightMeters_mc.HUDThirstMeter_mc.gotoAndStop(7);
            this.topLevel.RightMeters_mc.HUDHungerMeter_mc.gotoAndStop(7);
            this.VisibilityChanged = 1;
         }
         else if(this.xmlConfigHC.OtherImprovements.Hunger_ThirstTweaks.AlwaysShowThirstHunger == "false" && this.VisibilityChanged == 1)
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
         if(this.xmlConfigHC.OtherImprovements.HpMeter.HPLabel != undefined)
         {
            this.HPTextScale = Number(this.xmlConfigHC.OtherImprovements.HpMeter.HPLabel.Scale);
            this.HPTextPos.x = Number(this.xmlConfigHC.OtherImprovements.HpMeter.HPLabel.X);
            this.HPTextPos.y = Number(this.xmlConfigHC.OtherImprovements.HpMeter.HPLabel.Y);
            this.topLevel.LeftMeters_mc.HPMeter_mc.DisplayText_mc.x = this.HPTextPos.x + this.oHPTextPos.x;
            this.topLevel.LeftMeters_mc.HPMeter_mc.DisplayText_mc.y = this.HPTextPos.y + this.oHPTextPos.y;
            if(this.HPTextScale <= this.maxScale)
            {
               this.topLevel.LeftMeters_mc.HPMeter_mc.DisplayText_mc.scaleX = HPTextScale;
               this.topLevel.LeftMeters_mc.HPMeter_mc.DisplayText_mc.scaleY = HPTextScale;
            }
            else
            {
               this.topLevel.LeftMeters_mc.HPMeter_mc.DisplayText_mc.scaleX = 1;
               this.topLevel.LeftMeters_mc.HPMeter_mc.DisplayText_mc.scaleY = 1;
            }
         }
         if(this.xmlConfigHC.OtherImprovements.APMeter.APLabel != undefined)
         {
            this.APTextScale = Number(this.xmlConfigHC.OtherImprovements.APMeter.APLabel.Scale);
            this.APTextPos.x = Number(this.xmlConfigHC.OtherImprovements.APMeter.APLabel.X);
            this.APTextPos.y = Number(this.xmlConfigHC.OtherImprovements.APMeter.APLabel.Y);
            this.topLevel.RightMeters_mc.ActionPointMeter_mc.DisplayText_mc.x = this.oAPTextPos.x + this.APTextPos.x;
            this.topLevel.RightMeters_mc.ActionPointMeter_mc.DisplayText_mc.y = this.oAPTextPos.y + this.APTextPos.y;
            if(this.APTextScale <= this.maxScale)
            {
               this.topLevel.RightMeters_mc.ActionPointMeter_mc.DisplayText_mc.scaleX = APTextScale;
               this.topLevel.RightMeters_mc.ActionPointMeter_mc.DisplayText_mc.scaleY = APTextScale;
            }
            else
            {
               this.topLevel.RightMeters_mc.ActionPointMeter_mc.DisplayText_mc.scaleX = 1;
               this.topLevel.RightMeters_mc.ActionPointMeter_mc.DisplayText_mc.scaleY = 1;
            }
         }
         if(this.xmlConfigHC.Reposition_Elements != undefined)
         {
            if(this.inPowerArmor == true && this.powerArmorHUDEnabled == true)
            {
               this.topLevel.RightMeters_mc.HUDHungerMeter_mc.x = this.oHungerMeterPos.x + this.HungerMeterPosPA.x;
               this.topLevel.RightMeters_mc.HUDHungerMeter_mc.y = this.oHungerMeterPos.y + this.HungerMeterPosPA.y;
               this.topLevel.RightMeters_mc.HUDThirstMeter_mc.x = this.oThirstMeterPos.x + this.ThirstMeterPosPA.x;
               this.topLevel.RightMeters_mc.HUDThirstMeter_mc.y = this.oThirstMeterPos.y + this.ThirstMeterPosPA.y;
               this.topLevel.RightMeters_mc.ExplosiveAmmoCount_mc.x = this.oExplosiveAmmoCountPos.x + this.ExplosiveAmmoCountPosPA.x;
               this.topLevel.RightMeters_mc.ExplosiveAmmoCount_mc.y = this.oExplosiveAmmoCountPos.y + this.ExplosiveAmmoCountPosPA.y;
            }
            else
            {
               this.topLevel.RightMeters_mc.HUDHungerMeter_mc.x = this.oHungerMeterPos.x + this.HungerMeterPos.x;
               this.topLevel.RightMeters_mc.HUDHungerMeter_mc.y = this.oHungerMeterPos.y + this.HungerMeterPos.y;
               this.topLevel.RightMeters_mc.HUDThirstMeter_mc.x = this.oThirstMeterPos.x + this.ThirstMeterPos.x;
               this.topLevel.RightMeters_mc.HUDThirstMeter_mc.y = this.oThirstMeterPos.y + this.ThirstMeterPos.y;
               this.topLevel.RightMeters_mc.ExplosiveAmmoCount_mc.x = this.oExplosiveAmmoCountPos.x + this.ExplosiveAmmoCountPos.x;
               this.topLevel.RightMeters_mc.ExplosiveAmmoCount_mc.y = this.oExplosiveAmmoCountPos.y + this.ExplosiveAmmoCountPos.y;
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
            }
            if(this.inPowerArmorwthPAHUD)
            {
               this.topLevel.PartyResolutionContainer_mc.x = this.oTeamPanelPos.x + this.TeamPanelPosPA.x;
               this.topLevel.PartyResolutionContainer_mc.y = this.oTeamPanelPos.y + this.TeamPanelPosPA.y;
            }
            else if(!this.inPowerArmorwthPAHUD)
            {
               this.topLevel.PartyResolutionContainer_mc.x = this.oTeamPanelPos.x + this.TeamPanelPos.x;
               this.topLevel.PartyResolutionContainer_mc.y = this.oTeamPanelPos.y + this.TeamPanelPos.y;
            }
            if(this.oMicPos.x != this.MicPos.x || this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.AreaVoiceList_mc.x != this.oMicPos.x)
            {
               if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.AreaVoiceList_mc)
               {
                  this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.AreaVoiceList_mc.x = Number(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.AreaVoiceList_mc.x) - this.oMicPos.x;
                  this.oMicPos.x = this.MicPos.x;
                  this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.AreaVoiceList_mc.x = Number(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.AreaVoiceList_mc.x) + this.MicPos.x;
               }
            }
            if(this.oMicPos.y != this.MicPos.y || this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.AreaVoiceList_mc.y != this.oMicPos.y)
            {
               if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.AreaVoiceList_mc)
               {
                  this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.AreaVoiceList_mc.y = Number(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.AreaVoiceList_mc.y) - this.oMicPos.y;
                  this.oMicPos.y = this.MicPos.y;
                  this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.AreaVoiceList_mc.y = Number(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.AreaVoiceList_mc.y) + this.MicPos.y;
               }
            }
            this.topLevel.TopCenterGroup_mc.getChildAt(0).x = this.oSneakPos.x + this.SneakMeterPos.x;
            this.topLevel.TopCenterGroup_mc.getChildAt(0).y = this.oSneakPos.y + this.SneakMeterPos.y;
            this.topLevel.LeftMeters_mc.HPMeter_mc.x = this.oHpMeterPos.x + this.HpMeterPos.x;
            this.topLevel.LeftMeters_mc.HPMeter_mc.y = this.oHpMeterPos.y + this.HpMeterPos.y;
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
            this.topLevel.RightMeters_mc.FeralMeter_mc.x = this.oFeralMPos.x + this.FeralMPos.x;
            this.topLevel.RightMeters_mc.FeralMeter_mc.y = this.oFeralMPos.y + this.FeralMPos.y;
            if(this.oGlowMeterPos.x != this.GlowMeterPos.x)
            {
               this.topLevel.LeftMeters_mc.HPMeter_mc.GlowMeter_mc.x = Number(this.topLevel.LeftMeters_mc.HPMeter_mc.GlowMeter_mc.x) - this.oGlowMeterPos.x;
               this.oGlowMeterPos.x = this.GlowMeterPos.x;
               this.topLevel.LeftMeters_mc.HPMeter_mc.GlowMeter_mc.x = Number(this.topLevel.LeftMeters_mc.HPMeter_mc.GlowMeter_mc.x) + this.GlowMeterPos.x;
            }
            if(this.oGlowMeterPos.y != this.GlowMeterPos.y)
            {
               this.topLevel.LeftMeters_mc.HPMeter_mc.GlowMeter_mc.y = Number(this.topLevel.LeftMeters_mc.HPMeter_mc.GlowMeter_mc.y) - this.oGlowMeterPos.y;
               this.oGlowMeterPos.y = this.GlowMeterPos.y;
               this.topLevel.LeftMeters_mc.HPMeter_mc.GlowMeter_mc.y = Number(this.topLevel.LeftMeters_mc.HPMeter_mc.GlowMeter_mc.y) + this.GlowMeterPos.y;
            }
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
         if(this.xmlConfigHC.Mod_Options.EditMode != undefined)
         {
            this.watermark.x = stage.stageWidth - (this.watermark.width + 4);
            this.watermark.y = 0;
            color1 = "0x" + this.rightmetersRGB1;
            this.watermark.textColor = color1;
            if(this.xmlConfigHC.Mod_Options.EditMode == "true" && this.reloadCount == 150)
            {
               this.reloadXML();
               if(this.xmlConfigHC.Mod_Options.WaterMark.HideEditMode == "true")
               {
                  this.watermark.visible = false;
               }
               else
               {
                  this.watermark.visible = true;
               }
               if(this.xmlConfigHC.Mod_Options.WaterMark.CustomEditMark == "true")
               {
                  this.watermark.text = String(this.xmlConfigHC.Mod_Options.WaterMark.CustomEditMarkEntry.toString());
               }
               else
               {
                  this.watermark.text = "HUDEditor ***BETA*** EDIT MODE";
               }
            }
            else if(this.xmlConfigHC.Mod_Options.EditMode == "false")
            {
               if(this.xmlConfigHC.Mod_Options.WaterMark.HideDefaultMode == "true")
               {
                  this.watermark.visible = false;
               }
               else
               {
                  this.watermark.visible = false;
               }
               this.watermark.alpha = 0.3;
               this.reloadCount = 0;
               if(this.xmlConfigHC.Mod_Options.WaterMark.CustomWaterMark == "true")
               {
                  this.watermark.text = String(this.xmlConfigHC.Mod_Options.WaterMark.CustomEditMarkEntry.toString());
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
         this.maxScale = Number(this.xmlConfigHC.Mod_Options.MaxScale);
         this.ActiveEffectsBrightness = Number(this.xmlConfigHC.Colors.RightMeters.ActiveEffects.Brightness);
         this.ActiveEffectsContrast = Number(this.xmlConfigHC.Colors.RightMeters.ActiveEffects.Contrast);
         this.ActiveEffectsSaturation = Number(this.xmlConfigHC.Colors.RightMeters.ActiveEffects.Saturation);
         this.ActiveEffectsRGB1 = this.xmlConfigHC.Colors.RightMeters.ActiveEffects.Hex;
         this.AmmoCountBrightness = Number(this.xmlConfigHC.Colors.RightMeters.AmmoCount.Brightness);
         this.AmmoCountContrast = Number(this.xmlConfigHC.Colors.RightMeters.AmmoCount.Contrast);
         this.AmmoCountSaturation = Number(this.xmlConfigHC.Colors.RightMeters.AmmoCount.Saturation);
         this.AmmoCountRGB1 = this.xmlConfigHC.Colors.RightMeters.AmmoCount.Hex;
         this.APMeterBrightness = Number(this.xmlConfigHC.Colors.RightMeters.APMeter.Brightness);
         this.APMeterContrast = Number(this.xmlConfigHC.Colors.RightMeters.APMeter.Contrast);
         this.APMeterSaturation = Number(this.xmlConfigHC.Colors.RightMeters.APMeter.Saturation);
         this.APMeterRGB1 = this.xmlConfigHC.Colors.RightMeters.APMeter.Hex;
         this.ExplosiveAmmoCountBrightness = Number(this.xmlConfigHC.Colors.RightMeters.ExplosiveAmmoCount.Brightness);
         this.ExplosiveAmmoCountContrast = Number(this.xmlConfigHC.Colors.RightMeters.ExplosiveAmmoCount.Contrast);
         this.ExplosiveAmmoCountSaturation = Number(this.xmlConfigHC.Colors.RightMeters.ExplosiveAmmoCount.Saturation);
         this.ExplosiveAmmoCountRGB1 = this.xmlConfigHC.Colors.RightMeters.ExplosiveAmmoCount.Hex;
         this.FeralMeterBrightness = Number(this.xmlConfigHC.Colors.RightMeters.FeralMeter.Brightness);
         this.FeralMeterContrast = Number(this.xmlConfigHC.Colors.RightMeters.FeralMeter.Contrast);
         this.FeralMeterSaturation = Number(this.xmlConfigHC.Colors.RightMeters.FeralMeter.Saturation);
         this.FeralMeterRGB1 = this.xmlConfigHC.Colors.RightMeters.FeralMeter.Hex;
         this.HungerMeterBrightness = Number(this.xmlConfigHC.Colors.RightMeters.HungerMeter.Brightness);
         this.HungerMeterContrast = Number(this.xmlConfigHC.Colors.RightMeters.HungerMeter.Contrast);
         this.HungerMeterSaturation = Number(this.xmlConfigHC.Colors.RightMeters.HungerMeter.Saturation);
         this.HungerMeterRGB1 = this.xmlConfigHC.Colors.RightMeters.HungerMeters.Hex;
         this.ThirstMeterBrightness = Number(this.xmlConfigHC.Colors.RightMeters.ThirstMeter.Brightness);
         this.ThirstMeterContrast = Number(this.xmlConfigHC.Colors.RightMeters.ThirstMeter.Contrast);
         this.ThirstMeterSaturation = Number(this.xmlConfigHC.Colors.RightMeters.ThirstMeter.Saturation);
         this.ThirstMeterRGB1 = this.xmlConfigHC.Colors.RightMeters.ThirstMeter.Hex;
         this.FcmetersBrightness = Number(this.xmlConfigHC.Colors.LeftMeters.FusionCoreMeter.Brightness);
         this.FcmetersContrast = Number(this.xmlConfigHC.Colors.LeftMeters.FusionCoreMeter.Contrast);
         this.FcmetersSaturation = Number(this.xmlConfigHC.Colors.LeftMeters.FusionCoreMeter.Saturation);
         this.FcmetersRGB1 = this.xmlConfigHC.Colors.LeftMeters.FusionCoreMeter.Hex;
         this.HpmetersBrightness = Number(this.xmlConfigHC.Colors.LeftMeters.HpMeter.Brightness);
         this.HpmetersContrast = Number(this.xmlConfigHC.Colors.LeftMeters.HpMeter.Contrast);
         this.HpmetersSaturation = Number(this.xmlConfigHC.Colors.LeftMeters.HpMeter.Saturation);
         this.HpmetersRGB1 = this.xmlConfigHC.Colors.LeftMeters.HpMeter.Hex;
         this.GlmetersBrightness = Number(this.xmlConfigHC.Colors.LeftMeters.GlowMeter.Brightness);
         this.GlmetersContrast = Number(this.xmlConfigHC.Colors.LeftMeters.GlowMeter.Contrast);
         this.GlmetersSaturation = Number(this.xmlConfigHC.Colors.LeftMeters.GlowMeter.Saturation);
         this.GlmetersRGB1 = this.xmlConfigHC.Colors.LeftMeters.GlowMeter.Hex;
         this.radsbarBrightness = Number(this.xmlConfigHC.Colors.LeftMeters.RadBar.Brightness);
         this.radsbarContrast = Number(this.xmlConfigHC.Colors.LeftMeters.RadBar.Contrast);
         this.radsbarSaturation = Number(this.xmlConfigHC.Colors.LeftMeters.RadBar.Saturation);
         this.radsbarRGB = this.xmlConfigHC.Colors.LeftMeters.RadBar.Hex;
         this.AnnounceBrightness = Number(this.xmlConfigHC.Colors.HUD_Notifications.Announce.Brightness);
         this.AnnounceContrast = Number(this.xmlConfigHC.Colors.HUD_Notifications.Announce.Contrast);
         this.AnnounceSaturation = Number(this.xmlConfigHC.Colors.HUD_Notifications.Announce.Saturation);
         this.AnnounceRGB1 = this.xmlConfigHC.Colors.HUD_Notifications.Announce.Hex;
         this.AreaVoiceListBrightness = Number(this.xmlConfigHC.Colors.HUD_Notifications.AreaVoiceList.Brightness);
         this.AreaVoiceListContrast = Number(this.xmlConfigHC.Colors.HUD_Notifications.AreaVoiceList.Contrast);
         this.AreaVoiceListSaturation = Number(this.xmlConfigHC.Colors.HUD_Notifications.AreaVoiceList.Saturation);
         this.AreaVoiceListRGB1 = this.xmlConfigHC.Colors.HUD_Notifications.AreaVoiceList.Hex;
         this.LowFusionCoreWarningBrightness = Number(this.xmlConfigHC.Colors.HUD_Notifications.FusionCoreWarning.Low_Charge.Brightness);
         this.LowFusionCoreWarningContrast = Number(this.xmlConfigHC.Colors.HUD_Notifications.FusionCoreWarning.Low_Charge.Contrast);
         this.LowFusionCoreWarningSaturation = Number(this.xmlConfigHC.Colors.HUD_Notifications.FusionCoreWarning.Low_Charge.Saturation);
         this.LowFusionCoreWarningRGB1 = this.xmlConfigHC.Colors.HUD_Notifications.FusionCoreWarning.Low_Charge.Hex;
         this.NoFusionCoreWarningBrightness = Number(this.xmlConfigHC.Colors.HUD_Notifications.FusionCoreWarning.No_Charge.Brightness);
         this.NoFusionCoreWarningContrast = Number(this.xmlConfigHC.Colors.HUD_Notifications.FusionCoreWarning.No_Charge.Contrast);
         this.NoFusionCoreWarningSaturation = Number(this.xmlConfigHC.Colors.HUD_Notifications.FusionCoreWarning.No_Charge.Saturation);
         this.NoFusionCoreWarningRGB1 = this.xmlConfigHC.Colors.HUD_Notifications.FusionCoreWarning.No_Charge.Hex;
         this.NotificationBrightness = Number(this.xmlConfigHC.Colors.HUD_Notifications.Notification.Brightness);
         this.NotificationContrast = Number(this.xmlConfigHC.Colors.HUD_Notifications.Notification.Contrast);
         this.NotificationSaturation = Number(this.xmlConfigHC.Colors.HUD_Notifications.Notification.Saturation);
         this.NotificationRGB1 = this.xmlConfigHC.Colors.HUD_Notifications.Notification.Hex;
         this.RadDamageIndicatorBrightness = Number(this.xmlConfigHC.Colors.HUD_Notifications.RadDamageIndicator.Brightness);
         this.RadDamageIndicatorContrast = Number(this.xmlConfigHC.Colors.HUD_Notifications.RadDamageIndicator.Contrast);
         this.RadDamageIndicatorSaturation = Number(this.xmlConfigHC.Colors.HUD_Notifications.RadDamageIndicator.Saturation);
         this.RadDamageIndicatorRGB1 = this.xmlConfigHC.Colors.HUD_Notifications.RadDamageIndicator.Hex;
         this.SubtitlesBrightness = Number(this.xmlConfigHC.Colors.HUD_Notifications.Subtitles.Brightness);
         this.SubtitlesContrast = Number(this.xmlConfigHC.Colors.HUD_Notifications.Subtitles.Contrast);
         this.SubtitlesSaturation = Number(this.xmlConfigHC.Colors.HUD_Notifications.Subtitles.Saturation);
         this.SubtitlesRGB1 = this.xmlConfigHC.Colors.HUD_Notifications.Subtitles.Hex;
         this.XPBarBrightness = Number(this.xmlConfigHC.Colors.HUD_Notifications.XPBar.Brightness);
         this.XPBarContrast = Number(this.xmlConfigHC.Colors.HUD_Notifications.XPBar.Contrast);
         this.XPBarSaturation = Number(this.xmlConfigHC.Colors.HUD_Notifications.XPBar.Saturation);
         this.XPBarRGB1 = this.xmlConfigHC.Colors.HUD_Notifications.XPBar.Hex;
         this.QuickLootBrightness = Number(this.xmlConfigHC.Colors.InteractPrompts.QuickLoot.Brightness);
         this.QuickLootContrast = Number(this.xmlConfigHC.Colors.InteractPrompts.QuickLoot.Contrast);
         this.QuickLootSaturation = Number(this.xmlConfigHC.Colors.InteractPrompts.QuickLoot.Saturation);
         this.QuickLootRGB1 = this.xmlConfigHC.Colors.InteractPrompts.QuickLoot.Hex;
         this.FrobberBrightness = Number(this.xmlConfigHC.Colors.InteractPrompts.Frobber.Brightness);
         this.FrobberContrast = Number(this.xmlConfigHC.Colors.InteractPrompts.Frobber.Contrast);
         this.FrobberSaturation = Number(this.xmlConfigHC.Colors.InteractPrompts.Frobber.Saturation);
         this.FrobberRGB1 = this.xmlConfigHC.Colors.InteractPrompts.Frobber.Hex;
         this.RollOverBrightness = Number(this.xmlConfigHC.Colors.InteractPrompts.RollOver.Brightness);
         this.RollOverContrast = Number(this.xmlConfigHC.Colors.InteractPrompts.RollOver.Contrast);
         this.RollOverSaturation = Number(this.xmlConfigHC.Colors.InteractPrompts.RollOver.Saturation);
         this.RollOverRGB1 = this.xmlConfigHC.Colors.InteractPrompts.RollOver.Hex;
         this.HitMarkerBrightness = Number(this.xmlConfigHC.Colors.HitMarker.Brightness);
         this.HitMarkerContrast = Number(this.xmlConfigHC.Colors.HitMarker.Contrast);
         this.HitMarkerSaturation = Number(this.xmlConfigHC.Colors.HitMarker.Saturation);
         this.HitMarkerRGB1 = this.xmlConfigHC.Colors.HitMarker.Hex;
         this.DmgNumbBrightness = Number(this.xmlConfigHC.Colors.DmgNumb.Brightness);
         this.DmgNumbContrast = Number(this.xmlConfigHC.Colors.DmgNumb.Contrast);
         this.DmgNumbSaturation = Number(this.xmlConfigHC.Colors.DmgNumb.Saturation);
         this.DmgNumbRGB1 = this.xmlConfigHC.Colors.DmgNumb.Hex;
         this.floatingBrightness = Number(this.xmlConfigHC.Colors.Floating.Brightness);
         this.floatingContrast = Number(this.xmlConfigHC.Colors.Floating.Contrast);
         this.floatingSaturation = Number(this.xmlConfigHC.Colors.Floating.Saturation);
         this.floatingRGB1 = this.xmlConfigHC.Colors.Floating.Hex;
         this.TeamGlowBrightness = Number(this.xmlConfigHC.Colors.Team.Glow.Brightness);
         this.TeamGlowContrast = Number(this.xmlConfigHC.Colors.Team.Glow.Contrast);
         this.TeamGlowSaturation = Number(this.xmlConfigHC.Colors.Team.Glow.Saturation);
         this.TeamGlowRGB1 = this.xmlConfigHC.Colors.Team.Glow.Hex;
         this.TeamHpBrightness = Number(this.xmlConfigHC.Colors.Team.Hp.Brightness);
         this.TeamHpContrast = Number(this.xmlConfigHC.Colors.Team.Hp.Contrast);
         this.TeamHpSaturation = Number(this.xmlConfigHC.Colors.Team.Hp.Saturation);
         this.TeamHpRGB1 = this.xmlConfigHC.Colors.Team.Hp.Hex;
         this.TeamNameBrightness = Number(this.xmlConfigHC.Colors.Team.UserName.Brightness);
         this.TeamNameContrast = Number(this.xmlConfigHC.Colors.Team.UserName.Contrast);
         this.TeamNameSaturation = Number(this.xmlConfigHC.Colors.Team.UserName.Saturation);
         this.TeamNameRGB1 = this.xmlConfigHC.Colors.Team.UserName.Hex;
         this.TeamRadBrightness = Number(this.xmlConfigHC.Colors.Team.RadsBar.Brightness);
         this.TeamRadContrast = Number(this.xmlConfigHC.Colors.Team.RadsBar.Contrast);
         this.TeamRadSaturation = Number(this.xmlConfigHC.Colors.Team.RadsBar.Saturation);
         this.TeamRadRGB1 = this.xmlConfigHC.Colors.Team.RadsBar.Hex;
         this.TeamTypeBrightness = Number(this.xmlConfigHC.Colors.Team.TeamName.Brightness);
         this.TeamTypeContrast = Number(this.xmlConfigHC.Colors.Team.TeamName.Contrast);
         this.TeamTypeSaturation = Number(this.xmlConfigHC.Colors.Team.TeamName.Saturation);
         this.TeamTypeRGB1 = this.xmlConfigHC.Colors.Team.TeamName.Hex;
         this.TeamPerkBrightness = Number(this.xmlConfigHC.Colors.Team.PerkCard.Brightness);
         this.TeamPerkContrast = Number(this.xmlConfigHC.Colors.Team.PerkCard.Contrast);
         this.TeamPerkSaturation = Number(this.xmlConfigHC.Colors.Team.PerkCard.Saturation);
         this.TeamPerkRGB1 = this.xmlConfigHC.Colors.Team.PerkCard.Hex;
         this.QuestTrackerBrightness = Number(this.xmlConfigHC.Colors.QuestTracker.Brightness);
         this.QuestTrackerContrast = Number(this.xmlConfigHC.Colors.QuestTracker.Contrast);
         this.QuestTrackerSaturation = Number(this.xmlConfigHC.Colors.QuestTracker.Saturation);
         this.QuestTrackerRGB1 = this.xmlConfigHC.Colors.QuestTracker.Hex;
         this.SMHiddenBrightness = 0;
         this.SMHiddenContrast = 0;
         this.SMHiddenSaturation = 0;
         this.SMHiddenRGB1 = this.xmlConfigHC.Colors.StealthMeter.Hidden;
         this.SMDetectedBrightness = 0;
         this.SMDetectedContrast = 0;
         this.SMDetectedSaturation = 0;
         this.SMDetectedRGB1 = this.xmlConfigHC.Colors.StealthMeter.Detected;
         this.SMCautionBrightness = 0;
         this.SMCautionContrast = 0;
         this.SMCautionSaturation = 0;
         this.SMCautionRGB1 = this.xmlConfigHC.Colors.StealthMeter.Caution;
         this.SMDangerBrightness = 0;
         this.SMDangerContrast = 0;
         this.SMDangerSaturation = 0;
         this.SMDangerRGB1 = this.xmlConfigHC.Colors.StealthMeter.Danger;
         this.CompassBrightness = Number(this.xmlConfigHC.Colors.Compass.Brightness);
         this.CompassContrast = Number(this.xmlConfigHC.Colors.Compass.Contrast);
         this.CompassSaturation = Number(this.xmlConfigHC.Colors.Compass.Saturation);
         this.CompassRGB1 = this.xmlConfigHC.Colors.Compass.Hex;
         this.CritMeterBrightness = Number(this.xmlConfigHC.Colors.CritMeter.Brightness);
         this.CritMeterContrast = Number(this.xmlConfigHC.Colors.CritMeter.Contrast);
         this.CritMeterSaturation = Number(this.xmlConfigHC.Colors.CritMeter.Saturation);
         this.CritMeterRGB1 = this.xmlConfigHC.Colors.CritMeter.Hex;
         this.EnemyHealthMeterBrightness = Number(this.xmlConfigHC.Colors.EnemyHealthMeter.Brightness);
         this.EnemyHealthMeterContrast = Number(this.xmlConfigHC.Colors.EnemyHealthMeter.Contrast);
         this.EnemyHealthMeterSaturation = Number(this.xmlConfigHC.Colors.EnemyHealthMeter.Saturation);
         this.EnemyHealthMeterRGB1 = this.xmlConfigHC.Colors.EnemyHealthMeter.Hex;
         this.hudHUEActiveEffects = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.RightMeters.ActiveEffects.Hex))[0];
         this.hudHUEAmmoCount = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.RightMeters.AmmoCount.Hex))[0];
         this.hudHUEAPMeter = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.RightMeters.APMeter.Hex))[0];
         this.hudHUEExplosiveAmmoCount = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.RightMeters.ExplosiveAmmoCount.Hex))[0];
         this.hudHUEFeralMeter = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.RightMeters.FeralMeter.Hex))[0];
         this.hudHUEHungerMeter = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.RightMeters.HungerMeter.Hex))[0];
         this.hudHUEThirstMeter = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.RightMeters.ThirstMeter.Hex))[0];
         this.hudHUEFcmeters = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.LeftMeters.FusionCoreMeter.Hex))[0];
         this.hudHUEHpmeters = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.LeftMeters.HpMeter.Hex))[0];
         this.hudHUEGlmeters = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.LeftMeters.GlowMeter.Hex))[0];
         this.hudHUEradsbar = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.LeftMeters.RadBar.Hex))[0];
         this.hudHUEAnnounce = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.HUD_Notifications.Announce.Hex))[0];
         this.hudHUEAreaVoiceList = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.HUD_Notifications.AreaVoiceList.Hex))[0];
         this.hudHUELowFusionCoreWarning = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.HUD_Notifications.FusionCoreWarning.Low_Charge.Hex))[0];
         this.hudHUENoFusionCoreWarning = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.HUD_Notifications.FusionCoreWarning.No_Charge.Hex))[0];
         this.hudHUENotification = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.HUD_Notifications.Notification.Hex))[0];
         this.hudHUERadDamageIndicator = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.HUD_Notifications.RadDamageIndicator.Hex))[0];
         this.hudHUESubtitles = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.HUD_Notifications.Subtitles.Hex))[0];
         this.hudHUEXPBar = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.HUD_Notifications.XPBar.Hex))[0];
         this.hudHUEQuickLoot = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.InteractPrompts.QuickLoot.Hex))[0];
         this.hudHUEFrobber = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.InteractPrompts.Frobber.Hex))[0];
         this.hudHUERollOver = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.InteractPrompts.RollOver.Hex))[0];
         this.hudHUEHitMarker = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.HitMarker.Hex))[0];
         this.hudHUEDmgNumb = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.DmgNumb.Hex))[0];
         this.hudHUEfloating = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.Floating.Hex))[0];
         this.hudHUETeamGlow = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.Team.Glow.Hex))[0];
         this.hudHUETeamHp = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.Team.Hp.Hex))[0];
         this.hudHUETeamName = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.Team.UserName.Hex))[0];
         this.hudHUETeamRad = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.Team.RadsBar.Hex))[0];
         this.hudHUETeamType = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.Team.TeamName.Hex))[0];
         this.hudHUETeamPerk = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.Team.PerkCard.Hex))[0];
         this.hudHUEQuestTracker = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.QuestTracker.Hex))[0];
         this.hudHUESMHidden = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.StealthMeter.Hidden))[0];
         this.hudHUESMDetected = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.StealthMeter.Detected))[0];
         this.hudHUESMCaution = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.StealthMeter.Caution))[0];
         this.hudHUESMDanger = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.StealthMeter.Danger))[0];
         this.hudHUECompass = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.Compass.Hex))[0];
         this.hudHUECritMeter = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.CritMeter.Hex))[0];
         this.hudHUEEnemyHealthMeter = ColorMath.hex2hsb(uint("0x" + this.xmlConfigHC.Colors.EnemyHealthMeter.Hex))[0];
         if(this.xmlConfigHC.Reposition_Elements != undefined)
         {
            if(!this.xmlConfigHC.ImmersiveTweaks.StealthMeter)
            {
               this.SneakMeterScale = Number(this.xmlConfigHC.Reposition_Elements.StealthMeter.Scale);
            }
            this.SneakMeterPos.x = Number(this.xmlConfigHC.Reposition_Elements.StealthMeter.X);
            this.SneakMeterPos.y = Number(this.xmlConfigHC.Reposition_Elements.StealthMeter.Y);
            this.QuestScale = Number(this.xmlConfigHC.Reposition_Elements.QuestTracker.Scale);
            this.QuestPos.x = Number(this.xmlConfigHC.Reposition_Elements.QuestTracker.X);
            this.QuestPos.y = Number(this.xmlConfigHC.Reposition_Elements.QuestTracker.Y);
            this.HpMeterScale = Number(this.xmlConfigHC.Reposition_Elements.LeftMeters.HpMeter.Scale);
            this.HpMeterPos.x = Number(this.xmlConfigHC.Reposition_Elements.LeftMeters.HpMeter.X);
            this.HpMeterPos.y = Number(this.xmlConfigHC.Reposition_Elements.LeftMeters.HpMeter.Y);
            this.APMeterScale = Number(this.xmlConfigHC.Reposition_Elements.RightMeters.APMeter.Scale);
            this.APMeterPos.x = Number(this.xmlConfigHC.Reposition_Elements.RightMeters.APMeter.X);
            this.APMeterPos.y = Number(this.xmlConfigHC.Reposition_Elements.RightMeters.APMeter.Y);
            this.ActiveEffectsScale = Number(this.xmlConfigHC.Reposition_Elements.RightMeters.ActiveEffects.Scale);
            this.ActiveEffectsPos.x = Number(this.xmlConfigHC.Reposition_Elements.RightMeters.ActiveEffects.X);
            this.ActiveEffectsPos.y = Number(this.xmlConfigHC.Reposition_Elements.RightMeters.ActiveEffects.Y);
            this.HungerMeterScale = Number(this.xmlConfigHC.Reposition_Elements.RightMeters.HungerMeter.Scale);
            this.HungerMeterPos.x = Number(this.xmlConfigHC.Reposition_Elements.RightMeters.HungerMeter.X);
            this.HungerMeterPos.y = Number(this.xmlConfigHC.Reposition_Elements.RightMeters.HungerMeter.Y);
            this.ThirstMeterScale = Number(this.xmlConfigHC.Reposition_Elements.RightMeters.ThirstMeter.Scale);
            this.ThirstMeterPos.x = Number(this.xmlConfigHC.Reposition_Elements.RightMeters.ThirstMeter.X);
            this.ThirstMeterPos.y = Number(this.xmlConfigHC.Reposition_Elements.RightMeters.ThirstMeter.Y);
            this.HungerMeterPosPA.x = Number(this.xmlConfigHC.Reposition_Elements.RightMeters.HungerMeter.PowerArmor.X);
            this.HungerMeterPosPA.y = Number(this.xmlConfigHC.Reposition_Elements.RightMeters.HungerMeter.PowerArmor.Y);
            this.ThirstMeterPosPA.x = Number(this.xmlConfigHC.Reposition_Elements.RightMeters.ThirstMeter.PowerArmor.X);
            this.ThirstMeterPosPA.y = Number(this.xmlConfigHC.Reposition_Elements.RightMeters.ThirstMeter.PowerArmor.Y);
            this.ExplosiveAmmoCountPosPA.x = Number(this.xmlConfigHC.Reposition_Elements.RightMeters.ExplosiveAmmoCount.PowerArmor.X);
            this.ExplosiveAmmoCountPosPA.y = Number(this.xmlConfigHC.Reposition_Elements.RightMeters.ExplosiveAmmoCount.PowerArmor.Y);
            this.TeamPanelPosPA.x = Number(this.xmlConfigHC.Reposition_Elements.TeamPanel.PowerArmor.X);
            this.TeamPanelPosPA.y = Number(this.xmlConfigHC.Reposition_Elements.TeamPanel.PowerArmor.Y);
            this.HungerMeterScalePA = Number(this.xmlConfigHC.Reposition_Elements.RightMeters.HungerMeter.PowerArmor.Scale);
            this.ThirstMeterScalePA = Number(this.xmlConfigHC.Reposition_Elements.RightMeters.ThirstMeter.PowerArmor.Scale);
            this.ExplosiveAmmoCountScalePA = Number(this.xmlConfigHC.Reposition_Elements.RightMeters.ExplosiveAmmoCount.PowerArmor.Scale);
            this.TeamPanelScalePA = Number(this.xmlConfigHC.Reposition_Elements.TeamPanel.PowerArmor.Scale);
            this.AmmoCountScale = Number(this.xmlConfigHC.Reposition_Elements.RightMeters.AmmoCount.Scale);
            this.AmmoCountPos.x = Number(this.xmlConfigHC.Reposition_Elements.RightMeters.AmmoCount.X);
            this.AmmoCountPos.y = Number(this.xmlConfigHC.Reposition_Elements.RightMeters.AmmoCount.Y);
            this.ExplosiveAmmoCountScale = Number(this.xmlConfigHC.Reposition_Elements.RightMeters.ExplosiveAmmoCount.Scale);
            this.ExplosiveAmmoCountPos.x = Number(this.xmlConfigHC.Reposition_Elements.RightMeters.ExplosiveAmmoCount.X);
            this.ExplosiveAmmoCountPos.y = Number(this.xmlConfigHC.Reposition_Elements.RightMeters.ExplosiveAmmoCount.Y);
            this.FlashLightWidgetScale = Number(this.xmlConfigHC.OtherImprovements.FlashLightWidget.Scale);
            this.FlashLightWidgetPos.x = Number(this.xmlConfigHC.OtherImprovements.FlashLightWidget.X);
            this.FlashLightWidgetPos.y = Number(this.xmlConfigHC.OtherImprovements.FlashLightWidget.Y);
            this.EmoteScale = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.Emote.Scale);
            this.EmotePos.x = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.Emote.X);
            this.EmotePos.y = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.Emote.Y);
            this.AnnounceScale = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.Announce.Scale);
            this.AnnouncePos.x = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.Announce.X);
            this.AnnouncePos.y = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.Announce.Y);
            this.HitMarkerScale = Number(this.xmlConfigHC.Reposition_Elements.HitMarker.Scale);
            this.HitMarkerPos.x = Number(this.xmlConfigHC.Reposition_Elements.HitMarker.X);
            this.HitMarkerPos.y = Number(this.xmlConfigHC.Reposition_Elements.HitMarker.Y);
            if(!this.xmlConfigHC.ImmersiveTweaks.Compass)
            {
               this.CompassScale = Number(this.xmlConfigHC.Reposition_Elements.Compass.Scale);
            }
            this.CompassPos.x = Number(this.xmlConfigHC.Reposition_Elements.Compass.X);
            this.CompassPos.y = Number(this.xmlConfigHC.Reposition_Elements.Compass.Y);
            this.NotificationScale = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.Notification.Scale);
            this.NotificationPos.x = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.Notification.X);
            this.NotificationPos.y = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.Notification.Y);
            if(!this.xmlConfigHC.ImmersiveTweaks.InteractPrompts.QuickLoot)
            {
               this.QuickLootScale = Number(this.xmlConfigHC.Reposition_Elements.InteractPrompts.QuickLoot.Scale);
            }
            this.QuickLootPos.x = Number(this.xmlConfigHC.Reposition_Elements.InteractPrompts.QuickLoot.X);
            this.QuickLootPos.y = Number(this.xmlConfigHC.Reposition_Elements.InteractPrompts.QuickLoot.Y);
            this.TeamPanelScale = Number(this.xmlConfigHC.Reposition_Elements.TeamPanel.Scale);
            this.TeamPanelPos.x = Number(this.xmlConfigHC.Reposition_Elements.TeamPanel.X);
            this.TeamPanelPos.y = Number(this.xmlConfigHC.Reposition_Elements.TeamPanel.Y);
            this.MicPos.x = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.AreaVoiceList.X) - Number(this.xmlConfigHC.Reposition_Elements.TeamPanel.X);
            this.MicPos.y = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.AreaVoiceList.Y) - Number(this.xmlConfigHC.Reposition_Elements.TeamPanel.Y);
            this.FusionScale = Number(this.xmlConfigHC.Reposition_Elements.LeftMeters.FusionCoreMeter.Scale);
            this.FusionPos.x = Number(this.xmlConfigHC.Reposition_Elements.LeftMeters.FusionCoreMeter.X);
            this.FusionPos.y = Number(this.xmlConfigHC.Reposition_Elements.LeftMeters.FusionCoreMeter.Y);
            if(!this.xmlConfigHC.ImmersiveTweaks.InteractPrompts.Frobber)
            {
               this.FrobberScale = Number(this.xmlConfigHC.Reposition_Elements.InteractPrompts.Frobber.Scale);
            }
            this.FrobberPos.x = Number(this.xmlConfigHC.Reposition_Elements.InteractPrompts.Frobber.X);
            this.FrobberPos.y = Number(this.xmlConfigHC.Reposition_Elements.InteractPrompts.Frobber.Y);
            if(!this.xmlConfigHC.ImmersiveTweaks.InteractPrompts.RollOver)
            {
               this.RollOverScale = Number(this.xmlConfigHC.Reposition_Elements.InteractPrompts.RollOver.Scale);
            }
            this.RollOverPos.x = Number(this.xmlConfigHC.Reposition_Elements.InteractPrompts.RollOver.X);
            this.RollOverPos.y = Number(this.xmlConfigHC.Reposition_Elements.InteractPrompts.RollOver.Y);
            if(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.PerkPopUp)
            {
               this.PerkPopUpPos.x = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.PerkPopUp.X);
               this.PerkPopUpPos.y = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.PerkPopUp.Y);
            }
            else
            {
               this.PerkPopUpScale = 1;
               this.PerkPopUpPos.x = 0;
               this.PerkPopUpPos.y = 0;
            }
            if(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.FusionCoreWarning)
            {
               this.FusionPopUpPos.x = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.FusionCoreWarning.X);
               this.FusionPopUpPos.y = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.FusionCoreWarning.Y);
            }
            else
            {
               this.FusionPopUpScale = 1;
               this.FusionPopUpPos.x = 0;
               this.FusionPopUpPos.y = 0;
            }
            if(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.RadDamageIndicator)
            {
               this.RadCountPos.x = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.RadDamageIndicator.X);
               this.RadCountPos.y = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.RadDamageIndicator.Y);
            }
            else
            {
               this.RadCountScale = 1;
               this.RadCountPos.x = 0;
               this.RadCountPos.y = 0;
            }
            if(this.xmlConfigHC.Reposition_Elements.RightMeters.FeralMeter)
            {
               this.FeralMPos.x = Number(this.xmlConfigHC.Reposition_Elements.RightMeters.FeralMeter.X);
               this.FeralMPos.y = Number(this.xmlConfigHC.Reposition_Elements.RightMeters.FeralMeter.Y);
               this.FeralMScale = Number(this.xmlConfigHC.Reposition_Elements.RightMeters.FeralMeter.Scale);
            }
            else
            {
               this.FeralMScale = 1;
               this.FeralMPos.x = 0;
               this.FeralMPos.y = 0;
            }
            if(!this.xmlConfigHC.Reposition_Elements.LeftMeters.GlowMeter)
            {
               this.GlowMeterScale = 1;
               this.GlowMeterPos.x = 0;
               this.GlowMeterPos.y = 0;
            }
            this.RepUpdatesScale = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.ReputationUpdates.Scale);
            this.RepUpdatesPos.x = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.ReputationUpdates.X);
            this.RepUpdatesPos.y = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.ReputationUpdates.Y);
            this.LevelUpAnimScale = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.LevelUpAnimation.Scale);
            this.LevelUpAnimPos.x = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.LevelUpAnimation.X);
            this.LevelUpAnimPos.y = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.LevelUpAnimation.Y);
            if(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.Subtitles.Scale != undefined)
            {
               this.SubtitlesScale = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.Subtitles.Scale);
            }
            if(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.Subtitles.X != undefined)
            {
               this.SubtitlesPos.x = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.Subtitles.X);
            }
            else
            {
               this.SubtitlesPos.x = 0;
            }
            if(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.Subtitles.Y != undefined)
            {
               this.SubtitlesPos.y = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.Subtitles.Y);
            }
            else
            {
               this.SubtitlesPos.y = 0;
            }
            if(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.XPBar.Scale != undefined)
            {
               if(!this.xmlConfigHC.ImmersiveTweaks.Xp)
               {
                  this.XPBarScale = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.XPBar.Scale);
               }
            }
            if(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.XPBar.X != undefined)
            {
               this.XPBarPos.x = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.XPBar.X);
            }
            else
            {
               this.XPBarPos.x = 0;
            }
            if(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.XPBar.Y != undefined)
            {
               this.XPBarPos.y = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.XPBar.Y);
            }
            else
            {
               this.XPBarPos.y = 0;
            }
            if(this.xmlConfigHC.Reposition_Elements.CritMeter.Scale != undefined)
            {
               this.CritMeterScale = Number(this.xmlConfigHC.Reposition_Elements.CritMeter.Scale);
            }
            if(this.xmlConfigHC.Reposition_Elements.CritMeter.X != undefined)
            {
               this.CritMeterPos.x = Number(this.xmlConfigHC.Reposition_Elements.CritMeter.X);
            }
            else
            {
               this.CritMeterPos.x = 0;
            }
            if(this.xmlConfigHC.Reposition_Elements.CritMeter.Y != undefined)
            {
               this.CritMeterPos.y = Number(this.xmlConfigHC.Reposition_Elements.CritMeter.Y);
            }
            else
            {
               this.CritMeterPos.y = 0;
            }
            if(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.CurrencyUpdates.Scale != undefined)
            {
               this.CurrencyScale = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.CurrencyUpdates.Scale);
            }
            if(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.CurrencyUpdates.X != undefined)
            {
               this.CurrencyPos.x = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.CurrencyUpdates.X);
            }
            else
            {
               this.CurrencyPos.x = 0;
            }
            if(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.CurrencyUpdates.Y != undefined)
            {
               this.CurrencyPos.y = Number(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.CurrencyUpdates.Y);
            }
            else
            {
               this.CurrencyPos.y = 0;
            }
            if(this.xmlConfigHC.Reposition_Elements.EnemyHealthMeter.Scale != undefined)
            {
               this.EnemyHealthScale = Number(this.xmlConfigHC.Reposition_Elements.EnemyHealthMeter.Scale);
            }
            if(this.xmlConfigHC.Reposition_Elements.EnemyHealthMeter.X != undefined)
            {
               this.EnemyHealthPos.x = Number(this.xmlConfigHC.Reposition_Elements.EnemyHealthMeter.X);
            }
            else
            {
               this.EnemyHealthPos.x = 0;
            }
            if(this.xmlConfigHC.Reposition_Elements.EnemyHealthMeter.Y != undefined)
            {
               this.EnemyHealthPos.y = Number(this.xmlConfigHC.Reposition_Elements.EnemyHealthMeter.Y);
            }
            else
            {
               this.EnemyHealthPos.y = 0;
            }
         }
         var tempSatRM:Number = 0;
         if(this.ActiveEffectsSaturation >= 75)
         {
            tempSatRM = -(this.ActiveEffectsSaturation - 25);
         }
         else
         {
            tempSatRM = -this.ActiveEffectsSaturation;
         }
         ActiveEffectsColorMatrix = ColorMath.getColorChangeFilter(this.ActiveEffectsBrightness,this.ActiveEffectsContrast,this.ActiveEffectsSaturation,this.hudHUEActiveEffects - 60);
         ActiveEffectsInvColorMatrix = ColorMath.getColorChangeFilter(-this.ActiveEffectsBrightness,-this.ActiveEffectsContrast,tempSatRM,-this.hudHUEActiveEffects + 60);
         AmmoCountColorMatrix = ColorMath.getColorChangeFilter(this.AmmoCountBrightness,this.AmmoCountContrast,this.AmmoCountSaturation,this.hudHUEAmmoCount - 60);
         APMeterColorMatrix = ColorMath.getColorChangeFilter(this.APMeterBrightness,this.APMeterContrast,this.APMeterSaturation,this.hudHUEAPMeter - 60);
         ExplosiveAmmoCountColorMatrix = ColorMath.getColorChangeFilter(this.ExplosiveAmmoCountBrightness,this.ExplosiveAmmoCountContrast,this.ExplosiveAmmoCountSaturation,this.hudHUEExplosiveAmmoCount - 60);
         FeralMeterColorMatrix = ColorMath.getColorChangeFilter(this.FeralMeterBrightness,this.FeralMeterContrast,this.FeralMeterSaturation,this.hudHUEFeralMeter - 60);
         HungerMeterColorMatrix = ColorMath.getColorChangeFilter(this.HungerMeterBrightness,this.HungerMeterContrast,this.HungerMeterSaturation,this.hudHUEHungerMeter - 60);
         ThirstMeterColorMatrix = ColorMath.getColorChangeFilter(this.ThirstMeterBrightness,this.ThirstMeterContrast,this.ThirstMeterSaturation,this.hudHUEThirstMeter - 60);
         FcmetersColorMatrix = ColorMath.getColorChangeFilter(this.FcmetersBrightness,this.FcmetersContrast,this.FcmetersSaturation,this.hudHUEFcmeters - 60);
         HpmetersColorMatrix = ColorMath.getColorChangeFilter(this.HpmetersBrightness,this.HpmetersContrast,this.HpmetersSaturation,this.hudHUEHpmeters - 60);
         GlmetersColorMatrix = ColorMath.getColorChangeFilter(this.GlmetersBrightness,this.GlmetersContrast,this.GlmetersSaturation,this.hudHUEGlmeters - 60);
         radsbarColorMatrix = ColorMath.getColorChangeFilter(this.radsbarBrightness,this.radsbarContrast,this.radsbarSaturation,this.hudHUEradsbar + 60);
         var tempSatLM:Number = 0;
         if(this.HpmetersSaturation >= 75)
         {
            tempSatLM = -(this.HpmetersSaturation - 25);
         }
         else
         {
            tempSatLM = -this.HpmetersSaturation;
         }
         HpmetersInvColorMatrix = ColorMath.getColorChangeFilter(-this.HpmetersBrightness,-this.HpmetersContrast,tempSatLM,-this.hudHUEHpmeters + 60);
         AnnounceColorMatrix = ColorMath.getColorChangeFilter(this.AnnounceBrightness,this.AnnounceContrast,this.AnnounceSaturation,this.hudHUEAnnounce - 60);
         AreaVoiceListColorMatrix = ColorMath.getColorChangeFilter(this.AreaVoiceListBrightness,this.AreaVoiceListContrast,this.AreaVoiceListSaturation,this.hudHUEAreaVoiceList - 60);
         LowFusionCoreWarningColorMatrix = ColorMath.getColorChangeFilter(this.LowFusionCoreWarningBrightness,this.LowFusionCoreWarningContrast,this.LowFusionCoreWarningSaturation,this.hudHUELowFusionCoreWarning - 60);
         NoFusionCoreWarningColorMatrix = ColorMath.getColorChangeFilter(this.NoFusionCoreWarningBrightness,this.NoFusionCoreWarningContrast,this.NoFusionCoreWarningSaturation,this.hudHUENoFusionCoreWarning - 60);
         NotificationColorMatrix = ColorMath.getColorChangeFilter(this.NotificationBrightness,this.NotificationContrast,this.NotificationSaturation,this.hudHUENotification - 60);
         RadDamageIndicatorColorMatrix = ColorMath.getColorChangeFilter(this.RadDamageIndicatorBrightness,this.RadDamageIndicatorContrast,this.RadDamageIndicatorSaturation,this.hudHUERadDamageIndicator - 60);
         SubtitlesColorMatrix = ColorMath.getColorChangeFilter(this.SubtitlesBrightness,this.SubtitlesContrast,this.SubtitlesSaturation,this.hudHUESubtitles - 60);
         XPBarColorMatrix = ColorMath.getColorChangeFilter(this.XPBarBrightness,this.XPBarContrast,this.XPBarSaturation,this.hudHUEXPBar - 60);
         QuickLootColorMatrix = ColorMath.getColorChangeFilter(this.QuickLootBrightness,this.QuickLootContrast,this.QuickLootSaturation,this.hudHUEQuickLoot - 60);
         FrobberColorMatrix = ColorMath.getColorChangeFilter(this.FrobberBrightness,this.FrobberContrast,this.FrobberSaturation,this.hudHUEFrobber - 60);
         RollOverColorMatrix = ColorMath.getColorChangeFilter(this.RollOverBrightness,this.RollOverContrast,this.RollOverSaturation,this.hudHUERollOver - 60);
         HitMarkerColorMatrix = ColorMath.getColorChangeFilter(this.HitMarkerBrightness,this.HitMarkerContrast,this.HitMarkerSaturation,this.hudHUEHitMarker - 60);
         DmgNumbColorMatrix = ColorMath.getColorChangeFilter(this.DmgNumbBrightness,this.DmgNumbContrast,this.DmgNumbSaturation,this.hudHUEDmgNumb - 60);
         floatingColorMatrix = ColorMath.getColorChangeFilter(this.floatingBrightness,this.floatingContrast,this.floatingSaturation,this.hudHUEfloating - 60);
         floatingInvColorMatrix = ColorMath.getColorChangeFilter(-this.floatingBrightness,-this.floatingContrast,-this.floatingSaturation,-this.hudHUEfloating + 60);
         TeamGlowColorMatrix = ColorMath.getColorChangeFilter(this.TeamGlowBrightness,this.TeamGlowContrast,this.TeamGlowSaturation,this.hudHUETeamGlow - 60);
         TeamHpColorMatrix = ColorMath.getColorChangeFilter(this.TeamHpBrightness,this.TeamHpContrast,this.TeamHpSaturation,this.hudHUETeamHp - 60);
         TeamNameColorMatrix = ColorMath.getColorChangeFilter(this.TeamNameBrightness,this.TeamNameContrast,this.TeamNameSaturation,this.hudHUETeamName - 60);
         TeamRadColorMatrix = ColorMath.getColorChangeFilter(this.TeamRadBrightness,this.TeamRadContrast,this.TeamRadSaturation,this.hudHUETeamRad - 60);
         TeamTypeColorMatrix = ColorMath.getColorChangeFilter(this.TeamTypeBrightness,this.TeamTypeContrast,this.TeamTypeSaturation,this.hudHUETeamType - 60);
         TeamPerkColorMatrix = ColorMath.getColorChangeFilter(this.TeamPerkBrightness,this.TeamPerkContrast,this.TeamPerkSaturation,this.hudHUETeamPerk - 60);
         QuestTrackerColorMatrix = ColorMath.getColorChangeFilter(this.QuestTrackerBrightness,this.QuestTrackerContrast,this.QuestTrackerSaturation,this.hudHUEQuestTracker - 60);
         SMHiddenColorMatrix = ColorMath.getColorChangeFilter(this.SMHiddenBrightness,this.SMHiddenContrast,this.SMHiddenSaturation,this.hudHUESMHidden - 60);
         SMDetectedColorMatrix = ColorMath.getColorChangeFilter(this.SMDetectedBrightness,this.SMDetectedContrast,this.SMDetectedSaturation,this.hudHUESMDetected - 60);
         SMCautionColorMatrix = ColorMath.getColorChangeFilter(this.SMCautionBrightness,this.SMCautionContrast,this.SMCautionSaturation,this.hudHUESMCaution - 60);
         SMDangerColorMatrix = ColorMath.getColorChangeFilter(this.SMDangerBrightness,this.SMDangerContrast,this.SMDangerSaturation,this.hudHUESMDanger - 60);
         CompassColorMatrix = ColorMath.getColorChangeFilter(this.CompassBrightness,this.CompassContrast,this.CompassSaturation,this.hudHUECompass - 60);
         var tempSatBCC:Number = 0;
         if(this.CompassSaturation >= 75)
         {
            tempSatBCC = -(this.CompassSaturation - 25);
         }
         else
         {
            tempSatBCC = -this.CompassSaturation;
         }
         CompassInvColorMatrix = ColorMath.getColorChangeFilter(-this.CompassBrightness,-this.CompassContrast,tempSatBCC,-this.hudHUECompass + 60);
         CritMeterColorMatrix = ColorMath.getColorChangeFilter(this.CritMeterBrightness,this.CritMeterContrast,this.CritMeterSaturation,this.hudHUECritMeter - 60);
         EnemyHealthMeterColorMatrix = ColorMath.getColorChangeFilter(this.EnemyHealthMeterBrightness,this.EnemyHealthMeterContrast,this.EnemyHealthMeterSaturation,this.hudHUEEnemyHealthMeter - 60);
         this.initializeStaticElementsProps();
      }
      
      private function initializeStaticElementsProps() : void
      {
         if(this.xmlConfigHC.Reposition_Elements != undefined)
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
            if(this.FusionScale <= this.maxScale && !this.FusionVisualSync)
            {
               this.topLevel.RightMeters_mc.HUDFusionCoreMeter_mc.scaleX = this.FusionScale;
               this.topLevel.RightMeters_mc.HUDFusionCoreMeter_mc.scaleY = this.FusionScale;
            }
            else if(this.FusionVisualSync)
            {
               this.topLevel.RightMeters_mc.HUDFusionCoreMeter_mc.scaleX = 0;
               this.topLevel.RightMeters_mc.HUDFusionCoreMeter_mc.scaleY = 0;
            }
            else
            {
               this.topLevel.RightMeters_mc.HUDFusionCoreMeter_mc.scaleX = 1;
               this.topLevel.RightMeters_mc.HUDFusionCoreMeter_mc.scaleY = 1;
            }
            if(this.APMeterScale <= this.maxScale && !this.ApVisualSync)
            {
               this.topLevel.RightMeters_mc.ActionPointMeter_mc.scaleX = this.APMeterScale;
               this.topLevel.RightMeters_mc.ActionPointMeter_mc.scaleY = this.APMeterScale;
            }
            else if(this.ApVisualSync)
            {
               this.topLevel.RightMeters_mc.ActionPointMeter_mc.scaleX = 0;
               this.topLevel.RightMeters_mc.ActionPointMeter_mc.scaleY = 0;
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
            if(this.FeralMScale <= this.maxScale && !this.FeralVisualSync)
            {
               this.topLevel.RightMeters_mc.FeralMeter_mc.scaleX = this.FeralMScale;
               this.topLevel.RightMeters_mc.FeralMeter_mc.scaleY = this.FeralMScale;
            }
            else if(this.FeralVisualSync)
            {
               this.topLevel.RightMeters_mc.FeralMeter_mc.scaleX = 0;
               this.topLevel.RightMeters_mc.FeralMeter_mc.scaleY = 0;
            }
            else
            {
               this.topLevel.RightMeters_mc.FeralMeter_mc.scaleX = 1;
               this.topLevel.RightMeters_mc.FeralMeter_mc.scaleY = 1;
            }
            if(this.GlowMeterScale <= this.maxScale && !this.GlowVisualSync)
            {
               this.topLevel.LeftMeters_mc.HPMeter_mc.GlowMeter_mc.scaleX = this.GlowMeterScale / this.HpMeterScale;
               this.topLevel.LeftMeters_mc.HPMeter_mc.GlowMeter_mc.scaleY = this.GlowMeterScale / this.HpMeterScale;
            }
            else if(this.GlowVisualSync)
            {
               this.topLevel.LeftMeters_mc.HPMeter_mc.GlowMeter_mc.scaleX = 0;
               this.topLevel.LeftMeters_mc.HPMeter_mc.GlowMeter_mc.scaleY = 0;
            }
            else
            {
               this.topLevel.LeftMeters_mc.HPMeter_mc.GlowMeter_mc.scaleX = 1;
               this.topLevel.LeftMeters_mc.HPMeter_mc.GlowMeter_mc.scaleY = 1;
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
            if(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.Subtitles.Scale != undefined)
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
            if(this.xmlConfigHC.Reposition_Elements.CritMeter.Scale != undefined)
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
            if(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.CurrencyUpdates.Scale != undefined)
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
            if(this.xmlConfigHC.Reposition_Elements.HUD_Notifications.HUD_Notifications.XPBar.Scale != undefined)
            {
               if(this.XPBarScale <= this.maxScale)
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
            if(this.xmlConfigHC.Reposition_Elements.EnemyHealthMeter.Scale != undefined)
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
            if(this.HpMeterScale <= this.maxScale && !this.HpVisualSync)
            {
               this.topLevel.LeftMeters_mc.HPMeter_mc.scaleX = this.HpMeterScale;
               this.topLevel.LeftMeters_mc.HPMeter_mc.scaleY = this.HpMeterScale;
            }
            else if(this.HpVisualSync)
            {
               this.topLevel.LeftMeters_mc.HPMeter_mc.scaleX = 0;
               this.topLevel.LeftMeters_mc.HPMeter_mc.scaleY = 0;
            }
            else
            {
               this.topLevel.LeftMeters_mc.HPMeter_mc.scaleX = 1;
               this.topLevel.LeftMeters_mc.HPMeter_mc.scaleY = 1;
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
         if(this.xmlConfigHC.OtherImprovements.EnemyHealthMeter.HealthPercentLocation != undefined)
         {
            if(this.xmlConfigHC.OtherImprovements.EnemyHealthMeter.HealthPercentLocation == "top")
            {
               this.showHealthText.y = this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.DisplayText_mc.y - this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.DisplayText_mc.height;
               this.showHealthText.autoSize = TextFieldAutoSize.CENTER;
               this.showHealthText.x = 0 - this.showHealthText.width * 0.5;
            }
            else if(this.xmlConfigHC.OtherImprovements.EnemyHealthMeter.HealthPercentLocation == "bottom")
            {
               this.showHealthText.y = this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.DisplayText_mc.y + this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.DisplayText_mc.height + 40;
               this.showHealthText.autoSize = TextFieldAutoSize.CENTER;
               this.showHealthText.x = 0 - this.showHealthText.width * 0.5;
            }
            else if(this.xmlConfigHC.OtherImprovements.EnemyHealthMeter.HealthPercentLocation == "right")
            {
               this.showHealthText.y = this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.DisplayText_mc.y + this.showHealthText.height - this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.MeterBar_mc.height / 2;
               this.showHealthText.autoSize = TextFieldAutoSize.LEFT;
               this.showHealthText.x = this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.DisplayText_mc.x + this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.width / 4 + 75;
            }
            else if(this.xmlConfigHC.OtherImprovements.EnemyHealthMeter.HealthPercentLocation == "left")
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
         if(this.xmlConfigHC.OtherImprovements.FlashLightWidget.RestoreFlashLightIcon != undefined)
         {
            if(this.xmlConfigHC.OtherImprovements.FlashLightWidget.RestoreFlashLightIcon == "true")
            {
               this.FlashLightRestored_mc.visible = true;
            }
            else if(this.xmlConfigHC.OtherImprovements.FlashLightWidget.RestoreFlashLightIcon == "false")
            {
               this.FlashLightRestored_mc.visible = false;
            }
         }
         if(this.xmlConfigHC.OtherImprovements.Crosshair.CustomCrosshair == "true")
         {
            this.topLevel.CenterGroup_mc.HUDCrosshair_mc.filters = null;
         }
         if(this.xmlConfigHC.Colors.RightMeters.ActiveEffects.Enable == "true")
         {
            ii = 0;
            while(ii < this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.getChildAt(1).numChildren)
            {
               if(this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.getChildAt(1).getChildAt(ii).getChildAt(3).currentFrame == 69 || this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.getChildAt(1).getChildAt(ii).currentFrame == 2)
               {
                  if(this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.getChildAt(1).getChildAt(ii).visible)
                  {
                     this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.getChildAt(1).getChildAt(ii).filters = [ActiveEffectsColorMatrix];
                  }
               }
               else
               {
                  this.topLevel.RightMeters_mc.HUDActiveEffectsWidget_mc.getChildAt(1).getChildAt(ii).filters = [ActiveEffectsInvColorMatrix];
               }
               ii++;
            }
         }
         if(this.xmlConfigHC.Colors.RightMeters.AmmoCount.Enable == "true")
         {
            this.topLevel.RightMeters_mc.AmmoCount_mc.filters = [AmmoCountColorMatrix];
         }
         if(this.xmlConfigHC.Colors.RightMeters.APMeter.Enable == "true")
         {
            this.topLevel.RightMeters_mc.ActionPointMeter_mc.filters = [APMeterColorMatrix];
         }
         if(this.xmlConfigHC.Colors.RightMeters.ExplosiveAmmoCount.Enable == "true")
         {
            this.topLevel.RightMeters_mc.ExplosiveAmmoCount_mc.filters = [ExplosiveAmmoCountColorMatrix];
         }
         if(this.xmlConfigHC.Colors.RightMeters.FeralMeter.Enable == "true")
         {
            this.topLevel.RightMeters_mc.FeralMeter_mc.filters = [FeralMeterColorMatrix];
         }
         if(this.xmlConfigHC.Colors.RightMeters.HungerMeter.Enable == "true")
         {
            this.topLevel.RightMeters_mc.HUDHungerMeter_mc.filters = [HungerMeterColorMatrix];
         }
         if(this.xmlConfigHC.Colors.RightMeters.ThirstMeter.Enable == "true")
         {
            this.topLevel.RightMeters_mc.HUDThirstMeter_mc.filters = [ThirstMeterColorMatrix];
         }
         if(this.xmlConfigHC.Colors.LeftMeters.FusionCoreMeter.Enable == "true")
         {
            this.topLevel.RightMeters_mc.HUDFusionCoreMeter_mc.filters = [FcmetersColorMatrix];
         }
         if(this.xmlConfigHC.Colors.LeftMeters.HpMeter.Enable == "true")
         {
            hpCL = 0;
            while(hpCL < this.topLevel.LeftMeters_mc.HPMeter_mc.numChildren)
            {
               if(this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(hpCL) != this.topLevel.LeftMeters_mc.HPMeter_mc.GlowMeter_mc && this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(hpCL) != this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(2).getChildAt(0).getChildAt(0))
               {
                  this.topLevel.LeftMeters_mc.HPMeter_mc.getChildAt(hpCL).filters = [HpmetersColorMatrix];
               }
               hpCL++;
            }
         }
         if(this.xmlConfigHC.Colors.LeftMeters.RadBar.Enable == "true")
         {
            this.topLevel.LeftMeters_mc.getChildAt(0).getChildAt(2).getChildAt(0).getChildAt(0).filters = [radsbarColorMatrix];
         }
         if(this.xmlConfigHC.Colors.LeftMeters.GlowMeter.Enable == "true")
         {
            this.topLevel.LeftMeters_mc.HPMeter_mc.GlowMeter_mc.filters = [GlmetersColorMatrix];
         }
         if(this.xmlConfigHC.Colors.HUD_Notifications.Announce.Enable == "true")
         {
            this.topLevel.AnnounceEventWidget_mc.filters = [AnnounceColorMatrix];
         }
         if(this.xmlConfigHC.Colors.HUD_Notifications.AreaVoiceList.Enable == "true")
         {
            this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.AreaVoiceList_mc.filters = [AreaVoiceListColorMatrix];
         }
         if(this.xmlConfigHC.Colors.HUD_Notifications.FusionCoreWarning.Low_Charge.Enable == "true")
         {
            if(inPowerArmor)
            {
               if(FcLevel != 0)
               {
                  this.topLevel.RightMeters_mc.PowerArmorLowBatteryWarning_mc.WarningTextHolder_mc.PowerArmorLowBatteryWarning_tf.textColor = Number("0x" + this.xmlConfigHC.Colors.HUD_Notifications.FusionCoreWarning.Low_Charge.Hex);
               }
            }
         }
         if(this.xmlConfigHC.Colors.HUD_Notifications.FusionCoreWarning.No_Charge.Enable == "true")
         {
            if(inPowerArmor)
            {
               if(FcLevel == 0)
               {
                  this.topLevel.RightMeters_mc.PowerArmorLowBatteryWarning_mc.WarningTextHolder_mc.PowerArmorLowBatteryWarning_tf.textColor = Number("0x" + this.xmlConfigHC.Colors.HUD_Notifications.FusionCoreWarning.No_Charge.Hex);
               }
            }
         }
         if(this.xmlConfigHC.Colors.HUD_Notifications.Notification.Enable == "true")
         {
            this.topLevel.HUDNotificationsGroup_mc.Messages_mc.filters = [NotificationColorMatrix];
         }
         if(this.xmlConfigHC.Colors.HUD_Notifications.RadDamageIndicator.Enable == "true")
         {
            this.topLevel.LeftMeters_mc.RadsMeter_mc.filters = [RadDamageIndicatorColorMatrix];
         }
         if(this.xmlConfigHC.Colors.HUD_Notifications.Subtitles.Enable == "true")
         {
            this.topLevel.BottomCenterGroup_mc.SubtitleText_mc.filters = [SubtitlesColorMatrix];
         }
         if(this.xmlConfigHC.Colors.HUD_Notifications.XPBar.Enable == "true")
         {
            this.topLevel.HUDNotificationsGroup_mc.XPMeter_mc.filters = [XPBarColorMatrix];
         }
         if(this.xmlConfigHC.Colors.InteractPrompts.QuickLoot.Enable == "true")
         {
            this.topLevel.CenterGroup_mc.QuickContainerWidget_mc.filters = [QuickLootColorMatrix];
         }
         if(this.xmlConfigHC.Colors.InteractPrompts.Frobber.Enable == "true")
         {
            this.topLevel.FrobberWidget_mc.filters = [FrobberColorMatrix];
         }
         if(this.xmlConfigHC.Colors.InteractPrompts.RollOver.Enable == "true")
         {
            this.topLevel.CenterGroup_mc.RolloverWidget_mc.filters = [RollOverColorMatrix];
         }
         if(this.xmlConfigHC.Colors.HitMarker.Enable == "true")
         {
            this.topLevel.CenterGroup_mc.HitIndicator_mc.filters = [HitMarkerColorMatrix];
         }
         if(this.xmlConfigHC.Colors.DmgNumb.Enable == "true")
         {
            this.topLevel.DamageNumbers_mc.filters = [DmgNumbColorMatrix];
         }
         if(this.xmlConfigHC.Colors.Floating.Enable == "true")
         {
            this.topLevel.FloatingTargetManager_mc.filters = [floatingColorMatrix];
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
         pi = 0;
         while(pi < this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.numChildren)
         {
            if(this.xmlConfigHC.Colors.Team.RadsBar.Enable == "true")
            {
               if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(pi).RadsMeter_mc)
               {
                  this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(pi).RadsMeter_mc.filters = [TeamRadColorMatrix];
               }
            }
            if(this.xmlConfigHC.Colors.Team.Glow.Enable == "true")
            {
               if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(pi).GlowMeter_mc)
               {
                  this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(pi).GlowMeter_mc.filters = [TeamGlowColorMatrix];
               }
            }
            if(this.xmlConfigHC.Colors.Team.Hp.Enable == "true")
            {
               if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(pi).Meter_mc)
               {
                  this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(pi).Meter_mc.filters = [TeamHpColorMatrix];
               }
            }
            if(this.xmlConfigHC.Colors.Team.UserName.Enable == "true")
            {
               if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(pi).nameField_mc)
               {
                  this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(pi).nameField_mc.textField.textColor = Number("0x" + this.xmlConfigHC.Colors.Team.UserName.Hex);
               }
            }
            if(this.xmlConfigHC.Colors.Team.PerkCard.Enable == "true")
            {
               if(this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(pi).SharedPerk_mc)
               {
                  this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PartyList.List_mc.EntryHolder_mc.getChildAt(pi).SharedPerk_mc.filters = [TeamPerkColorMatrix];
               }
            }
            pi++;
         }
         if(this.xmlConfigHC.Colors.Team.TeamName.Enable == "true")
         {
            this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PTPartyListHeader_mc.PTPartyHeaderTeamType_mc.TeamType_tf.textColor = Number("0x" + this.xmlConfigHC.Colors.Team.TeamName.Hex);
         }
         if(this.xmlConfigHC.Colors.Team.TeamBonus.Enable == "true")
         {
            this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PTPartyListHeader_mc.PTPartyHeaderBonus_mc.Bonus_tf.textColor = Number("0x" + this.xmlConfigHC.Colors.Team.TeamBonus.Hex);
            this.topLevel.PartyResolutionContainer_mc.HUDPartyListBase_mc.PTPartyListHeader_mc.PTPartyHeaderBonus_mc.BonusMultiplier_tf.textColor = Number("0x" + this.xmlConfigHC.Colors.Team.TeamBonus.Hex);
         }
         if(this.xmlConfigHC.Colors.QuestTracker.Enable == "true")
         {
            this.topLevel.TopRightGroup_mc.NewQuestTracker_mc.filters = [QuestTrackerColorMatrix];
         }
         if(this.xmlConfigHC.Colors.StealthMeter.Enable == "true")
         {
            if(this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == "HIDDEN" || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == HiddenText)
            {
               this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.textColor = Number("0x" + this.xmlConfigHC.Colors.StealthMeter.Hidden);
               this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.BracketRightInstance.filters = [SMHiddenColorMatrix];
               this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.BracketLeftInstance.filters = [SMHiddenColorMatrix];
            }
            if(this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == "DETECTED" || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == DetectedText)
            {
               this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.textColor = Number("0x" + this.xmlConfigHC.Colors.StealthMeter.Detected);
               this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.BracketRightInstance.filters = [SMDetectedColorMatrix];
               this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.BracketLeftInstance.filters = [SMDetectedColorMatrix];
            }
            if(this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == "CAUTION" || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == CautionText)
            {
               this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.textColor = Number("0x" + this.xmlConfigHC.Colors.StealthMeter.Caution);
               this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.BracketRightInstance.filters = [SMCautionColorMatrix];
               this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.BracketLeftInstance.filters = [SMCautionColorMatrix];
            }
            if(this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == "DANGER" || this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.text == DangerText)
            {
               this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.stealthTextStates.stealthTextAnimStates.StealthTextInstance.textColor = Number("0x" + this.xmlConfigHC.Colors.StealthMeter.Danger);
               this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.BracketRightInstance.filters = [SMDangerColorMatrix];
               this.topLevel.TopCenterGroup_mc.StealthMeter_mc.Internal_mc.BracketLeftInstance.filters = [SMDangerColorMatrix];
            }
         }
         if(this.xmlConfigHC.Colors.Compass.Enable == "true")
         {
            this.topLevel.BottomCenterGroup_mc.CompassWidget_mc.filters = [CompassColorMatrix];
            if(this.xmlConfigHC.Colors.Compass.TZMapMarkers == "true")
            {
               this.topLevel.BottomCenterGroup_mc.CompassWidget_mc.QuestMarkerHolder_mc.filters = [CompassInvColorMatrix];
               jj = 5;
               while(jj < this.topLevel.BottomCenterGroup_mc.CompassWidget_mc.OtherMarkerHolder_mc.numChildren)
               {
                  this.topLevel.BottomCenterGroup_mc.CompassWidget_mc.OtherMarkerHolder_mc.getChildAt(jj).filters = [CompassInvColorMatrix];
                  jj++;
               }
            }
            else
            {
               this.topLevel.BottomCenterGroup_mc.CompassWidget_mc.QuestMarkerHolder_mc.filters = null;
               jjj = 5;
               while(jjj < this.topLevel.BottomCenterGroup_mc.CompassWidget_mc.OtherMarkerHolder_mc.numChildren)
               {
                  if(this.topLevel.BottomCenterGroup_mc.CompassWidget_mc.OtherMarkerHolder_mc.getChildAt(jjj).currentFrameLabel == "Enemy")
                  {
                     this.topLevel.BottomCenterGroup_mc.CompassWidget_mc.OtherMarkerHolder_mc.getChildAt(jjj).filters = [CompassInvColorMatrix];
                  }
                  else
                  {
                     this.topLevel.BottomCenterGroup_mc.CompassWidget_mc.OtherMarkerHolder_mc.getChildAt(jjj).filters = null;
                  }
                  jjj++;
               }
            }
         }
         if(this.xmlConfigHC.Colors.CritMeter.Enable == "true")
         {
            this.topLevel.BottomCenterGroup_mc.CritMeter_mc.filters = [CritMeterColorMatrix];
         }
         if(this.xmlConfigHC.Colors.EnemyHealthMeter.Enable == "true")
         {
            this.topLevel.TopCenterGroup_mc.EnemyHealthMeter_mc.filters = [EnemyHealthMeterColorMatrix];
         }
         this.topLevel.CenterGroup_mc.HUDCrosshair_mc.alpha = Number(this.xmlConfigHC.OtherImprovements.Crosshair.CrosshairOpacity);
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
            displayText("Error finding HUDEditor configuration file. " + error.message.toString());
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
         if(this.xmlConfigHC.OtherImprovements.EnemyHealthMeter.ShowHealthPercent == "true")
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
         else if(this.xmlConfigHC.OtherImprovements.EnemyHealthMeter.ShowHealthPercent == "false")
         {
            this.showHealthText.visible = false;
         }
         else if(this.xmlConfigHC.OtherImprovements.EnemyHealthMeter.ShowHealthPercent == undefined)
         {
            this.showHealthText.visible = false;
         }
      }
   }
}
