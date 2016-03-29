From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH resend v2 2/9] mfd: axp20x: Add bindings for
 AXP809 PMIC
Date: Tue, 29 Mar 2016 17:22:25 +0800
Message-ID: <1459243352-23344-3-git-send-email-wens@csie.org>
References: <1459243352-23344-1-git-send-email-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBZMS5G3QKGQEXYH36JQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1459243352-23344-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds the basic and regulator bindings for the X-Powers AXP809
PMIC.

Also update the DC-DC converter operating frequency for AXP22X/AXP80X.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/mfd/axp20x.txt | 31 ++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/axp20x.txt b/Documentation/devicetree/bindings/mfd/axp20x.txt
index fd39fa54571b..d20b1034e967 100644
--- a/Documentation/devicetree/bindings/mfd/axp20x.txt
+++ b/Documentation/devicetree/bindings/mfd/axp20x.txt
@@ -6,10 +6,11 @@ axp202 (X-Powers)
 axp209 (X-Powers)
 axp221 (X-Powers)
 axp223 (X-Powers)
+axp809 (X-Powers)
 
 Required properties:
 - compatible: "x-powers,axp152", "x-powers,axp202", "x-powers,axp209",
-	      "x-powers,axp221", "x-powers,axp223"
+	      "x-powers,axp221", "x-powers,axp223", "x-powers,axp809"
 - reg: The I2C slave address or RSB hardware address for the AXP chip
 - interrupt-parent: The parent interrupt controller
 - interrupts: SoC NMI / GPIO interrupt connected to the PMIC's IRQ pin
@@ -18,7 +19,9 @@ Required properties:
 
 Optional properties:
 - x-powers,dcdc-freq: defines the work frequency of DC-DC in KHz
-		      (range: 750-1875). Default: 1.5MHz
+		      AXP152/20X: range:  750-1875, Default: 1.5 MHz
+		      AXP22X/80X: range: 1800-4050, Default: 3   MHz
+
 - <input>-supply: a phandle to the regulator supply node. May be omitted if
 		  inputs are unregulated, such as using the IPSOUT output
 		  from the PMIC.
@@ -77,6 +80,30 @@ LDO_IO0		: LDO		: ips-supply		: GPIO 0
 LDO_IO1		: LDO		: ips-supply		: GPIO 1
 RTC_LDO		: LDO		: ips-supply		: always on
 
+AXP809 regulators, type, and corresponding input supply names:
+
+Regulator	  Type		  Supply Name		  Notes
+---------	  ----		  -----------		  -----
+DCDC1		: DC-DC buck	: vin1-supply
+DCDC2		: DC-DC buck	: vin2-supply
+DCDC3		: DC-DC	buck	: vin3-supply
+DCDC4		: DC-DC	buck	: vin4-supply
+DCDC5		: DC-DC	buck	: vin5-supply
+DC1SW		: On/Off Switch	:			: DCDC1 secondary output
+DC5LDO		: LDO		:			: input from DCDC5
+ALDO1		: LDO		: aldoin-supply		: shared supply
+ALDO2		: LDO		: aldoin-supply		: shared supply
+ALDO3		: LDO		: aldoin-supply		: shared supply
+DLDO1		: LDO		: dldoin-supply		: shared supply
+DLDO2		: LDO		: dldoin-supply		: shared supply
+ELDO1		: LDO		: eldoin-supply		: shared supply
+ELDO2		: LDO		: eldoin-supply		: shared supply
+ELDO3		: LDO		: eldoin-supply		: shared supply
+LDO_IO0		: LDO		: ips-supply		: GPIO 0
+LDO_IO1		: LDO		: ips-supply		: GPIO 1
+RTC_LDO		: LDO		: ips-supply		: always on
+SW		: On/Off Switch : swin-supply
+
 Example:
 
 axp209: pmic@34 {
-- 
2.7.0
