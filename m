Return-Path: <SRS0=biny=ZJ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F99C33C9A
	for <linux-devicetree@archiver.kernel.org>; Sun, 17 Nov 2019 13:01:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6EBAA20891
	for <linux-devicetree@archiver.kernel.org>; Sun, 17 Nov 2019 13:01:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbfKQNBL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 17 Nov 2019 08:01:11 -0500
Received: from inva020.nxp.com ([92.121.34.13]:40162 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726037AbfKQNBL (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 17 Nov 2019 08:01:11 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0DF071A0123;
        Sun, 17 Nov 2019 14:01:10 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 302631A06FA;
        Sun, 17 Nov 2019 14:01:06 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 1489C402AA;
        Sun, 17 Nov 2019 21:01:01 +0800 (SGT)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     devicetree@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, dongas86@gmail.com,
        kernel@pengutronix.de, shawnguo@kernel.org, robh+dt@kernel.org,
        linux-imx@nxp.com, Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 3/3] dt-bindings: i2c: lpi2c: add imx8qm compatible string
Date:   Sun, 17 Nov 2019 20:58:50 +0800
Message-Id: <1573995530-14573-3-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573995530-14573-1-git-send-email-aisheng.dong@nxp.com>
References: <1573995530-14573-1-git-send-email-aisheng.dong@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add imx8qm compatible string.

Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.txt b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.txt
index b245363d6d60..f0c072ff9eca 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.txt
@@ -4,6 +4,7 @@ Required properties:
 - compatible :
   - "fsl,imx7ulp-lpi2c" for LPI2C compatible with the one integrated on i.MX7ULP soc
   - "fsl,imx8qxp-lpi2c" for LPI2C compatible with the one integrated on i.MX8QXP soc
+  - "fsl,imx8qm-lpi2c" for LPI2C compatible with the one integrated on i.MX8QM soc
 - reg : address and length of the lpi2c master registers
 - interrupts : lpi2c interrupt
 - clocks : lpi2c clock specifier
-- 
2.23.0

