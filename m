From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 03/19] clk: sunxi: Add TCON channel0 clock
Date: Fri, 6 Nov 2015 14:11:22 -0800
Message-ID: <20151106221122.GL6114@lukather>
References: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
 <1446214865-3972-4-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v66hjH_GpkXpHdpCM+mUv-CgvqxJNFzsoRJ5MWp04b+jew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s7VmGO2m7mcnuX8Q"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v66hjH_GpkXpHdpCM+mUv-CgvqxJNFzsoRJ5MWp04b+jew@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-sunxi <linux-sunxi@googlegroups.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, Alexander Kaplan <alex@nextthing.co>, Wynter Woods <wynter@nextthing.co>, Boris Brezillon <boris.brezillon@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
List-Id: devicetree@vger.kernel.org


--s7VmGO2m7mcnuX8Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Oct 31, 2015 at 06:19:59PM +0800, Chen-Yu Tsai wrote:
> > +#define SUN4I_A10_TCON_CH0_RESET_SHIFT 29
>=20
> This is sun5i specific.
>=20
> A10s manual says bit 30 is the LCD reset, while bit 29 is the TV
> encoder reset.  A13/R8 don't mention TCON_CH0 clock. A10/A20 have no
> separate TV encoder reset.
>=20
> Please rename the clock.

This thing with the A10s is odd, the channel 0 is only used for the
LCD interface, and not the tv encoder (and both the A13 and R8 do have
a TCON).

But you're right, I've fixed it.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--s7VmGO2m7mcnuX8Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWPSWKAAoJEBx+YmzsjxAgfm8QAJNENjHOYLm8syjYmaydlF16
QBQ4JZN1RBE3STh6eR37n8lysOsMl05pFxUKRCWAL2JtKiN4etU/oHI4UibGEXvS
KJnDHTa0eF0HWUbahcj9nbGLhIUmb9bhJ58ttt5JuWtiQUjlTZ4mYRY9wjZj9usR
g5zy4RVG4cD8JLwGwmdsVRt3nmJNvxa+7krP+PPLdV9KC+YqW9hq+XrvibvxHv7Z
8xQgM2AG3YfT50GEkgkH2jSw5RETIp+5ttlZF7Fw6xxamvfKBBgc8N8wHRmFFEIF
5K+L2bvN/0AKsrtKdfiuJlXQ9GfRCUL8t9cbLlHQQW5SiYF0gY+K/pblHBF8SBTR
+hZcOk0FsXIlPEyx6WSncNixGxh/mcwJzr+SpLc4hsaDW2otwsvonB5RVxf1izOi
qMDSpUg3/6m1i6Y0NmYUy35WcJUjNe7HIAh6Fejgpwk+eZ9LXdDb5nb6Jc38m9fK
06Z44VMwOA4Tz+FW29smF5DwMVd1VJ01jVXzzmgLPga2pU/R3vFqQFBAOAmCsmsZ
qx72InSwzOfeL+ceU+VywRF59Vy6X95pWylyH0BHozvQZHjJK8FZshFcd5zyIUbC
kuZY1NbN7AWEQMiBp/Pj5gvzrJDVEXHg1GY1Q9Hp7BAtUt/mzJNVp48B3Mguj2P6
Rm+QXx4eWpKx2hBBOani
=of0s
-----END PGP SIGNATURE-----

--s7VmGO2m7mcnuX8Q--
