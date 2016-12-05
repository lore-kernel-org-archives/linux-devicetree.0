From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 2/3] ARM: dts: sunxi: add support for Orange Pi Zero
 board
Date: Mon, 5 Dec 2016 09:52:55 +0100
Message-ID: <20161205085255.ij3du3if2ss3q3h5@lukather>
References: <20161121162421.800-1-icenowy@aosc.xyz>
 <20161121162421.800-2-icenowy@aosc.xyz>
 <5373671480239408@web31m.yandex.ru>
 <cdfd3c65-d473-badb-ea6a-035f7ab79217@arm.com>
 <20161201093619.gs6lmoxtlptp2jr6@lukather>
 <11498641480688550@web2g.yandex.ru>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3223685677061644295=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <11498641480688550@web2g.yandex.ru>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, =?iso-8859-1?Q?Andr=E9?= Przywara <andre.przywara@arm.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============3223685677061644295==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="baavniebiyjrpcpi"
Content-Disposition: inline


--baavniebiyjrpcpi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 02, 2016 at 10:22:30PM +0800, Icenowy Zheng wrote:
>=20
>=20
> 01.12.2016, 17:36, "Maxime Ripard" <maxime.ripard@free-electrons.com>:
> > On Mon, Nov 28, 2016 at 12:29:07AM +0000, Andr=E9 Przywara wrote:
> >> =A0> Something more interesting happened.
> >> =A0>
> >> =A0> Xunlong made a add-on board for Orange Pi Zero, which exposes the
> >> =A0> two USB Controllers exported at expansion bus as USB Type-A
> >> =A0> connectors.
> >> =A0>
> >> =A0> Also it exposes a analog A/V jack and a microphone.
> >> =A0>
> >> =A0> Should I enable {e,o}hci{2.3} in the device tree?
> >>
> >> =A0Actually we should do this regardless of this extension board. The =
USB
> >> =A0pins are not multiplexed and are exposed on user accessible pins (j=
ust
> >> =A0not soldered, but that's a detail), so I think they qualify for DT
> >> =A0enablement. And even if a user can't use them, it doesn't hurt to h=
ave
> >> =A0them (since they are not multiplexed).
> >
> > My main concern about this is that we'll leave regulators enabled by
> > default, for a minority of users. And that minority will prevent to do
> > a proper power management when the times come since we'll have to keep
> > that behaviour forever.
>=20
> I think these users can add a 'fdt set /xxx/xxx status "disabled" ' .

You can't ask that from the majority of users. These users will take
debian or fedora, install it, and expect everything to work
properly. I would make the opposite argument actually. If someone is
knowledgeable enough to solder the USB pins a connector, then (s)he'll
be able to make that u-boot call.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--baavniebiyjrpcpi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYRSrnAAoJEBx+YmzsjxAgQSkQAJZ9ZqtNLaO0DH0isgGVLgQg
FXI6nF+WKqxv0w0Q91iFu8IfJgAItXUQp45vATtnjDRzDRT9/ktJ4le3NgE40l1s
Bq1aQVZMYRciEpW84RgmR1pViZdnfnvGCdTZwgra6GY2QYt5SgcEZuW37X71e0Ow
dltb6ziSbiLVThK8FwgRRmHwqDnulwc1UAuy9YD54je+27tSOLs8HmYrDqNYLzh5
Ie2U6QhRpjSi6f9IaprvhvPcm8PtvOWnDHhKSWvk4FZCJZWVKqlqss7Hy8GPi/3g
Emtpj6kZ+ioGYihLgYkf6eU1IYV2fJTvkb+y/nyl//YpQMGhVnrC6/KuUVAawY+h
eou7dEQzPTnUwW0xUwRPetnx/alvtAQguCskW1b/ziB+nn5zdkxIFV52qXF/abK6
hUrbiu4oOu6t5sGeZkLTWwHJ7VcYxvl+yx6k/d/xEjaD+l8xFiVEXnfUkgqT5KoR
cJLJ2wjANrTolHAbSOHZYFlafptnfan9St2cI5Q9vR4xXoC2ut7iW8+WT19Y1KHE
/aIhGx2KXCz7prZhQPFP0wMOhqq9VUgR0LWuA1vHTIA69R45vz/7lQ40znVfykcK
n8cBZK8povn+Z7xFyITyyPA+5PhYRP+DPQ9Uek9u9QTPYY0tikNfaNJVypH3G+hS
qP2GaL0pCPYnNh2LxQZT
=4yTS
-----END PGP SIGNATURE-----

--baavniebiyjrpcpi--


--===============3223685677061644295==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3223685677061644295==--
