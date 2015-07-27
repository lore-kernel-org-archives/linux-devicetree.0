From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v7 5/5] clk: dt: Introduce binding for critical clock
 support
Date: Mon, 27 Jul 2015 09:10:13 +0200
Message-ID: <20150727071013.GO2564@lukather>
References: <1437570255-21049-1-git-send-email-lee.jones@linaro.org>
 <1437570255-21049-6-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vNrHrykRFvLVX6W3"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1437570255-21049-6-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, mturquette@linaro.org, sboyd@codeaurora.org, devicetree@vger.kernel.org, geert@linux-m68k.org, s.hauer@pengutronix.de
List-Id: devicetree@vger.kernel.org


--vNrHrykRFvLVX6W3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Lee,

On Wed, Jul 22, 2015 at 02:04:15PM +0100, Lee Jones wrote:
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  .../devicetree/bindings/clock/clock-bindings.txt   | 39 ++++++++++++++++=
++++++
>  1 file changed, 39 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b=
/Documentation/devicetree/bindings/clock/clock-bindings.txt
> index 06fc6d5..4137034 100644
> --- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
> +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> @@ -44,6 +44,45 @@ For example:
>    clocks by index. The names should reflect the clock output signal
>    names for the device.
> =20
> +critical-clock:	Some hardware contains bunches of clocks which, in normal
> +		circumstances, must never be turned off.  If drivers a) fail to
> +		obtain a reference to any of these or b) give up a previously
> +		obtained reference during suspend, it is possible that some
> +		Operating Systems might attempt to disable them to save power.
> +		If this happens a platform can fail irrecoverably as a result.
> +		Usually the only way to recover from these failures is to
> +		reboot.
> +
> +		To avoid either of these two scenarios from catastrophically
> +		disabling an otherwise perfectly healthy running system,
> +		clocks can be identified as 'critical' using this property from
> +		inside a clocksource's node.
> +
> +		This property is not to be abused.  It is only to be used to
> +		protect platforms from being crippled by gated clocks, NOT as a
> +		convenience function to avoid using the framework correctly
> +		inside device drivers.
> +
> +		Expected values are hardware clock indices.  If the
> +		clock-indices property (see below) is used, then supplied
> +		values must correspond to one of the listed identifiers.
> +		Using the clock-indices example below, hardware clock <2>
> +		is missing, therefore it is considered invalid to then
> +		list clock <2> as a critical clock.

I think we should also consider having it simply as a boolean. Using
indices for clocks that don't have any (for example because it only
provides a single clock) seem to not really make much sense.

Also, since you can have a bunch of them, using critical-clocks seem
more appropriate.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--vNrHrykRFvLVX6W3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVtdlVAAoJEBx+YmzsjxAgoGYP/1dayeBYiTB9SkuBAt0ARSG4
h1Hr2h2nGUTqK8Dy43L3rZUN685yg1bl1iC7n51GaHwz/t3H0SCmKVsqry6OfWCg
s0MlKY7D3K16zC6zHTnv4HvuIeJqF76reoQRUwwrk0rW0aEo4m0srnej5XWB8TG/
AR+n30VTzFGT6qKejyu4KPigvwKNnNvWbS6K3ycLD+5Vo+P9qUcPV2ZqS67dxyQd
3iCj7XZX4pkGixUZdO/OuqZuQMa/7ulA7CEsWoq8qrpy2RCKGGKnZxrTXo6l6zdA
9H9JQTMRnbD0aqz2UhxV9GpfZn78W4qZud18GBFE8ab7rTnxxcHM/VM60HpNa5AH
sYixRLbjijveGWjvINXpDYDM8DXQBBflYPs1kg5xqqimDx2EVSVoPd7NZkcHAvG4
HuqW5Kmi53XpNQyeBxeV2mhnFcEq7xqv4B2kZ0UOQhYC/ehd61YDKfLqC7dhS9KK
mdYIgySRrVnn5edrzIH+SXSXq+bgOn7X7U1igDrYHRg+jGkBzfT8xUR+eBMEqotv
VFNiAot5JSNUFyQJhnmpTIroUbnVC1HRNhoUB4ho4vJtwj3ErD6ZRP5s/HbOCoTM
eNPTVMa+Bkk4JDE2/vhqxz5LXDs77x9v8xzKztkxDTbfBMSuDD1Ru8aQ6otG9bjr
HqmdR25OM08qk+3dZH/F
=wjtS
-----END PGP SIGNATURE-----

--vNrHrykRFvLVX6W3--
