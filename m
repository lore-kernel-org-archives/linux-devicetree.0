From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v3 2/3] drm: bridge: Add thc63lvd1024 LVDS decoder driver
Date: Wed, 14 Mar 2018 20:09:52 +0300
Message-ID: <a893a17c-367d-4f61-f835-4b6b420dc597@cogentembedded.com>
References: <1520951425-13843-1-git-send-email-jacopo+renesas@jmondi.org>
 <1520951425-13843-3-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1520951425-13843-3-git-send-email-jacopo+renesas@jmondi.org>
Content-Language: en-MW
Sender: linux-kernel-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>, architt@codeaurora.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, airlied@linux.ie, horms@verge.net.au, magnus.damm@gmail.com, geert@linux-m68k.org, niklas.soderlund@ragnatech.se, robh+dt@kernel.org, mark.rutland@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/13/2018 05:30 PM, Jacopo Mondi wrote:

> Add DRM bridge driver for Thine THC63LVD1024 LVDS to digital parallel
> output decoder.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
[...]
> diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
> new file mode 100644
> index 0000000..4b059c0
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
> @@ -0,0 +1,241 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * THC63LVD1024 LVDS to parallel data DRM bridge driver.
> + *
> + * Copyright (C) 2018 Jacopo Mondi <jacopo+renesas@jmondi.org>
> + */
> +
> +#include <drm/drmP.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_panel.h>
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/of_graph.h>
> +#include <linux/regulator/consumer.h>
> +
> +static const char * const thc63_reg_names[] = {
> +	"vcc", "lvcc", "pvcc", "cvcc", };

   Your bracing style is pretty strange -- neither here nor there. Please place };
on the next line...

[...]
> +static void thc63_enable(struct drm_bridge *bridge)
> +{
> +	struct thc63_dev *thc63 = to_thc63(bridge);
> +	struct regulator *vcc;
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < ARRAY_SIZE(thc63->vccs); i++) {
> +		vcc = thc63->vccs[i];
> +		if (vcc) {
> +			ret = regulator_enable(vcc);
> +			if (ret)

   You hardly need this variable, could do a call right in this *if*.

[...]
> +error_vcc_enable:
> +	dev_err(thc63->dev, "Failed to enable regulator %u\n", i);
> +}
> +

   Why not do this instead of *goto* before?
 
> +static void thc63_disable(struct drm_bridge *bridge)
> +{
> +	struct thc63_dev *thc63 = to_thc63(bridge);
> +	struct regulator *vcc;
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < ARRAY_SIZE(thc63->vccs); i++) {
> +		vcc = thc63->vccs[i];
> +		if (vcc) {
> +			ret = regulator_disable(vcc);
> +			if (ret)

   Again, no need for 'ret' whatsoever...

> +				goto error_vcc_disable;
> +		}
> +	}
> +
> +	if (thc63->pwdn)
> +		gpiod_set_value(thc63->pwdn, 1);
> +
> +	if (thc63->oe)
> +		gpiod_set_value(thc63->oe, 0);
> +
> +	return;
> +
> +error_vcc_disable:
> +	dev_err(thc63->dev, "Failed to disable regulator %u\n", i);

   Again, why not do it instead of *goto*?

[...]
> +static int thc63_gpio_init(struct thc63_dev *thc63)
> +{
> +	thc63->pwdn = devm_gpiod_get_optional(thc63->dev, "pwdn",
> +					      GPIOD_OUT_LOW);
> +	if (IS_ERR(thc63->pwdn)) {
> +		dev_err(thc63->dev, "Unable to get GPIO \"pwdn\"\n");

   "pwdn-gpios" maybe?

> +		return PTR_ERR(thc63->pwdn);
> +	}
> +
> +	thc63->oe = devm_gpiod_get_optional(thc63->dev, "oe", GPIOD_OUT_LOW);
> +	if (IS_ERR(thc63->oe)) {
> +		dev_err(thc63->dev, "Unable to get GPIO \"oe\"\n");

   "oe-gpios" maybe?

[...]

MBR, Sergei
