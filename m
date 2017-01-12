From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 4/4] ARM: dts: sun8i: add OTG function to Lichee Pi Zero
Date: Thu, 12 Jan 2017 18:39:38 +0100
Message-ID: <20170112173938.5am5njwrbs6p62br@lukather>
References: <20170103152534.20118-1-icenowy@aosc.xyz>
 <20170103152534.20118-5-icenowy@aosc.xyz>
 <20170110202443.GC2479@uda0271908>
 <2733831484164533@web1g.yandex.ru>
 <20170111200811.GA16865@uda0271908>
 <20170111210638.ppdnpzdd2l6x4lyo@lukather>
 <20170112145014.GC16865@uda0271908>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8945042168784782971=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170112145014.GC16865@uda0271908>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bin Liu <b-liu@ti.com>, Icenowy Zheng <icenowy@aosc.xyz>, Chen-Yu Tsai <wens@csie.org>, Kishon Vijay Abraham I <kishon@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--===============8945042168784782971==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7er4bemecvlabxwk"
Content-Disposition: inline


--7er4bemecvlabxwk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bin,

On Thu, Jan 12, 2017 at 08:50:14AM -0600, Bin Liu wrote:
> On Wed, Jan 11, 2017 at 10:06:38PM +0100, Maxime Ripard wrote:
> > On Wed, Jan 11, 2017 at 02:08:11PM -0600, Bin Liu wrote:
> > > On Thu, Jan 12, 2017 at 03:55:33AM +0800, Icenowy Zheng wrote:
> > > >=20
> > > >=20
> > > > 11.01.2017, 04:24, "Bin Liu" <b-liu@ti.com>:
> > > > > On Tue, Jan 03, 2017 at 11:25:34PM +0800, Icenowy Zheng wrote:
> > > > >> =A0Lichee Pi Zero features a USB OTG port.
> > > > >>
> > > > >> =A0Add support for it.
> > > > >>
> > > > >> =A0Note: in order to use the Host mode, the board must be powere=
d via the
> > > > >> =A0+5V and GND pins.
> > > > >>
> > > > >> =A0Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> > > > >> =A0---
> > > > >> =A0=A0arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts | 10 +++++++=
+++
> > > > >> =A0=A01 file changed, 10 insertions(+)
> > > > >>
> > > > >> =A0diff --git a/arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts b/=
arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts
> > > > >> =A0index 0099affc6ce3..3d9168cbaeca 100644
> > > > >> =A0--- a/arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts
> > > > >> =A0+++ b/arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts
> > > > >> =A0@@ -71,3 +71,13 @@
> > > > >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pinctrl-names =3D "default";
> > > > >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0status =3D "okay";
> > > > >> =A0=A0};
> > > > >> =A0+
> > > > >> =A0+&usb_otg {
> > > > >> =A0+ dr_mode =3D "otg";
> > > > >
> > > > > Why not set this default mode in dtsi instead?
> > > > >
> > > > > Regards,
> > > > > -Bin.
> > > >=20
> > > > There's possibly boards which do not have OTG functions.
> > >=20
> > > That is board specific.
> >=20
> > Exactly, and this is why it should be done in the board DT.
>=20
> I am just suggesting based on the common practice. If a .dtsi exists for
> a family, the .dtsi describes the device and common properties for all
> possible boards, and each board .dts adds or overrides its specific
> implementation. Kernel has many devices/boards done in this way - define
> the default dr_mode in .dtsi.
>=20
> In this case, I suggest to set the common dr_mode in .dtsi, then each
> board .dts only overrides it if the implementation is different.=20
>=20
> >=20
> > The controller in the Allwinner SoCs do not handle directly the ID pin
> > and VBUS, but rather rely on a GPIO to do so.
> >=20
> > So boards with OTG will need setup anyway, at least to tell which
> > GPIOs are used. There's no point in enforcing a default if it doesn't
> > work by default.
>=20
> Then define a default which supposes to work for most boards.
>=20
> Why I suggest this, is because defining a default dr_mode which works
> for most cases in dtsi could prevent a little surprise in MUSB function.
> If someone designs a new board but forgets to define dr_mode in the new
> board DT, the MUSB driver will default to org mode, which might not be
> intended.

The point is that there is no sensible default. Some boards don't have
an ID pin and no VBUS (peripheral), some don't have an ID pin but VBUS
(host), and some have an ID pin but no controllable VBUS, some have an
ID pin and a controllable VBUS, but we have no idea which GPIOs are
used.

There's no way we can have something that works on most cases.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--7er4bemecvlabxwk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYd79VAAoJEBx+YmzsjxAgOHUP/2t2LgtDsGcBkG724GG+YQ+U
viSvw6NsVYHjVs0+EcrwaO8kBBFoH48QxkCb61kwpyMCsshquQePnp2nulhz9FW9
/G/MQLHrdAQTqZc899t9jISEshAWPVlXkekqYk2bwZsjm5553eG87KNYYQSh4Wuv
Ch7l56d4b3xM/LDVtHtkq6r4lvbPNTe7SLzITdFZDgeogBJzZdOaru+cLEEoi4rg
Vi+m6dXi5CoZoYuHPdrYFAx7TTcJwPLKunB338PFYgBV+GsBsTYGjfwTPzmV5sT5
/gYhneu2O4GqFA7mxii65pLzRE83KxfoGG+UO38ymhCFtk71cfh1iCdBRT/A7NxL
Zu2XZv3TcYRXwY/n/vGxMgQwggRPuuFfuZGTvbLz3OBp3F5H/0GQhGUc1LD6SVnF
RV6JHX875m7OflT3iB9SWLfMpXWbXJpr8Xvzu7dsDFlthsZCULR2i2WxUGeG3l21
U8N5RUqqjSkdoGCYOqrw2BPySZZuelfppq5eL7UR8zmCVoRmxI5Au5dxEyFXNGox
7Sj4kv33WBUv+yB4sa5fAAWuq/D5U8vVGwZYA+oP7u1HRl92K3D7qjTOTUEkZ35V
xUD1B8WB4M9Bt4x0saMNhDZE4LtDJDqTBqs+vqPgJLmSYaqmaAsXSY4C2lMKKZ8g
LheEhnhawHGtPfxS4sz/
=05Iv
-----END PGP SIGNATURE-----

--7er4bemecvlabxwk--


--===============8945042168784782971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8945042168784782971==--
