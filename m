Return-Path: <SRS0=gSIt=VA=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:58093 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726870AbfGCJzU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 3 Jul 2019 05:55:20 -0400
From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 2/7] dt-bindings: net: mdio: Add address and size cells
Date: Wed,  3 Jul 2019 11:55:08 +0200
Message-Id: <20190703095513.12340-2-maxime.ripard@bootlin.com>
In-Reply-To: <20190703095513.12340-1-maxime.ripard@bootlin.com>
References: <20190703095513.12340-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

MDIO controllers should have child nodes with a singe value in their reg
properties being the ID of the PHY in the bus.

Let's add the proper constraints on #address-cells and #size-cells.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/net/mdio.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/mdio.yaml b/Documentation/devicetree/bindings/net/mdio.yaml
index 12069d0b25c6..24d67074d494 100644
--- a/Documentation/devicetree/bindings/net/mdio.yaml
+++ b/Documentation/devicetree/bindings/net/mdio.yaml
@@ -21,6 +21,12 @@ properties:
   $nodename:
     pattern: "^mdio(@.*)?"
 
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
   reset-gpios:
     maxItems: 1
     description:
-- 
2.21.0
