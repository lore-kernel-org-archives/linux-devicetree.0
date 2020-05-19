Return-Path: <SRS0=7YFh=7B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7AC0C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 09:54:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B23942084C
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 09:54:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728279AbgESJyl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 May 2020 05:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbgESJyl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 May 2020 05:54:41 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCB74C061A0C
        for <devicetree@vger.kernel.org>; Tue, 19 May 2020 02:54:40 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:918e:b928:22c1:d715])
        by michel.telenet-ops.be with bizsmtp
        id gZuY2200L4CPMDc06ZuYlg; Tue, 19 May 2020 11:54:38 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jayxE-0004yB-7b; Tue, 19 May 2020 11:54:32 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jayxE-0001Tr-4y; Tue, 19 May 2020 11:54:32 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     =?UTF-8?q?Andr=C3=A9=20Przywara?= <andre.przywara@arm.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: r9a06g032: Correct GIC compatible value order
Date:   Tue, 19 May 2020 11:54:31 +0200
Message-Id: <20200519095431.5650-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

According to commit 61efb56e30f1c54e ("dt-bindings: arm: gic: Allow
combining arm,gic-400 compatible strings"), "arm,gic-400" should be
listed first.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Aforementioned commit is in robh/for-next.
---
 arch/arm/boot/dts/r9a06g032.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
index 4c1ab49c7d39aeed..ee59cc84f2121488 100644
--- a/arch/arm/boot/dts/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/r9a06g032.dtsi
@@ -174,7 +174,7 @@
 		};
 
 		gic: interrupt-controller@44101000 {
-			compatible = "arm,cortex-a7-gic", "arm,gic-400";
+			compatible = "arm,gic-400", "arm,cortex-a7-gic";
 			interrupt-controller;
 			#interrupt-cells = <3>;
 			reg = <0x44101000 0x1000>, /* Distributer */
-- 
2.17.1

