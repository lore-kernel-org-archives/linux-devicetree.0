From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 1/3] dt-bindings: amlogic: Add Internal Clock Measurer bindings
Date: Wed, 14 Nov 2018 14:16:25 +0100
Message-ID: <20181114131627.17766-2-narmstrong@baylibre.com>
References: <20181114131627.17766-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181114131627.17766-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: khilman@baylibre.com, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Amlogic Meson GX SoCs embeds a clock measurer IP to measure the internal
clock paths frequencies.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/soc/amlogic/clk-measure.txt          | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt

diff --git a/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt b/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
new file mode 100644
index 000000000000..ba9183a42032
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
@@ -0,0 +1,15 @@
+Amlogic Internal Clock Measurer
+===============================
+
+The Amlogic SoCs contains an IP to measure the internal clocks.
+The precision is multiple of MHz, useful to debug the clock states.
+
+Required properties:
+- compatible: Shall contain "amlogic,meson-gx-clk-measure"
+- reg: base address and size of the Clock Measurer register space.
+
+Example:
+	clock-measure@8758 {
+		compatible = "amlogic,meson-gx-clk-measure";
+		reg = <0x0 0x8758 0x0 0x10>;
+	};
-- 
2.19.1
