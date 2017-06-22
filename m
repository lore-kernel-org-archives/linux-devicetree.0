From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 2/6] dt-bindings: mfd: axp20x: Introduce
 bindings for AXP813
Date: Thu, 22 Jun 2017 12:08:29 +0800
Message-ID: <20170622040833.15329-3-wens@csie.org>
References: <20170622040833.15329-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBRUFVXFAKGQEBSSHUYQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170622040833.15329-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The X-Powers AXP813 is a PMIC designed to be paired with Allwinner's
A83T SoC. There is also an AXP818, which is paired with the H8 SoC.

The two models seem to be identical, apart from the external markings.

This patch introduces the basic mfd and regulator bindings for the
AXP813.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 Documentation/devicetree/bindings/mfd/axp20x.txt | 49 +++++++++++++++++++++---
 1 file changed, 44 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/axp20x.txt b/Documentation/devicetree/bindings/mfd/axp20x.txt
index 211a100c6b20..1dff7e2ec375 100644
--- a/Documentation/devicetree/bindings/mfd/axp20x.txt
+++ b/Documentation/devicetree/bindings/mfd/axp20x.txt
@@ -9,6 +9,12 @@ axp223 (X-Powers)
 axp803 (X-Powers)
 axp806 (X-Powers)
 axp809 (X-Powers)
+axp813 (X-Powers)
+
+The AXP813 is 2 chips packaged into 1. The 2 chips do not share anything
+other than the packaging. Pins are routed separately. As such they should
+be treated as separate entities. The other half is an AC100 RTC/codec
+combo chip. Please see ac100.txt for its bindings.
 
 Required properties:
 - compatible: should be one of:
@@ -20,6 +26,7 @@ Required properties:
     * "x-powers,axp803"
     * "x-powers,axp806"
     * "x-powers,axp809"
+    * "x-powers,axp813"
 - reg: The I2C slave address or RSB hardware address for the AXP chip
 - interrupt-parent: The parent interrupt controller
 - interrupts: SoC NMI / GPIO interrupt connected to the PMIC's IRQ pin
@@ -29,12 +36,14 @@ Required properties:
 Optional properties:
 - x-powers,dcdc-freq: defines the work frequency of DC-DC in KHz
 		      AXP152/20X: range:  750-1875, Default: 1.5 MHz
-		      AXP22X/80X: range: 1800-4050, Default: 3   MHz
+		      AXP22X/8XX: range: 1800-4050, Default: 3   MHz
 
-- x-powers,drive-vbus-en: axp221 / axp223 only boolean, set this when the
-		  N_VBUSEN pin is used as an output pin to control an external
-		  regulator to drive the OTG VBus, rather then as an input pin
-		  which signals whether the board is driving OTG VBus or not.
+- x-powers,drive-vbus-en: boolean, set this when the N_VBUSEN pin is
+			  used as an output pin to control an external
+			  regulator to drive the OTG VBus, rather then
+			  as an input pin which signals whether the
+			  board is driving OTG VBus or not.
+			  (axp221 / axp223 / axp813 only)
 
 - x-powers,master-mode: Boolean (axp806 only). Set this when the PMIC is
 			wired for master mode. The default is slave mode.
@@ -172,6 +181,36 @@ LDO_IO1		: LDO		: ips-supply		: GPIO 1
 RTC_LDO		: LDO		: ips-supply		: always on
 SW		: On/Off Switch : swin-supply
 
+AXP813 regulators, type, and corresponding input supply names:
+
+Regulator	  Type		  Supply Name		  Notes
+---------	  ----		  -----------		  -----
+DCDC1		: DC-DC buck	: vin1-supply
+DCDC2		: DC-DC buck	: vin2-supply		: poly-phase capable
+DCDC3		: DC-DC	buck	: vin3-supply		: poly-phase capable
+DCDC4		: DC-DC	buck	: vin4-supply
+DCDC5		: DC-DC	buck	: vin5-supply		: poly-phase capable
+DCDC6		: DC-DC	buck	: vin6-supply		: poly-phase capable
+DCDC7		: DC-DC	buck	: vin7-supply
+ALDO1		: LDO		: aldoin-supply		: shared supply
+ALDO2		: LDO		: aldoin-supply		: shared supply
+ALDO3		: LDO		: aldoin-supply		: shared supply
+DLDO1		: LDO		: dldoin-supply		: shared supply
+DLDO2		: LDO		: dldoin-supply		: shared supply
+DLDO3		: LDO		: dldoin-supply		: shared supply
+DLDO4		: LDO		: dldoin-supply		: shared supply
+ELDO1		: LDO		: eldoin-supply		: shared supply
+ELDO2		: LDO		: eldoin-supply		: shared supply
+ELDO3		: LDO		: eldoin-supply		: shared supply
+FLDO1		: LDO		: fldoin-supply		: shared supply
+FLDO2		: LDO		: fldoin-supply		: shared supply
+FLDO3		: LDO		: fldoin-supply		: shared supply
+LDO_IO0		: LDO		: ips-supply		: GPIO 0
+LDO_IO1		: LDO		: ips-supply		: GPIO 1
+RTC_LDO		: LDO		: ips-supply		: always on
+SW		: On/Off Switch : swin-supply
+DRIVEVBUS	: Enable output	: drivevbus-supply	: external regulator
+
 Example:
 
 axp209: pmic@34 {
-- 
2.11.0
