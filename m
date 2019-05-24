From: Gareth Williams <gareth.williams.jx@renesas.com>
Subject: [PATCH v3 1/2] dt-bindings: clock: renesas,r9a06g032-sysctrl: Document power Domains
Date: Fri, 24 May 2019 16:31:43 +0100
Message-ID: <1558711904-27278-2-git-send-email-gareth.williams.jx@renesas.com>
References: <1558711904-27278-1-git-send-email-gareth.williams.jx@renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558711904-27278-1-git-send-email-gareth.williams.jx@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Phil Edworthy <phil.edworthy@renesas.com>
Cc: Gareth Williams <gareth.williams.jx@renesas.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The driver is gaining power domain support, so add the new property
to the DT binding and update the examples.

Signed-off-by: Gareth Williams <gareth.williams.jx@renesas.com>
---
 Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.txt b/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.txt
index d60b997..6c706cd 100644
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
@@ -40,4 +42,5 @@ Examples
 		reg-io-width = <4>;
 		clocks = <&sysctrl R9A06G032_CLK_UART0>;
 		clock-names = "baudclk";
+		power-domains = <&sysctrl>;
 	};
-- 
2.7.4
