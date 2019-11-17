Return-Path: <SRS0=biny=ZJ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E687C432C0
	for <linux-devicetree@archiver.kernel.org>; Sun, 17 Nov 2019 13:01:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5118E2075C
	for <linux-devicetree@archiver.kernel.org>; Sun, 17 Nov 2019 13:01:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbfKQNBJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 17 Nov 2019 08:01:09 -0500
Received: from inva020.nxp.com ([92.121.34.13]:40084 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726127AbfKQNBJ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 17 Nov 2019 08:01:09 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 2516F1A0113;
        Sun, 17 Nov 2019 14:01:08 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 463EB1A0123;
        Sun, 17 Nov 2019 14:01:04 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 296254029F;
        Sun, 17 Nov 2019 21:00:59 +0800 (SGT)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     devicetree@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, dongas86@gmail.com,
        kernel@pengutronix.de, shawnguo@kernel.org, robh+dt@kernel.org,
        linux-imx@nxp.com, Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 1/3] dt-bindings: mmc: fsl-imx-esdhc: add imx8qm compatible string
Date:   Sun, 17 Nov 2019 20:58:48 +0800
Message-Id: <1573995530-14573-1-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add imx8qm compatible string.

Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.txt b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.txt
index f707b8bee304..b8a4622d0718 100644
--- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.txt
+++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.txt
@@ -18,6 +18,7 @@ Required properties:
 	       "fsl,imx6ull-usdhc"
 	       "fsl,imx7d-usdhc"
 	       "fsl,imx7ulp-usdhc"
+	       "fsl,imx8qm-usdhc"
 	       "fsl,imx8qxp-usdhc"
 
 Optional properties:
-- 
2.23.0

