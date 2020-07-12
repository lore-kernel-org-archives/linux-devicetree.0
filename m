Return-Path: <SRS0=EOmc=AX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F168EC433E1
	for <linux-devicetree@archiver.kernel.org>; Sun, 12 Jul 2020 10:25:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7130208B8
	for <linux-devicetree@archiver.kernel.org>; Sun, 12 Jul 2020 10:25:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="ouYz4kH2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728662AbgGLKZU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 12 Jul 2020 06:25:20 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:9233 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727777AbgGLKZT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 12 Jul 2020 06:25:19 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f0ae5020001>; Sun, 12 Jul 2020 03:25:06 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sun, 12 Jul 2020 03:25:19 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sun, 12 Jul 2020 03:25:19 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 12 Jul
 2020 10:25:19 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 12 Jul 2020 10:25:19 +0000
Received: from moonraker.nvidia.com (Not Verified[10.26.75.246]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f0ae50e0003>; Sun, 12 Jul 2020 03:25:18 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 3/3] arm64: tegra: Populate VBUS for USB3 on Jetson TX2
Date:   Sun, 12 Jul 2020 11:25:06 +0100
Message-ID: <20200712102506.23686-4-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200712102506.23686-1-jonathanh@nvidia.com>
References: <20200712102506.23686-1-jonathanh@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594549506; bh=yCFruHaw69Mabibsg9VDKDYxzywqatQS+8PmlmivtW8=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=ouYz4kH23cufPUIWzmRCwAqqYgfK2cIMZDblZCPMWneZIZJVB2UkZYEZHLgEAHM/J
         7P5JQmkuTUkl8ixpPX6JS3Khni5nxGuCnWLhqEDvQJtnG3Bf51r/HDYvpASH23mvgD
         mPRu/A14qT5dzlj5cjV/GPpBfJj9CeI6vylLLfdtZvIh9S9vTPxxjKaOl0adCpfvy+
         OJFylu+tK+8IpjOm5FWbboBNW4eXXxG3bRq7xjXpc06KClm4rPrlK8XwXdjVy3XXjI
         IJbKI38UfyBl1wWegdYsxOFtvAxrzsX6LK9TR3j/tsIb8PqU6h/7Po8o1VC0x8Et2O
         K74QiEAx53swQ==
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The VBUS for USB3 connector on the Jetson TX2 is connected to the
vdd_usb1 supply and although this is populated for the USB2 port
on the USB3 connector it is not populated for the USB3 port and
causes the following warning to be seen on boot ...

 usb3-0: supply vbus not found, using dummy regulator

Fix this by also adding the VBUS supply to the USB3 port.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index a70fd4e86840..802b8c52489a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -194,6 +194,7 @@
 
 			usb3-0 {
 				nvidia,usb2-companion = <1>;
+				vbus-supply = <&vdd_usb1>;
 				status = "okay";
 			};
 		};
-- 
2.17.1

