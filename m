Return-Path: <SRS0=Re5X=7C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C8FC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 15:13:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B2C320671
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 15:13:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="ck1AzIzX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726790AbgETPNv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 May 2020 11:13:51 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:1087 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbgETPNv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 May 2020 11:13:51 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ec549220000>; Wed, 20 May 2020 08:13:38 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 20 May 2020 08:13:50 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 20 May 2020 08:13:50 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 20 May
 2020 15:13:29 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 20 May 2020 15:13:29 +0000
Received: from moonraker.nvidia.com (Not Verified[10.26.75.44]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ec549170002>; Wed, 20 May 2020 08:13:28 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: [PATCH 2/2] arm64: tegra: Make the RTC a wakeup source on Jetson Nano and TX1
Date:   Wed, 20 May 2020 16:13:18 +0100
Message-ID: <20200520151318.15493-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200520151318.15493-1-jonathanh@nvidia.com>
References: <20200520151318.15493-1-jonathanh@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1589987618; bh=5xBf/xzhXNwHBaZLoXUyTGDRd28A2viKOYfUpWZOQTI=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=ck1AzIzXHEOs0Sfheb0dn2imWs5DK+hH0sz87WBlH/LJHV+DUtpGeq0w+BloGT1JY
         nzn1aha8+wl9WXx1U5NZnnJe6AuCCP6LCBIXXOAlIntdZYib8y5EQIJ8HbrZt6MeYy
         q97kRcNjLB3gcQnAHif9qMn46QCkY/93vx4Fw5iaWStOeK9X4UW+GYI/ep9oPl0jH4
         oGJZCzAsgz2GXU/0Wuegu7RYKbGi0tqQh1+h0w2ZQZNIKVNm9AOJttiFc2zuhGBGMp
         Fx257proZ+PuHimKNSJCAyzwZiyORS8GY9KKE5KUggWee3At8OcSFY3imoLjFT9Ndh
         JbIOJxff+c4DA==
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The RTC found on the MAX77620 PMIC can be used as a wakeup source on
Jetson Nano and TX1, which is useful to wake the system from suspend
at a given time.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     | 3 ++-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index f87d2437d11c..cc6ed45a2b48 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -38,7 +38,8 @@
 		pmic: pmic@3c {
 			compatible = "maxim,max77620";
 			reg = <0x3c>;
-			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&tegra_pmc>;
+			interrupts = <51 IRQ_TYPE_LEVEL_LOW>;
 
 			#interrupt-cells = <2>;
 			interrupt-controller;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 374ce58b2b38..9bc52fdb393c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -149,7 +149,8 @@
 		pmic: pmic@3c {
 			compatible = "maxim,max77620";
 			reg = <0x3c>;
-			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&tegra_pmc>;
+			interrupts = <51 IRQ_TYPE_LEVEL_LOW>;
 
 			#interrupt-cells = <2>;
 			interrupt-controller;
-- 
2.17.1

