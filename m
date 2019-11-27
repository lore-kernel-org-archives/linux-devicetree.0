Return-Path: <SRS0=XuEv=ZT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3928C432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 18:19:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BD9562070B
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 18:19:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfK0STX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 Nov 2019 13:19:23 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:60511 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726576AbfK0STX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 27 Nov 2019 13:19:23 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1ia1uL-0001Xh-Le; Wed, 27 Nov 2019 19:19:21 +0100
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: [PATCH] arm64: dts: zii-ultra: adjust board names
Date:   Wed, 27 Nov 2019 19:19:21 +0100
Message-Id: <20191127181921.22030-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: "Ruslan V. Sushko" <ruslan.sushko@zii.aero>

Change ZII Ultra board names to be more in line with other ZII RDU platforms.

Signed-off-by: Ruslan Sushko <Ruslan.Sushko@zii.aero>
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dts | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dts b/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dts
index d2a6da479980..6b3581366d67 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dts
@@ -8,7 +8,7 @@
 #include "imx8mq-zii-ultra.dtsi"
 
 / {
-	model = "ZII i.MX8MQ Ultra RMB3 Board";
+	model = "ZII Ultra RMB3 Board";
 	compatible = "zii,imx8mq-ultra-rmb3", "zii,imx8mq-ultra", "fsl,imx8mq";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dts b/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dts
index 1084d9330403..173b9e9b2bbd 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dts
@@ -8,7 +8,7 @@
 #include "imx8mq-zii-ultra.dtsi"
 
 / {
-	model = "ZII i.MX8MQ Ultra Zest Board";
+	model = "ZII Ultra Zest Board";
 	compatible = "zii,imx8mq-ultra-zest", "zii,imx8mq-ultra", "fsl,imx8mq";
 };
 
-- 
2.20.1

