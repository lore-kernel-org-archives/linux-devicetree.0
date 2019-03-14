From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 3/5] media: uapi: Add RGB bus formats for the GiantPlus GPM940B0 panel
Date: Thu, 14 Mar 2019 13:26:20 +0100
Message-ID: <20190314122622.7597-3-paul@crapouillou.net>
References: <20190314122622.7597-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190314122622.7597-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: od@zcrc.me, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

The GiantPlus GPM940B0 is a 24-bit TFT panel where the RGB components
are transferred sequentially on a 8-bit bus.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: New patch

 include/uapi/linux/media-bus-format.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index d6a5a3bfe6c4..f31724d6cd40 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -34,7 +34,7 @@
 
 #define MEDIA_BUS_FMT_FIXED			0x0001
 
-/* RGB - next is	0x101b */
+/* RGB - next is	0x101d */
 #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
@@ -54,6 +54,8 @@
 #define MEDIA_BUS_FMT_RGB888_1X24		0x100a
 #define MEDIA_BUS_FMT_RGB888_2X12_BE		0x100b
 #define MEDIA_BUS_FMT_RGB888_2X12_LE		0x100c
+#define MEDIA_BUS_FMT_RGB888_3X8_BE		0x101b
+#define MEDIA_BUS_FMT_RGB888_3X8_LE		0x101c
 #define MEDIA_BUS_FMT_RGB888_1X7X4_SPWG		0x1011
 #define MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA	0x1012
 #define MEDIA_BUS_FMT_ARGB8888_1X32		0x100d
-- 
2.11.0
