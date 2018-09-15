From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next v3 10/11] phy: add driver for Microsemi Ocelot
 SerDes muxing
Date: Sat, 15 Sep 2018 14:20:25 -0700
Message-ID: <1dc66b5d-e60e-dad2-eed9-e283de260dc3@gmail.com>
References: <cover.ff40d591b548a6da31716e6e600f11a303e0e643.1536912834.git-series.quentin.schulz@bootlin.com>
 <cde4ccafdbd948db7ccbb263dd5b1a803e63a83e.1536912834.git-series.quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <cde4ccafdbd948db7ccbb263dd5b1a803e63a83e.1536912834.git-series.quentin.schulz@bootlin.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>, alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, kishon@ti.com, andrew@lunn.ch
Cc: allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org



On 09/14/18 01:16, Quentin Schulz wrote:
> The Microsemi Ocelot can mux SerDes lanes (aka macros) to different
> switch ports or even make it act as a PCIe interface.
> 
> This adds support for the muxing of the SerDes.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
> ---

[snip]

> +
> +struct serdes_macro {
> +	u8			idx;
> +	/* Not used when in QSGMII or PCIe mode */
> +	int			port;

u8 port to be consistent with the mux table?

[snip]

> +#define SERDES_MUX(_idx, _port, _mode, _mask, _mux) {	\
> +	.idx = _idx,						\
> +	.port = _port,						\
> +	.mode = _mode,						\
> +	.mask = _mask,						\
> +	.mux = _mux,						\
> +}
> +
> +static const struct serdes_mux ocelot_serdes_muxes[] = {
> +	SERDES_MUX(SERDES1G_0, 0, PHY_MODE_SGMII, 0, 0),
> +	SERDES_MUX(SERDES1G_1, 1, PHY_MODE_SGMII, HSIO_HW_CFG_DEV1G_5_MODE, 0),
> +	SERDES_MUX(SERDES1G_1, 5, PHY_MODE_SGMII, HSIO_HW_CFG_QSGMII_ENA |
> +		   HSIO_HW_CFG_DEV1G_5_MODE, HSIO_HW_CFG_DEV1G_5_MODE),

Why not go one step further and define a SERDES_MUX_SGMII() macro which
automatically resolves the correct bit definitions to use?

The current macro does not make this particularly easy to read :/

> +	SERDES_MUX(SERDES1G_2, 2, PHY_MODE_SGMII, HSIO_HW_CFG_DEV1G_4_MODE, 0),
> +	SERDES_MUX(SERDES1G_2, 4, PHY_MODE_SGMII, HSIO_HW_CFG_QSGMII_ENA |
> +		   HSIO_HW_CFG_DEV1G_4_MODE, HSIO_HW_CFG_DEV1G_4_MODE),
> +	SERDES_MUX(SERDES1G_3, 3, PHY_MODE_SGMII, HSIO_HW_CFG_DEV1G_6_MODE, 0),
> +	SERDES_MUX(SERDES1G_3, 6, PHY_MODE_SGMII, HSIO_HW_CFG_QSGMII_ENA |
> +		   HSIO_HW_CFG_DEV1G_6_MODE, HSIO_HW_CFG_DEV1G_6_MODE),
> +	SERDES_MUX(SERDES1G_4, 4, PHY_MODE_SGMII, HSIO_HW_CFG_QSGMII_ENA |
> +		   HSIO_HW_CFG_DEV1G_4_MODE | HSIO_HW_CFG_DEV1G_9_MODE, 0),
> +	SERDES_MUX(SERDES1G_4, 9, PHY_MODE_SGMII, HSIO_HW_CFG_DEV1G_4_MODE |
> +		   HSIO_HW_CFG_DEV1G_9_MODE, HSIO_HW_CFG_DEV1G_4_MODE |
> +		   HSIO_HW_CFG_DEV1G_9_MODE),
> +	SERDES_MUX(SERDES1G_5, 5, PHY_MODE_SGMII, HSIO_HW_CFG_QSGMII_ENA |
> +		   HSIO_HW_CFG_DEV1G_5_MODE | HSIO_HW_CFG_DEV2G5_10_MODE, 0),
> +	SERDES_MUX(SERDES1G_5, 10, PHY_MODE_SGMII, HSIO_HW_CFG_PCIE_ENA |
> +		   HSIO_HW_CFG_DEV1G_5_MODE | HSIO_HW_CFG_DEV2G5_10_MODE,
> +		   HSIO_HW_CFG_DEV1G_5_MODE | HSIO_HW_CFG_DEV2G5_10_MODE),
> +	SERDES_MUX(SERDES6G_0, 4, PHY_MODE_QSGMII, HSIO_HW_CFG_QSGMII_ENA,
> +		   HSIO_HW_CFG_QSGMII_ENA),
> +	SERDES_MUX(SERDES6G_0, 5, PHY_MODE_QSGMII, HSIO_HW_CFG_QSGMII_ENA,
> +		   HSIO_HW_CFG_QSGMII_ENA),
> +	SERDES_MUX(SERDES6G_0, 6, PHY_MODE_QSGMII, HSIO_HW_CFG_QSGMII_ENA,
> +		   HSIO_HW_CFG_QSGMII_ENA),
> +	SERDES_MUX(SERDES6G_0, 7, PHY_MODE_SGMII, HSIO_HW_CFG_QSGMII_ENA, 0),
> +	SERDES_MUX(SERDES6G_0, 7, PHY_MODE_QSGMII, HSIO_HW_CFG_QSGMII_ENA,
> +		   HSIO_HW_CFG_QSGMII_ENA),
> +	SERDES_MUX(SERDES6G_1, 8, PHY_MODE_SGMII, 0, 0),
> +	SERDES_MUX(SERDES6G_2, 10, PHY_MODE_SGMII, HSIO_HW_CFG_PCIE_ENA |
> +		   HSIO_HW_CFG_DEV2G5_10_MODE, 0),
> +	SERDES_MUX(SERDES6G_2, 10, PHY_MODE_PCIE, HSIO_HW_CFG_PCIE_ENA,
> +		   HSIO_HW_CFG_PCIE_ENA),
> +};
> +
> +static int serdes_set_mode(struct phy *phy, enum phy_mode mode)
> +{
> +	struct serdes_macro *macro = phy_get_drvdata(phy);
> +	int ret, i;

unsigned int i;

> +
> +	for (i = 0; i < ARRAY_SIZE(ocelot_serdes_muxes); i++) {
> +		if (macro->idx != ocelot_serdes_muxes[i].idx ||
> +		    mode != ocelot_serdes_muxes[i].mode)
> +			continue;
> +
> +		if (mode != PHY_MODE_QSGMII &&
> +		    macro->port != ocelot_serdes_muxes[i].port)
> +			continue;
> +
> +		ret = regmap_update_bits(macro->ctrl->regs, HSIO_HW_CFG,
> +					 ocelot_serdes_muxes[i].mask,
> +					 ocelot_serdes_muxes[i].mux);
> +		if (ret)
> +			return ret;
> +
> +		if (macro->idx < SERDES1G_MAX)
> +			return serdes_init_s1g(macro->ctrl->regs, macro->idx);
> +
> +		/* SERDES6G and PCIe not supported yet */
> +		return 0;

Would not returning -EOPNOTSUPP be more helpful rather than leaving the
PHY unconfigured (or did the bootloader somehow configure it before for us)?

> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static const struct phy_ops serdes_ops = {
> +	.set_mode	= serdes_set_mode,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static struct phy *serdes_simple_xlate(struct device *dev,
> +				       struct of_phandle_args *args)
> +{
> +	struct serdes_ctrl *ctrl = dev_get_drvdata(dev);
> +	int port, idx, i;

unsigned int port, idx, i;

[snip]


> +
> +static int serdes_probe(struct platform_device *pdev)
> +{
> +	struct phy_provider *provider;
> +	struct serdes_ctrl *ctrl;
> +	int i, ret;

unsigned int i;

> +
> +	ctrl = devm_kzalloc(&pdev->dev, sizeof(*ctrl), GFP_KERNEL);
> +	if (!ctrl)
> +		return -ENOMEM;
> +
> +	ctrl->dev = &pdev->dev;
> +	ctrl->regs = syscon_node_to_regmap(pdev->dev.parent->of_node);
> +	if (!ctrl->regs)
> +		return -ENODEV;
> +
> +	for (i = 0; i <= SERDES_MAX; i++) {

Every other loop you have is using <, is this one off-by-one?
-- 
Florian
