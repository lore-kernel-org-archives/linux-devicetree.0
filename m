From: Guillaume La Roque <glaroque@baylibre.com>
Subject: [PATCH v3 1/2] dt-bindings: clk: g12a-clkc: add Temperature Sensor clock ID
Date: Fri, 12 Apr 2019 12:02:20 +0200
Message-ID: <20190412100221.26740-2-glaroque@baylibre.com>
References: <20190412100221.26740-1-glaroque@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412100221.26740-1-glaroque@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jbrunet@baylibre.com, narmstrong@baylibre.com, khilman@baylibre.com, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add clock id used by temperature sensor for G12A Socs

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 include/dt-bindings/clock/g12a-clkc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index 82c9e0c020b2..cfda463091b7 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -136,5 +136,6 @@
 #define CLKID_VDEC_1				204
 #define CLKID_VDEC_HEVC				207
 #define CLKID_VDEC_HEVCF			210
+#define CLKID_TS				212
 
 #endif /* __G12A_CLKC_H */
-- 
2.17.1
