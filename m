From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RFC v9 14/20] Documentation: dt-bindings: Add bindings
 for Himax HX8369A DRM panel driver
Date: Thu, 9 Apr 2015 09:20:26 +0200
Message-ID: <20150409072025.GB12103@ulmo>
References: <1423720903-24806-1-git-send-email-Ying.Liu@freescale.com>
 <1423720903-24806-15-git-send-email-Ying.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v9Ux+11Zm5mwPlX6"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1423720903-24806-15-git-send-email-Ying.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liu Ying <Ying.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org, stefan.wahren-eS4NqCHxEME@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--v9Ux+11Zm5mwPlX6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2015 at 02:01:37PM +0800, Liu Ying wrote:
> This patch adds device tree bindings for Himax HX8369A DRM panel driver.
>=20
> Signed-off-by: Liu Ying <Ying.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> v8->v9:
>  * Rebase onto the imx-drm/next branch of Philipp Zabel's open git reposi=
tory.
>=20
> v7->v8:
>  * None.
>=20
> v6->v7:
>  * None.
>=20
> v5->v6:
>  * None.
>=20
> v4->v5:
>  * Merge the bs[3:0]-gpios properties into one property - bs-gpios.
>    This addresses Andrzej Hajda's comment.
>=20
> v3->v4:
>  * Newly introduced in v4.  This is separated from the relevant driver pa=
tch
>    in v3 to address Stefan Wahren's comment.
>=20
>  .../devicetree/bindings/panel/himax,hx8369a.txt    | 39 ++++++++++++++++=
++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/himax,hx8369a=
=2Etxt
>=20
> diff --git a/Documentation/devicetree/bindings/panel/himax,hx8369a.txt b/=
Documentation/devicetree/bindings/panel/himax,hx8369a.txt
> new file mode 100644
> index 0000000..3a44b70
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/himax,hx8369a.txt
> @@ -0,0 +1,39 @@
> +Himax HX8369A WVGA 16.7M color TFT single chip driver with internal GRAM
> +
> +Himax HX8369A is a WVGA resolution driving controller.
> +It is designed to provide a single chip solution that combines a source
> +driver and power supply circuits to drive a TFT dot matrix LCD with
> +480RGBx864 dots at the maximum.
> +
> +The HX8369A supports several interface modes, including MPU MIPI DBI Type
> +A/B mode, MIPI DPI/DBI Type C mode, MIPI DSI video mode, MIPI DSI command
> +mode and MDDI mode. The interface mode is selected by the external hardw=
are
> +pins BS[3:0].
> +
> +Currently, only the MIPI DSI video mode is supported.

This doesn't make much sense. The binding is supposed to describe the
hardware, so saying "only video mode is supported" is weird. Perhaps if
you have no way to test other modes you could reword as:

	This version of the device tree binding only specifies MIPI DSI
	video mode.

Then again, would the device tree content be different based on the
video mode?

> +Required properties:
> +  - compatible: should be a panel's compatible string

I don't understand this. If this chip isn't a panel, why should the
compatible string contain the panel's compatible string? Is this some
kind of bridge chip that can drive different panels? I guess I'll see
when I look at the driver.

Anyway, if it isn't a panel it shouldn't have the panel's compatible
string.

> +  - reg: the virtual channel number of a DSI peripheral, as described in=
 [1]
> +  - reset-gpios: a GPIO spec for the reset pin, as described in [2]
> +
> +Optional properties:
> +  - vdd1-supply: I/O and interface power supply
> +  - vdd2-supply: analog power supply
> +  - vdd3-supply: logic power supply
> +  - dsi-vcc-supply: DSI and MDDI power supply
> +  - vpp-supply: OTP programming voltage
> +  - bs-gpios: a GPIO spec for the pins BS[3:0], as described in [2]
> +
> +[1] Documentation/devicetree/bindings/mipi/dsi/mipi-dsi-bus.txt
> +[2] Documentation/devicetree/bindings/gpio/gpio.txt
> +
> +Example:
> +	panel {
> +		compatible =3D "truly,tft480800-16-e-dsi";
> +		reg =3D <0>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_mipi_panel>;
> +		reset-gpios =3D <&gpio6 11 GPIO_ACTIVE_LOW>;
> +		bs-gpios =3D <0>, <0>, <&gpio6 14 GPIO_ACTIVE_HIGH>, <0>;
> +	};

Again this doesn't make sense. You're mixing two things here: the HIMAX
chip that is presumably a bridge and the panel connected to it.

Thierry

--v9Ux+11Zm5mwPlX6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVJig4AAoJEN0jrNd/PrOh+4EP/RkR8rV2vF6yai828m1fQT37
C8bAlZxC0kHk9emfTK7Ye8Lv7lqWrJrDsGW7B7cXLJZPkbiILLDxt4pm9US7lx1Q
Zpp231URjpAXcfQvquD2Ul7I1jGAF2+TwXLknlenBYBQupClTTeg4EjotbD0PxGR
WKA7kR0p/Mp+GnhGBc52w+t3k39ProfIo1Q6goKtBYYuFmh/N7pJ0vpRnpg52S1b
PwfepnHwkNnXwVxiHPnk4I29vEW6FCSAMEBJjTEvdVZhiHiiouyBXYir7GTNkVpC
8KwcxQyvVCA5lbxEIi748j+BkffU5Ium1h7aGp1Ho3HarZLCdGnQsOp5sbBh37Zf
IKRfnuZt1k8cJ9Nn4KVGglYwiy6bS0ocOxDaedEH/NTF6IkVoh6yKAZc3vRVIrvY
XCUcxGaRUh6w3tKzDVht8wgrWRgmRqitYP/rK7jv1RiKDHOWXbM/LbdQh8HraZ3C
56B2ASOctL1ZFa1x4BtbMVBZLx+B7I0MmBcUGDn7aUJoqOWVw1aYRXI0jUtXk8Dm
HcH6FvqKtHdbfz2HxK64Lvkn30rO98J47AMDquDg40uCQzqTGG1EF1t110RP/DH5
5N1KVJBiyHwg+CNQ4sEIFJklhcwB5YV9yhrBSNJV3oSdLdm6Hh2olLHMLNNVQJ74
VREGSaJIpwI5NxbiGUUC
=WNwu
-----END PGP SIGNATURE-----

--v9Ux+11Zm5mwPlX6--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
