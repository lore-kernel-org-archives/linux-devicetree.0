From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH v4 1/5] ARM: dts: pxa: add pwri2c to pxa device-tree
Date: Thu, 12 Feb 2015 18:22:34 +0100
Message-ID: <1423761758-29159-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: devicetree@vger.kernel.org

pxa27x variant has 2 I2C busses on the SoC :
 - the casual I2C
 - the power I2C, normally driving power regulators, and capable of
 receiving orders on core frequency modifications

Add the missing pwri2c to pxa27x description.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
Since v2: as Dmitry pointed out, no pwri2c on pxa25x, only pxa27x
---
 arch/arm/boot/dts/pxa27x.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/pxa27x.dtsi b/arch/arm/boot/dts/pxa27x.dtsi
index 80fc5d7..98b560e 100644
--- a/arch/arm/boot/dts/pxa27x.dtsi
+++ b/arch/arm/boot/dts/pxa27x.dtsi
@@ -35,6 +35,13 @@
 			reg = <0x40c00010 0x10>;
 			#pwm-cells = <1>;
 		};
+
+		pwri2c: i2c@40f000180 {
+			compatible = "mrvl,pxa-i2c";
+			reg = <0x40f00180 0x24>;
+			interrupts = <6>;
+			status = "disabled";
+		};
 	};
 
 	clocks {
-- 
2.1.0
