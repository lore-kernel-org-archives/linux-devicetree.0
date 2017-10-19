From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] drm: panel: simple: add Toshiba LT089AC19000
Date: Thu, 19 Oct 2017 10:32:53 +0200
Message-ID: <20171019083253.GB9005@ulmo>
References: <20171018172240.8772-1-l.stach@pengutronix.de>
 <20171019081757.GB4459@ulmo>
 <1508401639.11773.5.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0302715026=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1508401639.11773.5.camel@pengutronix.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Lucas Stach <l.stach@pengutronix.de>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de
List-Id: devicetree@vger.kernel.org


--===============0302715026==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xXmbgvnjoT4axfJE"
Content-Disposition: inline


--xXmbgvnjoT4axfJE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2017 at 10:27:19AM +0200, Lucas Stach wrote:
> Am Donnerstag, den 19.10.2017, 10:17 +0200 schrieb Thierry Reding:
> > On Wed, Oct 18, 2017 at 07:22:40PM +0200, Lucas Stach wrote:
> > > Only exposes a single mode and not a complete display timing, as
> > > the datasheet is rather vague about the minimum/maximum values.
> > >=20
> > > > > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > > > > Acked-by: Rob Herring <robh@kernel.org>
> > > ---
> > > v2:
> > > - fix display size in documentation
> > > - add bus flags
> > > ---
> > > =C2=A0.../display/panel/toshiba,lt089ac29000.txt=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A08 +++++++
> > > =C2=A0drivers/gpu/drm/panel/panel-simple.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 27 +++++++=
+++++++++++++++
> > > =C2=A02 files changed, 35 insertions(+)
> > > =C2=A0create mode 100644 Documentation/devicetree/bindings/display/pa=
nel/toshiba,lt089ac29000.txt
> >=20
> > Separate patches are preferred for bindings and driver.
>=20
> This is news to me. At least in simple-panel land, I've always only
> split out additions of new vendor prefixes and kept the bindings
> together with the driver.
>=20
> I'll change that in the future if you prefer otherwise.

I don't mind too much either way, but I've seen Rob say he prefers
separate patches. I guess ultimately that makes it easier to move the DT
bindings outside of the kernel tree, but maybe there are other reasons,
too.

Rob, care to educate us?

Thierry

--xXmbgvnjoT4axfJE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnoYzUACgkQ3SOs138+
s6HczQ/9FIBZuArXP6afB0HAk4BPNESmLyVxtexybO9mWxOQvKD01Gge245q8yWc
JX/jWzYYYFdRwFR3Pvlop8E9DQpjCOv3WvTYhsWCNPiJyyCNR9sWNyYsauvPFVgJ
8SgNWdU88DqL585j6vDJCxWs84HoQnLTBv8HN8pqOFqTBbnaNsAlxyP+pa7gdu+O
04ScgiBT+VFMTyuLzhSd/QUzaMlXGctlbk8+lg79N4fyA9j4HP1Xjam4TE6aVTB7
7uAdYR+r8Fg1u8WmTBxX2xXd+sonDoL0r3cexbtKUbohiWYuSiduxDX4+dF0sbSm
kjBLOcblRXHeLlWoXd6jY1GOJuuXHirwpg0LeuRkNzE/7Cl+C0k1iQ8I+y/YqaJt
5/MByYptmpWpcytqw6m4Gwl+/fK2k//+69ofH4fJKPwDdu9iUNf1fDYEBCcRnoIf
+TdLU6juz2dLfDxxUd4mY56/xB/Dzq8QgYIllonUligRKIANnQyUER9tfhPy0TeL
hN1qb5fcly4Oh4O9axDP46kCmAy+HvWceBUp4+cQ34zEc+Lfd1ZeWkWAGDC8CGzW
bLJhvdR0gBe6AshMN1XO+kJUi0diSCR3GNnNSFQqprSu5s3LqfzV3bRh954uCe4v
SsotrPsvxZ51RtZjCadI/hjmVj0EE0q+aeLInrjdhVqv4S2+TXo=
=6eCh
-----END PGP SIGNATURE-----

--xXmbgvnjoT4axfJE--

--===============0302715026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0302715026==--
