From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RESEND] [PATCH v2 2/4] dt-bindings: Add jdi lt070me05000 panel
 bindings
Date: Wed, 24 Aug 2016 14:35:34 +0200
Message-ID: <20160824123534.GB3714@ulmo.ba.sec>
References: <1469978126-925-1-git-send-email-simhavcs@gmail.com>
 <1469978126-925-2-git-send-email-simhavcs@gmail.com>
 <20160824115639.GC3169@ulmo.ba.sec>
 <CAGWqDJ6HuoHP5ygEG-SWUhaUqOjnzTCZb=xyO_pu8xXXHnq5Aw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0901644341=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAGWqDJ6HuoHP5ygEG-SWUhaUqOjnzTCZb=xyO_pu8xXXHnq5Aw@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Vinay Simha <simhavcs@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, Archit Taneja <archit.taneja@gmail.com>
List-Id: devicetree@vger.kernel.org


--===============0901644341==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f2QGlHpHGjS2mn6Y"
Content-Disposition: inline


--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2016 at 05:53:00PM +0530, Vinay Simha wrote:
> if we do not set the polarity to 8mA, panel will have gibberish display.
> (information to set 8mA is available only in
> nexus7-msm-flo-3.4-lollipop-release_dsi kernel nx7 release)
>=20
> i will add this
> reset-gpios =3D <&tlmm_pinmux 54 GPIO_ACTIVE_LOW>;

I don't think that will work with the current driver, because the GPIO
subsystem will automatically invert the value for you. Currently the
panel driver sets the GPIO value to 0 to assert the reset. With the
GPIO_ACTIVE_LOW flag you'd end up setting the actual level of the GPIO
to high, which is going to deassert. So I think if you make the above
change (which I think is the right thing to do), you'll also have to
update the driver to use high-active logic.

Thierry

--f2QGlHpHGjS2mn6Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXvZSWAAoJEN0jrNd/PrOhHwgQAJBi/u9qCymJLCy6KkIhHuyQ
6syC+QBQYU3/Yo4cTviLjdIHOK3NqMAtKR2jgw6apGyV13YQPHN4Lwsig3M4AiIi
xw5i/lsulAC9iYQq/qVTGt6leHTrc6ogkGKpD5n9nQ+7S9DcpYaLiTyZrZ6CbB/x
ZnBQREQfRMicRGwVYur5pUudD3rX7OwZSAG83WeKJGPwyXKw8Z8RxtFDEUttesTu
EtHFb25xs3CWzG+M+Trr0nxv4i1xpnIEVms6WeEAFijHp0plsYCsJASZoT9wfF+n
aGtm2jbnRCA/u0JZUqB4zUcTyPLfKqYR8/vvG/SKIVJL0+wKUm6CtZvhPi5Ikx0Y
+ADII7CRcvh+993iy6xVN7EIUlA4dVk0yMCuvTqDag1N0HJxI6Kx6SVRdCzNTlhX
AtzV7Ug1WdqVHzzDKc4bC/jdO9wmeqRGmM+XFLlg5V62zwbE1YhCgME9ofjgwLyK
lcOjA075Hbcjqe367Meon4MvCfsB3YhPmOv/UzIh7I5KrL9m/dXWHv+w2YF7jg3r
NiB4O4+vehUIPA+iYOh671mkCCc9yBLM1thOd2nSgfVlpRDBaICcvuOqXYbwv8GE
GIRj3HqqbTuFrr4Dyrr4QQ5YBsZrEqfD05q+ewakqum9WqZHm4h/sDlRwZ+TRu87
42mineEcscHNellMYFOo
=IqXr
-----END PGP SIGNATURE-----

--f2QGlHpHGjS2mn6Y--

--===============0901644341==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0901644341==--
