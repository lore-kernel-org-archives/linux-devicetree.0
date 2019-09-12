From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 5/6] media: sun4i: Add H3 deinterlace driver
Date: Thu, 12 Sep 2019 22:26:47 +0200
Message-ID: <20190912202647.wfcjur7yxhlelvd6@localhost.localdomain>
References: <20190912175132.411-1-jernej.skrabec@siol.net>
 <20190912175132.411-6-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190912175132.411-6-jernej.skrabec@siol.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, hverkuil@xs4all.nl, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Sep 12, 2019 at 07:51:31PM +0200, Jernej Skrabec wrote:
> +	dev->regmap = devm_regmap_init_mmio(dev->dev, dev->base,
> +					    &deinterlace_regmap_config);
> +	if (IS_ERR(dev->regmap)) {
> +		dev_err(dev->dev, "Couldn't create deinterlace regmap\n");
> +
> +		return PTR_ERR(dev->regmap);
> +	}
> +
> +	ret = clk_prepare_enable(dev->bus_clk);
> +	if (ret) {
> +		dev_err(dev->dev, "Failed to enable bus clock\n");
> +
> +		return ret;
> +	}

Do you need to keep the bus clock enabled all the time? Usually, for
the SoCs that have a reset line, you only need it to read / write to
the registers, not to have the controller actually running.

If you don't, then regmap_init_mmio_clk will take care of that for
you.

> +	clk_set_rate(dev->mod_clk, 300000000);
> +
> +	ret = clk_prepare_enable(dev->mod_clk);
> +	if (ret) {
> +		dev_err(dev->dev, "Failed to enable mod clock\n");
> +
> +		goto err_bus_clk;
> +	}
> +
> +	ret = clk_prepare_enable(dev->ram_clk);
> +	if (ret) {
> +		dev_err(dev->dev, "Failed to enable ram clock\n");
> +
> +		goto err_mod_clk;
> +	}
> +
> +	ret = reset_control_reset(dev->rstc);
> +	if (ret) {
> +		dev_err(dev->dev, "Failed to apply reset\n");
> +
> +		goto err_ram_clk;
> +	}

This could be moved to a runtime_pm hook, with get_sync called in the
open. That way you won't leave the device powered on if it's unused.

> +struct deinterlace_dev {
> +	struct v4l2_device	v4l2_dev;
> +	struct video_device	vfd;
> +	struct device		*dev;
> +	struct v4l2_m2m_dev	*m2m_dev;
> +
> +	/* Device file mutex */
> +	struct mutex		dev_mutex;
> +
> +	void __iomem		*base;
> +	struct regmap		*regmap;

Do you need to store the base address in that structure if you're
using the regmap?

Maxime
