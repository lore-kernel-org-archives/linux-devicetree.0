From: jorik@kippendief.biz
Subject: [PATCH v3 4/8] dts: sun8i-h3: move uart1 pinmux/peripheral assocation to DSTI
Date: Wed,  7 Sep 2016 09:41:42 +0200
Message-ID: <1473234106-32330-5-git-send-email-jorik@kippendief.biz>
References: <1473234106-32330-1-git-send-email-jorik@kippendief.biz>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473234106-32330-1-git-send-email-jorik@kippendief.biz>
Sender: linux-kernel-owner@vger.kernel.org
To: wens@csie.org, maxime.ripard@free-electrons.com
Cc: mark.rutland@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jorik Jonker <jorik@kippendief.biz>
List-Id: devicetree@vger.kernel.org

From: Jorik Jonker <jorik@kippendief.biz>

Users using this UART without RTS/CTS should override the association in
their board specific DTS. All (1) board using this UART uses RTS/CTS, so
this breaks nothing.

Signed-off-by: Jorik Jonker <jorik@kippendief.biz>
---
 arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts | 2 --
 arch/arm/boot/dts/sun8i-h3.dtsi                 | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts b/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts
index c874270..4c86e45 100644
--- a/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts
+++ b/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts
@@ -182,8 +182,6 @@
 };
 
 &uart1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart1_rts_cts_pins>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
index 6635f3d..685755c 100644
--- a/arch/arm/boot/dts/sun8i-h3.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
@@ -414,6 +414,8 @@
 			resets = <&ccu RST_BUS_UART1>;
 			dmas = <&dma 7>, <&dma 7>;
 			dma-names = "rx", "tx";
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart1_rts_cts_pins>;
 			status = "disabled";
 		};
 
-- 
2.7.4
