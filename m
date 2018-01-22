From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCHv4 1/5] net: dsa: Support internal phy on 'cpu' port
Date: Mon, 22 Jan 2018 12:25:52 -0800
Message-ID: <09a9c406-85c1-0f84-4032-db243f825ca2@gmail.com>
References: <20180116101958.19711-1-sebastian.reichel@collabora.co.uk>
 <20180116101958.19711-2-sebastian.reichel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180116101958.19711-2-sebastian.reichel@collabora.co.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: Ian Ray <ian.ray@ge.com>, Nandor Han <nandor.han@ge.com>, Rob Herring <robh+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/16/2018 02:19 AM, Sebastian Reichel wrote:
> This adds support for enabling the internal PHY for a 'cpu' port.
> It has been tested on GE B850v3,  B650v3 and B450v3, which have a
> built-in MV88E6240 switch hardwired to a PCIe based network card
> making use of the internal PHY. Since mv88e6xxx driver resets the
> chip during probe, the PHY is disabled without this patch resulting
> in missing link and non-functional switch device.

Apologies for the late review, the code is fine, but there is room for
improvement, see below:

> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>> ---
>  net/dsa/dsa2.c     | 25 +++++++++++++++++++------
>  net/dsa/dsa_priv.h |  1 +
>  net/dsa/port.c     | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 69 insertions(+), 6 deletions(-)
> 
> diff --git a/net/dsa/dsa2.c b/net/dsa/dsa2.c
> index 1e287420ff49..f65938d10b6d 100644
> --- a/net/dsa/dsa2.c
> +++ b/net/dsa/dsa2.c
> @@ -18,6 +18,7 @@
>  #include <linux/rtnetlink.h>
>  #include <linux/of.h>
>  #include <linux/of_net.h>
> +#include <linux/of_mdio.h>
>  
>  #include "dsa_priv.h"
>  
> @@ -271,11 +272,20 @@ static int dsa_port_setup(struct dsa_port *dp)
>  		break;
>  	case DSA_PORT_TYPE_CPU:
>  	case DSA_PORT_TYPE_DSA:
> -		err = dsa_port_fixed_link_register_of(dp);
> -		if (err) {
> -			dev_err(ds->dev, "failed to register fixed link for port %d.%d\n",
> -				ds->index, dp->index);
> -			return err;
> +		if (of_phy_is_fixed_link(dp->dn)) {
> +			err = dsa_port_fixed_link_register_of(dp);

This function does exactly the same check you are adding, which
indicates that you should create a common function, e.g:
dsa_port_setup_link_of() which internally does check whether the PHY is
fixed or not and does the registration.

> +			if (err) {
> +				dev_err(ds->dev, "failed to register fixed link for port %d.%d\n",
> +					ds->index, dp->index);
> +				return err;
> +			}
> +		} else {
> +			err = dsa_port_setup_phy_of(dp, true);
> +			if (err) {
> +				dev_err(ds->dev, "failed to enable phy for port %d.%d\n",
> +					ds->index, dp->index);
> +				return err;
> +			}
>  		}
>  
>  		break;
> @@ -301,7 +311,10 @@ static void dsa_port_teardown(struct dsa_port *dp)
>  		break;
>  	case DSA_PORT_TYPE_CPU:
>  	case DSA_PORT_TYPE_DSA:
> -		dsa_port_fixed_link_unregister_of(dp);
> +		if (of_phy_is_fixed_link(dp->dn))
> +			dsa_port_fixed_link_unregister_of(dp);
> +		else
> +			dsa_port_setup_phy_of(dp, false);

Likewise, please rename dsa_port_fixed_link_unregister_of() into e.g:
dsa_port_teardown_link_of() and take care of the two cases.

The rest of the changes do look okay to me.

Note: there is still technically a misreprentation of how the PHY is
"attached" to the network device. In your DTSes, you have to have the
CPU port have a "phy-handle" to the internal PHY, while technically it
should be the i210 which has a "phy-handle" property to that PHY, and
even better, if the e1000e/idb drivers were PHYLIB capable, they could
manage it directly.

Since this is a link, which has two ends, it is probably acceptable to
make that shortcut with lack of a better solution.
-- 
Florian
