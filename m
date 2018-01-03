From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCHv1 2/6] net: dsa: mv88e6xxx: add 88E6240 DT compatible
Date: Wed, 3 Jan 2018 13:55:40 +0100
Message-ID: <20180103125540.GH15036@lunn.ch>
References: <20180103122609.5482-1-sebastian.reichel@collabora.co.uk>
 <20180103122609.5482-3-sebastian.reichel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180103122609.5482-3-sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Vivien Didelot <vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Ian Ray <ian.ray-JJi787mZWgc@public.gmane.org>, Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 03, 2018 at 01:26:05PM +0100, Sebastian Reichel wrote:
> Add compatible for Marvell 88E6240 switch.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/net/dsa/marvell.txt | 6 ++++--
>  drivers/net/dsa/mv88e6xxx/chip.c                      | 4 ++++
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/marvell.txt b/Documentation/devicetree/bindings/net/dsa/marvell.txt
> index 1d4d0f49c9d0..cf437b526f7f 100644
> --- a/Documentation/devicetree/bindings/net/dsa/marvell.txt
> +++ b/Documentation/devicetree/bindings/net/dsa/marvell.txt
> @@ -14,8 +14,10 @@ The properties described here are those specific to Marvell devices.
>  Additional required and optional properties can be found in dsa.txt.
>  
>  Required properties:
> -- compatible		: Should be one of "marvell,mv88e6085" or
> -			  "marvell,mv88e6190"
> +- compatible		: Should be one of the following
> + * "marvell,mv88e6085"
> + * "marvell,mv88e6190"
> + * "marvell,mv88e6240"

Hi Sebastian

This is not required. The 6240 is compatible with the 6085, so please
use "marvell,mv88e6085". We don't add compatible strings per
device. All the compatible string is used for is to find the ID
register in the device. Nothing more.

	Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
