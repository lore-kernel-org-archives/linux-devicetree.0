From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH net-next 03/10] net: mscc: ocelot: get HSIO regmap from
 syscon
Date: Tue, 31 Jul 2018 09:53:29 +0200
Message-ID: <20180731075329.GP28585@piout.net>
References: <cover.aa759035f6eefdd0bb2a5ae335dab5bd5399bd46.1532954208.git-series.quentin.schulz@bootlin.com>
 <fc4e6c0effa84417bddb32b4a53c6021f0b9e546.1532954208.git-series.quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <fc4e6c0effa84417bddb32b4a53c6021f0b9e546.1532954208.git-series.quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, kishon@ti.com, andrew@lunn.ch, f.fainelli@gmail.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, allan.nielsen@microsemi.com, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org

On 30/07/2018 14:43:48+0200, Quentin Schulz wrote:
> HSIO address space was moved to a syscon, hence we need to get the
> regmap of this address space from there and no more from the device
> node.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/net/ethernet/mscc/ocelot_board.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mscc/ocelot_board.c b/drivers/net/ethernet/mscc/ocelot_board.c
> index 26bb3b1..b7d755b 100644
> --- a/drivers/net/ethernet/mscc/ocelot_board.c
> +++ b/drivers/net/ethernet/mscc/ocelot_board.c
> @@ -9,6 +9,7 @@
>  #include <linux/netdevice.h>
>  #include <linux/of_mdio.h>
>  #include <linux/of_platform.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/skbuff.h>
>  
>  #include "ocelot.h"
> @@ -162,6 +163,7 @@ static int mscc_ocelot_probe(struct platform_device *pdev)
>  	struct device_node *np = pdev->dev.of_node;
>  	struct device_node *ports, *portnp;
>  	struct ocelot *ocelot;
> +	struct regmap *hsio;
>  	u32 val;
>  
>  	struct {
> @@ -173,7 +175,6 @@ static int mscc_ocelot_probe(struct platform_device *pdev)
>  		{ QSYS, "qsys" },
>  		{ ANA, "ana" },
>  		{ QS, "qs" },
> -		{ HSIO, "hsio" },
>  	};
>  
>  	if (!np && !pdev->dev.platform_data)
> @@ -196,6 +197,14 @@ static int mscc_ocelot_probe(struct platform_device *pdev)
>  		ocelot->targets[res[i].id] = target;
>  	}
>  
> +	hsio = syscon_regmap_lookup_by_compatible("mscc,ocelot-hsio");
> +	if (IS_ERR(hsio)) {
> +		dev_err(&pdev->dev, "missing hsio syscon\n");
> +		return PTR_ERR(hsio);
> +	}
> +
> +	ocelot->targets[HSIO] = hsio;
> +
>  	err = ocelot_chip_init(ocelot);
>  	if (err)
>  		return err;
> -- 
> git-series 0.9.1

-- 
Alexandre Belloni, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
