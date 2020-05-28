Return-Path: <SRS0=2ZKK=7K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36CD0C433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 13:23:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18985207F5
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 13:23:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390371AbgE1NXd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 09:23:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390368AbgE1NXa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 09:23:30 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16ED8C05BD1E
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 06:23:29 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:21:946d:6344:ccc1])
        by albert.telenet-ops.be with bizsmtp
        id kDPT2200155ue4H06DPT2l; Thu, 28 May 2020 15:23:27 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jeIVK-0007sC-TW; Thu, 28 May 2020 15:23:26 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jeIVK-0007tH-Rd; Thu, 28 May 2020 15:23:26 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH dt-schema] Fix interrupt controllers with interrupt-map
Date:   Thu, 28 May 2020 15:23:23 +0200
Message-Id: <20200528132323.30288-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

When an interrupt controller has an "interrupt-map" property, an "is
valid under each of" error is triggered.

Fix this by allowing "interrupt-controller" and "interrupt-map" to
coexist, in both the interrrupts meta-schema and the
interrupt-controller schema.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 meta-schemas/interrupts.yaml      | 2 +-
 schemas/interrupt-controller.yaml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-schemas/interrupts.yaml b/meta-schemas/interrupts.yaml
index 7073063486d44dab..93d8e4cafca679d3 100644
--- a/meta-schemas/interrupts.yaml
+++ b/meta-schemas/interrupts.yaml
@@ -26,7 +26,7 @@ properties:
 dependencies:
   interrupt-map: ['#interrupt-cells', 'interrupt-map-mask']
   '#interrupt-cells':
-    oneOf:
+    anyOf:
       - required:
           - interrupt-controller
       - required:
diff --git a/schemas/interrupt-controller.yaml b/schemas/interrupt-controller.yaml
index f65d5f6d2f1ac524..5dce87d839959489 100644
--- a/schemas/interrupt-controller.yaml
+++ b/schemas/interrupt-controller.yaml
@@ -30,7 +30,7 @@ dependencies:
   interrupt-controller: ['#interrupt-cells']
   interrupt-map: ['#interrupt-cells', 'interrupt-map-mask']
   "#interrupt-cells":
-    oneOf:
+    anyOf:
       - required:
           - interrupt-controller
       - required:
-- 
2.17.1

