From: Claudiu Manoil <claudiu.manoil@nxp.com>
Subject: [PATCH net-next 2/3] arm64: dts: fsl: ls1028a-rdb: Add ENETC external eth ports for the LS1028A RDB board
Date: Wed, 13 Feb 2019 13:02:22 +0200
Message-ID: <1550055743-15542-3-git-send-email-claudiu.manoil@nxp.com>
References: <1550055743-15542-1-git-send-email-claudiu.manoil@nxp.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1550055743-15542-1-git-send-email-claudiu.manoil@nxp.com>
Sender: netdev-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, "David S . Miller" <davem@davemloft.net>
Cc: alexandru.marginean@nxp.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The LS1028A RDB board features an Atheros PHY connected over
SGMII to the ENETC PF0 (or Port0).  ENETC Port1 (PF1) has no
external connection on this board, so it can be disabled for now.

Signed-off-by: Alex Marginean <alexandru.marginean@nxp.com>
Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
index fdeb417..c8487893 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
@@ -71,3 +71,18 @@
 &duart1 {
 	status = "okay";
 };
+
+&enetc_port0 {
+	phy-handle = <&sgmii_phy0>;
+	phy-connection-type = "sgmii";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	sgmii_phy0: ethernet-phy@2 {
+		reg = <0x2>;
+	};
+};
+
+&enetc_port1 {
+	status = "disabled";
+};
-- 
2.7.4
