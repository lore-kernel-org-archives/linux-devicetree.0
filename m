From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 1/2] Documentation: Add GPIO reset binding to reset
 binding documentation
Date: Thu, 17 Apr 2014 13:58:20 +0200
Message-ID: <20140417115820.GD4132@lukather>
References: <1397463709-19405-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sfyO1m2EN8ZOtJL6"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1397463709-19405-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--sfyO1m2EN8ZOtJL6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2014 at 10:21:48AM +0200, Philipp Zabel wrote:
> This patch adds documentation clarifying the reset GPIO bindings most
> commonly in use (reset-gpios and <name>-reset-gpios properties).
>=20
> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/reset/reset.txt | 26 +++++++++++++++++=
++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/reset/reset.txt b/Document=
ation/devicetree/bindings/reset/reset.txt
> index 31db6ff..51f9e35 100644
> --- a/Documentation/devicetree/bindings/reset/reset.txt
> +++ b/Documentation/devicetree/bindings/reset/reset.txt
> @@ -2,8 +2,8 @@
> =20
>  This binding is intended to represent the hardware reset signals present
>  internally in most IC (SoC, FPGA, ...) designs. Reset signals for whole
> -standalone chips are most likely better represented as GPIOs, although t=
here
> -are likely to be exceptions to this rule.
> +standalone chips are most likely better represented as GPIOs, ideally us=
ing a
> +common scheme as described below.
> =20
>  Hardware blocks typically receive a reset signal. This signal is generat=
ed by
>  a reset provider (e.g. power management or clock module) and received by=
 a
> @@ -56,6 +56,20 @@ reset-names:	List of reset signal name strings sorted =
in the same order as
>  		the resets property. Consumers drivers will use reset-names to
>  		match reset signal names with reset specifiers.
> =20
> +=3D GPIO Reset consumers =3D
> +
> +For the common case of reset lines controlled by GPIOs, the GPIO binding
> +documented in devicetree/bindings/gpio/gpio.txt should be used:
> +
> +Required properties:
> +reset-gpios or		Reset GPIO using standard GPIO bindings,
> +<name>-reset-gpios:	optionally named to specify the reset line
> +
> +Optional properties:
> +reset-boot-asserted or		Boolean. If set, the corresponding reset is
> +<name>-reset-boot-asserted:	initially asserted and should be kept that w=
ay
> +				until released by the driver.
> +

I still feel like we should really treat gpios like just another reset
controller, ie. using the resets property.

I understand that you chose this pattern to be pretty much compatible
with what have been done so fare, bu I don't see how to fulfill that
goal completely, since most of the devices are actually using
reset-gpios, but some are using other names too (including
reset-gpio).

So if we can't be fully backward compatible, I don't see the benefit
of being inconsistent with how reset controllers are used in general,
and more globally on how gpios are tied for regulators for example.

That would also make reset-gpio a regular reset driver, instead of
adding logic to the core itself to handle this special case.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--sfyO1m2EN8ZOtJL6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTT8HcAAoJEBx+YmzsjxAgiLQP/j9xuZGuaoMU3mB0D4whEWUx
lL/oKW6JHdTC4JjeQWfedrrrnYl08Drt/Pxm4SXY4txMre4Ml540mFXSVBhnr4n5
azCzx7Q0qoTSq1/TX5ox4Yncqxz82wz8q9h3Gum78M3NwtYVEXoBGA5a3bclsBVF
Px4VRV1ku6wYjqEPla2YGFPgxCHgX9t4RGaqZKAjAiSgOQRR61vWN1bA/JmGUM0d
XgqAKnw/jIHvLLLMml+3uf+0bvRpeJeyBRi5a3i8NmpxZhuPRHhBSPaKZYzKnhGu
nPpLzsxFkxE9R2KixEqzduy23vLBhcilyzXdjXQXbN1qeETN+Ww1tKaG1F7qAkAI
AFSpyosUjJWEilFdZxThnWVbm1GTwtzdA/+bW66eVS+iZ+IObnxpcKpwAGPprW2g
tlkbDtbizErHyHVoVVutJVkzlqkXtJ+eMSFURLAypO0KFi+g2Oq+Bd33oQ1iJRAb
e74OkI93pdGwoYw9xx/180yuNaxhmjHoSmfBsAJVBqKM/OoXqEeo8V9t5n8yLrsn
+gf1wZTeF8asB7HoRgq+S2/ehY3AN3zxVipsuhifU9Askn6T5gVmk/WXCxCLdfQe
1JhjUBsc0Rwyr/SqPkIhyUCCe2M7vzjvgvjd74KQtfHVYAEqx45biPEide63tFd+
EchdN6G0fXBgOKXMoxfK
=yX4S
-----END PGP SIGNATURE-----

--sfyO1m2EN8ZOtJL6--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
