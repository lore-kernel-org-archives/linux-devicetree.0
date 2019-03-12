From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 1/4] phy: rockchip-emmc: Allow to set drive impedance via DTS.
Date: Tue, 12 Mar 2019 14:07:39 +0100
Message-ID: <1571188.ajMNexS2DJ@phil>
References: <20190307084159.25236-1-christoph.muellner@theobroma-systems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190307084159.25236-1-christoph.muellner@theobroma-systems.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Muellner <christoph.muellner@theobroma-systems.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, shawn.lin@rock-chips.com, Philipp Tomsich <philipp.tomsich@theobroma-systems.com>, Kishon Vijay Abraham I <kishon@ti.com>, Brian Norris <briannorris@chromium.org>, Matthias Brugger <mbrugger@suse.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Klaus Goger <klaus.goger@theobroma-systems.com>, Douglas Anderson <dianders@chromium.org>, Viresh Kumar <viresh.kumar@linaro.org>, Jeffy Chen <jeffy.chen@rock-chips.com>, Vicente Bergas <vicencb@gmail.com>, Randy Li <ayaka@soulik.info>, Tony Xie <tony.xie@rock-chips.com>, Ezequiel Garcia <ezequiel@collabora.com>, Lin Huang <hl@rock-chips.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infrad
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 7. März 2019, 09:41:53 CET schrieb Christoph Muellner:
> The rockchip-emmc PHY can be configured with different
> drive impedance values. Currenlty a value of 50 Ohm is
> hard coded into the driver.
> 
> This patch introduces the DTS property 'drive-impedance-ohm'
> for the rockchip-emmc phy node, which uses the value from the DTS
> to setup the drive impedance accordingly.
> 
> Signed-off-by: Christoph Muellner <christoph.muellner@theobroma-systems.com>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@theobroma-systems.com>

change itself looks good
Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Though I cannot say too much about the electrical side.


Heiko

> ---
>  drivers/phy/rockchip/phy-rockchip-emmc.c | 30 ++++++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-emmc.c b/drivers/phy/rockchip/phy-rockchip-emmc.c
> index 19bf84f0bc67..b804c6bf4b55 100644
> --- a/drivers/phy/rockchip/phy-rockchip-emmc.c
> +++ b/drivers/phy/rockchip/phy-rockchip-emmc.c
> @@ -87,6 +87,7 @@ struct rockchip_emmc_phy {
>  	unsigned int	reg_offset;
>  	struct regmap	*reg_base;
>  	struct clk	*emmcclk;
> +	unsigned int drive_impedance;
>  };
>  
>  static int rockchip_emmc_phy_power(struct phy *phy, bool on_off)
> @@ -281,10 +282,10 @@ static int rockchip_emmc_phy_power_on(struct phy *phy)
>  {
>  	struct rockchip_emmc_phy *rk_phy = phy_get_drvdata(phy);
>  
> -	/* Drive impedance: 50 Ohm */
> +	/* Drive impedance: from DTS */
>  	regmap_write(rk_phy->reg_base,
>  		     rk_phy->reg_offset + GRF_EMMCPHY_CON6,
> -		     HIWORD_UPDATE(PHYCTRL_DR_50OHM,
> +		     HIWORD_UPDATE(rk_phy->drive_impedance,
>  				   PHYCTRL_DR_MASK,
>  				   PHYCTRL_DR_SHIFT));
>  
> @@ -314,6 +315,26 @@ static const struct phy_ops ops = {
>  	.owner		= THIS_MODULE,
>  };
>  
> +static u32 convert_drive_impedance_ohm(struct platform_device *pdev, u32 dr_ohm)
> +{
> +	switch (dr_ohm) {
> +	case 100:
> +		return PHYCTRL_DR_100OHM;
> +	case 66:
> +		return PHYCTRL_DR_66OHM;
> +	case 50:
> +		return PHYCTRL_DR_50OHM;
> +	case 40:
> +		return PHYCTRL_DR_40OHM;
> +	case 33:
> +		return PHYCTRL_DR_33OHM;
> +	}
> +
> +	dev_warn(&pdev->dev, "Invalid value %u for drive-impedance-ohm.\n",
> +		 dr_ohm);
> +	return PHYCTRL_DR_50OHM;
> +}
> +
>  static int rockchip_emmc_phy_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -322,6 +343,7 @@ static int rockchip_emmc_phy_probe(struct platform_device *pdev)
>  	struct phy_provider *phy_provider;
>  	struct regmap *grf;
>  	unsigned int reg_offset;
> +	u32 val;
>  
>  	if (!dev->parent || !dev->parent->of_node)
>  		return -ENODEV;
> @@ -344,6 +366,10 @@ static int rockchip_emmc_phy_probe(struct platform_device *pdev)
>  
>  	rk_phy->reg_offset = reg_offset;
>  	rk_phy->reg_base = grf;
> +	rk_phy->drive_impedance = PHYCTRL_DR_50OHM;
> +
> +	if (!of_property_read_u32(dev->of_node, "drive-impedance-ohm", &val))
> +		rk_phy->drive_impedance = convert_drive_impedance_ohm(pdev, val);
>  
>  	generic_phy = devm_phy_create(dev, dev->of_node, &ops);
>  	if (IS_ERR(generic_phy)) {
> 
