From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/3] phy-sun4i-usb: Add a sunxi specific
 function for setting squelch-detect
Date: Fri, 8 May 2015 11:06:36 -0500
Message-ID: <20150508160636.GD16571@saruman.tx.rr.com>
References: <1427626248-6257-1-git-send-email-hdegoede@redhat.com>
 <1427626248-6257-2-git-send-email-hdegoede@redhat.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VMt1DrMGOVs3KQwf"
Return-path: <linux-sunxi+bncBC5M7T4HYEKRB656WOVAKGQEILNC4CI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1427626248-6257-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--VMt1DrMGOVs3KQwf
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Sun, Mar 29, 2015 at 12:50:46PM +0200, Hans de Goede wrote:
> The sunxi otg phy has a bug where it wrongly detects a high speed squelch
> when reset on the root port gets de-asserted with a lo-speed device.
> 
> The workaround for this is to disable squelch detect before de-asserting
> reset, and re-enabling it after the reset de-assert is done. Add a sunxi
> specific phy function to allow the sunxi-musb glue to do this.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/phy/phy-sun4i-usb.c       |  9 +++++++++
>  include/linux/phy/phy-sun4i-usb.h | 26 ++++++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 include/linux/phy/phy-sun4i-usb.h
> 
> diff --git a/drivers/phy/phy-sun4i-usb.c b/drivers/phy/phy-sun4i-usb.c
> index 221e8ab..01eb08d 100644
> --- a/drivers/phy/phy-sun4i-usb.c
> +++ b/drivers/phy/phy-sun4i-usb.c
> @@ -33,6 +33,7 @@
>  #include <linux/of_address.h>
>  #include <linux/of_gpio.h>
>  #include <linux/phy/phy.h>
> +#include <linux/phy/phy-sun4i-usb.h>
>  #include <linux/platform_device.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
> @@ -75,6 +76,7 @@
>  #define PHY_OTG_FUNC_EN			0x28
>  #define PHY_VBUS_DET_EN			0x29
>  #define PHY_DISCON_TH_SEL		0x2a
> +#define PHY_SQUELCH_DETECT		0x3c  
>  
>  #define MAX_PHYS			3
>  
> @@ -322,6 +324,13 @@ static int sun4i_usb_phy_power_off(struct phy *_phy)
>  	return 0;
>  }
>  
> +void sun4i_usb_phy_set_squelch_detect(struct phy *_phy, bool enabled)
> +{
> +	struct sun4i_usb_phy *phy = phy_get_drvdata(_phy);
> +
> +	sun4i_usb_phy_write(phy, PHY_SQUELCH_DETECT, enabled ? 0 : 2, 2);
> +}
> +
>  static struct phy_ops sun4i_usb_phy_ops = {
>  	.init		= sun4i_usb_phy_init,
>  	.exit		= sun4i_usb_phy_exit,
> diff --git a/include/linux/phy/phy-sun4i-usb.h b/include/linux/phy/phy-sun4i-usb.h
> new file mode 100644
> index 0000000..50aed92
> --- /dev/null
> +++ b/include/linux/phy/phy-sun4i-usb.h
> @@ -0,0 +1,26 @@
> +/*
> + * Copyright (c) 2015 Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 and
> + * only version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef PHY_SUN4I_USB_H_
> +#define PHY_SUN4I_USB_H_
> +
> +#include "phy.h"
> +
> +/**
> + * sun4i_usb_phy_set_squelch_detect() - Enable/disable squelch detect
> + * @phy: reference to a sun4i usb phy
> + * @enabled: wether to enable or disable squelch detect
> + */
> +void sun4i_usb_phy_set_squelch_detect(struct phy *phy, bool enabled);

breaks build if MUSB=y and SUN41_PHY=m

-- 
balbi
--VMt1DrMGOVs3KQwf--
