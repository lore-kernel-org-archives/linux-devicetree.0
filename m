From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH v3 4/5] ARM: dts: pxa: add pxa27x-keypad to pxa27x
Date: Sat,  7 Feb 2015 13:39:19 +0100
Message-ID: <1423312760-15871-4-git-send-email-robert.jarzmik@free.fr>
References: <1423312760-15871-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423312760-15871-1-git-send-email-robert.jarzmik@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: devicetree@vger.kernel.org

Each pxa27x has an embedded keypad controller. Add it in the pxa27x
device-tree description.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 arch/arm/boot/dts/pxa27x.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/pxa27x.dtsi b/arch/arm/boot/dts/pxa27x.dtsi
index ddb6982..6ecf1a6 100644
--- a/arch/arm/boot/dts/pxa27x.dtsi
+++ b/arch/arm/boot/dts/pxa27x.dtsi
@@ -76,6 +76,14 @@
 			clocks = <&pxa2xx_clks CLK_USB>;
 			status = "disabled";
 		};
+
+		keypad: keypad@41500000 {
+			compatible = "marvell,pxa27x-keypad";
+			reg = <0x41500000 0x4c>;
+			interrupts = <4>;
+			clocks = <&pxa2xx_clks CLK_KEYPAD>;
+			status = "disabled";
+		};
 	};
 
 	clocks {
-- 
2.1.0
