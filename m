Return-Path: <SRS0=ucpJ=LP=gmail.com=semtax33@kernel.org>
From: sim manseop <semtax33@gmail.com>
Subject: [PATCH v3 2/2] dt-bindings: i2c: Fix SMBus typo
Date: Sat,  1 Sep 2018 09:49:12 +0000
Message-Id: <20180901094912.2403-1-semtax33@gmail.com>
To: devicetree@vger.kernel.org
Cc: robh@kernel.org, sim manseop <semtax33@gmail.com>
List-ID: <devicetree@vger.kernel.org>

Fix typo 'SMbus' to 'SMBus'

Signed-off-by: manseop sim <semtax33@gmail.com>

---
Changes in v3:
- modifing subject

---
Changes in v2:
- modifing subject
- changed commit message
---
 Documentation/devicetree/bindings/i2c/i2c.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
index 11263982470e..44efafdfd7f5 100644
--- a/Documentation/devicetree/bindings/i2c/i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c.txt
@@ -84,7 +84,7 @@ Binding may contain optional "interrupts" property, describing interrupts
 used by the device. I2C core will assign "irq" interrupt (or the very first
 interrupt if not using interrupt names) as primary interrupt for the slave.
 
-Alternatively, devices supporting SMbus Host Notify, and connected to
+Alternatively, devices supporting SMBus Host Notify, and connected to
 adapters that support this feature, may use "host-notify" property. I2C
 core will create a virtual interrupt for Host Notify and assign it as
 primary interrupt for the slave.
-- 
2.17.1
