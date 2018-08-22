From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH] sh_eth: Add R7S9210 support
Date: Wed, 22 Aug 2018 15:57:05 -0500
Message-ID: <20180822205705.20835-1-chris.brandt@renesas.com>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, Chris Brandt <chris.brandt@renesas.com>
List-Id: devicetree@vger.kernel.org

Add support for the R7S9210 which is part of the RZ/A2 series.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 Documentation/devicetree/bindings/net/sh_eth.txt |   1 +
 drivers/net/ethernet/renesas/sh_eth.c            | 107 +++++++++++++++++++++++
 drivers/net/ethernet/renesas/sh_eth.h            |   1 +
 3 files changed, 109 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/sh_eth.txt b/Documentation/devicetree/bindings/net/sh_eth.txt
index 76db9f13ad96..abc36274227c 100644
--- a/Documentation/devicetree/bindings/net/sh_eth.txt
+++ b/Documentation/devicetree/bindings/net/sh_eth.txt
@@ -16,6 +16,7 @@ Required properties:
 	      "renesas,ether-r8a7794"  if the device is a part of R8A7794 SoC.
 	      "renesas,gether-r8a77980" if the device is a part of R8A77980 SoC.
 	      "renesas,ether-r7s72100" if the device is a part of R7S72100 SoC.
+	      "renesas,ether-r7s9210" if the device is a part of R7S9210 SoC.
 	      "renesas,rcar-gen1-ether" for a generic R-Car Gen1 device.
 	      "renesas,rcar-gen2-ether" for a generic R-Car Gen2 or RZ/G1
 	                                device.
diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
index 5573199c4536..f3a575e56ae4 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -216,6 +216,59 @@ static const u16 sh_eth_offset_fast_rz[SH_ETH_MAX_REGISTER_OFFSET] = {
 	[RXALCR0]	= 0x008C,
 };
 
+static const u16 sh_eth_offset_fast_rza2[SH_ETH_MAX_REGISTER_OFFSET] = {
+	SH_ETH_OFFSET_DEFAULTS,
+
+	[EDMR]		= 0x0000,
+	[EDTRR]		= 0x0008,
+	[EDRRR]		= 0x0010,
+	[EESR]		= 0x0028,
+	[EESIPR]	= 0x0030,
+	[TDLAR]		= 0x0018,
+	[TBRAR]		= 0x00d4,
+	[TDFAR]		= 0x00d8,
+	[RDLAR]		= 0x0020,
+	[RBWAR]		= 0x00c8,
+	[RDFAR]		= 0x00cc,
+	[TRSCER]	= 0x0038,
+	[RMFCR]		= 0x0040,
+	[TFTR]		= 0x0048,
+	[FDR]		= 0x0050,
+	[RMCR]		= 0x0058,
+	[TFUCR]		= 0x0064,
+	[RFOCR]		= 0x0068,
+	[RPADIR]	= 0x0078,
+	[TRIMD]		= 0x007c,
+	[FCFTR]		= 0x0070,
+
+	[ECMR]		= 0x0100,
+	[RFLR]		= 0x0108,
+	[ECSR]		= 0x0110,
+	[ECSIPR]	= 0x0118,
+	[PIR]		= 0x0120,
+	[PSR]		= 0x0128,
+	[RDMLR]		= 0x0140,
+	[IPGR]		= 0x0150,
+	[APR]		= 0x0154,
+	[MPR]		= 0x0158,
+	[RFCF]		= 0x0160,
+	[TPAUSER]	= 0x0164,
+	[TPAUSECR]	= 0x0168,
+	[BCFRR]		= 0x016c,
+	[MAHR]		= 0x01c0,
+	[MALR]		= 0x01c8,
+	[TROCR]		= 0x01d0,
+	[CDCR]		= 0x01d4,
+	[LCCR]		= 0x01d8,
+	[CNDCR]		= 0x01dc,
+	[CEFCR]		= 0x01e4,
+	[FRECR]		= 0x01e8,
+	[TSFRCR]	= 0x01ec,
+	[TLFRCR]	= 0x01f0,
+	[RFCR]		= 0x01f4,
+	[MAFCR]		= 0x01f8,
+};
+
 static const u16 sh_eth_offset_fast_rcar[SH_ETH_MAX_REGISTER_OFFSET] = {
 	SH_ETH_OFFSET_DEFAULTS,
 
@@ -635,6 +688,56 @@ static struct sh_eth_cpu_data r7s72100_data = {
 	.no_tx_cntrs	= 1,
 };
 
+/* R7S9210 */
+static void sh_eth_set_rate_r7s9210(struct net_device *ndev)
+{
+	struct sh_eth_private *mdp = netdev_priv(ndev);
+	unsigned long RTM = 0x00000004;
+
+	switch (mdp->speed) {
+	case 10: /* 10BASE */
+		sh_eth_modify(ndev, ECMR, RTM, 0);
+		break;
+	case 100:/* 100BASE */
+		sh_eth_modify(ndev, ECMR, RTM, RTM);
+		break;
+	}
+}
+
+static struct sh_eth_cpu_data r7s9210_data = {
+	.soft_reset	= sh_eth_soft_reset,
+
+	.set_duplex	= sh_eth_set_duplex,
+	.set_rate	= sh_eth_set_rate_r7s9210,
+
+	.register_type	= SH_ETH_REG_FAST_RZA2,
+
+	.edtrr_trns	= EDTRR_TRNS_ETHER,
+	.ecsr_value	= ECSR_ICD,
+	.ecsipr_value	= ECSIPR_ICDIP,
+	.eesipr_value	= EESIPR_TWBIP | EESIPR_TABTIP | EESIPR_RABTIP |
+			  EESIPR_RFCOFIP | EESIPR_ECIIP | EESIPR_FTCIP |
+			  EESIPR_TDEIP | EESIPR_TFUFIP | EESIPR_FRIP |
+			  EESIPR_RDEIP | EESIPR_RFOFIP | EESIPR_CNDIP |
+			  EESIPR_DLCIP | EESIPR_CDIP | EESIPR_TROIP |
+			  EESIPR_RMAFIP | EESIPR_RRFIP | EESIPR_RTLFIP |
+			  EESIPR_RTSFIP | EESIPR_PREIP | EESIPR_CERFIP,
+
+	.tx_check	= EESR_FTC | EESR_CND | EESR_DLC | EESR_CD | EESR_TRO,
+	.eesr_err_check	= EESR_TWB | EESR_TABT | EESR_RABT | EESR_RFE |
+			  EESR_RDE | EESR_RFRMER | EESR_TFE | EESR_TDE,
+
+	.fdr_value	= 0x0000070f,
+
+	.apr		= 1,
+	.mpr		= 1,
+	.tpauser	= 1,
+	.hw_swap	= 1,
+	.rpadir		= 1,
+	.no_ade		= 1,
+	.xdfar_rw	= 1,
+};
+
 static void sh_eth_chip_reset_r8a7740(struct net_device *ndev)
 {
 	sh_eth_chip_reset(ndev);
@@ -3053,6 +3156,9 @@ static const u16 *sh_eth_get_register_offset(int register_type)
 	case SH_ETH_REG_FAST_RZ:
 		reg_offset = sh_eth_offset_fast_rz;
 		break;
+	case SH_ETH_REG_FAST_RZA2:
+		reg_offset = sh_eth_offset_fast_rza2;
+		break;
 	case SH_ETH_REG_FAST_RCAR:
 		reg_offset = sh_eth_offset_fast_rcar;
 		break;
@@ -3132,6 +3238,7 @@ static const struct of_device_id sh_eth_match_table[] = {
 	{ .compatible = "renesas,ether-r8a7794", .data = &rcar_gen2_data },
 	{ .compatible = "renesas,gether-r8a77980", .data = &r8a77980_data },
 	{ .compatible = "renesas,ether-r7s72100", .data = &r7s72100_data },
+	{ .compatible = "renesas,ether-r7s9210", .data = &r7s9210_data },
 	{ .compatible = "renesas,rcar-gen1-ether", .data = &rcar_gen1_data },
 	{ .compatible = "renesas,rcar-gen2-ether", .data = &rcar_gen2_data },
 	{ }
diff --git a/drivers/net/ethernet/renesas/sh_eth.h b/drivers/net/ethernet/renesas/sh_eth.h
index f94be99cf400..e501f1958cec 100644
--- a/drivers/net/ethernet/renesas/sh_eth.h
+++ b/drivers/net/ethernet/renesas/sh_eth.h
@@ -157,6 +157,7 @@ enum {
 enum {
 	SH_ETH_REG_GIGABIT,
 	SH_ETH_REG_FAST_RZ,
+	SH_ETH_REG_FAST_RZA2,
 	SH_ETH_REG_FAST_RCAR,
 	SH_ETH_REG_FAST_SH4,
 	SH_ETH_REG_FAST_SH3_SH2
-- 
2.16.1
