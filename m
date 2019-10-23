Return-Path: <SRS0=bPG9=YQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C03CA9EC0
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 12:30:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9A56221906
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 12:30:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391333AbfJWMaA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 23 Oct 2019 08:30:00 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:55572 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391328AbfJWMaA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 23 Oct 2019 08:30:00 -0400
Received: from ramsan ([84.194.98.4])
        by laurent.telenet-ops.be with bizsmtp
        id H0Vy2100v05gfCL010Vyvz; Wed, 23 Oct 2019 14:29:58 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFm2-0000p0-Ip; Wed, 23 Oct 2019 14:29:58 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFm2-0003F8-Hc; Wed, 23 Oct 2019 14:29:58 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/3] dt-bindings: pinctrl: sh-pfc: Document r8a77961 support
Date:   Wed, 23 Oct 2019 14:29:53 +0200
Message-Id: <20191023122955.12420-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023122955.12420-1-geert+renesas@glider.be>
References: <20191023122955.12420-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add DT binding documentation for the Pin Function Controller in the
Renesas R-Car M3-W+ (R8A77961) SoC.

Update all references to R-Car M3-W from "r8a7796" to "r8a77960", to
avoid confusion between R-Car M3-W (R8A77960) and M3-W+.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by,
  - Update R-Car M3-W references.
---
 .../devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
index c1b9eb4c8696d547..6eada23eaa31e430 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
@@ -28,7 +28,8 @@ Required Properties:
     - "renesas,pfc-r8a7793": for R8A7793 (R-Car M2-N) compatible pin-controller.
     - "renesas,pfc-r8a7794": for R8A7794 (R-Car E2) compatible pin-controller.
     - "renesas,pfc-r8a7795": for R8A7795 (R-Car H3) compatible pin-controller.
-    - "renesas,pfc-r8a7796": for R8A7796 (R-Car M3-W) compatible pin-controller.
+    - "renesas,pfc-r8a7796": for R8A77960 (R-Car M3-W) compatible pin-controller.
+    - "renesas,pfc-r8a77961": for R8A77961 (R-Car M3-W+) compatible pin-controller.
     - "renesas,pfc-r8a77965": for R8A77965 (R-Car M3-N) compatible pin-controller.
     - "renesas,pfc-r8a77970": for R8A77970 (R-Car V3M) compatible pin-controller.
     - "renesas,pfc-r8a77980": for R8A77980 (R-Car V3H) compatible pin-controller.
-- 
2.17.1

