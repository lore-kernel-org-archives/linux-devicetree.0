From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: imx28: add apf28 specific initialization
 (macaddr)
Date: Tue, 3 Dec 2013 16:50:32 +0800
Message-ID: <20131203085030.GJ10840@S2101-09.ap.freescale.net>
References: <1385801473-97460-1-git-send-email-gwenhael.goavec-merou@armadeus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1385801473-97460-1-git-send-email-gwenhael.goavec-merou-d2DlULPkwbNWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gwenhael Goavec-Merou <gwenhael.goavec-merou-d2DlULPkwbNWk0Htik3J/w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Nov 30, 2013 at 09:51:12AM +0100, Gwenhael Goavec-Merou wrote:
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou-d2DlULPkwbNWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm/mach-mxs/mach-mxs.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm/mach-mxs/mach-mxs.c b/arch/arm/mach-mxs/mach-mxs.c
> index 3982e12..02b17f7 100644
> --- a/arch/arm/mach-mxs/mach-mxs.c
> +++ b/arch/arm/mach-mxs/mach-mxs.c
> @@ -158,6 +158,7 @@ enum mac_oui {
>  	OUI_DENX,
>  	OUI_CRYSTALFONTZ,
>  	OUI_I2SE,

What tree are you based on?  I do not have this OUI_I2SE thing in my
tree.

Shawn

> +	OUI_ARMADEUS,
>  };
>  
>  static void __init update_fec_mac_prop(enum mac_oui oui)
> @@ -217,6 +218,11 @@ static void __init update_fec_mac_prop(enum mac_oui oui)
>  			macaddr[1] = 0x01;
>  			macaddr[2] = 0x87;
>  			break;
> +		case OUI_ARMADEUS:
> +			macaddr[0] = 0x00;
> +			macaddr[1] = 0x1e;
> +			macaddr[2] = 0xac;
> +			break;
>  		}
>  		val = ocotp[i];
>  		macaddr[3] = (val >> 16) & 0xff;
> @@ -242,6 +248,11 @@ static void __init imx28_evk_init(void)
>  	mxs_saif_clkmux_select(MXS_DIGCTL_SAIF_CLKMUX_EXTMSTR0);
>  }
>  
> +static void __init imx28_apf28_init(void)
> +{
> +	update_fec_mac_prop(OUI_ARMADEUS);
> +}
> +
>  static int apx4devkit_phy_fixup(struct phy_device *phy)
>  {
>  	phy->dev_flags |= MICREL_PHY_50MHZ_CLK;
> @@ -469,6 +480,8 @@ static void __init mxs_machine_init(void)
>  
>  	if (of_machine_is_compatible("fsl,imx28-evk"))
>  		imx28_evk_init();
> +	if (of_machine_is_compatible("armadeus,imx28-apf28"))
> +		imx28_apf28_init();
>  	else if (of_machine_is_compatible("bluegiga,apx4devkit"))
>  		apx4devkit_init();
>  	else if (of_machine_is_compatible("crystalfontz,cfa10036"))
> -- 
> 1.8.3.2
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
