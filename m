From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] leds: Add device tree binding for pca9633
Date: Thu, 27 Jun 2013 07:24:51 -0700
Message-ID: <20130627142451.GJ5523@atomide.com>
References: <20130626141705.GY5523@atomide.com>
 <CAK5ve-KapwU9HbrW=VBeKnghhdqSZYKMfsDdGiYcYMwM7LZBNg@mail.gmail.com>
 <20130627072151.GD5523@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130627072151.GD5523-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
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
To: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Linux LED Subsystem <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

* Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> [130627 00:28]:
> * Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> [130626 16:53]:
> > On Wed, Jun 26, 2013 at 7:17 AM, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> wrote:
> > > @@ -22,6 +22,7 @@
> > >  #include <linux/i2c.h>
> > >  #include <linux/workqueue.h>
> > >  #include <linux/slab.h>
> > > +#include <linux/of.h>
> > >  #include <linux/platform_data/leds-pca9633.h>
> > >
> > >  /* LED select registers determine the source that drives LED outputs */
> > > @@ -93,6 +94,61 @@ static void pca9633_led_set(struct led_classdev *led_cdev,
> > >         schedule_work(&pca9633->work);
> > >  }
> > >
> > > +#ifdef CONFIG_OF
> > 
> > Shall we use "#if IS_ENABLED(CONFIG_OF)", as Grant pointed out recently.
> 
> Thanks will do, I'll also add the push-pull vs totem pole binding
> as that can be quite crucial for some hardware configurations.

Here's the updated patch.

Regards,

Tony


From: Tony Lindgren <tmlind@panda>
Date: Wed, 26 Jun 2013 15:52:49 +0300
Subject: [PATCH] leds: Add device tree binding for pca9633

Similar to tca6507, we can just parse the standard LED
properties for pca9633.

Tested on a pca9632, which is compatible with pca9633.

Signed-off-by: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>

--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/pca9633.txt
@@ -0,0 +1,45 @@
+LEDs connected to pca9633 or pca9632
+
+Required properties:
+- compatible : should be : "nxp,pca963x"
+
+Optional properties:
+- nxp,totem-pole : use totem pole (push-pull) instead of default open-drain
+
+Each led is represented as a sub-node of the nxp,pca9633 device.
+
+LED sub-node properties:
+- label : (optional) see Documentation/devicetree/bindings/leds/common.txt
+- reg : number of LED line (could be from 0 to 4)
+- linux,default-trigger : (optional)
+   see Documentation/devicetree/bindings/leds/common.txt
+
+Examples:
+
+pca9632: pca9632 {
+	compatible = "nxp,pca9632", "nxp,pca963x";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	reg = <0x62>;
+
+	red@0 {
+		label = "red";
+		reg = <0>;
+		linux,default-trigger = "none";
+	};
+	green@1 {
+		label = "green";
+		reg = <1>;
+		linux,default-trigger = "none";
+	};
+	blue@2 {
+		label = "blue";
+		reg = <2>;
+		linux,default-trigger = "none";
+	};
+	unused@3 {
+		label = "unused";
+		reg = <3>;
+		linux,default-trigger = "none";
+	};
+};
--- a/drivers/leds/leds-pca9633.c
+++ b/drivers/leds/leds-pca9633.c
@@ -22,6 +22,7 @@
 #include <linux/i2c.h>
 #include <linux/workqueue.h>
 #include <linux/slab.h>
+#include <linux/of.h>
 #include <linux/platform_data/leds-pca9633.h>
 
 /* LED select registers determine the source that drives LED outputs */
@@ -93,6 +94,67 @@ static void pca9633_led_set(struct led_classdev *led_cdev,
 	schedule_work(&pca9633->work);
 }
 
+#if IS_ENABLED(CONFIG_OF)
+static struct pca9633_platform_data *
+pca9633_dt_init(struct i2c_client *client)
+{
+	struct device_node *np = client->dev.of_node, *child;
+	struct pca9633_platform_data *pdata;
+	struct led_info *pca9633_leds;
+	int count;
+
+	count = of_get_child_count(np);
+	if (!count || count > 4)
+		return ERR_PTR(-ENODEV);
+
+	pca9633_leds = devm_kzalloc(&client->dev,
+				sizeof(struct led_info) * count, GFP_KERNEL);
+	if (!pca9633_leds)
+		return ERR_PTR(-ENOMEM);
+
+	for_each_child_of_node(np, child) {
+		struct led_info led;
+		u32 reg;
+		int res;
+
+		led.name =
+			of_get_property(child, "label", NULL) ? : child->name;
+		led.default_trigger =
+			of_get_property(child, "linux,default-trigger", NULL);
+		res = of_property_read_u32(child, "reg", &reg);
+		if (res != 0)
+			continue;
+		pca9633_leds[reg] = led;
+	}
+	pdata = devm_kzalloc(&client->dev,
+			     sizeof(struct pca9633_platform_data), GFP_KERNEL);
+	if (!pdata)
+		return ERR_PTR(-ENOMEM);
+
+	pdata->leds.leds = pca9633_leds;
+	pdata->leds.num_leds = count;
+
+	/* default to open-drain unless totem pole (push-pull) is specified */
+	if (of_property_read_bool(np, "nxp,totem-pole"))
+		pdata->outdrv = PCA9633_TOTEM_POLE;
+	else
+		pdata->outdrv = PCA9633_OPEN_DRAIN;
+
+	return pdata;
+}
+
+static const struct of_device_id of_pca9633_match[] = {
+	{ .compatible = "nxp,pca963x", },
+	{},
+};
+#else
+static struct pca9633_platform_data *
+pca9633_dt_init(struct i2c_client *client)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif
+
 static int pca9633_probe(struct i2c_client *client,
 					const struct i2c_device_id *id)
 {
@@ -102,6 +164,14 @@ static int pca9633_probe(struct i2c_client *client,
 
 	pdata = client->dev.platform_data;
 
+	if (!pdata) {
+		pdata = pca9633_dt_init(client);
+		if (IS_ERR(pdata)) {
+			dev_warn(&client->dev, "could not parse configuration\n");
+			pdata = NULL;
+		}
+	}
+
 	if (pdata) {
 		if (pdata->leds.num_leds <= 0 || pdata->leds.num_leds > 4) {
 			dev_err(&client->dev, "board info must claim at most 4 LEDs");
@@ -181,6 +251,7 @@ static struct i2c_driver pca9633_driver = {
 	.driver = {
 		.name	= "leds-pca9633",
 		.owner	= THIS_MODULE,
+		.of_match_table = of_match_ptr(of_pca9633_match),
 	},
 	.probe	= pca9633_probe,
 	.remove	= pca9633_remove,
