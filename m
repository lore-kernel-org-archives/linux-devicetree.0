From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 04/16] net: phy: adin: add {write,read}_mmd hooks
Date: Mon, 5 Aug 2019 16:25:13 +0200
Message-ID: <20190805142513.GK24275@lunn.ch>
References: <20190805165453.3989-1-alexandru.ardelean@analog.com>
 <20190805165453.3989-5-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190805165453.3989-5-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

> diff --git a/drivers/net/phy/adin.c b/drivers/net/phy/adin.c
> index b75c723bda79..3dd9fe50f4c8 100644
> --- a/drivers/net/phy/adin.c
> +++ b/drivers/net/phy/adin.c
> @@ -14,6 +14,9 @@
>  #define PHY_ID_ADIN1200				0x0283bc20
>  #define PHY_ID_ADIN1300				0x0283bc30
>  
> +#define ADIN1300_MII_EXT_REG_PTR		0x10
> +#define ADIN1300_MII_EXT_REG_DATA		0x11
> +
>  #define ADIN1300_INT_MASK_REG			0x0018

Please be consistent with registers. Either use 4 digits, or 2 digits.

       Andrew
