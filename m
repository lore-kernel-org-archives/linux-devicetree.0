Return-Path: <SRS0=+ed7=B7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD172C433E3
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 11:14:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C49E3207DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 11:14:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727870AbgHULOJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Aug 2020 07:14:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727859AbgHULOI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 21 Aug 2020 07:14:08 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C43C6C061387
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2020 04:14:07 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id JBE42300F4C55Sk01BE42N; Fri, 21 Aug 2020 13:14:05 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k94zk-0002iI-D9; Fri, 21 Aug 2020 13:14:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k94zk-00013b-Bp; Fri, 21 Aug 2020 13:14:04 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: rza1: Switch to using "output-enable"
Date:   Fri, 21 Aug 2020 13:14:01 +0200
Message-Id: <20200821111401.4021-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

For pins requiring software driven IO output operations, the RZ/A1 Pin
Controller uses either the "output-high" or "output-low" DT property to
enable the corresponding output buffer.  The actual line value doesn't
matter, as it is ignored.

Commit 425562429d4f3b13 ("pinctrl: generic: Add output-enable property")
introduced a new DT property for this specific use case.

Update the RZ/A1 Pin Controller DT bindings and driver to use this new
property instead.  Preserve backwards compatibility with old DTBs in the
driver, as this comes at a very small cost.

Notes:
  - The DT binding examples already used the new property,
  - There are no upstream users of the old properties.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in sh-pfc for v5.10.

 .../devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt     | 5 ++---
 drivers/pinctrl/pinctrl-rza1.c                               | 3 ++-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
index fd3696eb36bf307e..38cdd23d3498e74a 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
@@ -117,10 +117,9 @@ function or a GPIO controller alternatively.
     - input-enable:
       enable input bufer for pins requiring software driven IO input
       operations.
-    - output-high:
+    - output-enable:
       enable output buffer for pins requiring software driven IO output
-      operations. output-low can be used alternatively, as line value is
-      ignored by the driver.
+      operations.
 
   The hardware reference manual specifies when a pin has to be configured to
   work in bi-directional mode and when the IO direction has to be specified
diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
index 511f232ab7bc290c..944466ef34d33f51 100644
--- a/drivers/pinctrl/pinctrl-rza1.c
+++ b/drivers/pinctrl/pinctrl-rza1.c
@@ -928,7 +928,8 @@ static int rza1_parse_pinmux_node(struct rza1_pinctrl *rza1_pctl,
 		case PIN_CONFIG_INPUT_ENABLE:
 			pinmux_flags |= MUX_FLAGS_SWIO_INPUT;
 			break;
-		case PIN_CONFIG_OUTPUT:
+		case PIN_CONFIG_OUTPUT:	/* for DT backwards compatibility */
+		case PIN_CONFIG_OUTPUT_ENABLE:
 			pinmux_flags |= MUX_FLAGS_SWIO_OUTPUT;
 		default:
 			break;
-- 
2.17.1

