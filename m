From: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] mfd: dt: tps6586x: Add power off control
Date: Fri, 17 Aug 2012 02:16:28 -0700
Message-ID: <1345194989-11614-2-git-send-email-bilhuang@nvidia.com>
References: <1345194989-11614-1-git-send-email-bilhuang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1345194989-11614-1-git-send-email-bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org
Cc: kyle.manna-CaKDIOJzjcgAvxtiuMwx3w@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, xxie-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, jhovold-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add DT property "ti,system-power-controller" telling whether or not this
pmic is in charge of controlling the system power, so the power off
routine can be hooked up to system call "pm_power_off".

Based on the work by:
Dan Willemsen <dwillemsen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Signed-off-by: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/regulator/tps6586x.txt     |    6 ++++++
 drivers/mfd/tps6586x.c                             |   19 +++++++++++++++++++
 include/linux/mfd/tps6586x.h                       |    1 +
 3 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/tps6586x.txt b/Documentation/devicetree/bindings/regulator/tps6586x.txt
index d156e1b..03dfa4e 100644
--- a/Documentation/devicetree/bindings/regulator/tps6586x.txt
+++ b/Documentation/devicetree/bindings/regulator/tps6586x.txt
@@ -18,6 +18,10 @@ Required properties:
 - vinldo678-supply: The input supply for the LDO6, LDO7 and LDO8
 - vinldo9-supply: The input supply for the LDO9
 
+Optional properties:
+- ti,system-power-controller: Telling whether or not this pmic is controlling
+  the system power.
+
 Each regulator is defined using the standard binding for regulators.
 
 Example:
@@ -30,6 +34,8 @@ Example:
 		#gpio-cells = <2>;
 		gpio-controller;
 
+		ti,system-power-controller;
+
 		sm0-supply = <&some_reg>;
 		sm1-supply = <&some_reg>;
 		sm2-supply = <&some_reg>;
diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index 353c348..93d57df 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -29,6 +29,10 @@
 #include <linux/mfd/core.h>
 #include <linux/mfd/tps6586x.h>
 
+#define TPS6586X_SUPPLYENE	0x14
+#define EXITSLREQ_BIT		BIT(1)
+#define SLEEP_MODE_BIT		BIT(3)
+
 /* interrupt control registers */
 #define TPS6586X_INT_ACK1	0xb5
 #define TPS6586X_INT_ACK2	0xb6
@@ -409,6 +413,7 @@ static struct tps6586x_platform_data *tps6586x_parse_dt(struct i2c_client *clien
 	pdata->subdevs = devs;
 	pdata->gpio_base = -1;
 	pdata->irq_base = -1;
+	pdata->pm_off = of_property_read_bool(np, "ti,system-power-controller");
 
 	return pdata;
 }
@@ -441,6 +446,15 @@ static const struct regmap_config tps6586x_regmap_config = {
 	.cache_type = REGCACHE_RBTREE,
 };
 
+static struct device *tps6586x_dev;
+static void tps6586x_power_off(void)
+{
+	if (tps6586x_clr_bits(tps6586x_dev, TPS6586X_SUPPLYENE, EXITSLREQ_BIT))
+		return;
+
+	tps6586x_set_bits(tps6586x_dev, TPS6586X_SUPPLYENE, SLEEP_MODE_BIT);
+}
+
 static int __devinit tps6586x_i2c_probe(struct i2c_client *client,
 					const struct i2c_device_id *id)
 {
@@ -505,6 +519,11 @@ static int __devinit tps6586x_i2c_probe(struct i2c_client *client,
 		goto err_add_devs;
 	}
 
+	tps6586x_dev = &client->dev;
+
+	if (pdata->pm_off && !pm_power_off)
+		pm_power_off = tps6586x_power_off;
+
 	return 0;
 
 err_add_devs:
diff --git a/include/linux/mfd/tps6586x.h b/include/linux/mfd/tps6586x.h
index f350fd0..08f109f 100644
--- a/include/linux/mfd/tps6586x.h
+++ b/include/linux/mfd/tps6586x.h
@@ -77,6 +77,7 @@ struct tps6586x_platform_data {
 
 	int gpio_base;
 	int irq_base;
+	bool pm_off;
 };
 
 /*
-- 
1.7.4.1
