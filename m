From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 2/4] net: dsa: vsc73xx: Split vsc73xx driver
Date: Mon, 1 Jul 2019 18:03:11 +0200
Message-ID: <20190701160311.GB30468@lunn.ch>
References: <20190701152723.624-1-paweldembicki@gmail.com>
 <20190701152723.624-2-paweldembicki@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190701152723.624-2-paweldembicki@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Dembicki <paweldembicki@gmail.com>
Cc: linus.walleij@linaro.org, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> @@ -495,12 +380,12 @@ static int vsc73xx_update_bits(struct vsc73xx *vsc, u8 block, u8 subblock,
>  	int ret;
>  
>  	/* Same read-modify-write algorithm as e.g. regmap */
> -	ret = vsc73xx_read(vsc, block, subblock, reg, &orig);
> +	ret = vsc->ops->read(vsc, block, subblock, reg, &orig);
>  	if (ret)
>  		return ret;
>  	tmp = orig & ~mask;
>  	tmp |= val & mask;
> -	return vsc73xx_write(vsc, block, subblock, reg, tmp);
> +	return vsc->ops->write(vsc, block, subblock, reg, tmp);

This patch would be a lot less invasive and smaller if you hid the
difference between SPI and platform inside vsc73xx_write() and
vsc73xx_read().

> -static int vsc73xx_probe(struct spi_device *spi)
> +int vsc73xx_probe(struct vsc73xx *vsc)
>  {
> -	struct device *dev = &spi->dev;

  struct device *dev = vsc->dev;

and then a lot of the changes you make here go away.

In general, think about how to make the changes small. It saves your
time from actually making changes, and reviewer time since the patch
it smaller.

    Andrew
