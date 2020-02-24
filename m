Return-Path: <SRS0=+Je1=4M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77780C11D30
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 14:35:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 390EC20836
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 14:35:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="K9z8jYfd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727827AbgBXOfC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Feb 2020 09:35:02 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:6117 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727803AbgBXOfC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 24 Feb 2020 09:35:02 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e53deca0000>; Mon, 24 Feb 2020 06:33:46 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 24 Feb 2020 06:35:01 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 24 Feb 2020 06:35:01 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 24 Feb
 2020 14:35:01 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 24 Feb 2020 14:35:01 +0000
Received: from thunderball.nvidia.com (Not Verified[10.21.140.91]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e53df140006>; Mon, 24 Feb 2020 06:35:01 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 4/4] ARM64: tegra: Populate LP8557 backlight regulator
Date:   Mon, 24 Feb 2020 14:34:36 +0000
Message-ID: <20200224143436.5438-4-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200224143436.5438-1-jonathanh@nvidia.com>
References: <20200224143436.5438-1-jonathanh@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1582554826; bh=8MBs7jrK7WrFNE7o6bG0zu41Sicfxu97bK94j6RYNJs=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=K9z8jYfdaYDh/XGz5S/vyzBWYN4ZPYT6jkue5E5YiUVIyQgLCoZqfSIh3h9luB+/C
         DhYTYMkUQRLasUE0VX9dr4Bn0Hxeaw8DjYS7BUq4LqfNwWjsCSsNEhk26FGBEUvhRH
         i2nMUMk5Ivw78ouR6qNZhI6freANsproJ+yQkA0cC9WXj5mQw4xcKRmL48dccxrX47
         aQi0BDk3SCzZBAa+4G3yynAGiRNiFuLVWkg/vFMcq1JDp6a2mVs/CS3Qj0/heE9gPn
         Qr2Wy0Oa6tg3jhxR9hk7qyy5FlkfDAtJOlUt6sPloPS4bhqqDJtbnXZL7lzHDP+sw+
         RZcjavnvJtCIQ==
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The following warning is observed on Jetson TX1 platform because the
supply regulator is not specified for the backlight.

 WARNING KERN lp855x 0-002c: 0-002c supply power not found, using dummy regulator

The backlight supply is provided by the 3.3V SYS rail and so add this
as the supply for the backlight.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
index c70a610f8e3a..ea0e1efa6973 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -56,6 +56,7 @@
 		backlight: backlight@2c {
 			compatible = "ti,lp8557";
 			reg = <0x2c>;
+			power-supply = <&vdd_3v3_sys>;
 
 			dev-ctrl = /bits/ 8 <0x80>;
 			init-brt = /bits/ 8 <0xff>;
-- 
2.17.1

