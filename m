Return-Path: <SRS0=gSIt=VA=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:47399 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbfGCJxq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 3 Jul 2019 05:53:46 -0400
From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 1/2] dt-bindings: i2c: mv64xxx: Fix the example compatible
Date: Wed,  3 Jul 2019 11:53:37 +0200
Message-Id: <20190703095338.11266-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

One example has a compatible that isn't a valid combination according to
the binding, and now that the examples are validated as well, this
generates a warning.

Let's fix this.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
index 9a5654ef5670..001f2b7abad0 100644
--- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
@@ -105,7 +105,7 @@ examples:
 
   - |
     i2c@11000 {
-        compatible = "marvell,mv78230-i2c", "marvell,mv64xxx-i2c";
+        compatible = "marvell,mv78230-i2c";
         reg = <0x11000 0x100>;
         interrupts = <29>;
         clock-frequency = <100000>;
-- 
2.21.0
