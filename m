From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 2/2] ARM: dts: sun8i: enable UART1 for iNet D978 Rev2 board
Date: Thu, 25 Aug 2016 10:03:34 +0200
Message-ID: <20160825080334.GD7776@lukather>
References: <20160823064451.25997-1-icenowy@aosc.xyz>
 <20160823064451.25997-3-icenowy@aosc.xyz>
 <20160824193600.GS8103@lukather> <43951472083107@web23m.yandex.ru>
 <CAGb2v66tFENk8QBw7D1+bwFN-zWaE2SGDrNyc-zdbJSRzENk4Q@mail.gmail.com>
 <97321472108244@web8m.yandex.ru>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7341039146447104955=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <97321472108244@web8m.yandex.ru>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============7341039146447104955==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xB0nW4MQa6jZONgY"
Content-Disposition: inline


--xB0nW4MQa6jZONgY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Aug 25, 2016 at 02:57:24PM +0800, Icenowy Zheng wrote:
> >>>> =A0=A0diff --git a/arch/arm/boot/dts/sun8i-a33-inet-d978-rev2.dts b/=
arch/arm/boot/dts/sun8i-a33-inet-d978-rev2.dts
> >>>> =A0=A0index 78823d8..3ac22d4 100644
> >>>> =A0=A0--- a/arch/arm/boot/dts/sun8i-a33-inet-d978-rev2.dts
> >>>> =A0=A0+++ b/arch/arm/boot/dts/sun8i-a33-inet-d978-rev2.dts
> >>>> =A0=A0@@ -48,6 +48,10 @@
> >>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0model =3D "INet-D978 Rev 02";
> >>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0compatible =3D "primux,inet-d978-re=
v2", "allwinner,sun8i-a33";
> >>>>
> >>>> =A0=A0+ aliases {
> >>>> =A0=A0+ serial1 =3D &uart1;
> >>>> =A0=A0+ };
> >>>> =A0=A0+
> >>>
> >>> =A0Is there any other UART in the system?
> >>
> >> =A0serial0 is defined in sun8i-reference-design-tablet.dtsi, as r_uart.
> >
> > If your board does not have r_uart pads, then the right thing to do
> > would be to disable it. You can then have uart1 as serial0.
>=20
> I don't know it. The RX/TX is wired on PF2/PF4 on the board (UART0 muxed =
with
> MMC)

Then you don't support it and you need to disable it.

> But many codes will require a ttyS0 as console... So I think the
> bluetooth should be located at ttyS1...

Most of them would use /dev/console anyway. What do you have in mind?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--xB0nW4MQa6jZONgY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXvqZWAAoJEBx+YmzsjxAgDywP/0z0xE4A93WkCDFajH2Smc3e
ItKmanSVQGKWVHiiiAimBPZMBSeybC2r48230uKMDr1UfYL4YPlOfSZdrvtvx0nN
ybSHahet4M+Ltym1/R5UEbWou9u2+YEO5wR6rxXMkW1ALgfUyZvbPq+grwFMHkPt
+ebvc/I/ELLHiYACO6nhlkdAi1+pB1MRTmOlBlqguXSilSfAhrHSNtSDJ3ZLeiX8
wJduLSiuWEAa3IT51k4Hte798P7cTGzOS0Ql2thqFWvVrPLV+rWg3Kvf9gvvDjg5
fwpgQagrT5/zKRjybhZQoBr1blk86COr/jruEOmOqyRu1L4o+cSwPOCJVSGWUxFg
EAnjfnZwVAOvIrkDmrLaym5MzVdccTB81peLxHponii2IzG2j3EHuaVjZ2Yr3uHt
xMpGaCaEGjVCsi9q+A0d3vqbE5caHxhMFZ/6uW7ZLbGZAyGimDxb7vmDvfZkvROh
YgJ2iCCOxOnrF7ZV9t82+L7Tx8nlgpOx4YrtZuNGpBG6bUfajs7JvzjqrElnMUAC
YvPsy/jK6a4X87PtBluuwuJCxNmei7ySXexHJqFhIxWXg0S7U/Ts+BvmjEr/kgcg
YWUMJtCaK4OBI1u1EKB0YE7tYu32i1WlUDLLUud5XGuoozkHJQ08YdvAdTIeJ4ED
0XfWJTVMLEJggPg9bIjH
=lYzw
-----END PGP SIGNATURE-----

--xB0nW4MQa6jZONgY--


--===============7341039146447104955==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7341039146447104955==--
