From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 1/2] drm/bridge: dw-hdmi: support optional supply
 regulators
Date: Fri, 5 Jun 2015 14:23:14 +0200
Message-ID: <20150605122311.GA759@ulmo.nvidia.com>
References: <4184159.j0iXe39dFB@phil> <2619686.csNBBFyt8W@phil>
 <20150605110159.GA16254@ulmo.nvidia.com>
 <23123577.mOoqGCAPdL@diego>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1130402509=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <23123577.mOoqGCAPdL@diego>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, dianders@chromium.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org, Yakir Yang <ykk@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1130402509==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 05, 2015 at 02:16:40PM +0200, Heiko St=C3=BCbner wrote:
> Hi Thierry
>=20
> Am Freitag, 5. Juni 2015, 13:02:01 schrieb Thierry Reding:
> > On Mon, Mar 23, 2015 at 07:17:49PM +0100, Heiko Stuebner wrote:
> > > Hi Philipp,
> > >=20
> > > Am Donnerstag, 12. M=C3=A4rz 2015, 21:45:19 schrieb Heiko Stuebner:
> > > > At least the Rockchip variant of the dw_hdmi can have controllable =
power
> > > > supplies providing 1.0 and 1.8V. Therefore add the possibility for =
the
> > > > generic bridge driver to enable supplies provided by the hw-specific
> > > > drivers.
> > > >=20
> > > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > >=20
> > > does this look ok now?
> > >=20
> > > And as we talked about in Chemnitz, who will be taking such bridge-re=
lated
> > > changes, as you mentioned some last bridge-patches going through Thie=
rry.
> >=20
> > Sorry, I had completely missed this.
> >=20
> > > > ---
> > > > changes since v2:
> > > > - rename supplies to the names found in the hdmi IP databook
> > > > changes since v1:
> > > > - follow suggestion from Russell King to keep regulator handling lo=
cal
> > > >=20
> > > >   to the rockchip implementation for the time being and only genera=
lize
> > > >   when a real second implementation needs regulator handling
> > > > =20
> > > >  .../devicetree/bindings/drm/bridge/dw_hdmi.txt     |  5 ++++
> > > >  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        | 32
> > > >=20
> > > > +++++++++++++++++++++- 2 files changed, 36 insertions(+), 1 deletio=
n(-)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/drm/bridge/dw_hdmi.t=
xt
> > > > b/Documentation/devicetree/bindings/drm/bridge/dw_hdmi.txt index
> > > > a905c14..bb74640 100644
> > > > --- a/Documentation/devicetree/bindings/drm/bridge/dw_hdmi.txt
> > > > +++ b/Documentation/devicetree/bindings/drm/bridge/dw_hdmi.txt
> > > > @@ -22,6 +22,11 @@ Optional properties
> > > >=20
> > > >  - ddc-i2c-bus: phandle of an I2C controller used for DDC EDID prob=
ing
> > > >  - clocks, clock-names: phandle to the HDMI CEC clock, name should =
be
> > > >  "cec"
> > > >=20
> > > > +Optional supplies:
> > > > +rockchip,rk3288-dw-hdmi handles two optional power supplies:
> > > > +- vp-supply: 1.0V power supply
> > > > +- vph-supply: 1.8V power supply
> >=20
> > If this is specific to the Rockchip implementation, shouldn't this go
> > into Documentation/devicetree/bindings/video/dw_hdmi-rockchip.txt? It
> > could then simply go into the Rockchip DRM tree.
>=20
> actually, we determined that the supply names are universal to the IP (bo=
th in=20
> imx and rockchip and probably more if there are more users out there). Ju=
st=20
> Russell requested that we don't pollute the generic code until necessary,=
 as=20
> it looks like the supply of those is somehow handled internally on the im=
x.

If it's universal then there should be no need to mention the Rockchip
compatible specifically. Also, it might be better to submit this as two
separate patches, one for the binding and another for the driver.

I could extract the DT binding piece myself and apply only that, then
somebody else can apply the Rockchip change to that driver separately.

Thierry

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVcZSuAAoJEN0jrNd/PrOhyW8P/0xc6k3+Psk2VUt/IQugjP+m
QYwBZBaiQnSjFDO55ndRjC80c1LJq347zNuBMdTUsfN/O9epCsmonwEKheR72g/E
EAxJnE4xhIEuC3WO/4kZKol+z9Rsz0CB+pzRa7gIqlWTT06l+gzmskZJZmroltTg
+0j0qrl39QXI8PYPe2r9fcNkaLujxC0rVbF2x8mGK+PvUKNT/O6FZAxkBmJ4D8vl
ZkWux7JbJ4OJs1RYeil9JNPn4dMIg0RPn9KmogIymryGrQYr/zO7QXsEroYlxQOu
bN3p+Uu9wCISc34LAgpHRUS52yrATRFBJdBqU7AS36h1uyhfwEKdcBx+cTMLg7no
ngKka/oDBGzqNrqplkvweRYDx7OtferOTGlhw4Azs6CWWwxhwbAT0+uI+BSw35xQ
bzFyDnq10ECo3zPS73eN7BVQYX+mPcqs2tXRoDJYHZBx73nPKbUiqvQwDE69Q1uA
am+p5aSRgl39eHzk4OAfwSpNr7kEPnDFqDVjve2MRtknnBHe8V7RcKWJprTfaRaB
hOeDkYEZwnG0mSvOK5X7VVm7fUdEiAdEi6r7nsBwlhgyOZuDrEaUwPIgTw/tLyg7
7eWWCLsE4vz6MP9Fjgp+nSW53Pw11WXgW3OWEpnd4/N66tUNF5awtl7aWrgMRTXh
qcet2LLX8YWmap+xOp7r
=sFiZ
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--

--===============1130402509==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1130402509==--
