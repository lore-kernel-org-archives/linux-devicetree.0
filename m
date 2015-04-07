From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v6 4/4] clk: dt: Introduce binding for always-on clock
 support
Date: Tue, 7 Apr 2015 21:17:46 +0200
Message-ID: <20150407191746.GA26727@lukather>
References: <1428432239-4114-1-git-send-email-lee.jones@linaro.org>
 <1428432239-4114-5-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1428432239-4114-5-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, mturquette@linaro.org, sboyd@codeaurora.org, devicetree@vger.kernel.org, geert@linux-m68k.org
List-Id: devicetree@vger.kernel.org


--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Lee,

On Tue, Apr 07, 2015 at 07:43:59PM +0100, Lee Jones wrote:
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  .../devicetree/bindings/clock/clock-bindings.txt   | 38 ++++++++++++++++=
++++++
>  1 file changed, 38 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b=
/Documentation/devicetree/bindings/clock/clock-bindings.txt
> index 06fc6d5..daf3323 100644
> --- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
> +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> @@ -44,6 +44,44 @@ For example:
>    clocks by index. The names should reflect the clock output signal
>    names for the device.
> =20
> +clock-always-on:    Some hardware contains bunches of clocks which must =
never be
> +		    turned off.  If drivers a) fail to obtain a reference to any
> +		    of these or b) give up a previously obtained reference
> +		    during suspend, the common clk framework will attempt to
> +		    disable them and a platform can fail irrecoverably as a
> +		    result.  Usually the only way to recover from these failures
> +		    is to reboot.
> +
> +		    To avoid either of these two scenarios from catastrophically
> +		    disabling an otherwise perfectly healthy running system,
> +		    clocks can be identified as always-on using this property
> +		    from inside a clocksource's node.

Isn't "clocksource" here way too similar to, I don't know, the
clocksource framework? Wouln't clock provider be better?

> +
> +		    This property is not to be abused.  It is only to be used to
> +		    protect platforms from being crippled by gated clocks, not
> +		    as a convenience function to avoid using the framework
> +		    correctly inside device drivers.

Disregarding what's stated here, I'm pretty sure that this will
actually happen. Where do you place the cursor?

Should we create a new driver for our RAM controller, or do we want to
use clock-always-on?

Do we really want to enforce this if we ever gain a driver that would
actually be able to manage its clock (like do we want the CPU clock to
never *ever* be gated just because we don't have a cpuidle/hotplug
driver yet?)

Have you seen the numerous NAK on such approach Mike did?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVJC1aAAoJEBx+YmzsjxAgeQcQAJLMsffAl4nbr8+coJmOD+Jg
5xABjIPaJ61vGBObWrwFwyBcyOnVCZ6jWW2uxZYOJA6fAOtxDiDknWVpZpsGNzum
xaetcviFq7khEioeenrfi6HWFiXNkwgt+wM4r4OSgfx59Y0WbfBNdNVsrZRPmfK+
yH0d71iddMXxlLtfcraLR/v6zLJxUQ3hyUGU6N0wHfMUdBxzaVW1dhWtS73GNjhb
uJGEX7G7lR1H43STqEZvT13soFuIPXB1vtLI+Bp91aNrjHwOKKw/vcl8skhrP4YT
ZfAVIexZmXxRTIxiGn5Syih3WWgObi6OSjw6tutJ5AP8yRsryefba5CTMx1Uz9jq
d/ew2G++6V6GNlBtwMAMj/FHkxwuAvyzmMNnxgCP72T4ZPDxzrHyiBHX16UmZfsB
tY0z1EPBTgZVarnXOzbCPxyjvZJpK8AdQVEjJwQoaDHME52k2VspuQghYuokbMCS
jkpVHpy1J/AmEj+6XgkAoiNcZvIwX4xyQJ/a9lewWiezMMz6UP4DMn5Gx5D8lYSe
RwNpRbZAtJV/KvqIWvni2gYUts2Z40QAem7TkuFfQtNdMqV2b8RbzZ14RhzSpn4B
AQynN+1DjH61nDGkv37VGqk0w9HyFX70RRGJrdNQKL3v1tQAGZ6hcqe/2XaH01dH
oYn2TWFqgVBxmmc0mI89
=Umc0
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--
