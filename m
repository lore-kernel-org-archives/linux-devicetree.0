From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH] dt-bindings: mfd: axp20x: Add fallback for axp805
Date: Tue,  9 Apr 2019 18:05:50 +0200
Message-ID: <20190409160550.1086-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
List-Id: devicetree@vger.kernel.org

axp805 is actually compatible and used with axp806 as fallback.
But it's actually undocumented and trig a warning with checkpatch.

DT compatible string "x-powers,axp805" appears un-documented.

Add this compatible in the dt-bindings documentation.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 Documentation/devicetree/bindings/mfd/axp20x.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/axp20x.txt b/Documentation/devicetree/bindings/mfd/axp20x.txt
index 2af4ff95d6bc..4991a6415796 100644
--- a/Documentation/devicetree/bindings/mfd/axp20x.txt
+++ b/Documentation/devicetree/bindings/mfd/axp20x.txt
@@ -25,6 +25,7 @@ Required properties:
     * "x-powers,axp223"
     * "x-powers,axp803"
     * "x-powers,axp806"
+    * "x-powers,axp805", "x-powers,axp806"
     * "x-powers,axp809"
     * "x-powers,axp813"
 - reg: The I2C slave address or RSB hardware address for the AXP chip
-- 
2.17.1
