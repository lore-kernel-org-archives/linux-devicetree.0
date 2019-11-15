Return-Path: <SRS0=ud5f=ZH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30886C432C3
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 Nov 2019 11:18:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0461B2072D
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 Nov 2019 11:18:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbfKOLSv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 Nov 2019 06:18:51 -0500
Received: from inva020.nxp.com ([92.121.34.13]:49320 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726521AbfKOLSv (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 15 Nov 2019 06:18:51 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B4DAD1A050C;
        Fri, 15 Nov 2019 12:18:49 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 42CCD1A0A30;
        Fri, 15 Nov 2019 12:18:44 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id A57B0402F8;
        Fri, 15 Nov 2019 19:18:37 +0800 (SGT)
From:   haibo.chen@nxp.com
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, robh+dt@kernel.org,
        mark.rutland@arm.com, kernel@pengutronix.de
Cc:     devicetree@vger.kernel.org, festevam@gmail.com,
        linux-mmc@vger.kernel.org, linux-imx@nxp.com, haibo.chen@nxp.com
Subject: [PATCH 08/14] doc: dt: fsl-imx-esdhc: add strobe-dll-delay-target binding
Date:   Fri, 15 Nov 2019 19:16:45 +0800
Message-Id: <1573816606-26779-1-git-send-email-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Haibo Chen <haibo.chen@nxp.com>

Add fsl,strobe-dll-delay-target binding.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.txt b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.txt
index f707b8bee304..d50144f5f1d2 100644
--- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.txt
+++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.txt
@@ -38,6 +38,11 @@ Optional properties:
   This property allows user to change the tuning step to more than one delay
   cells which is useful for some special boards or cards when the default
   tuning step can't find the proper delay window within limited tuning retries.
+- fsl,strobe-dll-delay-target: Specify the strobe dll control slave delay target.
+  This delay target programming host controller loopback read clock, and this
+  property allows user to change the delay target for the strobe input read clock.
+  If not use this property, driver default set the delay target to value 7.
+  Only eMMC HS400 mode need to take care of this property.
 
 Examples:
 
-- 
2.17.1

