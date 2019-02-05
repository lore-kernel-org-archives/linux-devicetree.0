From: Torsten Duwe <duwe@lst.de>
Subject: Re: [PATCH RESEND v2 05/12] drm/bridge: Add Analogix anx6345
 support
Date: Tue, 5 Feb 2019 14:19:02 +0100
Message-ID: <20190205131902.GA7432@lst.de>
References: <20181018073327.64942-1-icenowy@aosc.io> <20190204122250.GB7660@lst.de> <CA+E=qVfHMqo_ZWPTgvr+5G2J29Yy-TU4aceVD0oHLeyaOxVogA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190203185501.8958-6-anarsoul@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, devicetree <devicetree@vger.kernel.org>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>, arm-linux <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

First thing that struck me is that the chip's reset is actually low active

   reset-gpios = <&pio 3 24 GPIO_ACTIVE_LOW>; /* PD24 */
                                        ^^^^
(please correct this in patches 11 and 12)

Consequently, you're using inverted values here in the driver:

> +static void anx6345_poweron(struct anx6345 *anx6345)
> +{
[...]
> +	gpiod_set_value_cansleep(pdata->gpiod_reset, 0);

0 = reset on, ok.

> +	usleep_range(1000, 2000);
> +
> +	gpiod_set_value_cansleep(pdata->gpiod_reset, 1);

1 = reset off, also fine.

> +
> +	/* Power on registers module */
> +	anx6345_set_bits(anx6345->map[I2C_IDX_TXCOM], SP_POWERDOWN_CTRL_REG,
> +			 SP_HDCP_PD | SP_AUDIO_PD | SP_VIDEO_PD | SP_LINK_PD);
> +	anx6345_clear_bits(anx6345->map[I2C_IDX_TXCOM], SP_POWERDOWN_CTRL_REG,
> +			   SP_REGISTER_PD | SP_TOTAL_PD);
> +
> +	anx6345->powered = true;
> +}
> +
> +static void anx6345_poweroff(struct anx6345 *anx6345)
> +{
> +	struct anx6345_platform_data *pdata = &anx6345->pdata;
> +	int err;
> +
> +	if (WARN_ON(!anx6345->powered))
> +		return;
> +
> +	gpiod_set_value_cansleep(pdata->gpiod_reset, 1);
> +	usleep_range(1000, 2000);

This one got me a bit confused. Assert or deassert reset (again) before
poweroff?

Please stick to the logical value of the reset line.

	Torsten
