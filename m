From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 3/8] dt-bindings: gpu: mali-midgard: Add h6
 mali gpu compatible
Date: Thu, 11 Apr 2019 09:27:24 +0200
Message-ID: <20190411072724.qdhfvdhjce5sopzi@flea>
References: <20190410232543.13297-1-peron.clem@gmail.com>
 <20190410232543.13297-4-peron.clem@gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5anxqwtd6i6f45jl"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBZGYXPSQKGQERR6TPXQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190410232543.13297-4-peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--5anxqwtd6i6f45jl
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 01:25:38AM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> This add the H6 mali compatible in the dt-bindings to later support
> specific implementation.
>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/gpu/arm,mali-midgard.txt          | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt b=
/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> index 2e8bbce35695..9e71146b5c8a 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> @@ -15,6 +15,7 @@ Required properties:
>      + "arm,mali-t860"
>      + "arm,mali-t880"
>    * which must be preceded by one of the following vendor specifics:
> +    + "allwinner,sun50i-h6-mali"
>      + "amlogic,meson-gxm-mali"
>      + "rockchip,rk3288-mali"
>      + "rockchip,rk3399-mali"
> @@ -49,9 +50,14 @@ Vendor-specific bindings
>  ------------------------
>
>  The Mali GPU is integrated very differently from one SoC to
> -another. In order to accomodate those differences, you have the option
> +another. In order to accommodate those differences, you have the option
>  to specify one more vendor-specific compatible, among:
>
> +- "allwinner,sun50i-h6-mali"
> +  Required properties:
> +  - resets: Should contain phandle of :
> +    + GPU reset line
> +

And clocks, I assume?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--5anxqwtd6i6f45jl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXK7sXAAKCRDj7w1vZxhR
xeYwAQCzRx3UueQ8fazvSM1FAuqvt8wTq70tuV9mWYF6ydSh9QEAhHPEUJx55hRj
EiS/5GgnQnvrH5Y4DI5KI3VLpZAZswY=
=vQE2
-----END PGP SIGNATURE-----

--5anxqwtd6i6f45jl--
