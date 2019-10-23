Return-Path: <SRS0=bPG9=YQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F1AACA9EC0
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 12:33:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 61C4A21928
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 12:33:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389891AbfJWMdv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 23 Oct 2019 08:33:51 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:45776 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390102AbfJWMdq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 23 Oct 2019 08:33:46 -0400
Received: from ramsan ([84.194.98.4])
        by michel.telenet-ops.be with bizsmtp
        id H0Zk2100405gfCL060ZkVF; Wed, 23 Oct 2019 14:33:44 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFpg-0003tv-1D; Wed, 23 Oct 2019 14:33:44 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFpg-0003QQ-09; Wed, 23 Oct 2019 14:33:44 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 05/11] soc: renesas: rcar-rst: Add R8A77961 support
Date:   Wed, 23 Oct 2019 14:33:36 +0200
Message-Id: <20191023123342.13100-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023123342.13100-1-geert+renesas@glider.be>
References: <20191023123342.13100-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add support for the Reset block in the R-Car M3-W+ (R8A77961) SoC to the
Renesas R-Car RST driver.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by, Tested-by,
  - Reword.
---
 drivers/soc/renesas/rcar-rst.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/rcar-rst.c b/drivers/soc/renesas/rcar-rst.c
index cd5592977cefc22b..14d05a070dd3ecea 100644
--- a/drivers/soc/renesas/rcar-rst.c
+++ b/drivers/soc/renesas/rcar-rst.c
@@ -59,6 +59,7 @@ static const struct of_device_id rcar_rst_matches[] __initconst = {
 	/* R-Car Gen3 */
 	{ .compatible = "renesas,r8a7795-rst", .data = &rcar_rst_gen3 },
 	{ .compatible = "renesas,r8a7796-rst", .data = &rcar_rst_gen3 },
+	{ .compatible = "renesas,r8a77961-rst", .data = &rcar_rst_gen3 },
 	{ .compatible = "renesas,r8a77965-rst", .data = &rcar_rst_gen3 },
 	{ .compatible = "renesas,r8a77970-rst", .data = &rcar_rst_gen3 },
 	{ .compatible = "renesas,r8a77980-rst", .data = &rcar_rst_gen3 },
-- 
2.17.1

