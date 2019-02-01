From: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v2 4/7] drm: rockchip: introduce rk3066 hdmi
Date: Fri, 1 Feb 2019 15:25:54 +0100
Message-ID: <CA+z=w3UKrDODY964WOtq-FQhuFJWg4C2jKXn0=3QT45gJ3UG_A@mail.gmail.com>
References: <20181229133318.18128-1-jbx6244@gmail.com> <20181229133318.18128-5-jbx6244@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181229133318.18128-5-jbx6244@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: hjc@rock-chips.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

Beside the binding for "rockchip,rk3066-vop" this patch series
also has a new binding for "rockchip,rk3066-hdmi".
Can Rob Herring advise here? Including the document describing the binding.

This patch still has the original license text included.
Can the copyright holder (or Sandy) approve the replacement of the GPL text
by a SPDX License Identifier for GPL-2.0?

Is Heiko's test setup for rk3066 already functional?

Thanks

2018-12-29 14:33 GMT+01:00, Johan Jonker <jbx6244@gmail.com>:

> +++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
> @@ -0,0 +1,928 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> + *    Zheng Yang <zhengyang@rock-chips.com>
> + *
> + * This software is licensed under the terms of the GNU General Public
> + * License version 2, as published by the Free Software Foundation, and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */

> +static inline u8 rk3066_hdmi_get_power_mode(struct rk3066_hdmi *hdmi)
> +{
> +	return hdmi_readb(hdmi, HDMI_SYS_CTRL) & HDMI_SYS_POWER_MODE_MASK;
> +}
> +
> +static void rk3066_hdmi_set_power_mode(struct rk3066_hdmi *hdmi, int mode)
> +{
> +	u8 current_mode, next_mode;
> +	u8 i = 0;
> +

The function rk3066_hdmi_get_power_mode can also returns 0 with VIO
power domain disabled.
That would lead to an endless loop. Just replaced 0 with
HDMI_SYS_POWER_MODE_A to prevent a crash.
Please advise if this function is OK with you?

> +	current_mode = rk3066_hdmi_get_power_mode(hdmi);
> +
> +	dev_dbg(hdmi->dev, "mode         :%d\n", mode);
> +	dev_dbg(hdmi->dev, "current_mode :%d\n", current_mode);
> +
> +	if (current_mode == mode)
> +		return;
> +
> +	do {
> +		if (current_mode > mode)
> +			next_mode = current_mode / 2;
> +		else {
> +			if (current_mode < HDMI_SYS_POWER_MODE_A)
> +				next_mode = HDMI_SYS_POWER_MODE_A;
> +			else
> +				next_mode = current_mode * 2;
> +		}
> +
> +		dev_dbg(hdmi->dev, "%d: next_mode :%d\n", i, next_mode);
> +
> +		if (next_mode != HDMI_SYS_POWER_MODE_D) {
> +			hdmi_modb(hdmi, HDMI_SYS_CTRL,
> +				  HDMI_SYS_POWER_MODE_MASK, next_mode);
> +		} else {
> +			hdmi_writeb(hdmi, HDMI_SYS_CTRL,
> +				    HDMI_SYS_POWER_MODE_D |
> +				    HDMI_SYS_PLL_RESET_MASK);
> +			usleep_range(90, 100);
> +			hdmi_writeb(hdmi, HDMI_SYS_CTRL,
> +				    HDMI_SYS_POWER_MODE_D |
> +				    HDMI_SYS_PLLB_RESET);
> +			usleep_range(90, 100);
> +			hdmi_writeb(hdmi, HDMI_SYS_CTRL,
> +				    HDMI_SYS_POWER_MODE_D);
> +		}
> +		current_mode = next_mode;
> +		i = i + 1;
> +	} while ((next_mode != mode) && (i < 5));

> +static const struct drm_display_mode edid_cea_modes[] = {
> +	/* 4 - 1280x720@60Hz 16:9 */
> +	{ DRM_MODE("1280x720", DRM_MODE_TYPE_DRIVER, 74250, 1280, 1390,
> +		   1430, 1650, 0, 720, 725, 730, 750, 0,
> +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> +	  .vrefresh = 60, .picture_aspect_ratio = HDMI_PICTURE_ASPECT_16_9, },
> +};
> +
> +static int rk3066_hdmi_connector_get_modes(struct drm_connector
> *connector)
> +{
> +	struct rk3066_hdmi *hdmi = to_rk3066_hdmi(connector);
> +	struct drm_display_mode *mode = NULL;
> +	struct edid *edid;
> +	int ret = 0;
> +
> +	if (!hdmi->ddc)
> +		return 0;
> +
> +	hdmi->hdmi_data.sink_is_hdmi = false;
> +
> +	edid = drm_get_edid(connector, hdmi->ddc);
> +	if (edid) {
> +		hdmi->hdmi_data.sink_is_hdmi = drm_detect_hdmi_monitor(edid);
> +
> +		dev_info(hdmi->dev, "monitor type : %s : %dx%d cm\n",
> +			(hdmi->hdmi_data.sink_is_hdmi ? "HDMI" : "DVI"),
> +			edid->width_cm, edid->height_cm);
> +
> +		drm_connector_update_edid_property(connector, edid);
> +		ret = drm_add_edid_modes(connector, edid);
> +		kfree(edid);
> +	}
> +

The DRM framework doesn't provide a function to make a CEA mode. DVI-D
needs a mode set here.
Adding more modes needs an extra for loop. For now one mode is enough.
Just leave it that way.? Please advise.

> +	if ((ret == 0) || (hdmi->hdmi_data.sink_is_hdmi == false)) {
> +		hdmi->hdmi_data.sink_is_hdmi = false;
> +
> +		mode = drm_mode_duplicate(hdmi->drm_dev, &edid_cea_modes[0]);
> +		if (!mode)
> +			return ret;
> +		mode->type |= DRM_MODE_TYPE_PREFERRED;
> +		drm_mode_probed_add(connector, mode);
> +		ret++;
> +
> +		dev_info(hdmi->dev, "no CEA mode found, use default\n");
> +	}
> +
> +	return ret;
> +}

> +struct platform_driver rk3066_hdmi_driver = {
> +	.probe  = rk3066_hdmi_probe,
> +	.remove = rk3066_hdmi_remove,
> +	.driver = {
> +		.name = "rockchip-rk3066hdmi",
> +		.of_match_table = rk3066_hdmi_dt_ids,
> +	},
> +};


> diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.h
> b/drivers/gpu/drm/rockchip/rk3066_hdmi.h
> new file mode 100644
> index 000000000..f4c2e2081
> --- /dev/null
> +++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.h
> @@ -0,0 +1,235 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> + *    Zheng Yang <zhengyang@rock-chips.com>
> + *
> + * This software is licensed under the terms of the GNU General Public
> + * License version 2, as published by the Free Software Foundation, and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
