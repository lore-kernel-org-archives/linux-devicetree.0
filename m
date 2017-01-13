From: David Lechner <david@lechnology.com>
Subject: [PATCH v4 2/4] dt-bindings: Add LEGO MINDSTORMS EV3 compatible specification
Date: Fri, 13 Jan 2017 13:03:40 -0600
Message-ID: <1484334222-14223-3-git-send-email-david@lechnology.com>
References: <1484334222-14223-1-git-send-email-david@lechnology.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1484334222-14223-1-git-send-email-david@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: David Lechner <david@lechnology.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This adds the board level device tree specification for LEGO MINDSTORMS EV3

Signed-off-by: David Lechner <david@lechnology.com>
---
 Documentation/devicetree/bindings/arm/davinci.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/davinci.txt b/Documentation/devicetree/bindings/arm/davinci.txt
index f0841ce..715622c 100644
--- a/Documentation/devicetree/bindings/arm/davinci.txt
+++ b/Documentation/devicetree/bindings/arm/davinci.txt
@@ -13,6 +13,10 @@ EnBW AM1808 based CMC board
 Required root node properties:
     - compatible = "enbw,cmc", "ti,da850;
 
+LEGO MINDSTORMS EV3 (AM1808 based)
+Required root node properties:
+    - compatible = "lego,ev3", "ti,da850";
+
 Generic DaVinci Boards
 ----------------------
 
-- 
2.7.4
