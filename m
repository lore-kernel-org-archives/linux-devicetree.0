From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 3/4] net: dsa: vsc73xx: add support for parallel mode
Date: Mon, 1 Jul 2019 18:11:34 +0200
Message-ID: <20190701161134.GC30468@lunn.ch>
References: <20190701152723.624-1-paweldembicki@gmail.com>
 <20190701152723.624-3-paweldembicki@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190701152723.624-3-paweldembicki@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Dembicki <paweldembicki@gmail.com>
Cc: linus.walleij@linaro.org, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 01, 2019 at 05:27:22PM +0200, Pawel Dembicki wrote:
> +static int vsc73xx_platform_read(struct vsc73xx *vsc, u8 block, u8 subblock,
> +				 u8 reg, u32 *val)
> +{
> +	struct vsc73xx_platform *vsc_platform = vsc->priv;
> +	u32 offset;
> +
> +	if (!vsc73xx_is_addr_valid(block, subblock))
> +		return -EINVAL;
> +
> +	offset = vsc73xx_make_addr(block, subblock, reg);
> +
> +	mutex_lock(&vsc->lock);
> +		*val = ioread32be(vsc_platform->base_addr + offset);
> +	mutex_unlock(&vsc->lock);

Hi Pawel

What is this mutex protecting?

Plus the indentation is wrong.

Thanks
	Andrew
