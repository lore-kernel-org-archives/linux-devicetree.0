Return-Path: <SRS0=aDgx=ZR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C00C432C0
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 Nov 2019 22:51:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7C7F320733
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 Nov 2019 22:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574722291;
	bh=iVkG51EUncJlEhzBeJiQmg/gv6/VysR3bZScVo/r8eU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=AnnBpyaVFog4C9Zv/o6Rm4Ajc0h5tw9Y+ikSZLBbjKV0tq00I3JgxUvRgRL4pDZ7J
	 K099rZeB0EzgJGYGA2zywFY5kWGq7KL2aB1nnBzkGulD57crJp0/ELQ0RHI+Dj8sAu
	 08QUwJqMrOtu5Ct1aSxE7NvTbud3wPMGhCxfLcl0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbfKYWvb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 25 Nov 2019 17:51:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:45594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725946AbfKYWvb (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 25 Nov 2019 17:51:31 -0500
Received: from e123331-lin.home (lfbn-mar-1-643-104.w90-118.abo.wanadoo.fr [90.118.215.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5B5522082F;
        Mon, 25 Nov 2019 22:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574722290;
        bh=iVkG51EUncJlEhzBeJiQmg/gv6/VysR3bZScVo/r8eU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CQJu9G/gfK9XzK5+9haf3+rk1+7Jufxhy72B01HF/u/umFub0TM1qXFZ+rhYkHIXu
         yi+RT50CQJwMPMbNPgZc5OEu0lPYH1gtk51bMsl77c3ZUWPoeJPYGG2rqJdK/cUIhL
         XzmuIVetpR5GKvFM4NVitvUbruVcA1wZkq5Ndtwk=
From:   Ard Biesheuvel <ardb@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, thomas.lendacky@amd.com,
        suravee.suthikulpanit@amd.com, brijeshkumar.singh@amd.com,
        will@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH 3/6] dt: amd-seattle: upgrade AMD Seattle XGBE to new SMMU binding
Date:   Mon, 25 Nov 2019 23:51:07 +0100
Message-Id: <20191125225110.10924-4-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191125225110.10924-1-ardb@kernel.org>
References: <20191125225110.10924-1-ardb@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Upgrade the DT descriptions of the AMD Seattle XGBE network
controllers to use the current SMMU bindings.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/boot/dts/amd/amd-seattle-xgbe-b.dtsi | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/amd/amd-seattle-xgbe-b.dtsi b/arch/arm64/boot/dts/amd/amd-seattle-xgbe-b.dtsi
index d97498361ce3..fdebf78efa94 100644
--- a/arch/arm64/boot/dts/amd/amd-seattle-xgbe-b.dtsi
+++ b/arch/arm64/boot/dts/amd/amd-seattle-xgbe-b.dtsi
@@ -55,7 +55,7 @@
 		clocks = <&xgmacclk0_dma_250mhz>, <&xgmacclk0_ptp_250mhz>;
 		clock-names = "dma_clk", "ptp_clk";
 		phy-mode = "xgmii";
-		#stream-id-cells = <16>;
+		iommus = <&xgmac0_smmu 0x00 0x17>; /* 0-7, 16-23 */
 		dma-coherent;
 	};
 
@@ -81,7 +81,7 @@
 		clocks = <&xgmacclk1_dma_250mhz>, <&xgmacclk1_ptp_250mhz>;
 		clock-names = "dma_clk", "ptp_clk";
 		phy-mode = "xgmii";
-		#stream-id-cells = <16>;
+		iommus = <&xgmac1_smmu 0x00 0x17>; /* 0-7, 16-23 */
 		dma-coherent;
 	};
 
@@ -94,11 +94,7 @@
 			       */
 			      <0 336 4>,
 			      <0 336 4>;
-
-		 mmu-masters = <&xgmac0
-			  0  1  2  3  4  5  6  7
-			 16 17 18 19 20 21 22 23
-		 >;
+		#iommu-cells = <2>;
 	 };
 
 	 xgmac1_smmu: smmu@e0800000 {
@@ -110,9 +106,5 @@
 			       */
 			      <0 335 4>,
 			      <0 335 4>;
-
-		 mmu-masters = <&xgmac1
-			  0  1  2  3  4  5  6  7
-			 16 17 18 19 20 21 22 23
-		 >;
+		#iommu-cells = <2>;
 	 };
-- 
2.17.1

