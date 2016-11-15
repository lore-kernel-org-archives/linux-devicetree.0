From: Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: [PATCH] [media] ir-hix5hd2: make hisilicon,power-syscon property deprecated
Date: Tue, 15 Nov 2016 15:31:32 +0800
Message-ID: <1479195092-20090-1-git-send-email-xuejiancheng@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, hermit.wangheming-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bin.chen-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Ruqiang Ju <juruqiang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Ruqiang Ju <juruqiang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>

The clock of IR can be provided by the clock provider and controlled
by common clock framework APIs.

Signed-off-by: Ruqiang Ju <juruqiang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Signed-off-by: Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
---
 .../devicetree/bindings/media/hix5hd2-ir.txt       |  6 +++---
 drivers/media/rc/ir-hix5hd2.c                      | 25 ++++++++++++++--------
 2 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/hix5hd2-ir.txt b/Documentation/devicetree/bindings/media/hix5hd2-ir.txt
index fb5e760..54e1bed 100644
--- a/Documentation/devicetree/bindings/media/hix5hd2-ir.txt
+++ b/Documentation/devicetree/bindings/media/hix5hd2-ir.txt
@@ -8,10 +8,11 @@ Required properties:
 	  the device. The interrupt specifier format depends on the interrupt
 	  controller parent.
 	- clocks: clock phandle and specifier pair.
-	- hisilicon,power-syscon: phandle of syscon used to control power.

 Optional properties:
 	- linux,rc-map-name : Remote control map name.
+	- hisilicon,power-syscon: DEPRECATED. Don't use this in new dts files.
+		Provide correct clocks instead.

 Example node:

@@ -19,7 +20,6 @@ Example node:
 		compatible = "hisilicon,hix5hd2-ir";
 		reg = <0xf8001000 0x1000>;
 		interrupts = <0 47 4>;
-		clocks = <&clock HIX5HD2_FIXED_24M>;
-		hisilicon,power-syscon = <&sysctrl>;
+		clocks = <&clock HIX5HD2_IR_CLOCK>;
 		linux,rc-map-name = "rc-tivo";
 	};
diff --git a/drivers/media/rc/ir-hix5hd2.c b/drivers/media/rc/ir-hix5hd2.c
index d0549fb..d26907e 100644
--- a/drivers/media/rc/ir-hix5hd2.c
+++ b/drivers/media/rc/ir-hix5hd2.c
@@ -75,15 +75,22 @@ static void hix5hd2_ir_enable(struct hix5hd2_ir_priv *dev, bool on)
 {
 	u32 val;

-	regmap_read(dev->regmap, IR_CLK, &val);
-	if (on) {
-		val &= ~IR_CLK_RESET;
-		val |= IR_CLK_ENABLE;
+	if (dev->regmap) {
+		regmap_read(dev->regmap, IR_CLK, &val);
+		if (on) {
+			val &= ~IR_CLK_RESET;
+			val |= IR_CLK_ENABLE;
+		} else {
+			val &= ~IR_CLK_ENABLE;
+			val |= IR_CLK_RESET;
+		}
+		regmap_write(dev->regmap, IR_CLK, val);
 	} else {
-		val &= ~IR_CLK_ENABLE;
-		val |= IR_CLK_RESET;
+		if (on)
+			clk_prepare_enable(dev->clock);
+		else
+			clk_disable_unprepare(dev->clock);
 	}
-	regmap_write(dev->regmap, IR_CLK, val);
 }

 static int hix5hd2_ir_config(struct hix5hd2_ir_priv *priv)
@@ -207,8 +214,8 @@ static int hix5hd2_ir_probe(struct platform_device *pdev)
 	priv->regmap = syscon_regmap_lookup_by_phandle(node,
 						       "hisilicon,power-syscon");
 	if (IS_ERR(priv->regmap)) {
-		dev_err(dev, "no power-reg\n");
-		return -EINVAL;
+		dev_info(dev, "no power-reg\n");
+		priv->regmap = NULL;
 	}

 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
--
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
