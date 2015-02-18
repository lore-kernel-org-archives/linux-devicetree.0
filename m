From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v4 4/4] phy: add phy-hi6220-usb
Date: Wed, 18 Feb 2015 08:35:46 -0600
Message-ID: <20150218143546.GD3651@saruman.tx.rr.com>
References: <1423726646-30336-1-git-send-email-zhangfei.gao@linaro.org>
 <1423726646-30336-5-git-send-email-zhangfei.gao@linaro.org>
 <54E4249C.9050404@ti.com>
 <54E426B5.4070206@linaro.org>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C1iGAkRnbeBonpVg"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54E426B5.4070206@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: zhangfei <zhangfei.gao@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, balbi@ti.com, mark.rutland@arm.com, Peter Chen <peter.chen@freescale.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "dan . zhao" <dan.zhao@hisilicon.com>, Wangbinghui <wangbinghui@hisilicon.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--C1iGAkRnbeBonpVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2015 at 01:44:21PM +0800, zhangfei wrote:
> Hi, Kishon
>=20
> On 02/18/2015 01:35 PM, Kishon Vijay Abraham I wrote:
> >Hi,
> >
> >On Thursday 12 February 2015 01:07 PM, Zhangfei Gao wrote:
> >>Add usb phy controller for hi6220 platform
> >>
> >>Signed-off-by: Zhangfei Gao <zhangfei.gao@linaro.org>
> >>---
> >>  drivers/phy/Kconfig          |   9 ++
> >>  drivers/phy/Makefile         |   1 +
> >>  drivers/phy/phy-hi6220-usb.c | 306
> >>+++++++++++++++++++++++++++++++++++++++++++
> >>  3 files changed, 316 insertions(+)
> >>  create mode 100644 drivers/phy/phy-hi6220-usb.c
> >
> >why is this driver in drivers/phy when it doesn't use the generic PHY
> >framework at all?
> >
>=20
> Balbi recommended "new drivers only on drivers/phy/", including usb
> phy.

but it should use the API too. It's not only about a directory, you need
to use the new API.

> So Move drivers/usb/phy/phy-hi6220-usb.c to
> drivers/phy/phy-hi6220-usb.c, required by Balbi.

you're reading what I stated the way you like.

--=20
balbi

--C1iGAkRnbeBonpVg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU5KNCAAoJEIaOsuA1yqREuIEP/0lfGnca9Fl0sxxTUJZ3CPez
xsOgaLfX2EtrgEW02XfOX//0z3v7yS3zFFIynqng2oimaRE9QPguoYoBlVEgEZhl
+011U5uNYDI7M8Jg9jyJZUITvtSMUnLP84d5oG9wNbmd7APC5npy69MsjY5dI9WW
cHDr0625b/rCMcryVrmkJuzhBddMhscUjrPX8OZxngCTpxrcqXD277MWN9CR4l9N
16eMID/oHn48ZlPhHQHCBimQamF7jF9vGGZTfYHm2wurC7ntXJzXC+Y1vsIf8kxE
I++fyRueWKG3YGF46spUMpDAUG1tGVPxjjxvjVYAxZSzRrlPtha41x/RiLoLYiu9
MIP3UgTLXOZPn5GeW780yplKCIpZbndy5+X6eC2/wJUtWyMuHY0HGE6tAO1O9kp1
63HK3oiXG+buTV8uH5GHrlZ8hTRAJ+oGx3QE9Lr50K26AoK20DCZkla9pdAWsazX
4uMfZtzDEOH8xi8vWrL8FLqzSr4FWQnJsoGVb76eU2wmmtbVsQ/NKjm+yzM3TMjD
5Y2b8dJXZYBNQmaejkVcE99Ogyv+7840d4D1uy92JdfcUG2uZVrbnEz7EqLytdQ8
WfM7AtrYLKLFtuD57szXqDPif/EMCjXoO6YUWTkGwQ4GSVnTAsf6gou0AkK3NF9S
8CtpOsKkP5sBI2iZcH6J
=uiJX
-----END PGP SIGNATURE-----

--C1iGAkRnbeBonpVg--
