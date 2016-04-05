From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH 3/6] ARM: dts: add pincontroller to pxa27x
Date: Tue,  5 Apr 2016 08:35:52 +0200
Message-ID: <1459838155-28803-3-git-send-email-robert.jarzmik@free.fr>
References: <1459838155-28803-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459838155-28803-1-git-send-email-robert.jarzmik@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the new pincontrol driver to pxa27x based boards.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 arch/arm/boot/dts/pxa27x.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/pxa27x.dtsi b/arch/arm/boot/dts/pxa27x.dtsi
index 210192c38df3..9e73dc6b3ed3 100644
--- a/arch/arm/boot/dts/pxa27x.dtsi
+++ b/arch/arm/boot/dts/pxa27x.dtsi
@@ -22,8 +22,15 @@
 			marvell,intc-nr-irqs = <34>;
 		};
 
+		pinctrl: pinctrl@40e00000 {
+			reg = <0x40e00054 0x20 0x40e0000c 0xc 0x40e0010c 4
+			       0x40f00020 0x10>;
+			compatible = "marvell,pxa27x-pinctrl";
+		};
+
 		gpio: gpio@40e00000 {
 			compatible = "intel,pxa27x-gpio";
+			gpio-ranges = <&pinctrl 0 0 128>;
 			clocks = <&clks CLK_NONE>;
 		};
 
-- 
2.1.4
