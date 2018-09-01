Return-Path: <SRS0=ucpJ=LP=gmail.com=semtax33@kernel.org>
From: sim manseop <semtax33@gmail.com>
Subject: [PATCH v2] dt-bindings: i2c: fix typo in brcm,bcm2835-i2c.txt
Date: Sat,  1 Sep 2018 15:23:00 +0000
Message-Id: <20180901152300.1895-1-semtax33@gmail.com>
To: devicetree@vger.kernel.org
Cc: robh@kernel.org, sim manseop <semtax33@gmail.com>
List-ID: <devicetree@vger.kernel.org>

Fix typo in brcm,bcm2835-i2c.txt between dts unit address and register start address mismatch.

Signed-off-by: manseop sim <semtax33@gmail.com>

---
Changes in v2:
- modify subject
- modify commit message
---
 Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt b/Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt
index e9de3756752b..ec78f84893ec 100644
--- a/Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt
@@ -11,7 +11,7 @@ Recommended properties:
 
 Example:
 
-i2c@20205000 {
+i2c@7e205000 {
 	compatible = "brcm,bcm2835-i2c";
 	reg = <0x7e205000 0x1000>;
 	interrupts = <2 21>;
-- 
2.17.1
