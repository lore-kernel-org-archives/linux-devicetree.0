From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] ARM: DTS: Add watchdog to mt6589
Date: Mon, 16 Mar 2015 10:47:25 +0100
Message-ID: <1426499245-11103-1-git-send-email-matthias.bgg@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: matthias.bgg@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds the watchdog to the device tree of Mediatek mt6589 SoC.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 arch/arm/boot/dts/mt6589.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/mt6589.dtsi b/arch/arm/boot/dts/mt6589.dtsi
index 106b61b..88b3cb1 100644
--- a/arch/arm/boot/dts/mt6589.dtsi
+++ b/arch/arm/boot/dts/mt6589.dtsi
@@ -138,5 +138,10 @@
 			clocks = <&uart_clk>;
 			status = "disabled";
 		};
+
+		wdt: watchdog@010000000 {
+			compatible = "mediatek,mt6589-wdt";
+			reg = <0x10000000 0x44>;
+		};
 	};
 };
-- 
1.9.1
