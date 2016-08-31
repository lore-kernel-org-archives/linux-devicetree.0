From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v5 2/2] phy: add a driver for the Rockchip SoC internal
 PCIe PHY
Date: Wed, 31 Aug 2016 16:08:10 +0200
Message-ID: <6005500.MI6i4QbaFN@diego>
References: <1471661617-26432-1-git-send-email-shawn.lin@rock-chips.com>
 <1471661617-26432-2-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1471661617-26432-2-git-send-email-shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Am Samstag, 20. August 2016, 10:53:37 schrieb Shawn Lin:
> This patch to add a generic PHY driver for rockchip PCIe PHY.
> Access the PHY via registers provided by GRF (general register
> files) module.
> 
> Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

seems I'm late to the party, but when looking if I can apply the pcie-
devicetree patches, I found that the phy is still pending.

Apart from some error-message nitpicks below, this looks ok to me. I don't 
know enough about the actual pci phy part though.

Kishon, is this on your radar?

[...]

> +static int rockchip_pcie_phy_power_off(struct phy *phy)
> +{
> +	struct rockchip_pcie_phy *rk_phy = phy_get_drvdata(phy);
> +	int err = 0;
> +
> +	err = reset_control_assert(rk_phy->phy_rst);
> +	if (err) {
> +		pr_err("assert phy_rst err %d\n", err);

	dev_err(phy->dev, ...)

probably the same for all other pr_err invocations


> +		return err;
> +	}
> +
> +	return 0;
> +}

[...]

> +static const struct of_device_id rockchip_pcie_phy_dt_ids[] = {
> +	{
> +		.compatible = "rockchip,rk3399-pcie-phy",
> +		.data = &rk3399_pcie_data,
> +	},
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(of, rockchip_pcie_phy_dt_ids);
> +
> +static int rockchip_pcie_phy_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rockchip_pcie_phy *rk_phy;
> +	struct phy *generic_phy;
> +	struct phy_provider *phy_provider;
> +	struct regmap *grf;
> +	const struct of_device_id *of_id;
> +
> +	grf = syscon_node_to_regmap(dev->parent->of_node);
> +	if (IS_ERR(grf)) {
> +		dev_err(dev, "Missing rockchip,grf property\n");

		dev_err(dev, "Cannot find GRF syscon\n");


Heiko
