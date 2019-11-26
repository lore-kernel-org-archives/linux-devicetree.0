Return-Path: <SRS0=scSd=ZS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79EB8C432C0
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 Nov 2019 11:43:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5325B2080F
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 Nov 2019 11:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574768612;
	bh=pYwVYjRPIBn6454meuf0ZGKHHj28KubWIQAjdu1Xh9g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=pP4vnnH5ECqKpSabBesOWGmjA8H3mi3Gz4xD4VGFzwn24s/kjZZIPLUdfICfIvQkL
	 bw/lLAE9rwgpB9Yd6AQIICzPINWmaCu04oTGyVecH4L6LhL+FHXh9hJ8C6icd2Oa9e
	 NFlg2pJOKmGC3yPJ9H5KpLedEhA8CJUAsuJQmTqA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728169AbfKZLnc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 Nov 2019 06:43:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:35224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725884AbfKZLnb (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 Nov 2019 06:43:31 -0500
Received: from e123331-lin.home (amontpellier-657-1-18-247.w109-210.abo.wanadoo.fr [109.210.65.247])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0C42120835;
        Tue, 26 Nov 2019 11:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574768611;
        bh=pYwVYjRPIBn6454meuf0ZGKHHj28KubWIQAjdu1Xh9g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HM8n4/A9la1NNznZSvOM3osCdDG90SyxUPPcXmCsxW105fiXjwxTkvhmELuCgiZ+0
         guFXQix6qbmnjjLR/ipDeoAHwVsQVa6Qjwy5S8yPDRxWJ+MMOBynNEBBSz6dE9TnlB
         tD6yxlxL9MVFoAVf7SSyt4r54Yb5mR4kGAf6jsho=
From:   Ard Biesheuvel <ardb@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Brijesh Singh <brijeshkumar.singh@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 6/8] dt: amd-seattle: add description of the SATA/CCP SMMUs
Date:   Tue, 26 Nov 2019 12:43:17 +0100
Message-Id: <20191126114319.2755-7-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191126114319.2755-1-ardb@kernel.org>
References: <20191126114319.2755-1-ardb@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add descriptions of the SMMUs that cover the SATA controller(s)
on the AMD Seattle SOC. The CCP crypto accelerator shares its
SMMU with the second SATA controller, which is only enabled on
B1 silicon.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts |  4 ++++
 arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts |  5 +++++
 arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi     | 22 ++++++++++++++++++++
 3 files changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
index 8e341be9a399..be8db5758c94 100644
--- a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
+++ b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
@@ -60,6 +60,10 @@
 	status = "ok";
 };
 
+&sata0 {
+	iommus = <&sata0_smmu 0x0a>, <&sata0_smmu 0x0b>, <&sata0_smmu 0x1a>;
+};
+
 &spi0 {
 	status = "ok";
 };
diff --git a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts
index 92cef05c6b74..1661544eb0af 100644
--- a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts
+++ b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts
@@ -60,7 +60,12 @@
 	status = "ok";
 };
 
+&sata0 {
+	iommus = <&sata0_smmu 0x0e>, <&sata0_smmu 0x0f>, <&sata0_smmu 0x1e>;
+};
+
 &sata1 {
+	iommus = <&sata1_smmu 0x0e>, <&sata1_smmu 0x0f>, <&sata1_smmu 0x1e>;
 	status = "ok";
 };
 
diff --git a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
index 7484ea695262..eac241c98ff0 100644
--- a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
+++ b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
@@ -83,6 +83,24 @@
 			dma-coherent;
 		};
 
+		sata0_smmu: smmu@e0200000 {
+			compatible = "arm,mmu-401";
+			reg = <0 0xe0200000 0 0x10000>;
+			#global-interrupts = <1>;
+			interrupts = <0 332 4>, <0 332 4>;
+			#iommu-cells = <1>;
+			dma-coherent;
+		};
+
+		sata1_smmu: smmu@e0c00000 {
+			compatible = "arm,mmu-401";
+			reg = <0 0xe0c00000 0 0x10000>;
+			#global-interrupts = <1>;
+			interrupts = <0 331 4>, <0 331 4>;
+			#iommu-cells = <1>;
+			dma-coherent;
+		};
+
 		i2c0: i2c@e1000000 {
 			status = "disabled";
 			compatible = "snps,designware-i2c";
@@ -201,6 +219,10 @@
 			reg = <0 0xe0100000 0 0x10000>;
 			interrupts = <0 3 4>;
 			dma-coherent;
+			iommus = <&sata1_smmu 0x00>,
+				 <&sata1_smmu 0x02>,
+				 <&sata1_smmu 0x40>,
+				 <&sata1_smmu 0x42>;
 		};
 
 		pcie0: pcie@f0000000 {
-- 
2.17.1

