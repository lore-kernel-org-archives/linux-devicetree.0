Return-Path: <SRS0=7YFh=7B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FDEDC433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 07:55:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDF5A206D4
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 07:55:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728510AbgESHza (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 May 2020 03:55:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728493AbgESHza (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 May 2020 03:55:30 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1C4BC05BD09
        for <devicetree@vger.kernel.org>; Tue, 19 May 2020 00:55:29 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:918e:b928:22c1:d715])
        by laurent.telenet-ops.be with bizsmtp
        id gXvT220014CPMDc01XvTet; Tue, 19 May 2020 09:55:27 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jax5y-0000DH-VT; Tue, 19 May 2020 09:55:26 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jax5y-0006S0-TO; Tue, 19 May 2020 09:55:26 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: sh73a0: Add missing clocks to sound node
Date:   Tue, 19 May 2020 09:55:25 +0200
Message-Id: <20200519075525.24742-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The device node for the FIFO-buffered Serial Interface sound node lacks
the "clocks" property, as the DTS file didn't describe any clocks yet at
its introduction.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-fixes for v5.7 or v5.8, to avoid the
corresponding DT binding update introducing a regression.

 arch/arm/boot/dts/sh73a0.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/sh73a0.dtsi b/arch/arm/boot/dts/sh73a0.dtsi
index 6688f058087704d3..d7339e511288a4ec 100644
--- a/arch/arm/boot/dts/sh73a0.dtsi
+++ b/arch/arm/boot/dts/sh73a0.dtsi
@@ -601,6 +601,7 @@
 		compatible = "renesas,fsi2-sh73a0", "renesas,sh_fsi2";
 		reg = <0xec230000 0x400>;
 		interrupts = <GIC_SPI 146 0x4>;
+		clocks = <&mstp3_clks SH73A0_CLK_FSI>;
 		power-domains = <&pd_a4mp>;
 		status = "disabled";
 	};
-- 
2.17.1

