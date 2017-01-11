From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 4/4] ARM: dts: sun8i: add OTG function to Lichee Pi Zero
Date: Wed, 11 Jan 2017 22:06:38 +0100
Message-ID: <20170111210638.ppdnpzdd2l6x4lyo@lukather>
References: <20170103152534.20118-1-icenowy@aosc.xyz>
 <20170103152534.20118-5-icenowy@aosc.xyz>
 <20170110202443.GC2479@uda0271908>
 <2733831484164533@web1g.yandex.ru>
 <20170111200811.GA16865@uda0271908>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4334217677042734714=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170111200811.GA16865@uda0271908>
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


--===============4334217677042734714==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4qqvmbs5ksy4vwmu"
Content-Disposition: inline


--4qqvmbs5ksy4vwmu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 11, 2017 at 02:08:11PM -0600, Bin Liu wrote:
> On Thu, Jan 12, 2017 at 03:55:33AM +0800, Icenowy Zheng wrote:
> >=20
> >=20
> > 11.01.2017, 04:24, "Bin Liu" <b-liu@ti.com>:
> > > On Tue, Jan 03, 2017 at 11:25:34PM +0800, Icenowy Zheng wrote:
> > >> =A0Lichee Pi Zero features a USB OTG port.
> > >>
> > >> =A0Add support for it.
> > >>
> > >> =A0Note: in order to use the Host mode, the board must be powered vi=
a the
> > >> =A0+5V and GND pins.
> > >>
> > >> =A0Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> > >> =A0---
> > >> =A0=A0arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts | 10 ++++++++++
> > >> =A0=A01 file changed, 10 insertions(+)
> > >>
> > >> =A0diff --git a/arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts b/arch=
/arm/boot/dts/sun8i-v3s-licheepi-zero.dts
> > >> =A0index 0099affc6ce3..3d9168cbaeca 100644
> > >> =A0--- a/arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts
> > >> =A0+++ b/arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts
> > >> =A0@@ -71,3 +71,13 @@
> > >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pinctrl-names =3D "default";
> > >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0status =3D "okay";
> > >> =A0=A0};
> > >> =A0+
> > >> =A0+&usb_otg {
> > >> =A0+ dr_mode =3D "otg";
> > >
> > > Why not set this default mode in dtsi instead?
> > >
> > > Regards,
> > > -Bin.
> >=20
> > There's possibly boards which do not have OTG functions.
>=20
> That is board specific.

Exactly, and this is why it should be done in the board DT.

The controller in the Allwinner SoCs do not handle directly the ID pin
and VBUS, but rather rely on a GPIO to do so.

So boards with OTG will need setup anyway, at least to tell which
GPIOs are used. There's no point in enforcing a default if it doesn't
work by default.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--4qqvmbs5ksy4vwmu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYdp5aAAoJEBx+YmzsjxAghe8P/jGvrtjMMAfeLNMofkVHD7DE
8F2xoO2Msoe4zoN0wtjA7Kn+qPfEXQHBQ+HPquZRRDnfnxINGAhsqYdoflTuq8k+
PF2VKUOJm7IFKDGpWAW9Up8bHnHhpAgP8E/GNGU/yTIGUmtJBT/9M7xZNArDo/os
CiGb62xTaOPaqcQjM0xfTB17yTwKfWaLFL3yBtXtqfbRLUAujjauY9T4b7FL9Q9z
NZsvS5fdIb543UH47At/DLpnFNXXfIg3ZQznOXQnd+R8C8jeS1doORkbFXJYl8k/
UlBfEaiopNCSXb4frvP1xKr+3pB73MBladefAh6+xdS2eXKrP7smS/A+71NgQID8
ZqP9RjoFZH5n7KMTONuE+zA6b3vJSA5hvr/WNz36B+EqdtJAGKzlEK5iRRxwoYZG
qfDR5d6x+oSCiias2oaWaTRhEL/CoC5ZlWZxZq4QwJNikiPQQ5VE9qLqJUFWZUfL
K+3ulXBKUvRcbnjbHvhdZ81Kf2LTzutskx3Xz4aeVMo4kseaLzqHRjCi0z11WPpL
1fvOKXlm66soD61kNkT824msvyxIoYjReV4NoBXJFTZCgKMPmnTlinvKOXCiuxdx
056TEDqqakrPyEbXnLh5/mc2dFP5SV6D9ZodKw1dlHG52X7ORBXpsC3jLMnyz3Nb
m+zx4WzuU7l97Wl7/CLK
=2Vhx
-----END PGP SIGNATURE-----

--4qqvmbs5ksy4vwmu--


--===============4334217677042734714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4334217677042734714==--
