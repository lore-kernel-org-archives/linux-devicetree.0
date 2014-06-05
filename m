From: Andrew Ruder <andrew.ruder@elecsyscorp.com>
Subject: [PATCH 5/6] arm: pxa27x.dtsi: add pwri2c definition
Date: Thu,  5 Jun 2014 14:27:07 -0500
Message-ID: <9ddf8df8c0205563ac2b6d22601c28dc636845c9.1401995177.git.andrew.ruder@elecsyscorp.com>
References: <cover.1401995177.git.andrew.ruder@elecsyscorp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1401995177.git.andrew.ruder@elecsyscorp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux@arm.linux.org.uk, rdunlap@infradead.org, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, Andrew Ruder <andrew.ruder@elecsyscorp.com>
List-Id: devicetree@vger.kernel.org

This adds the pwri2c definition to the pxa27x device tree.  This is
already called out in pxa3xx.dtsi.

Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
---
 arch/arm/boot/dts/pxa27x.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/pxa27x.dtsi b/arch/arm/boot/dts/pxa27x.dtsi
index 931e1d5..2d05aa9 100644
--- a/arch/arm/boot/dts/pxa27x.dtsi
+++ b/arch/arm/boot/dts/pxa27x.dtsi
@@ -34,5 +34,14 @@
 			reg = <0x40c00010 0x10>;
 			#pwm-cells = <1>;
 		};
+
+		pwri2c: i2c@40f00180 {
+			compatible = "mrvl,pxa-i2c";
+			reg = <0x40f00180 0x30>;
+			interrupts = <6>;
+			#address-cells = <0x1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
 	};
 };
-- 
1.9.0.rc3.12.gbc97e2d
