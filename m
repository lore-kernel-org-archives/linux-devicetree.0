Return-Path: <SRS0=r3bb=2H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FDE5C2D0D4
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Dec 2019 18:38:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 515FF206EC
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Dec 2019 18:38:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727935AbfLQSit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 17 Dec 2019 13:38:49 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:43544 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728089AbfLQSit (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 17 Dec 2019 13:38:49 -0500
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id f6ei2100C5USYZQ016eiwp; Tue, 17 Dec 2019 19:38:47 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ihHk2-0003aL-LL; Tue, 17 Dec 2019 19:38:42 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ihHk2-000083-Jw; Tue, 17 Dec 2019 19:38:42 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/5] arm64: dts: renesas: Sort DTBs in Makefile
Date:   Tue, 17 Dec 2019 19:38:39 +0100
Message-Id: <20191217183841.432-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217183841.432-1-geert+renesas@glider.be>
References: <20191217183841.432-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Sort the entries for the various DTBs in the Makefile by SoC and board
type.  Keep Salvator-X(S) together, and do the same for ULCB with and
without Kingfisher extension.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/Makefile | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index f7ed7b5a41ea3c77..7ac6f18c996a0961 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -4,18 +4,15 @@ dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-ex.dtb
 dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n.dtb
 dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-ex.dtb
 dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-cat874.dtb r8a774c0-ek874.dtb
-dtb-$(CONFIG_ARCH_R8A7795) += r8a77951-salvator-x.dtb r8a77951-ulcb.dtb
-dtb-$(CONFIG_ARCH_R8A7795) += r8a77951-ulcb-kf.dtb
-dtb-$(CONFIG_ARCH_R8A7795) += r8a77951-salvator-xs.dtb
-dtb-$(CONFIG_ARCH_R8A7795) += r8a77950-salvator-x.dtb r8a77950-ulcb.dtb
-dtb-$(CONFIG_ARCH_R8A7795) += r8a77950-ulcb-kf.dtb
-dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-salvator-x.dtb r8a77960-ulcb.dtb
-dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-ulcb-kf.dtb
-dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-salvator-xs.dtb
+dtb-$(CONFIG_ARCH_R8A7795) += r8a77950-salvator-x.dtb
+dtb-$(CONFIG_ARCH_R8A7795) += r8a77950-ulcb.dtb r8a77950-ulcb-kf.dtb
+dtb-$(CONFIG_ARCH_R8A7795) += r8a77951-salvator-x.dtb r8a77951-salvator-xs.dtb
+dtb-$(CONFIG_ARCH_R8A7795) += r8a77951-ulcb.dtb r8a77951-ulcb-kf.dtb
+dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-salvator-x.dtb r8a77960-salvator-xs.dtb
+dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-ulcb.dtb r8a77960-ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A77961) += r8a77961-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-salvator-x.dtb r8a77965-salvator-xs.dtb
-dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-ulcb.dtb
-dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-ulcb-kf.dtb
+dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-ulcb.dtb r8a77965-ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle.dtb r8a77970-v3msk.dtb
 dtb-$(CONFIG_ARCH_R8A77980) += r8a77980-condor.dtb r8a77980-v3hsk.dtb
 dtb-$(CONFIG_ARCH_R8A77990) += r8a77990-ebisu.dtb
-- 
2.17.1

