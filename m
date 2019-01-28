From: Loys Ollivier <lollivier@baylibre.com>
Subject: [PATCH v3 3/4] gnss: add mtk receiver type support
Date: Mon, 28 Jan 2019 17:38:00 +0100
Message-ID: <1548693481-1162-4-git-send-email-lollivier@baylibre.com>
References: <1548693481-1162-1-git-send-email-lollivier@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548693481-1162-1-git-send-email-lollivier@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>
Cc: Loys Ollivier <lollivier@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

Add an MTK (Mediatek) type to the "GNSS_TYPE" attribute.

Note that MTK receivers support a subset of NMEA 0183 with vendor
extensions.

Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
---

v3:
Moved the gnss_type_names string addition to this patch.
Edited the commit message to remove the reference to a vendor protocol.

v2: renamed from GTOP to MTK.

 drivers/gnss/core.c  | 1 +
 include/linux/gnss.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gnss/core.c b/drivers/gnss/core.c
index 4291a0dd22aa..320cfca80d5f 100644
--- a/drivers/gnss/core.c
+++ b/drivers/gnss/core.c
@@ -334,6 +334,7 @@ static const char * const gnss_type_names[GNSS_TYPE_COUNT] = {
 	[GNSS_TYPE_NMEA]	= "NMEA",
 	[GNSS_TYPE_SIRF]	= "SiRF",
 	[GNSS_TYPE_UBX]		= "UBX",
+	[GNSS_TYPE_MTK]		= "MTK",
 };
 
 static const char *gnss_type_name(struct gnss_device *gdev)
diff --git a/include/linux/gnss.h b/include/linux/gnss.h
index 43546977098c..36968a0f33e8 100644
--- a/include/linux/gnss.h
+++ b/include/linux/gnss.h
@@ -22,6 +22,7 @@ enum gnss_type {
 	GNSS_TYPE_NMEA = 0,
 	GNSS_TYPE_SIRF,
 	GNSS_TYPE_UBX,
+	GNSS_TYPE_MTK,
 
 	GNSS_TYPE_COUNT
 };
-- 
2.7.4
