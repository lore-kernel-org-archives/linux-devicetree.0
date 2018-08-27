From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2] sh_eth: Add R7S9210 support
Date: Mon, 27 Aug 2018 12:42:02 -0500
Message-ID: <20180827174202.80750-1-chris.brandt@renesas.com>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, Chris Brandt <chris.brandt@renesas.com>
List-Id: devicetree@vger.kernel.org

Add support for the R7S9210 which is part of the RZ/A2 series.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
v2:
 * Use sh_eth_offset_fast_sh4 instead of sh_eth_offset_fast_rza2
 * Use sh_eth_set_rate_rcar instead of sh_eth_set_rate_r7s9210()
 * Removed enum SH_ETH_REG_FAST_RZA2
---
 Documentation/devicetree/bindings/net/sh_eth.txt |  1 +
 drivers/net/ethernet/renesas/sh_eth.c            | 36 ++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

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
index 5573199c4536..2b95f3b1b759 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -809,6 +809,41 @@ static struct sh_eth_cpu_data r8a77980_data = {
 	.magic		= 1,
 	.cexcr		= 1,
 };
+
+/* R7S9210 */
+static struct sh_eth_cpu_data r7s9210_data = {
+	.soft_reset	= sh_eth_soft_reset,
+
+	.set_duplex	= sh_eth_set_duplex,
+	.set_rate	= sh_eth_set_rate_rcar,
+
+	.register_type	= SH_ETH_REG_FAST_SH4,
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
 #endif /* CONFIG_OF */
 
 static void sh_eth_set_rate_sh7724(struct net_device *ndev)
@@ -3132,6 +3167,7 @@ static const struct of_device_id sh_eth_match_table[] = {
 	{ .compatible = "renesas,ether-r8a7794", .data = &rcar_gen2_data },
 	{ .compatible = "renesas,gether-r8a77980", .data = &r8a77980_data },
 	{ .compatible = "renesas,ether-r7s72100", .data = &r7s72100_data },
+	{ .compatible = "renesas,ether-r7s9210", .data = &r7s9210_data },
 	{ .compatible = "renesas,rcar-gen1-ether", .data = &rcar_gen1_data },
 	{ .compatible = "renesas,rcar-gen2-ether", .data = &rcar_gen2_data },
 	{ }
-- 
2.16.1
