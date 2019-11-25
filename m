Return-Path: <SRS0=aDgx=ZR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB00C432C0
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 Nov 2019 22:51:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 92EA520733
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 Nov 2019 22:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574722293;
	bh=GhbbMPmRLTIiAPr0pna3NGVil80h+WhDuySb/vrOXCY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=YiwB17nu/VB5pNr62LNz90bUbcFBzD+gJ8Dywh8IssHsdjYgOz/1P+wRP0VFCKTec
	 FxfgYtp1avE6Bn8u3fTqWnx2KS7/EULB4PoVMaZOCziqlhapJQyNpot3XnrByS9g1N
	 lMB9L5wF0GoTaQeHdXjjrkgYdGlHl1OpcPzbRA+8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbfKYWvd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 25 Nov 2019 17:51:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:45622 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725946AbfKYWvd (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 25 Nov 2019 17:51:33 -0500
Received: from e123331-lin.home (lfbn-mar-1-643-104.w90-118.abo.wanadoo.fr [90.118.215.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A92BF207FD;
        Mon, 25 Nov 2019 22:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574722292;
        bh=GhbbMPmRLTIiAPr0pna3NGVil80h+WhDuySb/vrOXCY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uZQR8yotwsLMB0gnHdYQe+1gjMVsjXxnz4tmDL3AA00b9iD3f3H6QRWEuLMJbgJEc
         3iY5Gvp+YmpGSBVCGiVMv8sJ63q7jdpNs91JO/rH1hEzJb8bipX9WCErN5vfAPzkR3
         gPHq7cdGGJbyF4pB4F6U4vVeBRmJXg/kpIiOdv50=
From:   Ard Biesheuvel <ardb@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, thomas.lendacky@amd.com,
        suravee.suthikulpanit@amd.com, brijeshkumar.singh@amd.com,
        will@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH 4/6] dt: amd-seattle: fix PCIe legacy interrupt routing
Date:   Mon, 25 Nov 2019 23:51:08 +0100
Message-Id: <20191125225110.10924-5-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191125225110.10924-1-ardb@kernel.org>
References: <20191125225110.10924-1-ardb@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The AMD Seattle SOC can be configured to expose up to 3 PCIe root
ports, each of which is wired to 4 dedicated SPI wired interrupts
for legacy INTx support. Update the SOC DT description to reflect
this.

Fix a stale comment about the size of the MMIO64 resource window
while at it.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi | 22 ++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
index b664e7af74eb..9fa6890fca35 100644
--- a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
+++ b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
@@ -213,12 +213,22 @@
 			msi-parent = <&v2m0>;
 			reg = <0 0xf0000000 0 0x10000000>;
 
-			interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
+			interrupt-map-mask = <0xff00 0x0 0x0 0x7>;
 			interrupt-map =
-				<0x1000 0x0 0x0 0x1 &gic0 0x0 0x0 0x0 0x120 0x1>,
-				<0x1000 0x0 0x0 0x2 &gic0 0x0 0x0 0x0 0x121 0x1>,
-				<0x1000 0x0 0x0 0x3 &gic0 0x0 0x0 0x0 0x122 0x1>,
-				<0x1000 0x0 0x0 0x4 &gic0 0x0 0x0 0x0 0x123 0x1>;
+				<0x1100 0x0 0x0 0x1 &gic0 0x0 0x0 0x0 0x120 0x1>,
+				<0x1100 0x0 0x0 0x2 &gic0 0x0 0x0 0x0 0x121 0x1>,
+				<0x1100 0x0 0x0 0x3 &gic0 0x0 0x0 0x0 0x122 0x1>,
+				<0x1100 0x0 0x0 0x4 &gic0 0x0 0x0 0x0 0x123 0x1>,
+
+				<0x1200 0x0 0x0 0x1 &gic0 0x0 0x0 0x0 0x124 0x1>,
+				<0x1200 0x0 0x0 0x2 &gic0 0x0 0x0 0x0 0x125 0x1>,
+				<0x1200 0x0 0x0 0x3 &gic0 0x0 0x0 0x0 0x126 0x1>,
+				<0x1200 0x0 0x0 0x4 &gic0 0x0 0x0 0x0 0x127 0x1>,
+
+				<0x1300 0x0 0x0 0x1 &gic0 0x0 0x0 0x0 0x128 0x1>,
+				<0x1300 0x0 0x0 0x2 &gic0 0x0 0x0 0x0 0x129 0x1>,
+				<0x1300 0x0 0x0 0x3 &gic0 0x0 0x0 0x0 0x12a 0x1>,
+				<0x1300 0x0 0x0 0x4 &gic0 0x0 0x0 0x0 0x12b 0x1>;
 
 			dma-coherent;
 			dma-ranges = <0x43000000 0x0 0x0 0x0 0x0 0x100 0x0>;
@@ -227,7 +237,7 @@
 				<0x01000000 0x00 0x00000000 0x00 0xefff0000 0x00 0x00010000>,
 				/* 32-bit MMIO (size=2G) */
 				<0x02000000 0x00 0x40000000 0x00 0x40000000 0x00 0x80000000>,
-				/* 64-bit MMIO (size= 124G) */
+				/* 64-bit MMIO (size= 508G) */
 				<0x03000000 0x01 0x00000000 0x01 0x00000000 0x7f 0x00000000>;
 		};
 
-- 
2.17.1

