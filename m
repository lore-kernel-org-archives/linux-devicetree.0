Return-Path: <SRS0=v2WM=2N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 346C6C2D0C0
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 10:14:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C758206D3
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 10:14:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726795AbfLWKOV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Dec 2019 05:14:21 -0500
Received: from inva020.nxp.com ([92.121.34.13]:51460 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725799AbfLWKOV (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 23 Dec 2019 05:14:21 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 451921A124E;
        Mon, 23 Dec 2019 11:14:19 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 38C6B1A0E95;
        Mon, 23 Dec 2019 11:14:19 +0100 (CET)
Received: from fsr-fed2164-101.ea.freescale.net (fsr-fed2164-101.ea.freescale.net [10.171.82.91])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id B6B1B2033F;
        Mon, 23 Dec 2019 11:14:18 +0100 (CET)
From:   Madalin Bucur <madalin.bucur@oss.nxp.com>
To:     davem@davemloft.net, netdev@vger.kernel.org, linux@armlinux.org.uk,
        andrew@lunn.ch
Cc:     f.fainelli@gmail.com, hkallweit1@gmail.com, shawnguo@kernel.org,
        leoyang.li@nxp.com, devicetree@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, Madalin Bucur <madalin.bucur@nxp.com>
Subject: [PATCH net-next v2 1/7] net: phy: add interface modes for XFI, SFI
Date:   Mon, 23 Dec 2019 12:14:07 +0200
Message-Id: <1577096053-20507-2-git-send-email-madalin.bucur@oss.nxp.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1577096053-20507-1-git-send-email-madalin.bucur@oss.nxp.com>
References: <1577096053-20507-1-git-send-email-madalin.bucur@oss.nxp.com>
Content-Type: text/plain; charset="us-ascii"
Reply-to: madalin.bucur@oss.nxp.com
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Madalin Bucur <madalin.bucur@nxp.com>

Add explicit entries for XFI, SFI to make sure the device
tree entries for phy-connection-type "xfi" or "sfi" are
properly parsed and differentiated against the existing
backplane 10GBASE-KR mode.

Signed-off-by: Madalin Bucur <madalin.bucur@nxp.com>
---
 include/linux/phy.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index dd4a91f1feaa..5651c7be0c45 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -99,7 +99,8 @@ typedef enum {
 	PHY_INTERFACE_MODE_2500BASEX,
 	PHY_INTERFACE_MODE_RXAUI,
 	PHY_INTERFACE_MODE_XAUI,
-	/* 10GBASE-KR, XFI, SFI - single lane 10G Serdes */
+	PHY_INTERFACE_MODE_XFI,
+	PHY_INTERFACE_MODE_SFI,
 	PHY_INTERFACE_MODE_10GKR,
 	PHY_INTERFACE_MODE_USXGMII,
 	PHY_INTERFACE_MODE_MAX,
@@ -175,6 +176,10 @@ static inline const char *phy_modes(phy_interface_t interface)
 		return "rxaui";
 	case PHY_INTERFACE_MODE_XAUI:
 		return "xaui";
+	case PHY_INTERFACE_MODE_XFI:
+		return "xfi";
+	case PHY_INTERFACE_MODE_SFI:
+		return "sfi";
 	case PHY_INTERFACE_MODE_10GKR:
 		return "10gbase-kr";
 	case PHY_INTERFACE_MODE_USXGMII:
-- 
2.1.0

