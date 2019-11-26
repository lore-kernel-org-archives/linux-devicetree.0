Return-Path: <SRS0=scSd=ZS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AECD1C432C0
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 Nov 2019 11:43:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8893220836
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 Nov 2019 11:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574768610;
	bh=6l+Q/1zeptnUElv8N8xrlvME3mj9QEmXMRy3WTUJudA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=cfHYaeitndJ7RLnvCV/sUkzHQu5uD6q2GRf/zU0l/cyEdM21IWpx5YjBdha+wLYyj
	 D6/UP6MfqISBiekoIVWjcwyRWvoTNZJfZtDhlg/3Zr00K0olMBrzJ53iJafRf84VAi
	 /ZYn5Kk1mWM5UpmUdCnhoFjeBFqXNUK5nJfGF05A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727575AbfKZLna (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 Nov 2019 06:43:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:35204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725884AbfKZLna (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 Nov 2019 06:43:30 -0500
Received: from e123331-lin.home (amontpellier-657-1-18-247.w109-210.abo.wanadoo.fr [109.210.65.247])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 388DF2082F;
        Tue, 26 Nov 2019 11:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574768609;
        bh=6l+Q/1zeptnUElv8N8xrlvME3mj9QEmXMRy3WTUJudA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=y8Z4BEwV4Ks/l+osPzbblKuMK7xR4Sx+w0rc5WST57aqLzBbGWhiyNGljOqJHlYEG
         OdimtT0hb1EX+52zbix5FGsm0cQq5QpKPJ96YgEytPS0lwmx0Ptf6SaQeDTUHjq/L1
         aND10O477qtGzfrWyNmbX8pJ1Hd6vJNVYbFpmtJc=
From:   Ard Biesheuvel <ardb@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Brijesh Singh <brijeshkumar.singh@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 5/8] dt: amd-seattle: add a description of the PCIe SMMU
Date:   Tue, 26 Nov 2019 12:43:16 +0100
Message-Id: <20191126114319.2755-6-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191126114319.2755-1-ardb@kernel.org>
References: <20191126114319.2755-1-ardb@kernel.org>
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
index 9fa6890fca35..7484ea695262 100644
--- a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
+++ b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
@@ -239,6 +239,16 @@
 				<0x02000000 0x00 0x40000000 0x00 0x40000000 0x00 0x80000000>,
 				/* 64-bit MMIO (size= 508G) */
 				<0x03000000 0x01 0x00000000 0x01 0x00000000 0x7f 0x00000000>;
+			iommu-map = <0x0 &pcie_smmu 0x0 0x10000>;
+		};
+
+		pcie_smmu: smmu@e0a00000 {
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

