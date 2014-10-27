From: NEO-Technologies / Julien CHAUVEAU
	<julien.chauveau-MwaZihP3oV2HdZQakrT3ElaPQRlvutdw@public.gmane.org>
Subject: Re: [PATCH v1 1/4] ARM: dts: rockchip: Add devicetree source for
 MarsBoard RK3066
Date: Mon, 27 Oct 2014 08:36:43 +0100
Message-ID: <544DF60B.4070909@neo-technologies.fr>
References: <1414329829-8031-1-git-send-email-romain.perier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414329829-8031-1-git-send-email-romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Romain,

Le 26/10/2014 14:23, Romain Perier a =E9crit :
> diff --git a/arch/arm/boot/dts/rk3066a-marsboard.dts b/arch/arm/boot/=
dts/rk3066a-marsboard.dts
> new file mode 100644
> index 0000000..d7d4cd1
> --- /dev/null
> +++ b/arch/arm/boot/dts/rk3066a-marsboard.dts
> @@ -0,0 +1,143 @@
> +/*
> + * Copyright (c) 2014 Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +/dts-v1/;
> +#include "rk3066a.dtsi"
> +
> +/ {
> +	model =3D "MarsBoard RK3066";
> +	compatible =3D "haoyuelectronics,marsboard-rk3066", "rockchip,rk306=
6a";

I think you should use "haoyu" for the vendor prefix, according to=20
Documentation/devicetree/bindings/vendor-prefixes.txt

Julien
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
