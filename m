From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 2/5] ath9k: Set the "big endian" bit of the AR9003 EEPROM templates
Date: Sun, 21 Aug 2016 16:49:03 +0200
Message-ID: <20160821144906.30984-3-martin.blumenstingl@googlemail.com>
References: <20160821144906.30984-1-martin.blumenstingl@googlemail.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160821144906.30984-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ath9k-devel-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath9k-devel-xDcbHBWguxHbcTqmT+pZeQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, nbd-Vt+b4OUoWG0@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

We will default to the system's native endianness for the eepmisc value.
This may be overwritten by the actual calibration data. If it is not
overwritten we interpret the template data in it's native endianness,
meaning that no swapping is required.
---
 drivers/net/wireless/ath/ath9k/ar9003_eeprom.c | 10 +++++-----
 drivers/net/wireless/ath/ath9k/ar9003_eeprom.h |  6 ++++++
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/ar9003_eeprom.c b/drivers/net/wireless/ath/ath9k/ar9003_eeprom.c
index ea7b819..6669e36 100644
--- a/drivers/net/wireless/ath/ath9k/ar9003_eeprom.c
+++ b/drivers/net/wireless/ath/ath9k/ar9003_eeprom.c
@@ -53,7 +53,7 @@ static const struct ar9300_eeprom ar9300_default = {
 		.txrxMask =  0x77, /* 4 bits tx and 4 bits rx */
 		.opCapFlags = {
 			.opFlags = AR5416_OPFLAGS_11G | AR5416_OPFLAGS_11A,
-			.eepMisc = 0,
+			.eepMisc = AR9300_EEPMISC_DEFAULT_VALUE,
 		},
 		.rfSilent = 0,
 		.blueToothOptions = 0,
@@ -631,7 +631,7 @@ static const struct ar9300_eeprom ar9300_x113 = {
 		.txrxMask =  0x77, /* 4 bits tx and 4 bits rx */
 		.opCapFlags = {
 			.opFlags = AR5416_OPFLAGS_11A,
-			.eepMisc = 0,
+			.eepMisc = AR9300_EEPMISC_DEFAULT_VALUE,
 		},
 		.rfSilent = 0,
 		.blueToothOptions = 0,
@@ -1210,7 +1210,7 @@ static const struct ar9300_eeprom ar9300_h112 = {
 		.txrxMask =  0x77, /* 4 bits tx and 4 bits rx */
 		.opCapFlags = {
 			.opFlags = AR5416_OPFLAGS_11G | AR5416_OPFLAGS_11A,
-			.eepMisc = 0,
+			.eepMisc = AR9300_EEPMISC_DEFAULT_VALUE,
 		},
 		.rfSilent = 0,
 		.blueToothOptions = 0,
@@ -1789,7 +1789,7 @@ static const struct ar9300_eeprom ar9300_x112 = {
 		.txrxMask =  0x77, /* 4 bits tx and 4 bits rx */
 		.opCapFlags = {
 			.opFlags = AR5416_OPFLAGS_11G | AR5416_OPFLAGS_11A,
-			.eepMisc = 0,
+			.eepMisc = AR9300_EEPMISC_DEFAULT_VALUE,
 		},
 		.rfSilent = 0,
 		.blueToothOptions = 0,
@@ -2367,7 +2367,7 @@ static const struct ar9300_eeprom ar9300_h116 = {
 		.txrxMask =  0x33, /* 4 bits tx and 4 bits rx */
 		.opCapFlags = {
 			.opFlags = AR5416_OPFLAGS_11G | AR5416_OPFLAGS_11A,
-			.eepMisc = 0,
+			.eepMisc = AR9300_EEPMISC_DEFAULT_VALUE,
 		},
 		.rfSilent = 0,
 		.blueToothOptions = 0,
diff --git a/drivers/net/wireless/ath/ath9k/ar9003_eeprom.h b/drivers/net/wireless/ath/ath9k/ar9003_eeprom.h
index 0a4c736..7e06f12 100644
--- a/drivers/net/wireless/ath/ath9k/ar9003_eeprom.h
+++ b/drivers/net/wireless/ath/ath9k/ar9003_eeprom.h
@@ -69,6 +69,12 @@
 #define AR9300_BASE_ADDR 0x3ff
 #define AR9300_BASE_ADDR_512 0x1ff
 
+#ifdef __BIG_ENDIAN
+#define AR9300_EEPMISC_DEFAULT_VALUE AR5416_EEPMISC_BIG_ENDIAN
+#else
+#define AR9300_EEPMISC_DEFAULT_VALUE 0
+#endif
+
 #define AR9300_OTP_BASE \
 		((AR_SREV_9340(ah) || AR_SREV_9550(ah)) ? 0x30000 : 0x14000)
 #define AR9300_OTP_STATUS \
-- 
2.9.3
