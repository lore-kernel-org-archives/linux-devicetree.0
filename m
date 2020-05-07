Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5D68C38A2A
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 10:14:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA26520663
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 10:14:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="XfOJJXm+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbgEGKOA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 06:14:00 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:12964 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbgEGKN7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 May 2020 06:13:59 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5eb3df5b0000>; Thu, 07 May 2020 03:13:47 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 07 May 2020 03:13:59 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 07 May 2020 03:13:59 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 7 May
 2020 10:13:59 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 7 May 2020 10:13:59 +0000
Received: from moonraker.nvidia.com (Not Verified[10.26.74.75]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5eb3df660002>; Thu, 07 May 2020 03:13:59 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 2/2] arm64: tegra: Allow the PMIC RTC to wakeup Jetson Xavier
Date:   Thu, 7 May 2020 11:13:49 +0100
Message-ID: <20200507101349.14118-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200507101349.14118-1-jonathanh@nvidia.com>
References: <20200507101349.14118-1-jonathanh@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588846427; bh=1hd7UO7e4/0O4siyJRQzrwEbDwRzmLIjEN8fOV8V+vY=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=XfOJJXm+p+XN23h5v5jI9Q4PoatxfEMJLor300JC/4DCnCTYL78Z4SoJ/U4jUx40D
         p876Nz1T9wxIPrcnngkkBDACuWvlSKJupUQpOGzvcdkpVZXHgdpelzB5H4EMcJ04Uv
         ZBIBP/nOvUiVnILHDvkdyIO9H1EOv2PfwveBLxPXNdimxSXVYJyLFkxL5/XffLdGxD
         HNodcLANPI3s2fe8o2Fd4es2CjdngVWkxqNzfGhT1Qi/PwQXMbuRt3Zut8PTI1b8Mk
         ST15nxkGROIc/OPYVBCAKz5ZfxTA7yR8aDy0797R/JZJiZMKpQgNKxq8OtS3iKrFka
         63GE6LA8oROZw==
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The PMIC RTC is currently unable to wakeup Tegra194 on the Jetson Xavier
platform because the interrupt from the PMIC is not usin the PMC as the
interrupt parent but the GIC directly. Update the PMIC interrupt to use
the PMC as the interrupt parent so that the PMIC RTC alarms can wakeup
the device.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
index 623f7d7d216b..eaba167d6cf0 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -111,7 +111,8 @@
 				compatible = "maxim,max20024";
 				reg = <0x3c>;
 
-				interrupts = <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pmc>;
+				interrupts = <24 IRQ_TYPE_LEVEL_LOW>;
 				#interrupt-cells = <2>;
 				interrupt-controller;
 
-- 
2.17.1

