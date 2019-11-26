Return-Path: <SRS0=scSd=ZS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7667CC432C0
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 Nov 2019 11:43:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3C1412082F
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 Nov 2019 11:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574768607;
	bh=DC7wsQLVdf0rpWXSK0wPXgvQe8LBS7hetKTgYGaTbbA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=eH3aDfZvCftlBqIEitdcrv1nCD8TJvT5BijVJ3XuldWjDZ1VuB2AdZHYCjab1prhr
	 1zxY+qRdyXi7QF1fBLRMUBT5rHRpqccUa8RlVnCzIReQfcX+7Iobbo8qRVge7NH7Mb
	 b9TB22IfRxuNC0f1Pxog/i12n/+GtXn1JAZEPuEU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbfKZLn0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 Nov 2019 06:43:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:35146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725884AbfKZLn0 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 Nov 2019 06:43:26 -0500
Received: from e123331-lin.home (amontpellier-657-1-18-247.w109-210.abo.wanadoo.fr [109.210.65.247])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8A1B620862;
        Tue, 26 Nov 2019 11:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574768606;
        bh=DC7wsQLVdf0rpWXSK0wPXgvQe8LBS7hetKTgYGaTbbA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NQTNQPz2mhA9NqzW2JvWSwghgCTfwPk/cw97Wlkgaz3ohZUU514unia7GyEo7CJVd
         YvlT9qX6KwClSk1GXY8c/Yo+LhX6MFX0X9nPe6YFG2B8kQoEjNjOxu5e2glOcKb2dD
         Y5/lhUsLGVp21uMex/QjTkkZ0o61j4mavH5DXt7M=
From:   Ard Biesheuvel <ardb@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Brijesh Singh <brijeshkumar.singh@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 3/8] dt: amd-seattle: upgrade AMD Seattle XGBE to new SMMU binding
Date:   Tue, 26 Nov 2019 12:43:14 +0100
Message-Id: <20191126114319.2755-4-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191126114319.2755-1-ardb@kernel.org>
References: <20191126114319.2755-1-ardb@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Upgrade the DT descriptions of the AMD Seattle XGBE network
controllers to use the current SMMU bindings.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/boot/dts/amd/amd-seattle-xgbe-b.dtsi | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/amd/amd-seattle-xgbe-b.dtsi b/arch/arm64/boot/dts/amd/amd-seattle-xgbe-b.dtsi
index d97498361ce3..edda6c2ef90c 100644
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
 
@@ -94,11 +94,8 @@
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
 
 	 xgmac1_smmu: smmu@e0800000 {
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

