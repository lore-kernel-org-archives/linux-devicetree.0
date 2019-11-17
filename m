Return-Path: <SRS0=biny=ZJ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A694AC43141
	for <linux-devicetree@archiver.kernel.org>; Sun, 17 Nov 2019 13:01:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 89FDF2084D
	for <linux-devicetree@archiver.kernel.org>; Sun, 17 Nov 2019 13:01:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbfKQNBL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 17 Nov 2019 08:01:11 -0500
Received: from inva020.nxp.com ([92.121.34.13]:40120 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726134AbfKQNBK (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 17 Nov 2019 08:01:10 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1B0D31A070E;
        Sun, 17 Nov 2019 14:01:09 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3C1CA1A0222;
        Sun, 17 Nov 2019 14:01:05 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 1F36F402A9;
        Sun, 17 Nov 2019 21:01:00 +0800 (SGT)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     devicetree@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, dongas86@gmail.com,
        kernel@pengutronix.de, shawnguo@kernel.org, robh+dt@kernel.org,
        linux-imx@nxp.com, Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 2/3] dt-bindings: serial: lpuart: add imx8qm compatible string
Date:   Sun, 17 Nov 2019 20:58:49 +0800
Message-Id: <1573995530-14573-2-git-send-email-aisheng.dong@nxp.com>
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
 Documentation/devicetree/bindings/serial/fsl-lpuart.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.txt b/Documentation/devicetree/bindings/serial/fsl-lpuart.txt
index 3495eee81d53..24ab789b22f7 100644
--- a/Documentation/devicetree/bindings/serial/fsl-lpuart.txt
+++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.txt
@@ -10,6 +10,8 @@ Required properties:
     on i.MX7ULP SoC with 32-bit little-endian register organization
   - "fsl,imx8qxp-lpuart" for lpuart compatible with the one integrated
     on i.MX8QXP SoC with 32-bit little-endian register organization
+  - "fsl,imx8qm-lpuart" for lpuart compatible with the one integrated
+    on i.MX8QM SoC with 32-bit little-endian register organization
 - reg : Address and length of the register set for the device
 - interrupts : Should contain uart interrupt
 - clocks : phandle + clock specifier pairs, one for each entry in clock-names
-- 
2.23.0

