From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v2 1/8] mfd: axp20x: Add bindings for AXP806 PMIC
Date: Sat, 27 Aug 2016 15:55:37 +0800
Message-ID: <20160827075544.26316-2-wens@csie.org>
References: <20160827075544.26316-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBHNJQW7AKGQEA26YSNQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160827075544.26316-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds the basic and regulator bindings for the X-Powers AXP806
PMIC.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
Changes since v1: none
---
 Documentation/devicetree/bindings/mfd/axp20x.txt | 28 ++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/axp20x.txt b/Documentation/devicetree/bindings/mfd/axp20x.txt
index 585a95546288..8f3ad9ab4637 100644
--- a/Documentation/devicetree/bindings/mfd/axp20x.txt
+++ b/Documentation/devicetree/bindings/mfd/axp20x.txt
@@ -10,7 +10,8 @@ axp809 (X-Powers)
 
 Required properties:
 - compatible: "x-powers,axp152", "x-powers,axp202", "x-powers,axp209",
-	      "x-powers,axp221", "x-powers,axp223", "x-powers,axp809"
+	      "x-powers,axp221", "x-powers,axp223", "x-powers,axp806",
+	      "x-powers,axp809"
 - reg: The I2C slave address or RSB hardware address for the AXP chip
 - interrupt-parent: The parent interrupt controller
 - interrupts: SoC NMI / GPIO interrupt connected to the PMIC's IRQ pin
@@ -47,7 +48,6 @@ Optional properties for DCDC regulators:
 			  probably makes sense for HiFi audio related
 			  applications that aren't battery constrained.
 
-
 AXP202/AXP209 regulators, type, and corresponding input supply names:
 
 Regulator	  Type		  Supply Name		  Notes
@@ -86,6 +86,30 @@ LDO_IO1		: LDO		: ips-supply		: GPIO 1
 RTC_LDO		: LDO		: ips-supply		: always on
 DRIVEVBUS	: Enable output	: drivevbus-supply	: external regulator
 
+AXP806 regulators, type, and corresponding input supply names:
+
+Regulator	  Type		  Supply Name		  Notes
+---------	  ----		  -----------		  -----
+DCDCA		: DC-DC buck	: vina-supply		: poly-phase capable
+DCDCB		: DC-DC buck	: vinb-supply		: poly-phase capable
+DCDCC		: DC-DC	buck	: vinc-supply		: poly-phase capable
+DCDCD		: DC-DC	buck	: vind-supply		: poly-phase capable
+DCDCE		: DC-DC	buck	: vine-supply		: poly-phase capable
+ALDO1		: LDO		: aldoin-supply		: shared supply
+ALDO2		: LDO		: aldoin-supply		: shared supply
+ALDO3		: LDO		: aldoin-supply		: shared supply
+BLDO1		: LDO		: bldoin-supply		: shared supply
+BLDO2		: LDO		: bldoin-supply		: shared supply
+BLDO3		: LDO		: bldoin-supply		: shared supply
+BLDO4		: LDO		: bldoin-supply		: shared supply
+CLDO1		: LDO		: cldoin-supply		: shared supply
+CLDO2		: LDO		: cldoin-supply		: shared supply
+CLDO3		: LDO		: cldoin-supply		: shared supply
+SW		: On/Off Switch : swin-supply
+
+Additionally, the AXP806 DC-DC regulators support poly-phase arrangements
+for higher output current. The possible groupings are: A+B, A+B+C, D+E.
+
 AXP809 regulators, type, and corresponding input supply names:
 
 Regulator	  Type		  Supply Name		  Notes
-- 
2.9.3
