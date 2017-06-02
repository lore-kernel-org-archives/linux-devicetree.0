From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 02/19] drm/sun4i: add components in two passes with
 encoders added in second pass
Date: Fri, 2 Jun 2017 21:18:47 +0200
Message-ID: <20170602191847.6wuz2pthqtc44xxb@flea.lan>
References: <20170602101024.18940-1-wens@csie.org>
 <20170602101024.18940-3-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="jsz7dexgmjhyp7va"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170602101024.18940-3-wens@csie.org>
Sender: linux-clk-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--jsz7dexgmjhyp7va
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 02, 2017 at 06:10:07PM +0800, Chen-Yu Tsai wrote:
> The encoder drivers use drm_of_find_possible_crtcs to get upstream
> crtcs from the device tree using of_graph. For the results to be
> correct, encoders must be probed/bound after _all_ crtcs have been
> created. The existing code uses a depth first recursive traversal
> of the of_graph, which means the encoders downstream of the TCON
> get add right after the first TCON. The second TCON or CRTC will
> never be properly associated with encoders connected to it.
>=20
> Other platforms, such as Rockchip, deal with this by probing all
> crtcs first, then all subsequent components. This is easy to do
> since the crtcs correspond to just one device node, and are the
> first nodes in the pipeline.
>=20
> However with Allwinner SoCs, the function of the CRTC is split between
> the display backend (DE 1.0) or mixer (DE 2.0), which does scan-out
> and compositing, and the TCON, which generating the display timing
> signals. Further complicating the process, there may be a Dynamic Range
> Controller between the backend and the TCON. Also, the backend is
> preceded by the frontend, with a Display Enhancement Unit possibly
> in between.
>=20
> One solution would be, instead of a depth first traversal of the
> component of_graph, we do a breadth first traversal, so that components
> at the same depth are grouped together. This however requires us to
> implement extra code for a queue structure that is only used here.
>=20
> Instead, since we can identify TCON device nodes, and since the
> component system can gracefully deal with duplicate entries, we can add
> components in two passes, using the existing recursive depth code. The
> first pass stops right after the TCON is added. The second pass will
> re-add all components up to the TCON, but these will be skipped since
> they will have already been bound with the entries from the first pass.
> The encoders added in the second pass will be the last entries in the
> list.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

This commit log is great. So great actually that it should be a
comment in the code ;)

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--jsz7dexgmjhyp7va
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZMboXAAoJEBx+YmzsjxAgqSEP/11tZUrN/BZ9+oTiMsSWDaJB
+biwzLq02fKdOigBcF5y9bSaIRRaPz+l5nFXE6iFmm3KLzFUF/HXXHjdnDGGtF6I
dfaEu9xmb24ApYrT4h0zTw8+tSGb3mDrKqYKc6m9a4Hfu5qaMA2ymcc13X6AR7h1
gOMRElVhsSmSVAw4Lxd5nfYrWmx8pRgaFjAREKdY/QeT3nNQZdo12sXansUa8nYl
9o9Y8w55IyWtcWK64nqFt/REF2w6FZbT1214n55Bk9yb40LpKmZnPpuwl4JScgKK
DrKkc8UsP3TWCfi5WYlVB5Jyms74ku2pUNMQuR5hPRzy7n4d4OFap1hAN4G25gWM
+DKch6xGwX74MsNhkOEReSlQ34Y3qL4CROZ8mdOq6JX0OqUUgq6oYD0a0FnCzjrF
QE/k0kH6H8MMX6ILol5Oxdv9OqCGjXAkMY+onsyuDtfb1sdM1sq2m1NVZPk0uilO
6kpw8LgGPIkJmLmkxn8D9pNGjpulCJDWl/zGxgaXAJnVcX/dkof2TE6dLzPG8LHg
rRhuda/2VCwkB+TIjhL0uutxKb+OULsbUSbWNmGT4Z6A+awjr+BEpmdQTrxL/Y/1
UdnSq1p+q1znuP0b6JKwxioPteQu9MxxawMjNoa/0Xo7wbNNBgHRuyV1IZnlCKB+
KkFjPTuvZ3mmUkvxhiwv
=JZct
-----END PGP SIGNATURE-----

--jsz7dexgmjhyp7va--
