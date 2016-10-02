From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH v2 2/7] ath9k: indicate that the AR9003 EEPROM template values are little endian
Date: Mon,  3 Oct 2016 00:29:08 +0200
Message-ID: <20161002222913.12223-3-martin.blumenstingl@googlemail.com>
References: <20160821144906.30984-1-martin.blumenstingl@googlemail.com>
 <20161002222913.12223-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161002222913.12223-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ath9k-devel-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath9k-devel-xDcbHBWguxHbcTqmT+pZeQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, nbd-Vt+b4OUoWG0@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The eepMisc field was not set explicitly. The default value of 0 means
that the values in the EEPROM (template) should be interpreted as little
endian. However, this is not clear until comparing the AR9003 code with
the other EEPROM formats.
To make the code easier to understand we explicitly state that the values
are little endian - there are no functional changes with this patch.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 drivers/net/wireless/ath/ath9k/ar9003_eeprom.c | 10 +++++-----
 drivers/net/wireless/ath/ath9k/ar9003_eeprom.h |  3 +++
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/ar9003_eeprom.c b/drivers/net/wireless/ath/ath9k/ar9003_eeprom.c
index ea7b819..270d4ae 100644
--- a/drivers/net/wireless/ath/ath9k/ar9003_eeprom.c
+++ b/drivers/net/wireless/ath/ath9k/ar9003_eeprom.c
@@ -53,7 +53,7 @@ static const struct ar9300_eeprom ar9300_default = {
 		.txrxMask =  0x77, /* 4 bits tx and 4 bits rx */
 		.opCapFlags = {
 			.opFlags = AR5416_OPFLAGS_11G | AR5416_OPFLAGS_11A,
-			.eepMisc = 0,
+			.eepMisc = AR9300_EEPMISC_LITTLE_ENDIAN,
 		},
 		.rfSilent = 0,
 		.blueToothOptions = 0,
@@ -631,7 +631,7 @@ static const struct ar9300_eeprom ar9300_x113 = {
 		.txrxMask =  0x77, /* 4 bits tx and 4 bits rx */
 		.opCapFlags = {
 			.opFlags = AR5416_OPFLAGS_11A,
-			.eepMisc = 0,
+			.eepMisc = AR9300_EEPMISC_LITTLE_ENDIAN,
 		},
 		.rfSilent = 0,
 		.blueToothOptions = 0,
@@ -1210,7 +1210,7 @@ static const struct ar9300_eeprom ar9300_h112 = {
 		.txrxMask =  0x77, /* 4 bits tx and 4 bits rx */
 		.opCapFlags = {
 			.opFlags = AR5416_OPFLAGS_11G | AR5416_OPFLAGS_11A,
-			.eepMisc = 0,
+			.eepMisc = AR9300_EEPMISC_LITTLE_ENDIAN,
 		},
 		.rfSilent = 0,
 		.blueToothOptions = 0,
@@ -1789,7 +1789,7 @@ static const struct ar9300_eeprom ar9300_x112 = {
 		.txrxMask =  0x77, /* 4 bits tx and 4 bits rx */
 		.opCapFlags = {
 			.opFlags = AR5416_OPFLAGS_11G | AR5416_OPFLAGS_11A,
-			.eepMisc = 0,
+			.eepMisc = AR9300_EEPMISC_LITTLE_ENDIAN,
 		},
 		.rfSilent = 0,
 		.blueToothOptions = 0,
@@ -2367,7 +2367,7 @@ static const struct ar9300_eeprom ar9300_h116 = {
 		.txrxMask =  0x33, /* 4 bits tx and 4 bits rx */
 		.opCapFlags = {
 			.opFlags = AR5416_OPFLAGS_11G | AR5416_OPFLAGS_11A,
-			.eepMisc = 0,
+			.eepMisc = AR9300_EEPMISC_LITTLE_ENDIAN,
 		},
 		.rfSilent = 0,
 		.blueToothOptions = 0,
diff --git a/drivers/net/wireless/ath/ath9k/ar9003_eeprom.h b/drivers/net/wireless/ath/ath9k/ar9003_eeprom.h
index 0a4c736..7dc7205 100644
--- a/drivers/net/wireless/ath/ath9k/ar9003_eeprom.h
+++ b/drivers/net/wireless/ath/ath9k/ar9003_eeprom.h
@@ -69,6 +69,9 @@
 #define AR9300_BASE_ADDR 0x3ff
 #define AR9300_BASE_ADDR_512 0x1ff
 
+/* AR5416_EEPMISC_BIG_ENDIAN not set indicates little endian */
+#define AR9300_EEPMISC_LITTLE_ENDIAN 0
+
 #define AR9300_OTP_BASE \
 		((AR_SREV_9340(ah) || AR_SREV_9550(ah)) ? 0x30000 : 0x14000)
 #define AR9300_OTP_STATUS \
-- 
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
