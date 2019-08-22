From: "Ramuthevar, Vadivel MuruganX"
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [PATCH v3 2/2] phy: intel-lgm-emmc: Add support for eMMC PHY
Date: Thu, 22 Aug 2019 14:54:52 +0800
Message-ID: <ca523af8-4d6b-ad1a-322b-7142c77a3c3b@linux.intel.com>
References: <20190821101118.42774-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20190821101118.42774-2-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20190821120142.GX30120@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190821120142.GX30120@smile.fi.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: kishon@ti.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, cheol.yong.kim@intel.com, qi-ming.wu@intel.com, peter.harliman.liem@intel.com
List-Id: devicetree@vger.kernel.org

Hi Andy,
On 21/8/2019 8:01 PM, Andy Shevchenko wrote:
> On Wed, Aug 21, 2019 at 06:11:18PM +0800, Ramuthevar,Vadivel MuruganX wrote:
>> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>>
>> Add support for eMMC PHY on Intel's Lightning Mountain SoC.
>> --- /dev/null
>> +++ b/drivers/phy/intel/Kconfig
>> @@ -0,0 +1,8 @@
> Missed licence tag
Thank you so much for the review comments, will update.
>> +#
>> +# Phy drivers for Intel X86 LGM platform
>> +#
>> +#define EMMC_PHYCTRL2_REG	0xb0
>> +#define FRQSEL_25M		0
> I would still leave 1 and 2 with corresponding names for sake of documentation.
Ok, will add for the sake of documentation.
>> +#define FRQSEL_150M		3
>> +#define FRQSEL_MASK		GENMASK(24, 22)
>> +#define FRQSEL_SHIFT(x)		(((x) << 22) & FRQSEL_MASK)
>> +	unsigned int freqsel = 0;
> Redundant assignment.
Noted, will update.
>> +	udelay(5);
> + blank line
Noted, will update
>
>> +	regmap_update_bits(priv->syscfg, EMMC_PHYCTRL1_REG, PDB_MASK, 1);
> And here missed to address one of my comments.
Yes, will update.
>> +	/*
>> +	 * We purposely get the clock here and not in probe to avoid the
>> +	 * circular dependency problem.  We expect:
> We don't use double space
Noted, will update.
>> +	 * - PHY driver to probe
>> +	 * - SDHCI driver to start probe
>> +	 * - SDHCI driver to register it's clock
>> +	 * - SDHCI driver to get the PHY
>> +	 * - SDHCI driver to init the PHY
>> +	 *
>> +	 * The clock is optional, so upon any error just return it like
>> +	 * any other error to user.
>> +	 *
>> +	 */
>> +	struct device *dev = &pdev->dev;
>> +	struct intel_emmc_phy *priv;
>> +	struct phy *generic_phy;
>> +	struct phy_provider *phy_provider;
>> +	struct device_node *np = dev->of_node;
> Group it with other assignment(s), i.e. dev = ... above.
>
> 	struct device *dev = ...;
> 	struct device_node *np = ...;

agree, will update.

---
With Best Regards
Vadivel Murugan
