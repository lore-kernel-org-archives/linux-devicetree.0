From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Fix documentation for adp1653 DT
Date: Wed, 6 Jan 2016 17:23:39 -0600
Message-ID: <20160106232339.GA2030@rob-hp-laptop>
References: <1451086636-3621-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1451086636-3621-1-git-send-email-pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Dec 26, 2015 at 12:37:16AM +0100, Pali Roh=E1r wrote:
> Property names do not match real names needed by driver itself.
> This patch fix this problem.
>=20
> Signed-off-by: Pali Roh=E1r <pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied, thanks.

Rob

> ---
>  .../devicetree/bindings/media/i2c/adp1653.txt      |    7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/adp1653.txt =
b/Documentation/devicetree/bindings/media/i2c/adp1653.txt
> index 5ce66f2..4cce0de 100644
> --- a/Documentation/devicetree/bindings/media/i2c/adp1653.txt
> +++ b/Documentation/devicetree/bindings/media/i2c/adp1653.txt
> @@ -12,12 +12,13 @@ There are two LED outputs available - flash and i=
ndicator. One LED is
>  represented by one child node, nodes need to be named "flash" and "i=
ndicator".
> =20
>  Required properties of the LED child node:
> -- max-microamp : see Documentation/devicetree/bindings/leds/common.t=
xt
> +- led-max-microamp : see Documentation/devicetree/bindings/leds/comm=
on.txt
> =20
>  Required properties of the flash LED child node:
> =20
>  - flash-max-microamp : see Documentation/devicetree/bindings/leds/co=
mmon.txt
>  - flash-timeout-us : see Documentation/devicetree/bindings/leds/comm=
on.txt
> +- led-max-microamp : see Documentation/devicetree/bindings/leds/comm=
on.txt
> =20
>  Example:
> =20
> @@ -29,9 +30,9 @@ Example:
>  		flash {
>  			flash-timeout-us =3D <500000>;
>  			flash-max-microamp =3D <320000>;
> -			max-microamp =3D <50000>;
> +			led-max-microamp =3D <50000>;
>  		};
>  		indicator {
> -			max-microamp =3D <17500>;
> +			led-max-microamp =3D <17500>;
>  		};
>  	};
> --=20
> 1.7.9.5
>=20
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
