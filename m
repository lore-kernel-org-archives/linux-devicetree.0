From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH 1/3] regulator: arizona: Update device tree binding to support Madera CODECs
Date: Tue, 21 May 2019 11:04:37 +0100
Message-ID: <20190521100439.27383-1-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Arizona regulator drivers are now also used by the Cirrus Logic
Madera audio CODECs, update the binding document to link to the primary
binding document for these as well as the existing Arizona document.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 Documentation/devicetree/bindings/regulator/arizona-regulator.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/arizona-regulator.txt b/Documentation/devicetree/bindings/regulator/arizona-regulator.txt
index 443564d7784fd..69bf41949b01f 100644
--- a/Documentation/devicetree/bindings/regulator/arizona-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/arizona-regulator.txt
@@ -5,7 +5,8 @@ of analogue I/O.
 
 This document lists regulator specific bindings, see the primary binding
 document:
-  ../mfd/arizona.txt
+  For Wolfson Microelectronic Arizona codecs: ../mfd/arizona.txt
+  For Cirrus Logic Madera codecs: ../mfd/madera.txt
 
 Optional properties:
   - wlf,ldoena : GPIO specifier for the GPIO controlling LDOENA
-- 
2.11.0
