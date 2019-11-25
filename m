Return-Path: <SRS0=aDgx=ZR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 124F9C432C0
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 Nov 2019 22:51:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D989C2075C
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 Nov 2019 22:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574722286;
	bh=EdHb6GNww8MdRNhWb+nGzxBHQmuFPNwfTahArtna3uI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=XuVwo6PZlLUwP+TgZsihX8hrzbMBTPZUDlqDivdx85KvzZUF/aHXLgKb51tp0YLtf
	 vOty8geKDnr5WK2MqftSOKK2ov8zF8ADi9FSwCn6OJ4DdISgcEHX1tUbUNa5qjcUCH
	 qolr33wtsejhMbTVrX6aIiMpaIHnR68MLuquveQo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbfKYWv0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 25 Nov 2019 17:51:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:45494 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725946AbfKYWv0 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 25 Nov 2019 17:51:26 -0500
Received: from e123331-lin.home (lfbn-mar-1-643-104.w90-118.abo.wanadoo.fr [90.118.215.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D3E552075C;
        Mon, 25 Nov 2019 22:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574722285;
        bh=EdHb6GNww8MdRNhWb+nGzxBHQmuFPNwfTahArtna3uI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Nfg1mRLIuZthwroFe9hqmiN7/VLbbqGmpOPkS9sCGx6OlRFoqBBfk52YgACw+uoT7
         g7R5b+lU4opu1GzwQmuehACB5rro/3UHtssBT6k/WxS8BJ68xPt+PWs97SBsdupUuV
         KWPgazlfBDJ0MwXhxfJxCUQ4pBJSyXxVjy+Bkfvg=
From:   Ard Biesheuvel <ardb@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, thomas.lendacky@amd.com,
        suravee.suthikulpanit@amd.com, brijeshkumar.singh@amd.com,
        will@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH 1/6] dt: amd-seattle: remove Husky platform
Date:   Mon, 25 Nov 2019 23:51:05 +0100
Message-Id: <20191125225110.10924-2-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191125225110.10924-1-ardb@kernel.org>
References: <20191125225110.10924-1-ardb@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The Huskyboard never made it to production, and its successor the
Celloboard was only shipped in very limited quantities with ACPI
only firmware, so the historical significance of husky.dts is
highly questionable. Let's drop it.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/boot/dts/amd/Makefile  |  3 +-
 arch/arm64/boot/dts/amd/husky.dts | 84 --------------------
 2 files changed, 1 insertion(+), 86 deletions(-)

diff --git a/arch/arm64/boot/dts/amd/Makefile b/arch/arm64/boot/dts/amd/Makefile
index 6a6093064a32..5e27bc0321e9 100644
--- a/arch/arm64/boot/dts/amd/Makefile
+++ b/arch/arm64/boot/dts/amd/Makefile
@@ -1,4 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SEATTLE) += amd-overdrive.dtb \
-			amd-overdrive-rev-b0.dtb amd-overdrive-rev-b1.dtb \
-			husky.dtb
+			amd-overdrive-rev-b0.dtb amd-overdrive-rev-b1.dtb
diff --git a/arch/arm64/boot/dts/amd/husky.dts b/arch/arm64/boot/dts/amd/husky.dts
deleted file mode 100644
index 7acde34772cb..000000000000
--- a/arch/arm64/boot/dts/amd/husky.dts
+++ /dev/null
@@ -1,84 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * DTS file for AMD/Linaro 96Boards Enterprise Edition Server (Husky) Board
- * Note: Based-on AMD Seattle Rev.B0
- *
- * Copyright (C) 2015 Advanced Micro Devices, Inc.
- */
-
-/dts-v1/;
-
-/include/ "amd-seattle-soc.dtsi"
-
-/ {
-	model = "Linaro 96Boards Enterprise Edition Server (Husky) Board";
-	compatible = "amd,seattle-overdrive", "amd,seattle";
-
-	chosen {
-		stdout-path = &serial0;
-	};
-
-	psci {
-		compatible   = "arm,psci-0.2";
-		method       = "smc";
-	};
-};
-
-&ccp0 {
-	status = "ok";
-	amd,zlib-support = <1>;
-};
-
-/**
- * NOTE: In Rev.B, gpio0 is reserved.
- */
-&gpio1 {
-	status = "ok";
-};
-
-&gpio2 {
-	status = "ok";
-};
-
-&gpio3 {
-	status = "ok";
-};
-
-&gpio4 {
-	status = "ok";
-};
-
-&i2c0 {
-	status = "ok";
-};
-
-&i2c1 {
-	status = "ok";
-};
-
-&pcie0 {
-	status = "ok";
-};
-
-&spi0 {
-	status = "ok";
-};
-
-&spi1 {
-	status = "ok";
-	sdcard0: sdcard@0 {
-		compatible = "mmc-spi-slot";
-		reg = <0>;
-		spi-max-frequency = <20000000>;
-		voltage-ranges = <3200 3400>;
-		pl022,hierarchy = <0>;
-		pl022,interface = <0>;
-		pl022,com-mode = <0x0>;
-		pl022,rx-level-trig = <0>;
-		pl022,tx-level-trig = <0>;
-	};
-};
-
-&smb0 {
-	/include/ "amd-seattle-xgbe-b.dtsi"
-};
-- 
2.17.1

