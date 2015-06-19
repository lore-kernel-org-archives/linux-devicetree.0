From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH v2 6/6] ARM: dts: pxa: add the usb host controller
Date: Fri, 19 Jun 2015 20:38:22 +0200
Message-ID: <1434739102-26217-6-git-send-email-robert.jarzmik@free.fr>
References: <1434739102-26217-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434739102-26217-1-git-send-email-robert.jarzmik@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: devicetree@vger.kernel.org

Add the usb host controller to pxa27x and pxa3xx.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 arch/arm/boot/dts/pxa27x.dtsi | 8 ++++++++
 arch/arm/boot/dts/pxa3xx.dtsi | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/pxa27x.dtsi b/arch/arm/boot/dts/pxa27x.dtsi
index fc79df9..97220ac 100644
--- a/arch/arm/boot/dts/pxa27x.dtsi
+++ b/arch/arm/boot/dts/pxa27x.dtsi
@@ -26,6 +26,14 @@
 			clocks = <&clks CLK_NONE>;
 		};
 
+		pxa27x_ohci: ohci@4c000000 {
+			compatible = "marvell,pxa-ohci";
+			reg = <0x4c000000 0x10000>;
+			interrupts = <3>;
+			clocks = <&clks CLK_USBHOST>;
+			status = "disabled";
+		};
+
 		pwm0: pwm@40b00000 {
 			compatible = "marvell,pxa270-pwm", "marvell,pxa250-pwm";
 			reg = <0x40b00000 0x10>;
diff --git a/arch/arm/boot/dts/pxa3xx.dtsi b/arch/arm/boot/dts/pxa3xx.dtsi
index 29aeac5..67bd4fe 100644
--- a/arch/arm/boot/dts/pxa3xx.dtsi
+++ b/arch/arm/boot/dts/pxa3xx.dtsi
@@ -86,6 +86,14 @@
 			dma-names = "rx", "tx";
 			status = "disabled";
 		};
+
+		pxa3xx_ohci: ohci@4c000000 {
+			compatible = "marvell,pxa-ohci";
+			reg = <0x4c000000 0x10000>;
+			interrupts = <3>;
+			clocks = <&clks CLK_USBHOST>;
+			status = "disabled";
+		};
 	};
 
 	clocks {
-- 
2.1.4
