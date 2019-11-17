Return-Path: <SRS0=biny=ZJ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59BA9C43141
	for <linux-devicetree@archiver.kernel.org>; Sun, 17 Nov 2019 12:46:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3359920850
	for <linux-devicetree@archiver.kernel.org>; Sun, 17 Nov 2019 12:46:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbfKQMqG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 17 Nov 2019 07:46:06 -0500
Received: from inva021.nxp.com ([92.121.34.21]:41308 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726059AbfKQMqG (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 17 Nov 2019 07:46:06 -0500
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id C80BD2007B9;
        Sun, 17 Nov 2019 13:46:04 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5504B20000A;
        Sun, 17 Nov 2019 13:45:59 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 588BF402A9;
        Sun, 17 Nov 2019 20:45:52 +0800 (SGT)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-clk@vger.kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH RESEND v3 02/15] arm64: dts: imx8qxp: move scu pd node before scu clock node
Date:   Sun, 17 Nov 2019 20:43:42 +0800
Message-Id: <1573994635-14479-3-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573994635-14479-1-git-send-email-aisheng.dong@nxp.com>
References: <1573994635-14479-1-git-send-email-aisheng.dong@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

SCU clock depends on SCU Power domain. So let's move scu pd node
before scu clock to make it probe earlier.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
 v2: new patch
---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index dc3d408d091a..c716b7b81b36 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -153,6 +153,11 @@
 			  &lsio_mu1 1 3
 			  &lsio_mu1 3 3>;
 
+		pd: imx8qx-pd {
+			compatible = "fsl,imx8qxp-scu-pd", "fsl,scu-pd";
+			#power-domain-cells = <1>;
+		};
+
 		clk: clock-controller {
 			compatible = "fsl,imx8qxp-clk";
 			#clock-cells = <1>;
@@ -170,11 +175,6 @@
 			#size-cells = <1>;
 		};
 
-		pd: imx8qx-pd {
-			compatible = "fsl,imx8qxp-scu-pd", "fsl,scu-pd";
-			#power-domain-cells = <1>;
-		};
-
 		scu_key: scu-key {
 			compatible = "fsl,imx8qxp-sc-key", "fsl,imx-sc-key";
 			linux,keycodes = <KEY_POWER>;
-- 
2.23.0

