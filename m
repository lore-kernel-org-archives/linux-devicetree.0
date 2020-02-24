Return-Path: <SRS0=+Je1=4M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E5AFC11D2F
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 14:34:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1330720873
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 14:34:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="YrupJt5o"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727820AbgBXOe4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Feb 2020 09:34:56 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:8365 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727803AbgBXOe4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 24 Feb 2020 09:34:56 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e53deec0000>; Mon, 24 Feb 2020 06:34:20 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 24 Feb 2020 06:34:55 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 24 Feb 2020 06:34:55 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 24 Feb
 2020 14:34:55 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 24 Feb 2020 14:34:55 +0000
Received: from thunderball.nvidia.com (Not Verified[10.21.140.91]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e53df0d0000>; Mon, 24 Feb 2020 06:34:54 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 2/4] ARM64: tegra: Add EEPROM supplies
Date:   Mon, 24 Feb 2020 14:34:34 +0000
Message-ID: <20200224143436.5438-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200224143436.5438-1-jonathanh@nvidia.com>
References: <20200224143436.5438-1-jonathanh@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1582554860; bh=XQRed+hM+dOmUn7lEyFBRTITiHe/kmVf6bYnTKyb4yU=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=YrupJt5osNrArZbD3/6N+E76P788S2kgwb7HnwldZ99/x70lrAIXTKHOx35uqz7o0
         bsYj1jAiz+BrmkHt678TBaesev2pBBcp8G+zkGDX+M6MWEvTixhn0bBERoHpnmuhQl
         1fWBcDKGg9r4KT46RFxrjCcRek8FB1gb1nM00FneNHFyguKuZEzRuMvoPfZEPr0Pm3
         HaB3AybSYgm2KABS5aZo/a2/9sIP0Bx2St673Bx+9vz89pPr8lWjHZO9QjIUdJn2Qw
         5rEeeEdOKkbx0RMyKaPAPIdhmrnVzrcyrnZYmf0KnxXJCWitqt2cyAu6uDjPI8kiL+
         JhWqRAza5osKg==
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The following warning is observed on Jetson TX1, Jetson Nano and Jetson
TX2 platforms because the supply regulators are not specified for the
EEPROMs.

 WARNING KERN at24 0-0050: 0-0050 supply vcc not found, using dummy regulator
 WARNING KERN at24 0-0057: 0-0057 supply vcc not found, using dummy regulator

For both of these platforms the EEPROM is powered by the main 1.8V
supply rail and so populate the supply for these devices to fix these
warnings.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 1 +
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     | 1 +
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     | 1 +
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 1 +
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 2 ++
 5 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index d7628f5afb85..961b1be0c56b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -226,6 +226,7 @@
 			compatible = "atmel,24c02";
 			reg = <0x57>;
 
+			vcc-supply = <&vdd_1v8>;
 			address-bits = <8>;
 			page-size = <8>;
 			size = <256>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index 947744d0f04c..da96de04d003 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -171,6 +171,7 @@
 			compatible = "atmel,24c02";
 			reg = <0x50>;
 
+			vcc-supply = <&vdd_1v8>;
 			address-bits = <8>;
 			page-size = <8>;
 			size = <256>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index 95b1a6e76e6e..f87d2437d11c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -272,6 +272,7 @@
 			compatible = "atmel,24c02";
 			reg = <0x50>;
 
+			vcc-supply = <&vdd_1v8>;
 			address-bits = <8>;
 			page-size = <8>;
 			size = <256>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
index a3cafe39ba4c..c70a610f8e3a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -85,6 +85,7 @@
 			compatible = "atmel,24c02";
 			reg = <0x57>;
 
+			vcc-supply = <&vdd_1v8>;
 			address-bits = <8>;
 			page-size = <8>;
 			size = <256>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 848afd855da6..21ed1756b889 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -114,6 +114,7 @@
 			compatible = "atmel,24c02";
 			reg = <0x50>;
 
+			vcc-supply = <&vdd_1v8>;
 			address-bits = <8>;
 			page-size = <8>;
 			size = <256>;
@@ -124,6 +125,7 @@
 			compatible = "atmel,24c02";
 			reg = <0x57>;
 
+			vcc-supply = <&vdd_1v8>;
 			address-bits = <8>;
 			page-size = <8>;
 			size = <256>;
-- 
2.17.1

