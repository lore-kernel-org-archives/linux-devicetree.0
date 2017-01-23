From: Jan Luebbe <jlu@pengutronix.de>
Subject: [PATCH] net: ethernet: mvneta: add support for 2.5G DRSGMII mode
Date: Mon, 23 Jan 2017 15:22:06 +0100
Message-ID: <20170123142206.5390-1-jlu@pengutronix.de>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, davem@davemloft.net
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Florian Fainelli <f.fainelli@gmail.com>, Jan Luebbe <jlu@pengutronix.de>
List-Id: devicetree@vger.kernel.org

The Marvell MVNETA Ethernet controller supports a 2.5 Gbps SGMII mode
called DRSGMII.

This patch adds a corresponding phy-mode string 'drsgmii' and parses it
from DT. The MVNETA then configures the SERDES protocol value
accordingly.

It was successfully tested on a MV78460 connected to a FPGA.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 Documentation/devicetree/bindings/net/ethernet.txt | 1 +
 drivers/net/ethernet/marvell/mvneta.c              | 5 +++++
 include/linux/phy.h                                | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ethernet.txt b/Documentation/devicetree/bindings/net/ethernet.txt
index 05150957ecfd..de40c5977d8f 100644
--- a/Documentation/devicetree/bindings/net/ethernet.txt
+++ b/Documentation/devicetree/bindings/net/ethernet.txt
@@ -29,6 +29,7 @@ The following properties are common to the Ethernet controllers:
   * "smii"
   * "xgmii"
   * "trgmii"
+  * "drsgmii"
 - phy-connection-type: the same as "phy-mode" property but described in ePAPR;
 - phy-handle: phandle, specifies a reference to a node representing a PHY
   device; this property is described in ePAPR and so preferred;
diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index e05e22705cf7..8cb43e0d9d0e 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -105,6 +105,7 @@
 #define MVNETA_SERDES_CFG			 0x24A0
 #define      MVNETA_SGMII_SERDES_PROTO		 0x0cc7
 #define      MVNETA_QSGMII_SERDES_PROTO		 0x0667
+#define      MVNETA_DRSGMII_SERDES_PROTO	 0x1107
 #define MVNETA_TYPE_PRIO                         0x24bc
 #define      MVNETA_FORCE_UNI                    BIT(21)
 #define MVNETA_TXQ_CMD_1                         0x24e4
@@ -4047,6 +4048,10 @@ static int mvneta_port_power_up(struct mvneta_port *pp, int phy_mode)
 	 * SGMII or QSGMII mode, the RGMII bit needs to be set.
 	 */
 	switch(phy_mode) {
+	case PHY_INTERFACE_MODE_DRSGMII:
+		mvreg_write(pp, MVNETA_SERDES_CFG, MVNETA_DRSGMII_SERDES_PROTO);
+		ctrl |= MVNETA_GMAC2_PCS_ENABLE | MVNETA_GMAC2_PORT_RGMII;
+		break;
 	case PHY_INTERFACE_MODE_QSGMII:
 		mvreg_write(pp, MVNETA_SERDES_CFG, MVNETA_QSGMII_SERDES_PROTO);
 		ctrl |= MVNETA_GMAC2_PCS_ENABLE | MVNETA_GMAC2_PORT_RGMII;
diff --git a/include/linux/phy.h b/include/linux/phy.h
index f7d95f644eed..a3d83bc96035 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -82,6 +82,7 @@ typedef enum {
 	PHY_INTERFACE_MODE_MOCA,
 	PHY_INTERFACE_MODE_QSGMII,
 	PHY_INTERFACE_MODE_TRGMII,
+	PHY_INTERFACE_MODE_DRSGMII,
 	PHY_INTERFACE_MODE_MAX,
 } phy_interface_t;
 
@@ -142,6 +143,8 @@ static inline const char *phy_modes(phy_interface_t interface)
 		return "qsgmii";
 	case PHY_INTERFACE_MODE_TRGMII:
 		return "trgmii";
+	case PHY_INTERFACE_MODE_DRSGMII:
+		return "drsgmii";
 	default:
 		return "unknown";
 	}
-- 
2.11.0
