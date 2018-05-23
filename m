Return-Path: <SRS0=ZT0k=IK=gmail.com=marek.vasut@kernel.org>
From: Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH] mfd: dt: Add bindings for DA9063L
Date: Wed, 23 May 2018 13:26:44 +0200
Message-Id: <20180523112644.9464-1-marek.vasut+renesas@gmail.com>
To: devicetree@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Steve Twiss <stwiss.opensource@diasemi.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add device tree bindings for the Dialog DA9063L. This is a
variant of the DA9063 chip with smaller package, with less
LDO regulators and without RTC block. The other properties
of the chip are the same, including the content of the chip
ID register.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Steve Twiss <stwiss.opensource@diasemi.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 Documentation/devicetree/bindings/mfd/da9063.txt | 34 +++++++++++++++++-------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/da9063.txt b/Documentation/devicetree/bindings/mfd/da9063.txt
index 05b21bcb8543..a519cf0f5c8d 100644
--- a/Documentation/devicetree/bindings/mfd/da9063.txt
+++ b/Documentation/devicetree/bindings/mfd/da9063.txt
@@ -1,4 +1,4 @@
-* Dialog DA9063 Power Management Integrated Circuit (PMIC)
+* Dialog DA9063/DA9063L Power Management Integrated Circuit (PMIC)
 
 DA9093 consists of a large and varied group of sub-devices (I2C Only):
 
@@ -6,14 +6,14 @@ Device                   Supply Names    Description
 ------                   ------------    -----------
 da9063-regulator        :               : LDOs & BUCKs
 da9063-onkey            :               : On Key
-da9063-rtc              :               : Real-Time Clock
+da9063-rtc              :               : Real-Time Clock (DA9063 only)
 da9063-watchdog         :               : Watchdog
 
 ======
 
 Required properties:
 
-- compatible : Should be "dlg,da9063"
+- compatible : Should be "dlg,da9063" or "dlg,da9063l"
 - reg : Specifies the I2C slave address (this defaults to 0x58 but it can be
   modified to match the chip's OTP settings).
 - interrupt-parent : Specifies the reference to the interrupt controller for
@@ -23,8 +23,8 @@ Required properties:
 
 Sub-nodes:
 
-- regulators : This node defines the settings for the LDOs and BUCKs. The
-  DA9063 regulators are bound using their names listed below:
+- regulators : This node defines the settings for the LDOs and BUCKs.
+  The DA9063 regulators are bound using their names listed below:
 
     bcore1    : BUCK CORE1
     bcore2    : BUCK CORE2
@@ -44,13 +44,28 @@ Sub-nodes:
     ldo10     : LDO_10
     ldo11     : LDO_11
 
+  The DA9063L regulators are bound using their names listed below:
+
+    bcore1    : BUCK CORE1
+    bcore2    : BUCK CORE2
+    bpro      : BUCK PRO
+    bmem      : BUCK MEM
+    bio       : BUCK IO
+    bperi     : BUCK PERI
+    ldo3      : LDO_3
+    ldo7      : LDO_7
+    ldo8      : LDO_8
+    ldo9      : LDO_9
+    ldo11     : LDO_11
+
   The component follows the standard regulator framework and the bindings
   details of individual regulator device can be found in:
   Documentation/devicetree/bindings/regulator/regulator.txt
 
 - rtc : This node defines settings for the Real-Time Clock associated with
-  the DA9063. There are currently no entries in this binding, however
-  compatible = "dlg,da9063-rtc" should be added if a node is created.
+  the DA9063 only. The RTC is not present in DA9063L. There are currently
+  no entries in this binding, however compatible = "dlg,da9063-rtc" should
+  be added if a node is created.
 
 - onkey : This node defines the OnKey settings for controlling the key
   functionality of the device. The node should contain the compatible property
@@ -65,8 +80,9 @@ Sub-nodes:
     and KEY_SLEEP.
 
 - watchdog : This node defines settings for the Watchdog timer associated
-  with the DA9063. There are currently no entries in this binding, however
-  compatible = "dlg,da9063-watchdog" should be added if a node is created.
+  with the DA9063 and DA9063L. There are currently no entries in this
+  binding, however compatible = "dlg,da9063-watchdog" should be added
+  if a node is created.
 
 
 Example:
-- 
2.16.2
