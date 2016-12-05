From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 2/3] ARM: dts: sunxi: add support for Orange Pi Zero
 board
Date: Mon, 5 Dec 2016 10:40:23 +0100
Message-ID: <20161205094023.mtymfvpmca4x3ohh@lukather>
References: <20161205120021.0GBGtAl4@smtp3m.mail.yandex.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0273777918439684925=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161205120021.0GBGtAl4@smtp3m.mail.yandex.net>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "	devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, Arnd Bergmann <arnd@arndb.de>, "	linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, =?iso-8859-1?Q?Andr=E9?= Przywara <andre.przywara@arm.com>, Jonathan Corbet <corbet@lwn.net>, linux-kernel <linux-kernel@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, " linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============0273777918439684925==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jio2ezo5engbusen"
Content-Disposition: inline


--jio2ezo5engbusen
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 05, 2016 at 04:59:44PM +0800, Icenowy Zheng wrote:
>=20
> 2016=E5=B9=B412=E6=9C=885=E6=97=A5 16:52=E4=BA=8E Maxime Ripard <maxime.r=
ipard@free-electrons.com>=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Fri, Dec 02, 2016 at 10:22:30PM +0800, Icenowy Zheng wrote:=20
> > >=20
> > >=20
> > > 01.12.2016, 17:36, "Maxime Ripard" <maxime.ripard@free-electrons.com>=
:=20
> > > > On Mon, Nov 28, 2016 at 12:29:07AM +0000, Andr=C3=A9 Przywara wrote=
:=20
> > > >> =C2=A0> Something more interesting happened.=20
> > > >> =C2=A0>=20
> > > >> =C2=A0> Xunlong made a add-on board for Orange Pi Zero, which expo=
ses the=20
> > > >> =C2=A0> two USB Controllers exported at expansion bus as USB Type-=
A=20
> > > >> =C2=A0> connectors.=20
> > > >> =C2=A0>=20
> > > >> =C2=A0> Also it exposes a analog A/V jack and a microphone.=20
> > > >> =C2=A0>=20
> > > >> =C2=A0> Should I enable {e,o}hci{2.3} in the device tree?=20
> > > >>=20
> > > >> =C2=A0Actually we should do this regardless of this extension boar=
d. The USB=20
> > > >> =C2=A0pins are not multiplexed and are exposed on user accessible =
pins (just=20
> > > >> =C2=A0not soldered, but that's a detail), so I think they qualify =
for DT=20
> > > >> =C2=A0enablement. And even if a user can't use them, it doesn't hu=
rt to have=20
> > > >> =C2=A0them (since they are not multiplexed).=20
> > > >=20
> > > > My main concern about this is that we'll leave regulators enabled b=
y=20
> > > > default, for a minority of users. And that minority will prevent to=
 do=20
> > > > a proper power management when the times come since we'll have to k=
eep=20
> > > > that behaviour forever.=20
> > >=20
> > > I think these users can add a 'fdt set /xxx/xxx status "disabled" ' .=
=20
> >
> > You can't ask that from the majority of users. These users will take=20
> > debian or fedora, install it, and expect everything to work=20
> > properly. I would make the opposite argument actually. If someone is=20
> > knowledgeable enough to solder the USB pins a connector, then (s)he'll=
=20
> > be able to make that u-boot call.=20
>=20
> Now (s)he do not need soldering.
>=20
> (S)he needs only paying $1.99 more to Xunlong to get the expansion
> board, and insert it on the OPi Zero.

Which is going to require an overlay anyway, so we could have the USB
bits in there too.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--jio2ezo5engbusen
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYRTYCAAoJEBx+YmzsjxAgWJsP/iXC08UwYPZmq1H+G2bubKi/
AOUZXobx/B3EZQS/azY+r0JcbBXEYABjz47xKlBqfIgIJhP5+IkTv+f3jv5iF2aA
v0mesuU5yu0+70oVCjM/F0Oe0Q5FrLTtfdtpV2UdFAFRk8svE4G+1MW041TG5+PA
6MPRgUGkZkkZNxIk2a5J4JOMNI00HW3XFNVWxFr97RFdmo5M/SJ5SNxOFoZMWpt8
izzMkvKYtMKFtPbXdEXMXNPR+CPmwDMSmCmhqdQ37Juags240+dNhnLqmOCYvGWI
vtQKyOhQ0MpbBzy+ijnD0nJiCiJZMKbwyouwKHbLzd+N3pFSc334DRSzQ/vAtkYL
gVsEjDCXjYHpU0laA+L5bqYDbIxzV36uZtJPkq539+nqYb9SC7U8NMjQHnKgBRMz
T8hjytgylvZawkWNpqWAYDJg+lOz2TzgOaQlsAa6j4X1hLPifVgpZeThVozJqj61
FRCZ5jlEM3mvKMOE2bhPExWEvT6ZLDGdn6OGXFU82sydHxjxDTPHH/prtjzUPYHO
QOrHAQbWAdk4fVuOSJl5fB7vKyDYhrmmMHBlyszg4zrDZcNh+kJKCR6h9fzw53kK
2IJZzWbs5a9HOv0IjMf1iGPHh0megyZkymf2Oyycv78rvWfxNXWfFmzntwiWZFDb
nlXxQRbNbt4M4Vn9FJ/k
=KQVj
-----END PGP SIGNATURE-----

--jio2ezo5engbusen--


--===============0273777918439684925==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0273777918439684925==--
