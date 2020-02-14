Return-Path: <SRS0=lsCC=4C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1144C3B194
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 03:07:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AD1352168B
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 03:07:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728541AbgBNDHE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 13 Feb 2020 22:07:04 -0500
Received: from inva020.nxp.com ([92.121.34.13]:39740 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728195AbgBNDHD (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 13 Feb 2020 22:07:03 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0C07C1A9EFD;
        Fri, 14 Feb 2020 04:07:02 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B9B7A1A9F10;
        Fri, 14 Feb 2020 04:06:56 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 44EB1402F3;
        Fri, 14 Feb 2020 11:06:49 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH 4/5] ARM: dts: imx6ul: make clks node name generic
Date:   Fri, 14 Feb 2020 10:59:39 +0800
Message-Id: <1581649180-26086-4-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581649180-26086-1-git-send-email-Anson.Huang@nxp.com>
References: <1581649180-26086-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Node name should be generic, use "clock-controller" instead of
"ccm" for clks node.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx6ul.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index 2864d24..a4b1be8 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -546,7 +546,7 @@
 				status = "disabled";
 			};
 
-			clks: ccm@20c4000 {
+			clks: clock-controller@20c4000 {
 				compatible = "fsl,imx6ul-ccm";
 				reg = <0x020c4000 0x4000>;
 				interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.7.4

