Return-Path: <SRS0=bPG9=YQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F4C7C47E49
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 12:29:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E2CFA21920
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 12:29:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391308AbfJWM30 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 23 Oct 2019 08:29:26 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:39178 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391307AbfJWM3Z (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 23 Oct 2019 08:29:25 -0400
Received: from ramsan ([84.194.98.4])
        by xavier.telenet-ops.be with bizsmtp
        id H0VK2100905gfCL010VKSV; Wed, 23 Oct 2019 14:29:23 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFlP-0000Fd-5w; Wed, 23 Oct 2019 14:29:19 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFlP-0003BF-4e; Wed, 23 Oct 2019 14:29:19 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 3/5] dt-bindings: reset: rcar-rst: Document r8a77961 support
Date:   Wed, 23 Oct 2019 14:29:09 +0200
Message-Id: <20191023122911.12166-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023122911.12166-1-geert+renesas@glider.be>
References: <20191023122911.12166-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add DT binding documentation for the Reset block in the Renesas R-Car
M3-W+ (R8A77961) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by.
---
 Documentation/devicetree/bindings/reset/renesas,rst.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rst.txt b/Documentation/devicetree/bindings/reset/renesas,rst.txt
index d6d6769a0c42735f..de7f06ccd003da9f 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rst.txt
+++ b/Documentation/devicetree/bindings/reset/renesas,rst.txt
@@ -31,6 +31,7 @@ Required properties:
 		  - "renesas,r8a7794-rst" (R-Car E2)
 		  - "renesas,r8a7795-rst" (R-Car H3)
 		  - "renesas,r8a7796-rst" (R-Car M3-W)
+		  - "renesas,r8a77961-rst" (R-Car M3-W+)
 		  - "renesas,r8a77965-rst" (R-Car M3-N)
 		  - "renesas,r8a77970-rst" (R-Car V3M)
 		  - "renesas,r8a77980-rst" (R-Car V3H)
-- 
2.17.1

