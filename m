Return-Path: <SRS0=aDgx=ZR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE53C432C0
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 Nov 2019 22:51:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB60A2075C
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 Nov 2019 22:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574722288;
	bh=NaCEN7DJRgw9XbI89MhLbH0ZEOc5T0E9kQGhCcD1tqo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=qp3VmXuGuEqsCq1afikfUQ2a6XVxmgRYwUUw6qXRPfk9E9qfK++ePr7M0o1Mrt0gk
	 l+LQHh97A8/3YuDrbFvxUmXc3x8JCtS/2hfydDTV+lOURKfGvUtymoSzT+ZTQr33SX
	 1+iV6u/WPQtDn+2vLPyRvyOcdgWaa8G5Nild0MRI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbfKYWv2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 25 Nov 2019 17:51:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:45526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725946AbfKYWv2 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 25 Nov 2019 17:51:28 -0500
Received: from e123331-lin.home (lfbn-mar-1-643-104.w90-118.abo.wanadoo.fr [90.118.215.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1DCFD207FD;
        Mon, 25 Nov 2019 22:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574722287;
        bh=NaCEN7DJRgw9XbI89MhLbH0ZEOc5T0E9kQGhCcD1tqo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2PDQKQkuQao9jo2qzlnTnlKoTrriHfUxQyXJ08cCth3zaOfgp1aY1Bz5j8LO9Xcl7
         +lGMwsG40w4HDk4AaUyVCN4JlC+q/MT5buvFJ25TPcc8bfwraux07Tb7gGxMIKGSNg
         1zrcFHn4W9rk3zmfmiqLWEBinP039PcCGxZ/plqU=
From:   Ard Biesheuvel <ardb@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, thomas.lendacky@amd.com,
        suravee.suthikulpanit@amd.com, brijeshkumar.singh@amd.com,
        will@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH 2/6] dt: amd-seattle: remove Overdrive revision A0 support
Date:   Mon, 25 Nov 2019 23:51:06 +0100
Message-Id: <20191125225110.10924-3-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191125225110.10924-1-ardb@kernel.org>
References: <20191125225110.10924-1-ardb@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Support for AMD Seattle silicon revision A0 is no longer relevant,
since we no longer have a driver for the network controller, and
the PCIe on these boards was very unreliable. So drop the DTS
description of the A0 version of the overdrive board.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/boot/dts/amd/Makefile          |  3 +-
 arch/arm64/boot/dts/amd/amd-overdrive.dts | 66 --------------------
 2 files changed, 1 insertion(+), 68 deletions(-)

diff --git a/arch/arm64/boot/dts/amd/Makefile b/arch/arm64/boot/dts/amd/Makefile
index 5e27bc0321e9..68103a8b0ef5 100644
--- a/arch/arm64/boot/dts/amd/Makefile
+++ b/arch/arm64/boot/dts/amd/Makefile
@@ -1,3 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_ARCH_SEATTLE) += amd-overdrive.dtb \
-			amd-overdrive-rev-b0.dtb amd-overdrive-rev-b1.dtb
+dtb-$(CONFIG_ARCH_SEATTLE) += amd-overdrive-rev-b0.dtb amd-overdrive-rev-b1.dtb
diff --git a/arch/arm64/boot/dts/amd/amd-overdrive.dts b/arch/arm64/boot/dts/amd/amd-overdrive.dts
deleted file mode 100644
index 41b3a6c0993d..000000000000
--- a/arch/arm64/boot/dts/amd/amd-overdrive.dts
+++ /dev/null
@@ -1,66 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * DTS file for AMD Seattle Overdrive Development Board
- *
- * Copyright (C) 2014 Advanced Micro Devices, Inc.
- */
-
-/dts-v1/;
-
-/include/ "amd-seattle-soc.dtsi"
-
-/ {
-	model = "AMD Seattle Development Board (Overdrive)";
-	compatible = "amd,seattle-overdrive", "amd,seattle";
-
-	chosen {
-		stdout-path = &serial0;
-	};
-};
-
-&ccp0 {
-	status = "ok";
-};
-
-&gpio0 {
-	status = "ok";
-};
-
-&gpio1 {
-	status = "ok";
-};
-
-&i2c0 {
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
-		gpios = <&gpio0 7 0>;
-		interrupt-parent = <&gpio0>;
-		interrupts = <7 3>;
-		pl022,hierarchy = <0>;
-		pl022,interface = <0>;
-		pl022,com-mode = <0x0>;
-		pl022,rx-level-trig = <0>;
-		pl022,tx-level-trig = <0>;
-	};
-};
-
-&v2m0 {
-	arm,msi-base-spi = <64>;
-	arm,msi-num-spis = <256>;
-};
-- 
2.17.1

