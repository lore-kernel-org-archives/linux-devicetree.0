From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH 5/6] ARM: dts: pxa: add pinctrl to pxa3xx
Date: Tue,  5 Apr 2016 08:35:54 +0200
Message-ID: <1459838155-28803-5-git-send-email-robert.jarzmik@free.fr>
References: <1459838155-28803-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459838155-28803-1-git-send-email-robert.jarzmik@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add pincontrol to pxa3xx, based on pinconf-simple.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 arch/arm/boot/dts/pxa3xx.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/pxa3xx.dtsi b/arch/arm/boot/dts/pxa3xx.dtsi
index 5e2dea0f1436..6995b11ce042 100644
--- a/arch/arm/boot/dts/pxa3xx.dtsi
+++ b/arch/arm/boot/dts/pxa3xx.dtsi
@@ -43,6 +43,15 @@
 			marvell,intc-nr-irqs = <56>;
 		};
 
+		pinctrl: pinctrl@40e10000 {
+			compatible = "pinconf-single";
+			reg = <0x40e10000 0xffff>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			pinctrl-single,register-width = <32>;
+			pinctrl-single,function-mask = <0x7>;
+		};
+
 		gpio: gpio@40e00000 {
 			compatible = "intel,pxa3xx-gpio";
 			reg = <0x40e00000 0x10000>;
-- 
2.1.4
