From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v7 2/3] gpio: mmio: add DT support for memory-mapped GPIOs
Date: Fri, 6 May 2016 12:50:10 +0100
Message-ID: <20160506114916.GA18053@leverpostej>
References: <cover.1462372360.git.chunkeey@googlemail.com>
 <50f7f506364f84effd5224677b21726fd2e511a4.1462372360.git.chunkeey@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <50f7f506364f84effd5224677b21726fd2e511a4.1462372360.git.chunkeey@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, =?utf-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>, Kumar Gala <galak@codeaurora.org>, Alexander Shiyan <shc_work@mail.ru>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, May 06, 2016 at 01:10:20PM +0200, Christian Lamparter wrote:
> +static int bgpio_basic_mmio_parse_dt(struct platform_device *pdev,
> +				     struct bgpio_pdata *pdata,
> +				     unsigned long *flags)
> +{
> +	struct device *dev = &pdev->dev;
> +	int err;
> +
> +	pdata->base = -1;
> +	/* If ngpio property is not specified, of_property_read_u32
> +	 * will return -EINVAL. In this case the number of GPIOs is
> +	 * automatically determined by the register width. Any
> +	 * other error of of_property_read_u32 is due bad data and
> +	 * needs to be dealt with.
> +	 */
> +	err = of_property_read_u32(dev->of_node, "ngpio", &pdata->ngpio);
> +	if (err && err != -EINVAL)
> +		return err;
> +
> +	if (of_device_is_big_endian(dev->of_node))
> +		*flags |= BGPIOF_BIG_ENDIAN_BYTE_ORDER;
> +
> +	if (of_property_read_bool(dev->of_node, "unreadable-reg-set"))
> +		*flags |= BGPIOF_UNREADABLE_REG_SET;
> +
> +	if (of_property_read_bool(dev->of_node, "unreadable-reg-dir"))
> +		*flags |= BGPIOF_UNREADABLE_REG_DIR;
> +
> +	if (of_property_read_bool(dev->of_node, "big-endian-byte-order"))
> +		*flags |= BGPIOF_BIG_ENDIAN;
> +
> +	if (of_property_read_bool(dev->of_node, "read-output-reg-set"))
> +		*flags |= BGPIOF_READ_OUTPUT_REG_SET;
> +
> +	if (of_property_read_bool(dev->of_node, "no-output"))
> +		*flags |= BGPIOF_NO_OUTPUT;
> +	return 0;
> +}

Other than no-output, none of these are in the wd,mbl-gpio binding.

Please remove them for now. We can add them as/when other users of this
binding appear and begin to need them.

Thanks,
Mark.
