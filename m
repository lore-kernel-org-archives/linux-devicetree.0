From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH v2 5/5] phy: amlogic: phy-meson-gxl-usb2: rename some of the U2P_R2 registers
Date: Mon, 12 Feb 2018 23:39:28 +0100
Message-ID: <20180212223928.22993-6-martin.blumenstingl@googlemail.com>
References: <20180212223928.22993-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180212223928.22993-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kishon-l0cyMroinI0@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The U2P_R2 register provides "test mode" functionality for bits 17:0.
These are only used during SoC development and should be left untouched
on production SoC versions.
Rename these register definitions to indicate that these are for "test
mode" only.

While here, also merge the definitions for U2P_R2_DATA_IN_MASK and
U2P_R2_DATA_IN_EN_MASK (bits 0:7) because Amlogic's internal
documentation suggests that these bits belong together. The old
definition was not taken from the documentation but rather from a struct
definition in the Amlogic GPL kernel sources.

No functional changes.

Suggested-by: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Tested-by: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
---
 drivers/phy/amlogic/phy-meson-gxl-usb2.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson-gxl-usb2.c b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
index f062fc7f0a3a..9f9b5414b97a 100644
--- a/drivers/phy/amlogic/phy-meson-gxl-usb2.c
+++ b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
@@ -71,12 +71,11 @@
 
 /* bits [31:14] are read-only */
 #define U2P_R2							0x8
-	#define U2P_R2_DATA_IN_MASK				GENMASK(3, 0)
-	#define U2P_R2_DATA_IN_EN_MASK				GENMASK(7, 4)
-	#define U2P_R2_ADDR_MASK				GENMASK(11, 8)
-	#define U2P_R2_DATA_OUT_SEL				BIT(12)
-	#define U2P_R2_CLK					BIT(13)
-	#define U2P_R2_DATA_OUT_MASK				GENMASK(17, 14)
+	#define U2P_R2_TESTDATA_IN_MASK				GENMASK(7, 0)
+	#define U2P_R2_TESTADDR_MASK				GENMASK(11, 8)
+	#define U2P_R2_TESTDATA_OUT_SEL				BIT(12)
+	#define U2P_R2_TESTCLK					BIT(13)
+	#define U2P_R2_TESTDATA_OUT_MASK			GENMASK(17, 14)
 	#define U2P_R2_ACA_PIN_RANGE_C				BIT(18)
 	#define U2P_R2_ACA_PIN_RANGE_B				BIT(19)
 	#define U2P_R2_ACA_PIN_RANGE_A				BIT(20)
-- 
2.16.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
