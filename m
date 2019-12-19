Return-Path: <SRS0=R1yt=2J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1451EC2D0D2
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 15:21:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DFBD121D7D
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 15:21:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbfLSPVk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Dec 2019 10:21:40 -0500
Received: from inva020.nxp.com ([92.121.34.13]:39914 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726945AbfLSPVi (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 19 Dec 2019 10:21:38 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C2E2F1A09E7;
        Thu, 19 Dec 2019 16:21:36 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B2A351A0094;
        Thu, 19 Dec 2019 16:21:36 +0100 (CET)
Received: from fsr-fed2164-101.ea.freescale.net (fsr-fed2164-101.ea.freescale.net [10.171.82.91])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 33669203C8;
        Thu, 19 Dec 2019 16:21:36 +0100 (CET)
From:   Madalin Bucur <madalin.bucur@oss.nxp.com>
To:     davem@davemloft.net, netdev@vger.kernel.org
Cc:     linux@armlinux.org.uk, andrew@lunn.ch, f.fainelli@gmail.com,
        hkallweit1@gmail.com, shawnguo@kernel.org,
        devicetree@vger.kernel.org,
        Madalin Bucur <madalin.bucur@oss.nxp.com>
Subject: [PATCH 5/6] net: fsl/fman: add support for PHY_INTERFACE_MODE_SFI
Date:   Thu, 19 Dec 2019 17:21:20 +0200
Message-Id: <1576768881-24971-6-git-send-email-madalin.bucur@oss.nxp.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1576768881-24971-1-git-send-email-madalin.bucur@oss.nxp.com>
References: <1576768881-24971-1-git-send-email-madalin.bucur@oss.nxp.com>
Content-Type: text/plain; charset="us-ascii"
Reply-to: madalin.bucur@nxp.com
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add support for the SFI PHY interface mode.

Signed-off-by: Madalin Bucur <madalin.bucur@oss.nxp.com>
---
 drivers/net/ethernet/freescale/fman/fman_memac.c | 2 ++
 drivers/net/ethernet/freescale/fman/mac.c        | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/freescale/fman/fman_memac.c b/drivers/net/ethernet/freescale/fman/fman_memac.c
index d0b12efadd6c..09fdec935bf2 100644
--- a/drivers/net/ethernet/freescale/fman/fman_memac.c
+++ b/drivers/net/ethernet/freescale/fman/fman_memac.c
@@ -440,6 +440,7 @@ static int init(struct memac_regs __iomem *regs, struct memac_cfg *cfg,
 	tmp = 0;
 	switch (phy_if) {
 	case PHY_INTERFACE_MODE_XFI:
+	case PHY_INTERFACE_MODE_SFI:
 	case PHY_INTERFACE_MODE_XGMII:
 		tmp |= IF_MODE_10G;
 		break;
@@ -456,6 +457,7 @@ static int init(struct memac_regs __iomem *regs, struct memac_cfg *cfg,
 	/* TX_FIFO_SECTIONS */
 	tmp = 0;
 	if (phy_if == PHY_INTERFACE_MODE_XFI ||
+	    phy_if == PHY_INTERFACE_MODE_SFI ||
 	    phy_if == PHY_INTERFACE_MODE_XGMII) {
 		if (slow_10g_if) {
 			tmp |= (TX_FIFO_SECTIONS_TX_AVAIL_SLOW_10G |
diff --git a/drivers/net/ethernet/freescale/fman/mac.c b/drivers/net/ethernet/freescale/fman/mac.c
index 2944188c19b3..5e6317742c38 100644
--- a/drivers/net/ethernet/freescale/fman/mac.c
+++ b/drivers/net/ethernet/freescale/fman/mac.c
@@ -542,6 +542,7 @@ static const u16 phy2speed[] = {
 	[PHY_INTERFACE_MODE_QSGMII]		= SPEED_1000,
 	[PHY_INTERFACE_MODE_XGMII]		= SPEED_10000,
 	[PHY_INTERFACE_MODE_XFI]		= SPEED_10000,
+	[PHY_INTERFACE_MODE_SFI]		= SPEED_10000,
 };
 
 static struct platform_device *dpaa_eth_add_device(int fman_id,
@@ -800,6 +801,7 @@ static int mac_probe(struct platform_device *_of_dev)
 
 	/* The 10G interface only supports one mode */
 	if (mac_dev->phy_if == PHY_INTERFACE_MODE_XFI ||
+	    mac_dev->phy_if == PHY_INTERFACE_MODE_SFI ||
 	    mac_dev->phy_if == PHY_INTERFACE_MODE_XGMII)
 		mac_dev->if_support = SUPPORTED_10000baseT_Full;
 
-- 
2.1.0

