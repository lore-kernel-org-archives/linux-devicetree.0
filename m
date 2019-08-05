From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 15/16] net: phy: adin: add ethtool get_stats support
Date: Mon, 5 Aug 2019 17:30:58 +0200
Message-ID: <20190805153058.GU24275@lunn.ch>
References: <20190805165453.3989-1-alexandru.ardelean@analog.com>
 <20190805165453.3989-16-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190805165453.3989-16-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

On Mon, Aug 05, 2019 at 07:54:52PM +0300, Alexandru Ardelean wrote:
> This change implements retrieving all the error counters from the PHY.
> The PHY supports several error counters/stats. The `Mean Square Errors`
> status values are only valie when a link is established, and shouldn't be
> incremented. These values characterize the quality of a signal.

I think you mean accumulated, not incremented?

> 
> The rest of the error counters are self-clearing on read.
> Most of them are reports from the Frame Checker engine that the PHY has.
> 
> Not retrieving the `LPI Wake Error Count Register` here, since that is used
> by the PHY framework to check for any EEE errors. And that register is
> self-clearing when read (as per IEEE spec).
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> ---
>  drivers/net/phy/adin.c | 108 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 108 insertions(+)
> 
> diff --git a/drivers/net/phy/adin.c b/drivers/net/phy/adin.c
> index a1f3456a8504..04896547dac8 100644
> --- a/drivers/net/phy/adin.c
> +++ b/drivers/net/phy/adin.c
> @@ -103,6 +103,32 @@ static struct clause22_mmd_map clause22_mmd_map[] = {
>  	{ MDIO_MMD_PCS, MDIO_PCS_EEE_WK_ERR,	ADIN1300_LPI_WAKE_ERR_CNT_REG },
>  };
>  
> +struct adin_hw_stat {
> +	const char *string;
> +	u16 reg1;
> +	u16 reg2;
> +	bool do_not_inc;

do_not_accumulate? or reverse its meaning, clear_on_read?

   Andrew
