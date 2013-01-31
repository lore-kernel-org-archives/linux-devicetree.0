From: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH V2] ENGR00242223-2 Need to add delay to regulator based on
 register setting
Date: Thu, 31 Jan 2013 11:32:00 -0500
Message-ID: <1359649920-22050-1-git-send-email-b20788@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, b38343-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, LNXREVLI-z7JfP6tgrtWcPGwCZ8RIIdkmqwFzkYv6@public.gmane.org
List-Id: devicetree@vger.kernel.org

When LDO is set to voltage up, need to do enough waiting before
it ramps up to the new voltage, and this ramp up time should be
based on the register setting.

Signed-off-by: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 .../bindings/regulator/anatop-regulator.txt        |    8 ++++
 drivers/regulator/anatop-regulator.c               |   41 +++++++++++++++++++-
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/anatop-regulator.txt b/Documentation/devicetree/bindings/regulator/anatop-regulator.txt
index 357758c..758eae2 100644
--- a/Documentation/devicetree/bindings/regulator/anatop-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/anatop-regulator.txt
@@ -9,6 +9,11 @@ Required properties:
 - anatop-min-voltage: Minimum voltage of this regulator
 - anatop-max-voltage: Maximum voltage of this regulator
 
+Optional properties:
+- anatop-delay-reg-offset: Anatop MFD step time register offset
+- anatop-delay-bit-shift: Bit shift for the step time register
+- anatop-delay-bit-width: Number of bits used in the step time register
+
 Any property defined as part of the core regulator
 binding, defined in regulator.txt, can also be used.
 
@@ -23,6 +28,9 @@ Example:
 		anatop-reg-offset = <0x140>;
 		anatop-vol-bit-shift = <9>;
 		anatop-vol-bit-width = <5>;
+		anatop-delay-reg-offset = <0x170>;
+		anatop-delay-bit-shift = <24>;
+		anatop-delay-bit-width = <2>;
 		anatop-min-bit-val = <1>;
 		anatop-min-voltage = <725000>;
 		anatop-max-voltage = <1300000>;
diff --git a/drivers/regulator/anatop-regulator.c b/drivers/regulator/anatop-regulator.c
index 1af9768..f4ed04f 100644
--- a/drivers/regulator/anatop-regulator.c
+++ b/drivers/regulator/anatop-regulator.c
@@ -1,5 +1,5 @@
 /*
- * Copyright (C) 2011 Freescale Semiconductor, Inc. All Rights Reserved.
+ * Copyright (C) 2011-2013 Freescale Semiconductor, Inc. All Rights Reserved.
  */
 
 /*
@@ -31,12 +31,18 @@
 #include <linux/regulator/driver.h>
 #include <linux/regulator/of_regulator.h>
 
+#define LDO_RAMP_UP_UNIT_IN_CYCLES      64 /* 64 cycles per step */
+#define LDO_RAMP_UP_FREQ_IN_MHZ         24 /* time base on 24M OSC */
+
 struct anatop_regulator {
 	const char *name;
 	u32 control_reg;
 	struct regmap *anatop;
 	int vol_bit_shift;
 	int vol_bit_width;
+	u32 delay_reg;
+	int delay_bit_shift;
+	int delay_bit_width;
 	int min_bit_val;
 	int min_voltage;
 	int max_voltage;
@@ -80,8 +86,34 @@ static int anatop_regmap_get_voltage_sel(struct regulator_dev *reg)
 	return val - anatop_reg->min_bit_val;
 }
 
+static int anatop_regmap_set_voltage_time_sel(struct regulator_dev *reg,
+	unsigned int old_sel,
+	unsigned int new_sel)
+{
+	struct anatop_regulator *anatop_reg = rdev_get_drvdata(reg);
+	u32 val;
+	int ret = 0;
+
+	if (anatop_reg->delay_bit_width && new_sel > old_sel) {
+		/*
+		 * the delay time for LDO ramp up time is
+		 * based on the register setting, we need
+		 * to calculate how many steps LDO need to
+		 * ramp up, and how much delay needed. (us)
+		 */
+		regmap_read(anatop_reg->anatop, anatop_reg->delay_reg, &val);
+		val = (val >> anatop_reg->delay_bit_shift) &
+			((1 << anatop_reg->delay_bit_width) - 1);
+		ret = (new_sel - old_sel) * ((LDO_RAMP_UP_UNIT_IN_CYCLES <<
+			val) / LDO_RAMP_UP_FREQ_IN_MHZ + 1);
+	}
+
+	return ret;
+}
+
 static struct regulator_ops anatop_rops = {
 	.set_voltage_sel = anatop_regmap_set_voltage_sel,
+	.set_voltage_time_sel = anatop_regmap_set_voltage_time_sel,
 	.get_voltage_sel = anatop_regmap_get_voltage_sel,
 	.list_voltage = regulator_list_voltage_linear,
 	.map_voltage = regulator_map_voltage_linear,
@@ -157,6 +189,13 @@ static int __devinit anatop_regulator_probe(struct platform_device *pdev)
 		dev_err(dev, "no anatop-max-voltage property set\n");
 		goto anatop_probe_end;
 	}
+	/* read LDO ramp up setting, only for core reg */
+	of_property_read_u32(np, "anatop-delay-reg-offset",
+			     &sreg->delay_reg);
+	of_property_read_u32(np, "anatop-delay-bit-width",
+			     &sreg->delay_bit_width);
+	of_property_read_u32(np, "anatop-delay-bit-shift",
+			     &sreg->delay_bit_shift);
 
 	rdesc->n_voltages = (sreg->max_voltage - sreg->min_voltage)
 		/ 25000 + 1;
-- 
1.7.9.5
