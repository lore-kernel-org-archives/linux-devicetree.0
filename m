Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BAF5C432C0
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 15:23:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 54ED32073C
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 15:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575386596;
	bh=6pW/HR0Z4Qg481mA2feeya881OuopJ+Y8DDGuFlu1Gs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=rgWSEXvZ8cjaMiQP8jfgiBmy8Vs+A91IncyLnILbDzue1i1iC/EqBS94cuGCERyR1
	 cbD/Y2FZVjpEW6fpO0UbRjGsK7y3xhOtDJQWYZzYpWOE29SHSPMaTNA5gPh+UJWjXv
	 LucIdaVxqlMGZHqYT+vnNPGO76rh4f0tmYP7X0fU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbfLCPXQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 10:23:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:41420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725997AbfLCPXP (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 3 Dec 2019 10:23:15 -0500
Received: from e123331-lin.cambridge.arm.com (fw-tnat-cam5.arm.com [217.140.106.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D81422080A;
        Tue,  3 Dec 2019 15:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575386595;
        bh=6pW/HR0Z4Qg481mA2feeya881OuopJ+Y8DDGuFlu1Gs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qGf3UgpqEhrXVXtmY312vyAgkVCaffcP2xQshMXaXujuVB0LVRCbj4S/B3wCUm1Eu
         N6CR356pbr8Qq/kh1+sU4dmgXLn0yW89D8C0/BsWHswGbKjuDd+0fTAUKGybPhB6c/
         gBdBvH0tk+g9TOJBmWV6m0yGR7LgvCn5u4IuBHkQ=
From:   Ard Biesheuvel <ardb@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Brijesh Singh <brijeshkumar.singh@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v3 3/8] dt: amd-seattle: upgrade AMD Seattle XGBE to new SMMU binding
Date:   Tue,  3 Dec 2019 15:23:01 +0000
Message-Id: <20191203152306.7839-4-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191203152306.7839-1-ardb@kernel.org>
References: <20191203152306.7839-1-ardb@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Upgrade the DT descriptions of the AMD Seattle XGBE network
controllers to use the current SMMU bindings.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/boot/dts/amd/amd-seattle-xgbe-b.dtsi | 22 +++++++-------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/amd/amd-seattle-xgbe-b.dtsi b/arch/arm64/boot/dts/amd/amd-seattle-xgbe-b.dtsi
index d97498361ce3..9259e547e2e8 100644
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
 
@@ -81,11 +81,11 @@
 		clocks = <&xgmacclk1_dma_250mhz>, <&xgmacclk1_ptp_250mhz>;
 		clock-names = "dma_clk", "ptp_clk";
 		phy-mode = "xgmii";
-		#stream-id-cells = <16>;
+		iommus = <&xgmac1_smmu 0x00 0x17>; /* 0-7, 16-23 */
 		dma-coherent;
 	};
 
-	xgmac0_smmu: smmu@e0600000 {
+	xgmac0_smmu: iommu@e0600000 {
 		 compatible = "arm,mmu-401";
 		 reg = <0 0xe0600000 0 0x10000>;
 		 #global-interrupts = <1>;
@@ -94,14 +94,11 @@
 			       */
 			      <0 336 4>,
 			      <0 336 4>;
-
-		 mmu-masters = <&xgmac0
-			  0  1  2  3  4  5  6  7
-			 16 17 18 19 20 21 22 23
-		 >;
+		#iommu-cells = <2>;
+		dma-coherent;
 	 };
 
-	 xgmac1_smmu: smmu@e0800000 {
+	 xgmac1_smmu: iommu@e0800000 {
 		 compatible = "arm,mmu-401";
 		 reg = <0 0xe0800000 0 0x10000>;
 		 #global-interrupts = <1>;
@@ -110,9 +107,6 @@
 			       */
 			      <0 335 4>,
 			      <0 335 4>;
-
-		 mmu-masters = <&xgmac1
-			  0  1  2  3  4  5  6  7
-			 16 17 18 19 20 21 22 23
-		 >;
+		#iommu-cells = <2>;
+		dma-coherent;
 	 };
-- 
2.17.1

