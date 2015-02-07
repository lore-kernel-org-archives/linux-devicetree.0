From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH v3 3/5] ARM: dts: pxa: add pxa27x-udc to pxa27x
Date: Sat,  7 Feb 2015 13:39:18 +0100
Message-ID: <1423312760-15871-3-git-send-email-robert.jarzmik@free.fr>
References: <1423312760-15871-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423312760-15871-1-git-send-email-robert.jarzmik@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: devicetree@vger.kernel.org

Each pxa27x has an embedded usb udc controller. Add it in the pxa27x
device-tree description.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 arch/arm/boot/dts/pxa27x.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/pxa27x.dtsi b/arch/arm/boot/dts/pxa27x.dtsi
index e8d5097..ddb6982 100644
--- a/arch/arm/boot/dts/pxa27x.dtsi
+++ b/arch/arm/boot/dts/pxa27x.dtsi
@@ -68,6 +68,14 @@
 		pxai2c1: i2c@40301680 {
 			clocks = <&pxa2xx_clks CLK_I2C>;
 		};
+
+		pxa27x_udc: udc@40600000 {
+			compatible = "marvell,pxa270-udc";
+			reg = <0x40600000 0x10000>;
+			interrupts = <11>;
+			clocks = <&pxa2xx_clks CLK_USB>;
+			status = "disabled";
+		};
 	};
 
 	clocks {
-- 
2.1.0
