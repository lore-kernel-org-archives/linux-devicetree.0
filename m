From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: [PATCH v2 7/8] ARM: dts: berlin: add the Ethernet node
Date: Tue,  9 Sep 2014 16:44:07 +0200
Message-ID: <1410273848-24663-8-git-send-email-antoine.tenart@free-electrons.com>
References: <1410273848-24663-1-git-send-email-antoine.tenart@free-electrons.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1410273848-24663-1-git-send-email-antoine.tenart@free-electrons.com>
Sender: netdev-owner@vger.kernel.org
To: sebastian.hesselbarth@gmail.com
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>, alexandre.belloni@free-electrons.com, thomas.petazzoni@free-electrons.com, zmxu@marvell.com, jszhang@marvell.com, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds the Ethernet node, enabling the network unit on Berlin
BG2Q SoCs.

Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
---
 arch/arm/boot/dts/berlin2q.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/berlin2q.dtsi b/arch/arm/boot/dts/berlin2q.dtsi
index 400c40fceccc..a216cb621ebc 100644
--- a/arch/arm/boot/dts/berlin2q.dtsi
+++ b/arch/arm/boot/dts/berlin2q.dtsi
@@ -114,6 +114,15 @@
 			#interrupt-cells = <3>;
 		};
 
+		eth0: ethernet@b90000 {
+			compatible = "marvell,pxa168-eth";
+			reg = <0xb90000 0x10000>;
+			clocks = <&chip CLKID_GETH0>;
+			clock-names = "MFUCLK";
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		cpu-ctrl@dd0000 {
 			compatible = "marvell,berlin-cpu-ctrl";
 			reg = <0xdd0000 0x10000>;
-- 
1.9.1
