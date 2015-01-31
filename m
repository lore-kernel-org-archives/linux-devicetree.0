From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH 5/5] ARM: dts: pxa: add pxa-timer to pxa27x
Date: Sat, 31 Jan 2015 23:48:30 +0100
Message-ID: <1422744510-3179-5-git-send-email-robert.jarzmik@free.fr>
References: <1422744510-3179-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1422744510-3179-1-git-send-email-robert.jarzmik@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: devicetree@vger.kernel.org

Each pxa has an embedded OS Timers IP. The kernel cannot work without a
valid clocksource, and this adds the OS Timers to the pxa device-tree
description.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 arch/arm/boot/dts/pxa27x.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/pxa27x.dtsi b/arch/arm/boot/dts/pxa27x.dtsi
index 7f93828..9e6bf60 100644
--- a/arch/arm/boot/dts/pxa27x.dtsi
+++ b/arch/arm/boot/dts/pxa27x.dtsi
@@ -97,5 +97,18 @@
 			status = "okay";
 		};
 	};
+
+	clocksources {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		pxa-timer@40a00000 {
+			compatible = "marvell,pxa-timer";
+			reg = <0x40a00000 0x20>;
+			interrupts = <26>;
+			clocks = <&pxa2xx_clks CLK_OSTIMER>;
+			status = "okay";
+		};
 	};
 };
-- 
2.1.0
