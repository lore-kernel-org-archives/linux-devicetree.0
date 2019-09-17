From: Biwen Li <biwen.li@nxp.com>
Subject: [PATCH] devicetree: property-units: Add kohms unit
Date: Tue, 17 Sep 2019 15:58:50 +0800
Message-ID: <20190917075850.40039-1-biwen.li@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, geert+renesas@glider.be, alexandre.belloni@bootlin.com, sam@ravnborg.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Biwen Li <biwen.li@nxp.com>
List-Id: devicetree@vger.kernel.org

The patch adds kohms unit

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
 Documentation/devicetree/bindings/property-units.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/property-units.txt b/Documentation/devicetree/bindings/property-units.txt
index e9b8360b3288..97feb8995d1f 100644
--- a/Documentation/devicetree/bindings/property-units.txt
+++ b/Documentation/devicetree/bindings/property-units.txt
@@ -27,6 +27,7 @@ Electricity
 -microamp	: microampere
 -microamp-hours : microampere hour
 -ohms		: ohm
+-kohms		: kiloohm
 -micro-ohms	: microohm
 -microwatt-hours: microwatt hour
 -microvolt	: microvolt
-- 
2.17.1
