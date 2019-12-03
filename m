Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D42B3C432C3
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 15:23:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AC1432070A
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 15:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575386597;
	bh=GhbbMPmRLTIiAPr0pna3NGVil80h+WhDuySb/vrOXCY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=bNJBOwfkUMubkBCx40v7RF5YRk9vzMUzsd2T5llCiIL1Y2axxB09OfGmsDWVlbIbU
	 B1CEV7RfCXj/R7r3wx1aq1WcIFt61OziWPwRFRNfKn80baiTi/dC8tc72GZwrvJ065
	 Rmo0Ft0Bxf8bw8Pg6RCLZo6WPK6RjToKIKND56hY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbfLCPXR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 10:23:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:41460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725997AbfLCPXR (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 3 Dec 2019 10:23:17 -0500
Received: from e123331-lin.cambridge.arm.com (fw-tnat-cam5.arm.com [217.140.106.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7889B20803;
        Tue,  3 Dec 2019 15:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575386596;
        bh=GhbbMPmRLTIiAPr0pna3NGVil80h+WhDuySb/vrOXCY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o6YaL9jeOK4yLYNq8tA3QnKqah7U0VuDi1jXEWcoL3wjwgUb4wd56UZW7Q/nNTOE1
         eK/fkULZOZJDco1nfe5iZiJxheyoIvF2D/D5W1CrDjBt3ZkhRjb/ImuRd13OXUpWG2
         K8MDbd/YNpPbQ1O1ZZ37/tCEwSO2N+e5EIbKJeCo=
From:   Ard Biesheuvel <ardb@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Brijesh Singh <brijeshkumar.singh@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v3 4/8] dt: amd-seattle: fix PCIe legacy interrupt routing
Date:   Tue,  3 Dec 2019 15:23:02 +0000
Message-Id: <20191203152306.7839-5-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191203152306.7839-1-ardb@kernel.org>
References: <20191203152306.7839-1-ardb@kernel.org>
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

