Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A8AC432C3
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 15:23:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ACAB720803
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 15:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575386592;
	bh=EdHb6GNww8MdRNhWb+nGzxBHQmuFPNwfTahArtna3uI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=cQvQ5Pktum9gkK5MLPwxwRr98NgjxZ3KUC+72OnlWkqCw9hVighbSmj/PU0zJkiO7
	 pAjR9JK5GqarBQQC8HXVYgN4h8M4m0biUzTbcePNEYsl8s6iYIQtx4zVVTpRquumjh
	 1nhBa80q21p4bdRZN+nO4UlgZd7fVa1ulhXARqDI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbfLCPXM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 10:23:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:41366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725997AbfLCPXM (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 3 Dec 2019 10:23:12 -0500
Received: from e123331-lin.cambridge.arm.com (fw-tnat-cam5.arm.com [217.140.106.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A13082073C;
        Tue,  3 Dec 2019 15:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575386591;
        bh=EdHb6GNww8MdRNhWb+nGzxBHQmuFPNwfTahArtna3uI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2V3PbDvgZF4lifjtbnWXx/wwvmouB3Zrw22NSGdtWBl9EcL+As1V8B+GUcaYbyB1F
         BYfb0HVmxgnN/myU1hAeI5Ts5cUSoa15sTFpRSNwzXUAIb3O16IzkqadT8KACleSkT
         ZInpgy9AYEpYsfCoChqXdSIiz7xasbJ6NdLSG7dY=
From:   Ard Biesheuvel <ardb@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Brijesh Singh <brijeshkumar.singh@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v3 1/8] dt: amd-seattle: remove Husky platform
Date:   Tue,  3 Dec 2019 15:22:59 +0000
Message-Id: <20191203152306.7839-2-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191203152306.7839-1-ardb@kernel.org>
References: <20191203152306.7839-1-ardb@kernel.org>
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

