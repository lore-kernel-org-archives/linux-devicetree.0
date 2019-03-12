From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 04/14] pinctrl: sunxi: v3: really introduce
 support for V3
Date: Tue, 12 Mar 2019 16:36:54 +0100
Message-ID: <20190312153654.25r5orlw7qjtlhbt@flea>
References: <20190312152256.35574-1-icenowy@aosc.io>
 <20190312152256.35574-5-icenowy@aosc.io>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s44e46kj3dzvjmpr"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBGNET7SAKGQEQ34NB6Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190312152256.35574-5-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--s44e46kj3dzvjmpr
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Tue, Mar 12, 2019 at 11:22:46PM +0800, Icenowy Zheng wrote:
> Introduce the GPIO pins that is only available on V3 (not on V3s) to the
> V3 pinctrl driver.
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sun8i-v3.c | 291 +++++++++++++++++++++--
>  drivers/pinctrl/sunxi/pinctrl-sunxi.h    |   2 +
>  2 files changed, 275 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-v3.c b/drivers/pinctrl/sunxi/pinctrl-sun8i-v3.c
> index 6704ce8e5e3d..54c210871a95 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun8i-v3.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-v3.c
> @@ -1,5 +1,5 @@
>  /*
> - * Allwinner V3s SoCs pinctrl driver.
> + * Allwinner V3/V3s SoCs pinctrl driver.
>   *
>   * Copyright (C) 2016 Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>   *
> @@ -23,7 +23,7 @@
>  
>  #include "pinctrl-sunxi.h"
>  
> -static const struct sunxi_desc_pin sun8i_v3s_pins[] = {
> +static const struct sunxi_desc_pin sun8i_v3_v3s_pins[] = {

I'm not sure all that remaining is worth it to be honest. It adds a
lot of noise for no particular reason (and the same goes for renaming
the file itself).

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--s44e46kj3dzvjmpr--
