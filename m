From: Gareth Williams <gareth.williams.jx@renesas.com>
Subject: [PATCH v4 1/2] dt-bindings: clock: renesas,r9a06g032-sysctrl: Document power Domains
Date: Tue, 28 May 2019 12:54:26 +0100
Message-ID: <1559044467-2639-2-git-send-email-gareth.williams.jx@renesas.com>
References: <1559044467-2639-1-git-send-email-gareth.williams.jx@renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559044467-2639-1-git-send-email-gareth.williams.jx@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Phil Edworthy <phil.edworthy@renesas.com>
Cc: Gareth Williams <gareth.williams.jx@renesas.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The driver is gaining power domain support, so add the new property
to the DT binding and update the examples.

Signed-off-by: Gareth Williams <gareth.williams.jx@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
 - Added missing HCLK to UART0 example to show the clock added
   to the driver.
 - Added Geert's Reviewed-by line.
v3:
 - Added new #power-domain-cells property to the required properties.
 - Added "#power-domain-cells" and "power-domains" lines to examples.
v2:
 - No changes.
---
 .../devicetree/bindings/clock/renesas,r9a06g032-sysctrl.txt        | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.txt b/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.txt
index d60b997..30adb4c 100644
--- a/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.txt
@@ -13,6 +13,7 @@ Required Properties:
 	- external (optional) RGMII_REFCLK
   - clock-names: Must be:
         clock-names = "mclk", "rtc", "jtag", "rgmii_ref_ext";
+  - #power-domain-cells : Must be 0
 
 Examples
 --------
@@ -27,6 +28,7 @@ Examples
 		clocks = <&ext_mclk>, <&ext_rtc_clk>,
 				<&ext_jtag_clk>, <&ext_rgmii_ref>;
 		clock-names = "mclk", "rtc", "jtag", "rgmii_ref_ext";
+		#power-domain-cells = <0>;
 	};
 
   - Other nodes can use the clocks provided by SYSCTRL as in:
@@ -38,6 +40,7 @@ Examples
 		interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
 		reg-shift = <2>;
 		reg-io-width = <4>;
-		clocks = <&sysctrl R9A06G032_CLK_UART0>;
-		clock-names = "baudclk";
+		clocks = <&sysctrl R9A06G032_CLK_UART0>, <&sysctrl R9A06G032_HCLK_UART0>;
+		clock-names = "baudclk", "apb_pclk";
+		power-domains = <&sysctrl>;
 	};
-- 
2.7.4
