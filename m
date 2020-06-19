Return-Path: <SRS0=bA0P=AA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74ADCC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 19 Jun 2020 08:51:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B3CC214DB
	for <linux-devicetree@archiver.kernel.org>; Fri, 19 Jun 2020 08:51:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731288AbgFSIvy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 19 Jun 2020 04:51:54 -0400
Received: from inva020.nxp.com ([92.121.34.13]:40892 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729521AbgFSIvx (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 19 Jun 2020 04:51:53 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 88B7D1A1249;
        Fri, 19 Jun 2020 10:51:51 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1A7E01A1237;
        Fri, 19 Jun 2020 10:51:48 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 71A9B402B1;
        Fri, 19 Jun 2020 16:51:43 +0800 (SGT)
From:   Biwen Li <biwen.li@oss.nxp.com>
To:     leoyang.li@nxp.com, shawnguo@kernel.org, robh+dt@kernel.org,
        meenakshi.aggarwal@nxp.com
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jiafei.pan@nxp.com, Biwen Li <biwen.li@nxp.com>
Subject: [PATCH] dts: arm64: lx2160a-rdb: fix shunt-resistor
Date:   Fri, 19 Jun 2020 16:46:07 +0800
Message-Id: <20200619084607.16637-1-biwen.li@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Biwen Li <biwen.li@nxp.com>

Fix value of shunt-resistor property

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
index e266d8a170ea..dce79018d397 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
@@ -141,7 +141,7 @@
 			power-monitor@40 {
 				compatible = "ti,ina220";
 				reg = <0x40>;
-				shunt-resistor = <1000>;
+				shunt-resistor = <500>;
 			};
 		};
 
-- 
2.17.1

