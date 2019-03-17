From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next 2/3] net: phy: add amlogic g12a mdio mux support
Date: Sun, 17 Mar 2019 17:14:02 +0100
Message-ID: <20190317161402.GB22226@lunn.ch>
References: <20190314140135.19184-1-jbrunet@baylibre.com>
 <20190314140135.19184-3-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190314140135.19184-3-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, Kevin Hilman <khilman@baylibre.com>, netdev@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 14, 2019 at 03:01:34PM +0100, Jerome Brunet wrote:
> Add support for the mdio mux and internal phy glue of the g12a SoC family
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/net/phy/Kconfig               |  10 +
>  drivers/net/phy/Makefile              |   1 +
>  drivers/net/phy/mdio-mux-meson-g12a.c | 371 ++++++++++++++++++++++++++
>  3 files changed, 382 insertions(+)
>  create mode 100644 drivers/net/phy/mdio-mux-meson-g12a.c
> 
> diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
> index 071869db44cf..831aa350b1cb 100644
> --- a/drivers/net/phy/Kconfig
> +++ b/drivers/net/phy/Kconfig
> @@ -74,6 +74,16 @@ config MDIO_BUS_MUX_GPIO
>  	  several child MDIO busses to a parent bus.  Child bus
>  	  selection is under the control of GPIO lines.
>  
> +config MDIO_BUS_MUX_MESON_G12A
> +	tristate "Amlogic G12a based MDIO bus multiplexer"
> +	depends on ARCH_MESON || COMPILE_TEST
> +	depends on OF_MDIO && HAS_IOMEM
> +	select MDIO_BUS_MUX

Hi Jerome

Do you need some clock depends? 

> +static int g12a_mdio_switch_fn(int current_child, int desired_child,
> +			       void *data)
> +{
> +	struct device *dev = data;
> +	struct g12a_mdio_mux *priv = dev_get_drvdata(dev);

David won't like that you don't have reverse Christmas tree. You need
to do the assignment to priv in the body of the code. Or can you pass
data directly to dev_get_drvdata?

> +static int g12a_mdio_mux_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	struct g12a_mdio_mux *priv;
> +	int ret;

Reverse Christmas tree please.


> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	priv->regs = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(priv->regs))
> +		return PTR_ERR(priv->regs);
> +
> +	priv->pclk = devm_clk_get(dev, "pclk");
> +	if (IS_ERR(priv->pclk)) {
> +		ret = PTR_ERR(priv->pclk);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "failed to get peripheral clock\n");
> +		return ret;
> +	}
> +
> +	/* Make sure the device registers are clocked */
> +	ret = clk_prepare_enable(priv->pclk);
> +	if (ret) {
> +		dev_err(dev, "failed to enable peripheral clock");
> +		return ret;
> +	}
> +
> +	/* Register PLL in CCF */
> +	ret = g12a_ephy_glue_clk_register(dev);

On error, you are not disabling the peripheral clock.

> +	if (ret)
> +		return ret;
> +
> +	return mdio_mux_init(dev, dev->of_node, g12a_mdio_switch_fn,
> +			     &priv->mux_handle, dev, NULL);
> +}

  Andrew
