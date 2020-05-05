Return-Path: <SRS0=A/SL=6T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86487C47257
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 16:52:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71AC62078C
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 16:52:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730381AbgEEQwn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 May 2020 12:52:43 -0400
Received: from foss.arm.com ([217.140.110.172]:45488 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730251AbgEEQwm (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 5 May 2020 12:52:42 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5730D31B;
        Tue,  5 May 2020 09:52:42 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.25])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3DE273F305;
        Tue,  5 May 2020 09:52:41 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Rob Herring <robh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 12/16] arm64: dts: fvp: Fix SMMU DT node
Date:   Tue,  5 May 2020 17:52:08 +0100
Message-Id: <20200505165212.76466-13-andre.przywara@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200505165212.76466-1-andre.przywara@arm.com>
References: <20200505165212.76466-1-andre.przywara@arm.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The SMMU name in the RevC FVP DT file was not fully binding compliant.

Adjust the node name to match the binding's list of allowed names, also
shuffle the order of the interrupts to comply with the expected order.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/arm/fvp-base-revc.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/fvp-base-revc.dts b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
index 0cf96ceff431..b8a21092db4d 100644
--- a/arch/arm64/boot/dts/arm/fvp-base-revc.dts
+++ b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
@@ -172,14 +172,14 @@
 		dma-coherent;
 	};
 
-	smmu: smmu@2b400000 {
+	smmu: iommu@2b400000 {
 		compatible = "arm,smmu-v3";
 		reg = <0x0 0x2b400000 0x0 0x100000>;
 		interrupts = <GIC_SPI 74 IRQ_TYPE_EDGE_RISING>,
+			     <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
 			     <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>,
-			     <GIC_SPI 77 IRQ_TYPE_EDGE_RISING>,
-			     <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>;
-		interrupt-names = "eventq", "priq", "cmdq-sync", "gerror";
+			     <GIC_SPI 77 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
 		dma-coherent;
 		#iommu-cells = <1>;
 		msi-parent = <&its 0x10000>;
-- 
2.17.1

