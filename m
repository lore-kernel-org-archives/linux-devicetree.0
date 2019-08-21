From: "Ramuthevar, Vadivel MuruganX"
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [PATCH v2 2/2] phy: intel-lgm-emmc: Add support for eMMC PHY
Date: Wed, 21 Aug 2019 13:33:14 +0800
Message-ID: <8aadf00b-048a-0db8-ba31-307cc6e7eb2e@linux.intel.com>
References: <20190820103133.53776-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20190820103133.53776-2-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20190820135602.GN30120@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190820135602.GN30120@smile.fi.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: kishon@ti.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, cheol.yong.kim@intel.com, qi-ming.wu@intel.com, peter.harliman.liem@intel.com
List-Id: devicetree@vger.kernel.org

On 20/8/2019 9:56 PM, Andy Shevchenko wrote:
> On Tue, Aug 20, 2019 at 06:31:33PM +0800, Ramuthevar,Vadivel MuruganX wrote:
>> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>>
>> Add support for eMMC PHY on Intel's Lightning Mountain SoC.
> Thanks for an update.
> Looks better though several minor comments below.
>
Thanks a lot! Andy,  for the review comments.

>> +/* eMMC phy register definitions */
>> +#define EMMC_PHYCTRL0_REG	0xa8
>> +#define DR_TY_MASK		GENMASK(30, 28)
>> +#define DR_TY_50OHM(x)		((~(x) << 28) & DR_TY_MASK)
> For consistency it should be
>
> #define DR_TY_SHIFT(x)		(((x) << 28) & DR_TY_MASK)
>
> with explanation about 50 Ohm in the code below.
>
>> +#define OTAPDLYENA		BIT(14)
>> +#define OTAPDLYSEL_MASK		GENMASK(13, 10)
>> +#define OTAPDLYSEL_SHIFT(x)	(((x) << 10) & OTAPDLYSEL_MASK)
>> +
>> +#define EMMC_PHYCTRL1_REG	0xac
>> +#define PDB_MASK		BIT(0)
>> +#define ENDLL_MASK		BIT(7)
>> +#define ENDLL_VAL		BIT(7)
> Again, inconsistency here,
>
> #define ENDLL_SHIFT(x)		(((x) << 7) & ENDLL_MASK)
Agreed
>> +#define EMMC_PHYCTRL2_REG	0xb0
>> +#define FRQSEL_25M		0
>> +#define FRQSEL_150M		3
>> +#define FRQSEL_MASK		GENMASK(24, 22)
>> +#define FRQSEL_SHIFT(x)		((x) << 22)
> And here
>
> #define FRQSEL_SHIFT(x)		(((x) << 22) & FRQSEL_MASK)
Agreed
>> +	/*
>> +	 * According to the user manual, calpad calibration
>> +	 * cycle takes more than 2us without the minimal recommended
>> +	 * value, so we may need a little margin here
>> +	 */
>> +	usleep_range(3, 6);
> Actually for this low values it's recommended to use udelay() disregard to
> context.
>
> 	udelay(5);
Agreed
>> +	regmap_update_bits(priv->syscfg, EMMC_PHYCTRL1_REG, PDB_MASK, 1);
> 1 looks like a magic that has to be changed in the same way as for the rest, i.e.
>
> #define PDB_SHIFT(x)	(((x) << 0) & PDB_MASK)
>
> 	..., PDB_MASK, PDB_SHIFT(1)...
Agreed
>> +static int intel_emmc_phy_power_on(struct phy *phy)
>> +{
>> +	struct intel_emmc_phy *priv = phy_get_drvdata(phy);
>> +	int ret;
>> +
>> +	/* Drive impedance: 50 Ohm */
> Nice, you have already a comment here. Just use DR_TY_SHIFT(1)
>
>> +	ret = regmap_update_bits(priv->syscfg, EMMC_PHYCTRL0_REG, DR_TY_MASK,
>> +				 DR_TY_50OHM(1));
>> +	ret = regmap_update_bits(priv->syscfg, EMMC_PHYCTRL0_REG, OTAPDLYENA,
>> +				 0x0);
> 0x0 -> 0
Noted
>> +static int intel_emmc_phy_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct intel_emmc_phy *priv;
>> +	struct phy *generic_phy;
>> +	struct phy_provider *phy_provider;
>> +
>> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	/* Get eMMC phy (accessed via chiptop) regmap */
>> +	priv->syscfg = syscon_regmap_lookup_by_phandle(dev->of_node,
>> +						       "intel,syscon");
> Perhaps
>
> 	struct device_node *np = dev->of_node;
> 	...
> 	priv->syscfg = syscon_regmap_lookup_by_phandle(np, "intel,syscon");
>
>> +	generic_phy = devm_phy_create(dev, dev->of_node, &ops);
> And here.

Noted, will update

With Best Regards
Vadivel
