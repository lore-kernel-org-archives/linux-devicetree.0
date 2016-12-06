From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 2/3] ARM: dts: sunxi: add support for Orange Pi Zero
 board
Date: Tue, 6 Dec 2016 09:00:56 +0100
Message-ID: <20161206080056.23jpd4e7eeuhuyiq@lukather>
References: <20161205120021.0GBGtAl4@smtp3m.mail.yandex.net>
 <20161205094023.mtymfvpmca4x3ohh@lukather>
 <17819681480935706@web24g.yandex.ru>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6317367676103866451=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <17819681480935706@web24g.yandex.ru>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, Arnd Bergmann <arnd@arndb.de>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, =?iso-8859-1?Q?Andr=E9?= Przywara <andre.przywara@arm.com>, Jonathan Corbet <corbet@lwn.net>, linux-kernel <linux-kernel@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, "\"linux-arm-kernel@lists.infradead.org\"" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============6317367676103866451==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x2wwbqrqtrwsjvnr"
Content-Disposition: inline


--x2wwbqrqtrwsjvnr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 05, 2016 at 07:01:46PM +0800, Icenowy Zheng wrote:
>=20
>=20
> 05.12.2016, 17:40, "Maxime Ripard" <maxime.ripard@free-electrons.com>:
> > On Mon, Dec 05, 2016 at 04:59:44PM +0800, Icenowy Zheng wrote:
> >> =C2=A02016=E5=B9=B412=E6=9C=885=E6=97=A5 16:52=E4=BA=8E Maxime Ripard =
<maxime.ripard@free-electrons.com>=E5=86=99=E9=81=93=EF=BC=9A
> >> =C2=A0>
> >> =C2=A0> On Fri, Dec 02, 2016 at 10:22:30PM +0800, Icenowy Zheng wrote:
> >> =C2=A0> >
> >> =C2=A0> >
> >> =C2=A0> > 01.12.2016, 17:36, "Maxime Ripard" <maxime.ripard@free-elect=
rons.com>:
> >> =C2=A0> > > On Mon, Nov 28, 2016 at 12:29:07AM +0000, Andr=C3=A9 Przyw=
ara wrote:
> >> =C2=A0> > >> =C2=A0> Something more interesting happened.
> >> =C2=A0> > >> =C2=A0>
> >> =C2=A0> > >> =C2=A0> Xunlong made a add-on board for Orange Pi Zero, w=
hich exposes the
> >> =C2=A0> > >> =C2=A0> two USB Controllers exported at expansion bus as =
USB Type-A
> >> =C2=A0> > >> =C2=A0> connectors.
> >> =C2=A0> > >> =C2=A0>
> >> =C2=A0> > >> =C2=A0> Also it exposes a analog A/V jack and a microphon=
e.
> >> =C2=A0> > >> =C2=A0>
> >> =C2=A0> > >> =C2=A0> Should I enable {e,o}hci{2.3} in the device tree?
> >> =C2=A0> > >>
> >> =C2=A0> > >> =C2=A0Actually we should do this regardless of this exten=
sion board. The USB
> >> =C2=A0> > >> =C2=A0pins are not multiplexed and are exposed on user ac=
cessible pins (just
> >> =C2=A0> > >> =C2=A0not soldered, but that's a detail), so I think they=
 qualify for DT
> >> =C2=A0> > >> =C2=A0enablement. And even if a user can't use them, it d=
oesn't hurt to have
> >> =C2=A0> > >> =C2=A0them (since they are not multiplexed).
> >> =C2=A0> > >
> >> =C2=A0> > > My main concern about this is that we'll leave regulators =
enabled by
> >> =C2=A0> > > default, for a minority of users. And that minority will p=
revent to do
> >> =C2=A0> > > a proper power management when the times come since we'll =
have to keep
> >> =C2=A0> > > that behaviour forever.
> >> =C2=A0> >
> >> =C2=A0> > I think these users can add a 'fdt set /xxx/xxx status "disa=
bled" ' .
> >> =C2=A0>
> >> =C2=A0> You can't ask that from the majority of users. These users wil=
l take
> >> =C2=A0> debian or fedora, install it, and expect everything to work
> >> =C2=A0> properly. I would make the opposite argument actually. If some=
one is
> >> =C2=A0> knowledgeable enough to solder the USB pins a connector, then =
(s)he'll
> >> =C2=A0> be able to make that u-boot call.
> >>
> >> =C2=A0Now (s)he do not need soldering.
> >>
> >> =C2=A0(S)he needs only paying $1.99 more to Xunlong to get the expansi=
on
> >> =C2=A0board, and insert it on the OPi Zero.
> >
> > Which is going to require an overlay anyway, so we could have the USB
> > bits in there too.
>=20
> If so, I think the [PATCH -next v3 2/2] is ready to be merged ;-)

I meant enabling the USB in the overlay, you enabled it in the base DT.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--x2wwbqrqtrwsjvnr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYRnA0AAoJEBx+YmzsjxAg4soP/Rfjmvz2LduqDq//AxlNh+uy
pHsVXd1+Ca/3o26sngdPPVdfzHRMFiOngZnTo+wrQY0e3FqRMZud2HczU2uwVtH5
rghlTotxXk4FscR+NOpZSRfoTWLBM/OCvW4axPpiiMPfqEqHQy+wGlSAkbByrIEn
MqWrmAaJsHlTNBDG89w4ii/69wTmqxeFc2zfOf1gLlhh8k7W6CY6dqCrhN6VTduT
ghga9tOH1+OBf4sKxU6+xT32eNHq9kTf3bYhdruQlXJhxaNF6GPFgGMEVGcGAU/K
z8XlLXfB6ChAWziiDxV31rpIx6uHzEvcgENQNQucWJ2gPJqF4n/bwsSBbXVQY1Dq
qBRn76CD261KhtjX8wDkdWKswU4u2Pz3CHjaULq2odhI+QWdNyx+73HkWpuZ2eyL
rTT0tkvYcNtL0KqCUBqckVgR1621sp1bePLpQ0zFasFyvB0qYgHOfNzGdtxmGeke
odo6JW7x22y37XyWpG9abGKo10LMkXCVth4jgnYOm1PzNaWKedoKXCeRN5poLOY5
gTxUT5QVBCKFhF+OOdYsuMMAr1TIjkfUKVd8bwdSd4EvvbvVPqk1YMbn8DUtLpox
bKiYkPEeWhmlkAZcQg0vicA2X81NYZ2YpUHw4Z8PSBdE7qhjmtDZqn/MuhbMxJ3j
0rjfKlPfeu8y86/cQ78D
=zz1u
-----END PGP SIGNATURE-----

--x2wwbqrqtrwsjvnr--


--===============6317367676103866451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6317367676103866451==--
