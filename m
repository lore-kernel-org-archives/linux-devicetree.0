From: jorik@kippendief.biz
Subject: [PATCH v3 6/8] dts: sun8i-h3: associate pinmux/peripherals for UART2-3
Date: Wed,  7 Sep 2016 09:41:44 +0200
Message-ID: <1473234106-32330-7-git-send-email-jorik@kippendief.biz>
References: <1473234106-32330-1-git-send-email-jorik@kippendief.biz>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473234106-32330-1-git-send-email-jorik@kippendief.biz>
Sender: linux-kernel-owner@vger.kernel.org
To: wens@csie.org, maxime.ripard@free-electrons.com
Cc: mark.rutland@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jorik Jonker <jorik@kippendief.biz>
List-Id: devicetree@vger.kernel.org

From: Jorik Jonker <jorik@kippendief.biz>

Although these peripherals are disabled, they are associated to the
pinmux definitions. Again, these are the full pinmux defs which include
RTS/CTS. One could narrow this down to RX/TX only in a board specific
DTS.

Signed-off-by: Jorik Jonker <jorik@kippendief.biz>
---
 arch/arm/boot/dts/sun8i-h3.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
index 5cde54c..e9528d1 100644
--- a/arch/arm/boot/dts/sun8i-h3.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
@@ -443,6 +443,8 @@
 			resets = <&ccu RST_BUS_UART2>;
 			dmas = <&dma 8>, <&dma 8>;
 			dma-names = "rx", "tx";
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart2_rts_cts_pins>;
 			status = "disabled";
 		};
 
@@ -456,6 +458,8 @@
 			resets = <&ccu RST_BUS_UART3>;
 			dmas = <&dma 9>, <&dma 9>;
 			dma-names = "rx", "tx";
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart3_rts_cts_pins>;
 			status = "disabled";
 		};
 
-- 
2.7.4
