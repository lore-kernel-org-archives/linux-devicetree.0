From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 01/16] net: phy: adin: add support for Analog Devices PHYs
Date: Mon, 5 Aug 2019 16:16:44 +0200
Message-ID: <20190805141644.GH24275@lunn.ch>
References: <20190805165453.3989-1-alexandru.ardelean@analog.com>
 <20190805165453.3989-2-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190805165453.3989-2-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

> +static int adin_config_init(struct phy_device *phydev)
> +{
> +	int rc;
> +
> +	rc = genphy_config_init(phydev);
> +	if (rc < 0)
> +		return rc;
> +
> +	return 0;
> +}

Why not just

    return genphy_config_init(phydev);

    Andrew
