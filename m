From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH v3 5/5] ARM: dts: pxa: add pxa-timer to pxa27x
Date: Sat,  7 Feb 2015 13:39:20 +0100
Message-ID: <1423312760-15871-5-git-send-email-robert.jarzmik@free.fr>
References: <1423312760-15871-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423312760-15871-1-git-send-email-robert.jarzmik@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: devicetree@vger.kernel.org

Each pxa has an embedded OS Timers IP. The kernel cannot work without a
valid clocksource, and this adds the OS Timers to the pxa device-tree
description.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
Since v1: removed clocksource node, pxa-timer being directly under
          pxabus (Rob's comment).
Since v2: renamed pxa-timer to timer (Sergei's comment)
---
 arch/arm/boot/dts/pxa27x.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/pxa27x.dtsi b/arch/arm/boot/dts/pxa27x.dtsi
index 6ecf1a6..fb0abad 100644
--- a/arch/arm/boot/dts/pxa27x.dtsi
+++ b/arch/arm/boot/dts/pxa27x.dtsi
@@ -101,4 +101,12 @@
 			status = "okay";
 		};
 	};
+
+	timer@40a00000 {
+		compatible = "marvell,pxa-timer";
+		reg = <0x40a00000 0x20>;
+		interrupts = <26>;
+		clocks = <&pxa2xx_clks CLK_OSTIMER>;
+		status = "okay";
+	};
 };
-- 
2.1.0
