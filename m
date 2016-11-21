From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v2 1/5] ARM: memory: da8xx-ddrctl: new driver
Date: Mon, 21 Nov 2016 22:03:00 +0530
Message-ID: <a309a738-7fa7-3aab-4457-f7d693e6b37f@ti.com>
References: <1477925138-23457-1-git-send-email-bgolaszewski@baylibre.com>
 <1477925138-23457-2-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1477925138-23457-2-git-send-email-bgolaszewski@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>, linux-drm <dri-devel@lists.freedesktop.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>, arm-soc <linux-arm-kernel@lists.infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

On Monday 31 October 2016 08:15 PM, Bartosz Golaszewski wrote:
> +static int da8xx_ddrctl_probe(struct platform_device *pdev)
> +{
> +	const struct da8xx_ddrctl_config_knob *knob;
> +	const struct da8xx_ddrctl_setting *setting;
> +	struct device_node *node;
> +	struct resource *res;
> +	void __iomem *ddrctl;
> +	struct device *dev;
> +	u32 reg;
> +
> +	dev = &pdev->dev;
> +	node = dev->of_node;
> +
> +	setting = da8xx_ddrctl_get_board_settings();
> +	if (!setting) {
> +		dev_err(dev, "no settings for board '%s'\n",
> +			of_flat_dt_get_machine_name());
> +		return -EINVAL;
> +	}

This causes a section mismatch because of_flat_dt_get_machine_name() 
has an __init annotation. I did not notice that before, sorry.

It can be fixed with a patch like below:

---8<---
diff --git a/drivers/memory/da8xx-ddrctl.c b/drivers/memory/da8xx-ddrctl.c
index a20e7bbbcbe0..9ca5aab3ac54 100644
--- a/drivers/memory/da8xx-ddrctl.c
+++ b/drivers/memory/da8xx-ddrctl.c
@@ -102,6 +102,18 @@ static const struct da8xx_ddrctl_setting *da8xx_ddrctl_get_board_settings(void)
 	return NULL;
 }
 
+static const char* da8xx_ddrctl_get_machine_name(void)
+{
+	const char *str;
+	int ret;
+
+	ret = of_property_read_string(of_root, "model", &str);
+	if (ret)
+		ret = of_property_read_string(of_root, "compatible", &str);
+
+	return str;
+}
+
 static int da8xx_ddrctl_probe(struct platform_device *pdev)
 {
 	const struct da8xx_ddrctl_config_knob *knob;
@@ -118,7 +130,7 @@ static int da8xx_ddrctl_probe(struct platform_device *pdev)
 	setting = da8xx_ddrctl_get_board_settings();
 	if (!setting) {
 		dev_err(dev, "no settings for board '%s'\n",
-			of_flat_dt_get_machine_name());
+			da8xx_ddrctl_get_machine_name());
 		return -EINVAL;
 	}
---8<--- 

A similar fix is required for the other driver in this series (patch 
2/5). I need some advise on whether I should introduce a common 
function to get the machine name post kernel boot-up (I cannot see an 
existing one). If yes, any advise on which file it should go into?

Thanks,
Sekhar
