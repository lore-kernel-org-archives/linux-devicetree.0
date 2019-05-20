From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: Add vendor prefix for VXT Ltd
Date: Mon, 20 May 2019 18:22:12 +0200
Message-ID: <20190520162212.GA22833@ulmo>
References: <20190219002706.20077-1-festevam@gmail.com>
 <20190423110336.GB23448@ulmo>
 <CAOMZO5C4YKcUGJ9wDJHQE04278Cr6ujYnYwPs-yhCyKumbruqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2056940107=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAOMZO5C4YKcUGJ9wDJHQE04278Cr6ujYnYwPs-yhCyKumbruqg@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Otavio Salvador <otavio.salvador@ossystems.com.br>, DRI mailing list <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, John Weber <john.weber@technexion.com>
List-Id: devicetree@vger.kernel.org


--===============2056940107==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 20, 2019 at 11:15:05AM -0300, Fabio Estevam wrote:
> On Tue, Apr 23, 2019 at 8:03 AM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> >
> > On Mon, Feb 18, 2019 at 09:27:04PM -0300, Fabio Estevam wrote:
> > > VXT Ltd is a manufacturer of projected capacitive touch panel
> > > and display solutions: http://www.vxt.com.tw/
> > >
> > > Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> > > ---
> > > Changes since v1:
> > > - None
> > >
> > >  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
> > >  1 file changed, 1 insertion(+)
> >
> > Applied all three patches, thanks.
>=20
> I don't see any of these patches applied in linux-next nor 5.2-rc1.
>=20
> What is the issue here?

The patch is in drm-misc-next and should show up in linux-next tomorrow.

My understanding is that somebody needs to push drm-misc-next after each
-rc1 release before drm-misc-next feeds into linux-next. Chances of that
happening between -rc1 and the linux-next release the day after are
fairly small.

Thierry

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzi1DAACgkQ3SOs138+
s6Fvjg/8CnT+tpBemRaTuPMVdtW6RcvZYnuD+AlNSXZIXEwo+ICEmdVqTC4b90yX
HxJmjc1skcQ3i4J+UJbf+E+8GrqlUllogGDo1eSkt2XaRrKYdMq5LOglISWl3slO
CHmcC2oZPYtmIutDNYJ/KrQ0s0TFFoZ3QYYTxy6F0XC5HVgXhyensfEXAFPNRpt6
anULoCzdKy3sH/mZBxG4t6pUsSMwqPnJq9kEkHu9b92inVgcB6oOPlj5hPuIGn7c
F/yA+ygUEHQEpNL6lixOL6hoEy/JvwjwbIwVF15ijYJ73SMDOVS3W3xkFuJjYcs9
R1QzyvRpE/6UZcSrOhBOeKWjtWw6wfAslfXQJoFtUw1NClWheaaFWkb2mkb0D6Yd
yXwDvP4W1uk2vfUM0ljAYsrOiWKrRXHcBHJEzwc9DDPeTh9sdYTybV0IT4yrftMc
yOcA1ZGz0Yyw+Mv8U46SLMNh7lDRQqUF2s99wbTCWN3UuKZxGXl9mqFDrvSJEKo/
JygSrYcRigcQFPNtFGjf8qqBqGzJON0icX3cvs8NQGBY7D9i4niK/KXqESr+tcHU
Dlypdd7pKF5i7dkZa45NsXXE1lYO6HI4ZQnZZL4+Csgdq6gaZ0Qxylda1hEOSPeH
QxcKrK1BTTbe7QBaSiRJqByjWNYGk1h2v8dtD7mF8AQ3LnP5oGI=
=KW7q
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--

--===============2056940107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2056940107==--
