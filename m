From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 01/25] arm64: dts: allwinner: Switch A64
 dts(i) to use SPDX identifier
Date: Wed, 3 Jul 2019 15:28:38 +0200
Message-ID: <20190703132838.nhewz5wzsijl65s5@flea>
References: <20190703124609.21435-1-jagan@amarulasolutions.com>
 <20190703124609.21435-2-jagan@amarulasolutions.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ai23iijsoaamk652"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBCW36LUAKGQEMJICICY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190703124609.21435-2-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ai23iijsoaamk652
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Wed, Jul 03, 2019 at 06:15:45PM +0530, Jagan Teki wrote:
> Adopt the SPDX license identifier headers to ease license
> compliance management on Allwinner A64 dts(i) files.
>
> While the text specifies "of the GPL or the X11 license"
> but the actual license text matches the MIT license as
> specified at [0]
>
> [0] https://spdx.org/licenses/MIT.html
>
> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> ---
>  .../dts/allwinner/sun50i-a64-bananapi-m64.dts | 39 +------------------
>  .../dts/allwinner/sun50i-a64-nanopi-a64.dts   | 39 +------------------
>  .../dts/allwinner/sun50i-a64-olinuxino.dts    | 39 +------------------
>  .../dts/allwinner/sun50i-a64-orangepi-win.dts | 39 +------------------
>  .../dts/allwinner/sun50i-a64-pine64-plus.dts  | 39 +------------------
>  .../boot/dts/allwinner/sun50i-a64-pine64.dts  | 39 +------------------
>  .../allwinner/sun50i-a64-sopine-baseboard.dts | 39 +------------------
>  .../boot/dts/allwinner/sun50i-a64-sopine.dtsi | 39 +------------------
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 39 +------------------
>  9 files changed, 9 insertions(+), 342 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
> index 208373efee49..efdd84c362b0 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
> @@ -1,43 +1,6 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)

You say that this is a GPL2 only license

>  /*
>   * Copyright (c) 2016 ARM Ltd.
> - *
> - * This file is dual-licensed: you can use it either under the terms
> - * of the GPL or the X11 license, at your option. Note that this dual
> - * licensing only applies to this file, and not this project as a
> - * whole.
> - *
> - *  a) This library is free software; you can redistribute it and/or
> - *     modify it under the terms of the GNU General Public License as
> - *     published by the Free Software Foundation; either version 2 of the
> - *     License, or (at your option) any later version.

While this is GPL2 or later.

Also, I'm not sure why we need 25 patches to do that. Can't you just
send one (there's no even need to separate arm and arm64, since we
will do only a single PR from now as opposed to what we were doing
before).

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--ai23iijsoaamk652--
