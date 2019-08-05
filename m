From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 10/16] net: phy: adin: add EEE translation layer for
 Clause 22
Date: Tue, 6 Aug 2019 00:11:50 +0200
Message-ID: <20190805221150.GE25700@lunn.ch>
References: <20190805165453.3989-1-alexandru.ardelean@analog.com>
 <20190805165453.3989-11-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190805165453.3989-11-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

> +static int adin_cl22_to_adin_reg(int devad, u16 cl22_regnum)
> +{
> +	struct clause22_mmd_map *m;
> +	int i;
> +
> +	if (devad == MDIO_MMD_VEND1)
> +		return cl22_regnum;
> +
> +	for (i = 0; i < ARRAY_SIZE(clause22_mmd_map); i++) {
> +		m = &clause22_mmd_map[i];
> +		if (m->devad == devad && m->cl22_regnum == cl22_regnum)
> +			return m->adin_regnum;
> +	}
> +
> +	pr_err("No translation available for devad: %d reg: %04x\n",
> +	       devad, cl22_regnum);

phydev_err(). 

	      Andrew
