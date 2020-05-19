Return-Path: <SRS0=7YFh=7B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FC5C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 07:42:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9A6E207D8
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 07:42:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbgESHmh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 May 2020 03:42:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbgESHmh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 May 2020 03:42:37 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E8AC061A0C
        for <devicetree@vger.kernel.org>; Tue, 19 May 2020 00:42:36 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:918e:b928:22c1:d715])
        by andre.telenet-ops.be with bizsmtp
        id gXiW2200Q4CPMDc01XiWgj; Tue, 19 May 2020 09:42:34 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jawtS-0008Ff-GR; Tue, 19 May 2020 09:42:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jawtS-0005qr-Dv; Tue, 19 May 2020 09:42:30 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: media: Add missing clock domain description
Date:   Tue, 19 May 2020 09:42:29 +0200
Message-Id: <20200519074229.22308-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

make dtbs_check:

    arch/arm/boot/dts/r7s72100-genmai.dt.yaml: camera@e8210000: 'clocks', 'power-domains' do not match any of the regexes: 'pinctrl-[0-9]+'

Fix this by documenting the missing properties.
Update the example to match reality.

Fixes: 7f464532b05dadc8 ("dt-bindings: Add missing 'additionalProperties: false'")
Fixes: 58361eaa11d561f3 ("dt-bindings: media: renesas,ceu: Convert to yaml")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/media/renesas,ceu.yaml        | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,ceu.yaml b/Documentation/devicetree/bindings/media/renesas,ceu.yaml
index f2393458814ee08f..c7e1e4fe67e6696b 100644
--- a/Documentation/devicetree/bindings/media/renesas,ceu.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,ceu.yaml
@@ -27,6 +27,12 @@ properties:
   interrupts:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
   port:
     type: object
     additionalProperties: false
@@ -57,6 +63,8 @@ required:
   - compatible
   - reg
   - interrupts
+  - clocks
+  - power-domains
   - port
 
 additionalProperties: false
@@ -64,11 +72,14 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/r7s72100-clock.h>
 
     ceu: ceu@e8210000 {
         reg = <0xe8210000 0x209c>;
         compatible = "renesas,r7s72100-ceu";
         interrupts = <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&mstp6_clks R7S72100_CLK_CEU>;
+        power-domains = <&cpg_clocks>;
 
         port {
             ceu_in: endpoint {
-- 
2.17.1

