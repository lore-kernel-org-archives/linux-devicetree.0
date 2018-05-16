From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 3/3] sh_eth: add R8A77980 support
Date: Wed, 16 May 2018 23:00:29 +0300
Message-ID: <d3fe7c8e-3356-4f3a-d550-bc813f3f72cd@cogentembedded.com>
References: <087c91a3-a451-6de7-5e0f-a835f8cc98f1@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <087c91a3-a451-6de7-5e0f-a835f8cc98f1@cogentembedded.com>
Content-Language: en-MW
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Finally, add support for the DT probing of the R-Car V3H (AKA R8A77980) --
it's the only R-Car gen3 SoC having the GEther controller -- others have
only EtherAVB...

Based on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 Documentation/devicetree/bindings/net/sh_eth.txt |    1 
 drivers/net/ethernet/renesas/sh_eth.c            |   44 +++++++++++++++++++++++
 2 files changed, 45 insertions(+)

Index: net-next/Documentation/devicetree/bindings/net/sh_eth.txt
===================================================================
--- net-next.orig/Documentation/devicetree/bindings/net/sh_eth.txt
+++ net-next/Documentation/devicetree/bindings/net/sh_eth.txt
@@ -14,6 +14,7 @@ Required properties:
 	      "renesas,ether-r8a7791"  if the device is a part of R8A7791 SoC.
 	      "renesas,ether-r8a7793"  if the device is a part of R8A7793 SoC.
 	      "renesas,ether-r8a7794"  if the device is a part of R8A7794 SoC.
+	      "renesas,gether-r8a77980" if the device is a part of R8A77980 SoC.
 	      "renesas,ether-r7s72100" if the device is a part of R7S72100 SoC.
 	      "renesas,rcar-gen1-ether" for a generic R-Car Gen1 device.
 	      "renesas,rcar-gen2-ether" for a generic R-Car Gen2 or RZ/G1
Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -753,6 +753,49 @@ static struct sh_eth_cpu_data rcar_gen2_
 	.rmiimode	= 1,
 	.magic		= 1,
 };
+
+/* R8A77980 */
+static struct sh_eth_cpu_data r8a77980_data = {
+	.soft_reset	= sh_eth_soft_reset_gether,
+
+	.set_duplex	= sh_eth_set_duplex,
+	.set_rate	= sh_eth_set_rate_gether,
+
+	.register_type  = SH_ETH_REG_GIGABIT,
+
+	.edtrr_trns	= EDTRR_TRNS_GETHER,
+	.ecsr_value	= ECSR_PSRTO | ECSR_LCHNG | ECSR_ICD | ECSR_MPD,
+	.ecsipr_value	= ECSIPR_PSRTOIP | ECSIPR_LCHNGIP | ECSIPR_ICDIP |
+			  ECSIPR_MPDIP,
+	.eesipr_value	= EESIPR_RFCOFIP | EESIPR_ECIIP |
+			  EESIPR_FTCIP | EESIPR_TDEIP | EESIPR_TFUFIP |
+			  EESIPR_FRIP | EESIPR_RDEIP | EESIPR_RFOFIP |
+			  EESIPR_RMAFIP | EESIPR_RRFIP |
+			  EESIPR_RTLFIP | EESIPR_RTSFIP |
+			  EESIPR_PREIP | EESIPR_CERFIP,
+
+	.tx_check       = EESR_FTC | EESR_CD | EESR_RTO,
+	.eesr_err_check = EESR_TWB1 | EESR_TWB | EESR_TABT | EESR_RABT |
+			  EESR_RFE | EESR_RDE | EESR_RFRMER |
+			  EESR_TFE | EESR_TDE | EESR_ECI,
+	.fdr_value	= 0x0000070f,
+
+	.apr		= 1,
+	.mpr		= 1,
+	.tpauser	= 1,
+	.bculr		= 1,
+	.hw_swap	= 1,
+	.nbst		= 1,
+	.rpadir		= 1,
+	.rpadir_value   = 2 << 16,
+	.no_trimd	= 1,
+	.no_ade		= 1,
+	.xdfar_rw	= 1,
+	.hw_checksum	= 1,
+	.select_mii	= 1,
+	.magic		= 1,
+	.cexcr		= 1,
+};
 #endif /* CONFIG_OF */
 
 static void sh_eth_set_rate_sh7724(struct net_device *ndev)
@@ -3134,6 +3177,7 @@ static const struct of_device_id sh_eth_
 	{ .compatible = "renesas,ether-r8a7791", .data = &rcar_gen2_data },
 	{ .compatible = "renesas,ether-r8a7793", .data = &rcar_gen2_data },
 	{ .compatible = "renesas,ether-r8a7794", .data = &rcar_gen2_data },
+	{ .compatible = "renesas,gether-r8a77980", .data = &r8a77980_data },
 	{ .compatible = "renesas,ether-r7s72100", .data = &r7s72100_data },
 	{ .compatible = "renesas,rcar-gen1-ether", .data = &rcar_gen1_data },
 	{ .compatible = "renesas,rcar-gen2-ether", .data = &rcar_gen2_data },
