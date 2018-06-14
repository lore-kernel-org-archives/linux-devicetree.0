From: Michel Pollet <michel.pollet@bp.renesas.com>
Subject: [PATCH v1 4/5] ARM: dts: Renesas R9A06G032 pinctrl node
Date: Thu, 14 Jun 2018 12:00:20 +0100
Message-ID: <1528974029-29617-5-git-send-email-michel.pollet@bp.renesas.com>
References: <1528974029-29617-1-git-send-email-michel.pollet@bp.renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528974029-29617-1-git-send-email-michel.pollet@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>
Cc: phil.edworthy@renesas.com, Michel Pollet <buserror+upstream@gmail.com>, Michel Pollet <michel.pollet@bp.renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This provides a pinctrl driver for the Renesas R9A06G032 SoC

Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
---
 arch/arm/boot/dts/r9a06g032.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
index 3e45375..fbad039 100644
--- a/arch/arm/boot/dts/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/r9a06g032.dtsi
@@ -88,6 +88,14 @@
 			status = "disabled";
 		};
 
+		pinctrl: pinctrl@40067000 {
+			compatible = "renesas,r9a06g032-pinctrl";
+			reg = <0x40067000 0x1000>, <0x51000000 0x800>;
+			clocks = <&sysctrl R9A06G032_HCLK_PINCONFIG>;
+			clock-names = "bus";
+			status = "okay";
+		};
+
 		gic: gic@44101000 {
 			compatible = "arm,cortex-a7-gic", "arm,gic-400";
 			interrupt-controller;
-- 
2.7.4
