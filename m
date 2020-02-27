Return-Path: <SRS0=tkJE=4P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44AC2C4BA2D
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 13:03:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 277632469C
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 13:03:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729142AbgB0ND2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Feb 2020 08:03:28 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:42896 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729110AbgB0ND2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Feb 2020 08:03:28 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id 7p3R2200B5USYZQ06p3Rc2; Thu, 27 Feb 2020 14:03:26 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j7Ip3-0002zD-EN; Thu, 27 Feb 2020 14:03:25 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j7Ip3-0003zy-BV; Thu, 27 Feb 2020 14:03:25 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        Linux-renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] spi: dt-bindings: spi-controller: Fix #address-cells for slave mode
Date:   Thu, 27 Feb 2020 14:03:23 +0100
Message-Id: <20200227130323.15327-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Currently, the DT bindings for an SPI controller specify that
"#address-cells" must be fixed to one.  However, that applies to an SPI
controller in master mode only.  When running in SPI slave mode,
"#address-cells" should be zero.

Fix this making the value of "#address-cells" dependent on the presence
of "spi-slave".

Fixes: 0a1b929356830257 ("spi: Add YAML schemas for the generic SPI options")
Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Is this the right way to specify this?  I couldn't find an example, so
this needed some trial-and-error.

As of dtc commit 403cc79f06a135ae ("checks: Update SPI bus check for
'spi-slave'") and Linux commit c2e7075ca8303631 ("scripts/dtc: Update to
upstream version v1.4.7-57-gf267e674d145"), dtc knows about SPI slave.

However, when using "#address-cells = <0>" with W=1:

    Warning (avoid_unnecessary_addr_size): /soc/spi@e6e10000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

Just removing #address-cells (using /delete-property/ in the board DTS)
to fix this warning causes:

    Warning (spi_bus_bridge): /soc/spi@e6e10000: incorrect #address-cells for SPI bus

as spi_bus_bridge() uses node_addr_cells(), which defaults to 2 (due to
dtc's ppc64 heritage? But node_size_cells() defaults to 1, not 2?).

How should this be fixed?
Should "#address-cells = <0>" be left out or not?
Should node_{addr,size}_cells() in dtc default to zero?

Thanks!
---
 .../devicetree/bindings/spi/spi-controller.yaml   | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-controller.yaml b/Documentation/devicetree/bindings/spi/spi-controller.yaml
index 1e0ca6ccf64bbd0a..ba2646258b94980e 100644
--- a/Documentation/devicetree/bindings/spi/spi-controller.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-controller.yaml
@@ -20,7 +20,8 @@ properties:
     pattern: "^spi(@.*|-[0-9a-f])*$"
 
   "#address-cells":
-    const: 1
+    minimum: 0
+    maximum: 1
 
   "#size-cells":
     const: 0
@@ -52,6 +53,18 @@ properties:
     description:
       The SPI controller acts as a slave, instead of a master.
 
+if:
+  required:
+    [ spi-slave ]
+then:
+  properties:
+    "#address-cells":
+      const: 0
+else:
+  properties:
+    "#address-cells":
+      const: 1
+
 patternProperties:
   "^slave$":
     type: object
-- 
2.17.1

