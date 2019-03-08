From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/panel: panel-simple: Support panel-dpi
Date: Fri, 8 Mar 2019 14:39:24 +0100
Message-ID: <20190308133924.GA2559@ulmo>
References: <20190307101030.3822-1-maxime.ripard@bootlin.com>
 <20190308094457.GA22655@ulmo> <20190308130148.GA21068@ravnborg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1364043088=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190308130148.GA21068@ravnborg.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org, eben@raspberrypi.org, Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org


--===============1364043088==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Content-Disposition: inline


--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 08, 2019 at 02:01:48PM +0100, Sam Ravnborg wrote:
> > One thing that's not clear to me is whether or not we want to allow
> > video timings to be specified in DT. I used to think that we didn't,
> > because the video timings are implied by the specific compatible string
> > (which we already determined is mandatory anyway),
>=20
> We often have two users of the timings for a simple panel.
> First we have the bootloader that may present something on the
> panel - next step it then the kernel.
>=20
> Bootloaders such as U-boot and barebox supports devicetree.
> So with the timings specified in the devicetree there are three
> users that can use the timings, and it is simple to share the
> timing specifications.

I think this is not true in practice. As far as I know U-Boot and Linux
don't share the device tree. So we wouldn't actually be sharing the
video timings, we'd be duplicating them. And whether we duplicate them
in code or DT isn't really all that different.

> As it is now one has to patch the kernel to add a panel to panel-simple,
> and add timing to device tree to let barebox use it.
>=20
> So it would be good once and for all to have the rules specified.
> And the preferred solution is to have timing in the devicetree
> so we can use it both in the kernel and in the bootloaders.

This is *exactly* the same argument that I've heard many times before.
And it is still overly simplistic. Video timings are just one part of
the description of the panel. In most cases you need at least also a
power sequence. You also typically want additional data like physical
dimensions of the visible area so that you can compute the DPI, etc.

The status quo of deriving all of this information from the compatible
string gives us all the flexibility that we need in order to add such
information as we find it to be necessary. If we accept video timings
to be defined in DT, people are just blindly going to use that and not
think about things like physical dimensions or power sequences. And
then we'll just end up in a situation that we can't properly fix
anymore.

=46rom that perspective the status quo is the preferred solution because
it actually allows us to fix things.

Thierry

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyCcIkACgkQ3SOs138+
s6HaOA/7BxUS71yklBIRRHtYLMyVKvrcafHhEXA57cDHaVB9lSswpyRmygU/TVxF
FivJN6+9FhkT9dkDITU2qbC++sJl8c6xYLP/LrwJqH4cZ3GFTeFi7Px/MPiNsdsV
BDEPzVDWSclbGtWk+2UhZqzMfqqllWkJJfd/I53Yc4/ljpGppxuLKcnTZnNvO9e8
JZp6ZD95it8V2Bfmj4jXdh4rX2p9po9tBy3aO7Awt3JbUtCkloZo/7GfezhyeHva
6PZulHZwHIiXDB/sbaMHWLVSF6tc2BnXtQHrR+GJjR1Efi+R21Pg84PxUNCvWvn/
T2Cq699B1F+kMTGjn9sFTN7nuQHDkkAOdgfK8FPpNC2arrWjc32DmVfERPLA6Xlh
3b2ECywa5fytJIxgQUfU2DTRvy9t4ViATOwkMsxYVMuJVpKSaHX4expy72hSxLe9
3vwm70/D3lVE4L0jX0MWZL+U9TkqhfYJsaUqtXTKqubXQ16D3Gyo7w9btGR/oOxU
dApUqJ7ekexp4ZEOyBnZ6iixQOY4O1X/g9DJ/uWtmG0u5dm4CWiR4HdIlouoKwA8
TcsqfjxKdb9MdVsmohbSMVmPBt7oHPFaS9AVGR2J6/pW4NoR6FNKdgfsPRgh6dWH
OyR+2Ff7opRW4srKUVKKYwAWGwEFryjhZCVWAOXIa/P1EmOgmeE=
=/HFn
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--

--===============1364043088==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1364043088==--
