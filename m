Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E6CFC432C0
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 15:23:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5AA702070A
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 15:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575386599;
	bh=3xNoirRsHB2eXxhJ+g4PBX9kpskIFtSZ4st9oKNFx1M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=NUlqoIS1DFLa86YcN23ksTWEEntpY/P+09UkX5hPCsaXYLcq7HWEazJvRLeDj7wLN
	 WjZc7WKexkODAWOZqx48G1nsidh8W8e8rvNh6KjgxPscRKHCT4fIKysCYzskFnDc74
	 hJQ2fnh4TqWGQZ47ndDC6qu/lQ8dgDAK0qvpGDTs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbfLCPXT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 10:23:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:41486 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725997AbfLCPXS (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 3 Dec 2019 10:23:18 -0500
Received: from e123331-lin.cambridge.arm.com (fw-tnat-cam5.arm.com [217.140.106.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1A9AD207DD;
        Tue,  3 Dec 2019 15:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575386598;
        bh=3xNoirRsHB2eXxhJ+g4PBX9kpskIFtSZ4st9oKNFx1M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=B/0xw9hdPsV5Z4xRCOh285Hx2bL+qnLWqmD4EJw59NS/1aMAHjJ/IJ42JCzCZg8AF
         +qPKc9JExs6YwGiZjQ8Oywc/gIj/kqsP1uCSw6Bh+/u4CmOIwSVSmOInvri4c8h9rb
         w4C8w00tAgWlGhAK6WTGHedih0QzMIhevbCTFGks=
From:   Ard Biesheuvel <ardb@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Brijesh Singh <brijeshkumar.singh@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v3 5/8] dt: amd-seattle: add a description of the PCIe SMMU
Date:   Tue,  3 Dec 2019 15:23:03 +0000
Message-Id: <20191203152306.7839-6-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191203152306.7839-1-ardb@kernel.org>
References: <20191203152306.7839-1-ardb@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add a description of the SMMU that covers the PCIe host bridge
on AMD Seattle.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
index 9fa6890fca35..124e58a76be0 100644
--- a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
+++ b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
@@ -239,6 +239,16 @@
 				<0x02000000 0x00 0x40000000 0x00 0x40000000 0x00 0x80000000>,
 				/* 64-bit MMIO (size= 508G) */
 				<0x03000000 0x01 0x00000000 0x01 0x00000000 0x7f 0x00000000>;
+			iommu-map = <0x0 &pcie_smmu 0x0 0x10000>;
+		};
+
+		pcie_smmu: iommu@e0a00000 {
+			compatible = "arm,mmu-401";
+			reg = <0 0xe0a00000 0 0x10000>;
+			#global-interrupts = <1>;
+			interrupts = <0 333 4>, <0 333 4>;
+			#iommu-cells = <1>;
+			dma-coherent;
 		};
 
 		/* Perf CCN504 PMU */
-- 
2.17.1

