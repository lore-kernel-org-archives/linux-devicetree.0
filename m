From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 1/2] dt-bindings: clock: meson8b: export the video decoder clocks
Date: Sun, 24 Mar 2019 16:14:22 +0100
Message-ID: <20190324151423.19063-2-martin.blumenstingl@googlemail.com>
References: <20190324151423.19063-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190324151423.19063-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: narmstrong@baylibre.com, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org, mjourdan@baylibre.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

Export the four video decoder clocks so they can be used by the video
decoder driver:
- VDEC_1
- VDEC_HCODEC
- VDEC_2
- VDEC_HEVC

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 include/dt-bindings/clock/meson8b-clkc.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
index 2ac9469a1c27..47556539f0ee 100644
--- a/include/dt-bindings/clock/meson8b-clkc.h
+++ b/include/dt-bindings/clock/meson8b-clkc.h
@@ -108,5 +108,9 @@
 #define CLKID_AXI		128
 #define CLKID_L2_DRAM		130
 #define CLKID_VPU		190
+#define CLKID_VDEC_1		196
+#define CLKID_VDEC_HCODEC	199
+#define CLKID_VDEC_2		202
+#define CLKID_VDEC_HEVC		206
 
 #endif /* __MESON8B_CLKC_H */
-- 
2.21.0
