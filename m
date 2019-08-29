From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 1/2] dt-bindings: interrupt-controller: new binding for the meson sm1 SoCs
Date: Thu, 29 Aug 2019 18:16:34 +0200
Message-ID: <20190829161635.25067-2-jbrunet@baylibre.com>
References: <20190829161635.25067-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190829161635.25067-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Update the dt-binding to add support for the sm1 SoC family in the
amlogic GPIO interrupt controller driver.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/interrupt-controller/amlogic,meson-gpio-intc.txt    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
index 7d531d5fff29..684bb1cd75ec 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
@@ -16,6 +16,7 @@ Required properties:
     "amlogic,meson-gxl-gpio-intc" for GXL SoCs (S905X, S912)
     "amlogic,meson-axg-gpio-intc" for AXG SoCs (A113D, A113X)
     "amlogic,meson-g12a-gpio-intc" for G12A SoCs (S905D2, S905X2, S905Y2)
+    "amlogic,meson-sm1-gpio-intc" for SM1 SoCs (S905D3, S905X3, S905Y3)
 - reg : Specifies base physical address and size of the registers.
 - interrupt-controller : Identifies the node as an interrupt controller.
 - #interrupt-cells : Specifies the number of cells needed to encode an
-- 
2.21.0
