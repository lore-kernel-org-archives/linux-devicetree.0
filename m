From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH linux-next 2/2] mfd: flexcom: add a driver for Atmel
 Flexible Serial Communication Unit
Date: Mon, 15 Jun 2015 19:50:59 +0200
Message-ID: <20150615175059.GE17679@piout.net>
References: <cover.1434386119.git.cyrille.pitchen@atmel.com>
 <e85ceae28a0b382b12b809ac7cca891fcb7ac846.1434386119.git.cyrille.pitchen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e85ceae28a0b382b12b809ac7cca891fcb7ac846.1434386119.git.cyrille.pitchen@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: nicolas.ferre@atmel.com, boris.brezillon@free-electrons.com, sameo@linux.intel.com, lee.jones@linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On 15/06/2015 at 18:38:05 +0200, Cyrille Pitchen wrote :
> +	err = of_property_read_string(pdev->dev.of_node,
> +				      "atmel,flexcom-mode", &mode);
> +	if (err)
> +		return err;
> +
> +	if (!strcmp(mode, "usart"))
> +		mr = FX_MR_USART;
> +	else if (!strcmp(mode, "spi"))
> +		mr = FX_MR_SPI;
> +	else if (!strcmp(mode, "twi") || !strcmp(mode, "i2c"))
> +		mr = FX_MR_TWI;
> +	else
> +		return -EINVAL;
> +
> +	clk_prepare_enable(clk);
> +	version = __raw_readl(map + FX_VERSION);
> +	__raw_writel(mr, map + FX_MR);
> +	clk_disable_unprepare(clk);
> +
> +	dev_info(&pdev->dev, "version: %#x\n", version);
> +

I would also print the selected mode for debugging convenience,
especially if this is used with device tree overlays.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
