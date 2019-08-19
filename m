From: Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v1 2/2] phy: intel-lgm-emmc: Add support for eMMC PHY
Date: Mon, 19 Aug 2019 19:06:42 +0300
Message-ID: <20190819160642.GC30120@smile.fi.intel.com>
References: <20190819034416.45192-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20190819034416.45192-2-vadivel.muruganx.ramuthevar@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190819034416.45192-2-vadivel.muruganx.ramuthevar@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Ramuthevar,Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
Cc: kishon@ti.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, cheol.yong.kim@intel.com, qi-ming.wu@intel.com, peter.harliman.liem@intel.com
List-Id: devicetree@vger.kernel.org

On Mon, Aug 19, 2019 at 11:44:16AM +0800, Ramuthevar,Vadivel MuruganX wrote:
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> 
> Adds support for eMMC PHY on Intel's Lightning Mountain SoC.

Adds -> Add.

> +/* eMMC phy register definitions */
> +#define EMMC_PHYCTRL0_REG	0xa8
> +#define DR_TY_MASK		GENMASK(30, 28)
> +#define DR_TY_50OHM(x)		((~(x) << 28) & DR_TY_MASK)
> +#define OTAPDLYENA		BIT(14)
> +#define OTAPDLYSEL_MASK		GENMASK(13, 10)
> +#define OTAPDLYSEL_SHIFT(x)	(((x) << 10) & OTAPDLYSEL_MASK)
> +
> +#define EMMC_PHYCTRL1_REG	0xac

> +#define PDB_MASK		1

BIT(0)

> +#define ENDLL_MASK		BIT(7)
> +#define ENDLL_VAL		BIT(7)
> +
> +#define EMMC_PHYCTRL2_REG	0xb0
> +#define FRQSEL_25M		0
> +#define FRQSEL_150M		3
> +#define FRQSEL_MASK		GENMASK(24, 22)
> +#define FRQSEL_SHIFT(x)		((x) << 22)
> +
> +#define EMMC_PHYSTAT_REG	0xbc

> +#define CALDONE_MASK		1
> +#define DLLRDY_MASK		1
> +#define IS_CALDONE(x)	((((x) >> 9) & CALDONE_MASK) == 1)
> +#define IS_DLLRDY(x)	((((x) >> 8) & DLLRDY_MASK) == 1)

These are inconsistent with above:

	#define CALDONE_MASK	BIT(9)
	...
	#define IS_CALDONE	((x) & CALDONE_MASK)

Note redundant == part.

> +static int intel_emmc_phy_power(struct phy *phy, bool on_off)
> +{
> +	 * - PHY driver to probe
> +	 * - SDHCI driver to start probe
> +	 * - SDHCI driver to register it's clock
> +	 * - SDHCI driver to get the PHY
> +	 * - SDHCI driver to init the PHY
> +	 *


> +	 * The clock is optional, so upon any error we just set to NULL.

No, the clock framework will do it for you.

> +	 *
> +	 * NOTE: we don't do anything special for EPROBE_DEFER here.  Given the
> +	 * above expected use case, EPROBE_DEFER isn't sensible to expect, so
> +	 * it's just like any other error.

This comment is not correct...

> +	 */
> +	priv->emmcclk = clk_get_optional(&phy->dev, "emmcclk");
> +	if (IS_ERR(priv->emmcclk)) {

> +		dev_warn(&phy->dev, "ERROR: getting emmcclk\n");

...because here you have to return an error...

> +		priv->emmcclk = NULL;

...and here is redundant assignment.


> +	}
> +
> +	return 0;
> +}

When you send out patches, check that you do this for latest version you got reviewed internally.

-- 
With Best Regards,
Andy Shevchenko
