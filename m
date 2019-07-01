From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 3/4] net: dsa: vsc73xx: add support for parallel mode
Date: Mon, 1 Jul 2019 09:45:10 -0700
Message-ID: <b7afaf2e-ca4e-2795-658d-2f0289203833@gmail.com>
References: <20190701152723.624-1-paweldembicki@gmail.com>
 <20190701152723.624-3-paweldembicki@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190701152723.624-3-paweldembicki@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Dembicki <paweldembicki@gmail.com>
Cc: linus.walleij@linaro.org, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 7/1/19 8:27 AM, Pawel Dembicki wrote:
> This patch add platform part of vsc73xx driver.
> It allows to use chip connected by PI interface.
> 
> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
> ---

[snip]

> +	struct vsc73xx_platform *vsc_platform = vsc->priv;
> +	u32 offset;
> +
> +	if (!vsc73xx_is_addr_valid(block, subblock))
> +		return -EINVAL;
> +
> +	offset = vsc73xx_make_addr(block, subblock, reg);
> +
> +	mutex_lock(&vsc->lock);
> +		iowrite32be(val, vsc_platform->base_addr + offset);
> +	mutex_unlock(&vsc->lock);

Similar question from Andrew, why is the locking done in the platform
layer, should not that be done in the core I/O operation instead?

> +
> +	return 0;
> +}
> +
> +static int vsc73xx_platform_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct vsc73xx_platform *vsc_platform;
> +	struct resource *res = NULL;
> +	int ret;
> +
> +	vsc_platform = devm_kzalloc(dev, sizeof(*vsc_platform), GFP_KERNEL);
> +	if (!vsc_platform)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, vsc_platform);
> +	vsc_platform->pdev = pdev;
> +	vsc_platform->vsc.dev = dev;
> +	vsc_platform->vsc.priv = vsc_platform;
> +	vsc_platform->vsc.ops = &vsc73xx_platform_ops;
> +
> +	/* obtain I/O memory space */
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "cannot obtain I/O memory space\n");
> +		ret = -ENXIO;
> +		return ret;
> +	}
> +
> +	vsc_platform->base_addr = devm_ioremap_resource(&pdev->dev, res);

devm_ioremap_resource takes care of checking that the resource pointer
is valid, no need to do that here.

> +	if (!vsc_platform->base_addr) {

if (IS_ERR(vsc_platform->base_addr))
-- 
Florian
