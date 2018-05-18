From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 2/3] sh_eth: add EDMR.NBST support
Date: Fri, 18 May 2018 21:31:28 +0300
Message-ID: <6dc30bc4-04f4-7ac3-e9e9-de86f2eee99f@cogentembedded.com>
References: <f30c98ff-f6da-9e7f-c637-49076a428885@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <f30c98ff-f6da-9e7f-c637-49076a428885@cogentembedded.com>
Content-Language: en-MW
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The R-Car V3H (AKA R8A77980) GEther controller adds the DMA burst mode bit
(NBST) in EDMR and the manual tells to always set it before doing any DMA.

Based on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

---
Changes in version 2:
- added Simon's tag.

 drivers/net/ethernet/renesas/sh_eth.c |    4 ++++
 drivers/net/ethernet/renesas/sh_eth.h |    2 ++
 2 files changed, 6 insertions(+)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -1434,6 +1434,10 @@ static int sh_eth_dev_init(struct net_de
 
 	sh_eth_write(ndev, mdp->cd->trscer_err_mask, TRSCER);
 
+	/* DMA transfer burst mode */
+	if (mdp->cd->nbst)
+		sh_eth_modify(ndev, EDMR, EDMR_NBST, EDMR_NBST);
+
 	if (mdp->cd->bculr)
 		sh_eth_write(ndev, 0x800, BCULR);	/* Burst sycle set */
 
Index: net-next/drivers/net/ethernet/renesas/sh_eth.h
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.h
+++ net-next/drivers/net/ethernet/renesas/sh_eth.h
@@ -184,6 +184,7 @@ enum GECMR_BIT {
 
 /* EDMR */
 enum DMAC_M_BIT {
+	EDMR_NBST = 0x80,
 	EDMR_EL = 0x40, /* Litte endian */
 	EDMR_DL1 = 0x20, EDMR_DL0 = 0x10,
 	EDMR_SRST_GETHER = 0x03,
@@ -505,6 +506,7 @@ struct sh_eth_cpu_data {
 	unsigned bculr:1;	/* EtherC have BCULR */
 	unsigned tsu:1;		/* EtherC have TSU */
 	unsigned hw_swap:1;	/* E-DMAC have DE bit in EDMR */
+	unsigned nbst:1;	/* E-DMAC has NBST bit in EDMR */
 	unsigned rpadir:1;	/* E-DMAC have RPADIR */
 	unsigned no_trimd:1;	/* E-DMAC DO NOT have TRIMD */
 	unsigned no_ade:1;	/* E-DMAC DO NOT have ADE bit in EESR */
