From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] ARM: dts: sun8i-q8-common: enable bluetooth on SDIO Wi-Fi
Date: Fri, 16 Dec 2016 13:47:48 +0100
Message-ID: <20161216124748.rkvnnlo4x5onzpvk@lukather>
References: <20161213233658.atGuNCNY@smtp1h.mail.yandex.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7057722624371078287=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161213233658.atGuNCNY@smtp1h.mail.yandex.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--===============7057722624371078287==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="raogyjplz5y4bidw"
Content-Disposition: inline


--raogyjplz5y4bidw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 09, 2016 at 07:49:00PM +0800, Icenowy Zheng wrote:
>=20
> 2016=E5=B9=B412=E6=9C=889=E6=97=A5 =E4=B8=8B=E5=8D=884:07=E4=BA=8E Maxime=
 Ripard <maxime.ripard@free-electrons.com>=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Tue, Dec 06, 2016 at 04:08:38PM +0800, Icenowy Zheng wrote:=20
> > > Some SDIO Wi-Fi chips (such as RTL8703AS) have a UART bluetooth, whic=
h=20
> > > has a dedicated enable pin (PL8 in the reference design).=20
> > >=20
> > > Enable the pin in the same way as the WLAN enable pins.=20
> > >=20
> > > Tested on an A33 Q8 tablet with RTL8703AS.=20
> > >=20
> > > Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>=20
> > > ---=20
> > >=20
> > > This patch should be coupled with the uart1 node patch I send before:=
=20
> > > http://lists.infradead.org/pipermail/linux-arm-kernel/2016-December/4=
71997.html=20
> > >=20
> > > For RTL8703AS, the rtl8723bs bluetooth code is used, which can be ret=
rieve from:=20
> > > https://github.com/lwfinger/rtl8723bs_bt=20
> > >=20
> > >=C2=A0 arch/arm/boot/dts/sun8i-q8-common.dtsi | 2 +-=20
> > >=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)=20
> > >=20
> > > diff --git a/arch/arm/boot/dts/sun8i-q8-common.dtsi b/arch/arm/boot/d=
ts/sun8i-q8-common.dtsi=20
> > > index c676940..4aeb5bb 100644=20
> > > --- a/arch/arm/boot/dts/sun8i-q8-common.dtsi=20
> > > +++ b/arch/arm/boot/dts/sun8i-q8-common.dtsi=20
> > > @@ -88,7 +88,7 @@=20
> > >=C2=A0=20
> > >=C2=A0 &r_pio {=20
> > >=C2=A0 wifi_pwrseq_pin_q8: wifi_pwrseq_pin@0 {=20
> > > - pins =3D "PL6", "PL7", "PL11";=20
> > > + pins =3D "PL6", "PL7", "PL8", "PL11";=20
> > >=C2=A0 function =3D "gpio_in";=20
> > >=C2=A0 bias-pull-up;=20
> > >=C2=A0 };=20
> >
> > There's several things wrong here. The first one is that you rely=20
> > solely on the pinctrl state to maintain a reset line. This is very=20
> > fragile (especially since the GPIO pinctrl state are likely to go away=
=20
> > at some point), but it also means that if your driver wants to recover=
=20
> > from that situation at some point, it won't work.=20
> >
> > The other one is that the bluetooth and wifi chips are two devices in=
=20
> > linux, and you assign that pin to the wrong device (wifi).=20
> >
> > rfkill-gpio is made just for that, so please use it.=20
>=20
> The GPIO is not for the radio, but for the full Bluetooth part.

I know.

> If it's set to 0, then the bluetooth part will reset, and the
> hciattach will fail.

Both rfkill-gpio and rfkill-regulator will shutdown when called
(either by poking the reset pin or shutting down the regulator), so
that definitely seems like an expected behavior to put the device in
reset.

> The BSP uses this as a rfkill, and the result is that the bluetooth
> on/off switch do not work properly.

Then rfkill needs fixing, but working around it by hoping that the
core will probe an entirely different device, and enforcing a default
that the rest of the kernel might or might not change is both fragile
and wrong.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--raogyjplz5y4bidw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYU+JwAAoJEBx+YmzsjxAgrwkP/AxNGzR+GatHqHJzHC3OaY7V
NdBxT42Xv0Qfjg2h2vP+014Lk1kqU9OYljee7df7uiFKKi5DLROpwu8RcHmIdTsA
dM693VuaBwkPQPHBV078LBtnZa+v8xTG2sw0e1OPbh7Epj4PDkla409l8IEZbO0w
6uF3wi5YYT9DfDmLyjGT7Nhvg1Gw0Trbi1I7tUQMWtJTzxe1qPCeHoaSxvUQZUnS
lp+QvruVb79asrBy0e0dtKp2EmFRqOjIxIDUHGHO9quE6xp9fuOkdEWJ660hBZsV
qGpUVnZJ85lzUm/4sgJq8sELliz/tP+w2RaOuJXcCDdiGBzfp/QI5axQyZ/sCbS9
laAc3SXdUNM5Oav4egMd8HPgTpIma/jo1XcRxS9joxmpR1sPgut5V584HZzw6cJt
2ZwkWl5euKPaGvR7j4bj0YLbkUQevcz9WX9ux6kPE9plNOtHDEuOkMAqD2l5d1LO
xepCVVE0y1T1m62kPHaYlhAsfu138c6rbQ1PwZ05JbAhru/R+YAgXVXJAwhUcsWX
7Xd8TEHO6kCwqzjmfi6qCC53wvLij++cl2rZB8lGX4U94VCIn/KrO/2bOOaV9vTR
PPhdrWQwSG2+xrJH4uddnQEm3ZJTh0JlCLo1BMnmuJuQF7hec8B6scGxBwU4zdLS
00RO867AMDgY+3a0le/l
=RhRt
-----END PGP SIGNATURE-----

--raogyjplz5y4bidw--


--===============7057722624371078287==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7057722624371078287==--
