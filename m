Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C39C432C0
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 15:23:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 026432073C
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 15:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575386601;
	bh=qnVdq5u+fBqorGO7xWiFW9bbfJhIka7ZQZK9QJ4pQQg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=m2ewiktqg/OoLTNZbtzEQKx/ZoAwG0oEWazZdeEYlT3qmZAZKNR0nfDl3ady260xR
	 T9V6wEpjQG1vyHqouTyogixiGrXiJYGwmwuXt9mu0TtD8hffVFwP3thoeLq69edToe
	 HnbwEZEt3TXU3qnqvyyhbMxEDOiPxbyu+jqlnMBc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbfLCPXU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 10:23:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:41516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725997AbfLCPXU (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 3 Dec 2019 10:23:20 -0500
Received: from e123331-lin.cambridge.arm.com (fw-tnat-cam5.arm.com [217.140.106.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AF4B22080F;
        Tue,  3 Dec 2019 15:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575386599;
        bh=qnVdq5u+fBqorGO7xWiFW9bbfJhIka7ZQZK9QJ4pQQg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=xXjKttztFdiMTkryx6Z6Rj44uNRRioKcsXH4JJgV9a7sxysxr27uVkaOTj66t6Xrr
         VXdbJRcBymGz1Se1J70AzjuQ4NXQpoIDbWcvDIO06ZJQmr0EFLV8lE64osQl+yq6Vh
         xZGHMpwqMxmvk0XhAyw7KzZ9g9V4GScUTpqIfLUo=
From:   Ard Biesheuvel <ardb@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Brijesh Singh <brijeshkumar.singh@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v3 6/8] dt: amd-seattle: add description of the SATA/CCP SMMUs
Date:   Tue,  3 Dec 2019 15:23:04 +0000
Message-Id: <20191203152306.7839-7-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191203152306.7839-1-ardb@kernel.org>
References: <20191203152306.7839-1-ardb@kernel.org>
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
 arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi | 26 ++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
index 124e58a76be0..547a6bf10f5e 100644
--- a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
+++ b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
@@ -70,6 +70,7 @@
 			reg = <0 0xe0300000 0 0xf0000>;
 			interrupts = <0 355 4>;
 			clocks = <&sataclk_333mhz>;
+			iommus = <&sata0_smmu 0x0 0x1f>;
 			dma-coherent;
 		};
 
@@ -80,6 +81,27 @@
 			reg = <0 0xe0d00000 0 0xf0000>;
 			interrupts = <0 354 4>;
 			clocks = <&sataclk_333mhz>;
+			iommus = <&sata1_smmu 0x0e>,
+				 <&sata1_smmu 0x0f>,
+				 <&sata1_smmu 0x1e>;
+			dma-coherent;
+		};
+
+		sata0_smmu: iommu@e0200000 {
+			compatible = "arm,mmu-401";
+			reg = <0 0xe0200000 0 0x10000>;
+			#global-interrupts = <1>;
+			interrupts = <0 332 4>, <0 332 4>;
+			#iommu-cells = <2>;
+			dma-coherent;
+		};
+
+		sata1_smmu: iommu@e0c00000 {
+			compatible = "arm,mmu-401";
+			reg = <0 0xe0c00000 0 0x10000>;
+			#global-interrupts = <1>;
+			interrupts = <0 331 4>, <0 331 4>;
+			#iommu-cells = <1>;
 			dma-coherent;
 		};
 
@@ -201,6 +223,10 @@
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

