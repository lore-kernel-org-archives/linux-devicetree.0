From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH v2 1/7] ath9k: Add a #define for the EEPROM "eepmisc" endianness bit
Date: Mon,  3 Oct 2016 00:29:07 +0200
Message-ID: <20161002222913.12223-2-martin.blumenstingl@googlemail.com>
References: <20160821144906.30984-1-martin.blumenstingl@googlemail.com>
 <20161002222913.12223-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161002222913.12223-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ath9k-devel-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath9k-devel-xDcbHBWguxHbcTqmT+pZeQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, nbd-Vt+b4OUoWG0@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This replaces a magic number with a named #define. Additionally it
removes two "eeprom format" specific #defines for the "big endianness"
bit which are the same on all eeprom formats.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 drivers/net/wireless/ath/ath9k/ar9003_eeprom.c | 3 ++-
 drivers/net/wireless/ath/ath9k/ar9003_eeprom.h | 1 -
 drivers/net/wireless/ath/ath9k/eeprom.h        | 4 +++-
 drivers/net/wireless/ath/ath9k/eeprom_4k.c     | 2 +-
 drivers/net/wireless/ath/ath9k/eeprom_9287.c   | 2 +-
 drivers/net/wireless/ath/ath9k/eeprom_def.c    | 2 +-
 6 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/ar9003_eeprom.c b/drivers/net/wireless/ath/ath9k/ar9003_eeprom.c
index 08607d7..ea7b819 100644
--- a/drivers/net/wireless/ath/ath9k/ar9003_eeprom.c
+++ b/drivers/net/wireless/ath/ath9k/ar9003_eeprom.c
@@ -3468,7 +3468,8 @@ static u32 ath9k_hw_ar9003_dump_eeprom(struct ath_hw *ah, bool dump_base_hdr,
 					AR5416_OPFLAGS_N_5G_HT20));
 	PR_EEP("Disable 5Ghz HT40", !!(pBase->opCapFlags.opFlags &
 					AR5416_OPFLAGS_N_5G_HT40));
-	PR_EEP("Big Endian", !!(pBase->opCapFlags.eepMisc & 0x01));
+	PR_EEP("Big Endian", !!(pBase->opCapFlags.eepMisc &
+				AR5416_EEPMISC_BIG_ENDIAN));
 	PR_EEP("RF Silent", pBase->rfSilent);
 	PR_EEP("BT option", pBase->blueToothOptions);
 	PR_EEP("Device Cap", pBase->deviceCap);
diff --git a/drivers/net/wireless/ath/ath9k/ar9003_eeprom.h b/drivers/net/wireless/ath/ath9k/ar9003_eeprom.h
index 107bcfb..0a4c736 100644
--- a/drivers/net/wireless/ath/ath9k/ar9003_eeprom.h
+++ b/drivers/net/wireless/ath/ath9k/ar9003_eeprom.h
@@ -38,7 +38,6 @@
 #define AR9300_NUM_CTLS_2G           12
 #define AR9300_NUM_BAND_EDGES_5G     8
 #define AR9300_NUM_BAND_EDGES_2G     4
-#define AR9300_EEPMISC_BIG_ENDIAN    0x01
 #define AR9300_EEPMISC_WOW           0x02
 #define AR9300_CUSTOMER_DATA_SIZE    20
 
diff --git a/drivers/net/wireless/ath/ath9k/eeprom.h b/drivers/net/wireless/ath/ath9k/eeprom.h
index 4465c65..c466ada 100644
--- a/drivers/net/wireless/ath/ath9k/eeprom.h
+++ b/drivers/net/wireless/ath/ath9k/eeprom.h
@@ -161,6 +161,9 @@
 #define AR5416_EEP_TXGAIN_ORIGINAL         0
 #define AR5416_EEP_TXGAIN_HIGH_POWER       1
 
+/* Endianness of EEPROM content */
+#define AR5416_EEPMISC_BIG_ENDIAN          0x01
+
 #define AR5416_EEP4K_START_LOC                64
 #define AR5416_EEP4K_NUM_2G_CAL_PIERS         3
 #define AR5416_EEP4K_NUM_2G_CCK_TARGET_POWERS 3
@@ -191,7 +194,6 @@
 #define AR9287_NUM_CTLS              	12
 #define AR9287_NUM_BAND_EDGES        	4
 #define AR9287_PD_GAIN_ICEPTS           1
-#define AR9287_EEPMISC_BIG_ENDIAN       0x01
 #define AR9287_EEPMISC_WOW              0x02
 #define AR9287_MAX_CHAINS               2
 #define AR9287_ANT_16S                  32
diff --git a/drivers/net/wireless/ath/ath9k/eeprom_4k.c b/drivers/net/wireless/ath/ath9k/eeprom_4k.c
index 5da0826..780cb49 100644
--- a/drivers/net/wireless/ath/ath9k/eeprom_4k.c
+++ b/drivers/net/wireless/ath/ath9k/eeprom_4k.c
@@ -154,7 +154,7 @@ static u32 ath9k_hw_4k_dump_eeprom(struct ath_hw *ah, bool dump_base_hdr,
 					AR5416_OPFLAGS_N_5G_HT20));
 	PR_EEP("Disable 5Ghz HT40", !!(pBase->opCapFlags &
 					AR5416_OPFLAGS_N_5G_HT40));
-	PR_EEP("Big Endian", !!(pBase->eepMisc & 0x01));
+	PR_EEP("Big Endian", !!(pBase->eepMisc & AR5416_EEPMISC_BIG_ENDIAN));
 	PR_EEP("Cal Bin Major Ver", (pBase->binBuildNumber >> 24) & 0xFF);
 	PR_EEP("Cal Bin Minor Ver", (pBase->binBuildNumber >> 16) & 0xFF);
 	PR_EEP("Cal Bin Build", (pBase->binBuildNumber >> 8) & 0xFF);
diff --git a/drivers/net/wireless/ath/ath9k/eeprom_9287.c b/drivers/net/wireless/ath/ath9k/eeprom_9287.c
index 1a019a3..f483ba2 100644
--- a/drivers/net/wireless/ath/ath9k/eeprom_9287.c
+++ b/drivers/net/wireless/ath/ath9k/eeprom_9287.c
@@ -150,7 +150,7 @@ static u32 ath9k_hw_ar9287_dump_eeprom(struct ath_hw *ah, bool dump_base_hdr,
 					AR5416_OPFLAGS_N_5G_HT20));
 	PR_EEP("Disable 5Ghz HT40", !!(pBase->opCapFlags &
 					AR5416_OPFLAGS_N_5G_HT40));
-	PR_EEP("Big Endian", !!(pBase->eepMisc & 0x01));
+	PR_EEP("Big Endian", !!(pBase->eepMisc & AR5416_EEPMISC_BIG_ENDIAN));
 	PR_EEP("Cal Bin Major Ver", (pBase->binBuildNumber >> 24) & 0xFF);
 	PR_EEP("Cal Bin Minor Ver", (pBase->binBuildNumber >> 16) & 0xFF);
 	PR_EEP("Cal Bin Build", (pBase->binBuildNumber >> 8) & 0xFF);
diff --git a/drivers/net/wireless/ath/ath9k/eeprom_def.c b/drivers/net/wireless/ath/ath9k/eeprom_def.c
index 959682f..39b1b27 100644
--- a/drivers/net/wireless/ath/ath9k/eeprom_def.c
+++ b/drivers/net/wireless/ath/ath9k/eeprom_def.c
@@ -232,7 +232,7 @@ static u32 ath9k_hw_def_dump_eeprom(struct ath_hw *ah, bool dump_base_hdr,
 					AR5416_OPFLAGS_N_5G_HT20));
 	PR_EEP("Disable 5Ghz HT40", !!(pBase->opCapFlags &
 					AR5416_OPFLAGS_N_5G_HT40));
-	PR_EEP("Big Endian", !!(pBase->eepMisc & 0x01));
+	PR_EEP("Big Endian", !!(pBase->eepMisc & AR5416_EEPMISC_BIG_ENDIAN));
 	PR_EEP("Cal Bin Major Ver", (pBase->binBuildNumber >> 24) & 0xFF);
 	PR_EEP("Cal Bin Minor Ver", (pBase->binBuildNumber >> 16) & 0xFF);
 	PR_EEP("Cal Bin Build", (pBase->binBuildNumber >> 8) & 0xFF);
-- 
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
