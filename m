From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] net: phy: TLK10X initial driver submission
Date: Tue, 24 Apr 2018 09:52:39 -0700
Message-ID: <03ddc0d5-85ff-feeb-259a-65ae89893d4e@gmail.com>
References: <20180419082816.109338-1-mans.andersson@nibe.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180419082816.109338-1-mans.andersson@nibe.se>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?M=c3=a5ns_Andersson?= <mans.andersson@nibe.se>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 04/19/2018 01:28 AM, Måns Andersson wrote:
> From: Mans Andersson <mans.andersson@nibe.se>
> 
> Add suport for the TI TLK105 and TLK106 10/100Mbit ethernet phys.
> 
> In addition the TLK10X needs to be removed from DP83848 driver as the
> power back off support is added here for this device.

I would not think this is a compelling enough reason, you could very
well just adjust the dp83848.c driver just to account for these
properties that you are introducing. More comments below.

[snip]

> +#define TLK10X_INT_EN_MASK		\
> +	(TLK10X_MISR_ANC_INT_EN |	\
> +	 TLK10X_MISR_DUP_INT_EN |	\
> +	 TLK10X_MISR_SPD_INT_EN |	\
> +	 TLK10X_MISR_LINK_INT_EN)
> +
> +struct tlk10x_private {
> +	int pwrbo_level;

unsigned int

> +};
> +
> +static int tlk10x_read(struct phy_device *phydev, int reg)
> +{
> +	if (reg & ~0x1f) {
> +		/* Extended register */
> +		phy_write(phydev, TLK10X_REGCR, 0x001F);
> +		phy_write(phydev, TLK10X_ADDAR, reg);
> +		phy_write(phydev, TLK10X_REGCR, 0x401F);
> +		reg = TLK10X_ADDAR;
> +	}

Humm, this looks a bit fragile, you would likely want to create separate
helper functions for these extended registers and make sure you handle
write failures as well. Also consider making use of the page helpers
from include/linux/phy.h.

> +
> +	return phy_read(phydev, reg);
> +}
> +
> +static int tlk10x_write(struct phy_device *phydev, int reg, int val)
> +{
> +	if (reg & ~0x1f) {
> +		/* Extended register */
> +		phy_write(phydev, TLK10X_REGCR, 0x001F);
> +		phy_write(phydev, TLK10X_ADDAR, reg);
> +		phy_write(phydev, TLK10X_REGCR, 0x401F);
> +		reg = TLK10X_ADDAR;
> +	}

Same here.

> +
> +	return phy_write(phydev, reg, val);
> +}
> +
> +#ifdef CONFIG_OF_MDIO
> +static int tlk10x_of_init(struct phy_device *phydev)
> +{
> +	struct tlk10x_private *tlk10x = phydev->priv;
> +	struct device *dev = &phydev->mdio.dev;
> +	struct device_node *of_node = dev->of_node;
> +	int ret;
> +
> +	if (!of_node)
> +		return 0;
> +
> +	ret = of_property_read_u32(of_node, "ti,power-back-off",
> +				   &tlk10x->pwrbo_level);
> +	if (ret) {
> +		dev_err(dev, "missing ti,power-back-off property");
> +		tlk10x->pwrbo_level = 0;

This should not be necessary, that should be the default with a zero
initialized private data structure.

> +	}
> +
> +	return 0;
> +}
> +#else
> +static int tlk10x_of_init(struct phy_device *phydev)
> +{
> +	return 0;
> +}
> +#endif /* CONFIG_OF_MDIO */
> +
> +static int tlk10x_config_init(struct phy_device *phydev)
> +{
> +	int ret, reg;
> +	struct tlk10x_private *tlk10x;
> +
> +	ret = genphy_config_init(phydev);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (!phydev->priv) {
> +		tlk10x = devm_kzalloc(&phydev->mdio.dev, sizeof(*tlk10x),
> +				      GFP_KERNEL);
> +		if (!tlk10x)
> +			return -ENOMEM;
> +
> +		phydev->priv = tlk10x;
> +		ret = tlk10x_of_init(phydev);
> +		if (ret)
> +			return ret;
> +	} else {
> +		tlk10x = (struct tlk10x_private *)phydev->priv;
> +	}

You need to implement a probe() function that is responsible for
allocation private memory instead of doing this check.

> +
> +	// Power back off
> +	if (tlk10x->pwrbo_level < 0 || tlk10x->pwrbo_level > 3)
> +		tlk10x->pwrbo_level = 0;

How can you have pwrb_level < 0 when you use of_read_property_u32()?

> +	reg = tlk10x_read(phydev, TLK10X_PWRBOCR);
> +	reg = ((reg & ~TLK10X_PWRBOCR_MASK)
> +		| (tlk10x->pwrbo_level << 6));

One too many levels of parenthesis, the outer ones should not be necessary.

> +	ret = tlk10x_write(phydev, TLK10X_PWRBOCR, reg);
> +	if (ret < 0) {
> +		dev_err(&phydev->mdio.dev,
> +			"unable to set power back-off (err=%d)\n", ret);
> +		return ret;
> +	}
> +	dev_info(&phydev->mdio.dev, "power back-off set to level %d\n",
> +		 tlk10x->pwrbo_level);

config_init() is called often, consider making this a debugging statement.

-- 
Florian
