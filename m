From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: add LG LP097QX1-SPA1 panel binding
Date: Thu, 7 Jul 2016 23:57:01 +0200
Message-ID: <20160707215659.GD744@mithrandir.ba.sec>
References: <1465700010-13483-1-git-send-email-ykk@rock-chips.com>
 <20160707215523.GC744@mithrandir.ba.sec>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0686525892=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20160707215523.GC744@mithrandir.ba.sec>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Yakir Yang <ykk@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, emil.l.velikov@gmail.com, dianders@chromium.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org


--===============0686525892==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="F8dlzb82+Fcn6AgP"
Content-Disposition: inline


--F8dlzb82+Fcn6AgP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 07, 2016 at 11:55:23PM +0200, Thierry Reding wrote:
> On Sun, Jun 12, 2016 at 10:53:30AM +0800, Yakir Yang wrote:
> > The LG LP097QX1-SPA1 is an 9.7", 2048x1536 (QXGA) TFT-LCD panel
> > connected using eDP interfaces.
> >=20
> > Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> > ---
> > Changes in v3: None
> > Changes in v2:
> > - Add Rob's acked for dt-bindings of LG LP097QX1-SPA1 panel
> >=20
> >  .../devicetree/bindings/display/panel/lg,lp097qx1-spa1.txt         | 7=
 +++++++
> >  1 file changed, 7 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/lg,=
lp097qx1-spa1.txt
>=20
> Applied all six patches, though I modified 3/6 as Doug suggested.

I mean patch 4/6, of course.

Thierry

--F8dlzb82+Fcn6AgP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXftArAAoJEN0jrNd/PrOhZcUP/iQ8w9Q6o2ZsMFYv00luO1d4
j++KtnblWKFfjLuJSS2nCZtvfYq8iez+5WonkB3w5A78o/2/ctjsQyEPODADhxMK
kDPSQRIm9RzYvpY443Md7bgcElQZUQjJJ9wrm0rHpiyaZBq0WCm+tNiy6EvlkyTa
JfzwReKAezEVn4TpgQBN022VnWsio1DL/8OnLmEJaR9Wpe2m3bETzpGWjlcT9SG9
95+YvR1ZtYW1WfzvayUVgZKOJBE60tX58z/I9hwk9+g8w9G7MNVYeM5uvNUKxkOq
7QhqIABsgYMPPVNH3aPwCotiXHsoodYwY3s79cCTjraz9upz4fUjpT6YYt6TbO+i
NY2meShDyKAxXQcN4Fb/poH2jjs8Jgqc/nNwlJRvcrI6Oc7J6bOao6Vj/Q8oQ+p2
x738ftrIbi7OfK9WtOxluG5n2eaqB//x5jtJYkv78zNC60KigcSrbUgAjM1ix8zq
8pTHizMh9Acx64Pv+ejesKJ2suSvU+2rgMxR79gziu8Qy6CLtteIDD52Zj27hxEz
9Quvy7paNeD06Co1b0HhVNa/sNekRiq5aH2TvKF1SeXx2ixDPx7C97DnpQoWghv8
+7k+RHKl0DQMIAYMhdnHIgfNuoGUYmHb5oDzZ+IhK3U09gbXhyJXkgS5VBkZU4Kq
E6md+J1JPiIee9IqJeTo
=UA9a
-----END PGP SIGNATURE-----

--F8dlzb82+Fcn6AgP--

--===============0686525892==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0686525892==--
