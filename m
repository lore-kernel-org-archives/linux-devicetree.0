From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 2/2] ARM: dts: sun8i: enable UART1 for iNet D978 Rev2 board
Date: Thu, 25 Aug 2016 22:47:26 +0200
Message-ID: <20160825204726.GH32598@lukather>
References: <20160823064451.25997-1-icenowy@aosc.xyz>
 <20160823064451.25997-3-icenowy@aosc.xyz>
 <20160824193600.GS8103@lukather> <43951472083107@web23m.yandex.ru>
 <CAGb2v66tFENk8QBw7D1+bwFN-zWaE2SGDrNyc-zdbJSRzENk4Q@mail.gmail.com>
 <97321472108244@web8m.yandex.ru> <20160825080334.GD7776@lukather>
 <116041472134355@web12g.yandex.ru>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1931570542950262735=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <116041472134355@web12g.yandex.ru>
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


--===============1931570542950262735==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LZFKeWUZP29EKQNE"
Content-Disposition: inline


--LZFKeWUZP29EKQNE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 25, 2016 at 10:12:35PM +0800, Icenowy Zheng wrote:
> >> =A0But many codes will require a ttyS0 as console... So I think the
> >> =A0bluetooth should be located at ttyS1...
> >
> > Most of them would use /dev/console anyway. What do you have in mind?
>=20
> As a general configuration, /dev/ttyS0 will be indicated as the default c=
onsole=3D
> value... (Otherwise more boards will fail)

There's no reason to make that assumption. The console might be on
another UART entirely (ttyS3, for the sake of the argument), on a
different UART "class" (ttyUSB?, framebuffer console?), or not present
at all.

If you want to use the console, use /dev/console.

I don't what's so special about the UART here. Every single device in
Linux behaves that way.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--LZFKeWUZP29EKQNE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXv1leAAoJEBx+YmzsjxAg/u4P/j5Ef6igixO11gVOZDSqG5at
yDchkzu+I+hLWlLRic4Umm2YcbiGi32wb/oG4nd7LFqbzy+fOUbrSDJfY7Dsj2CP
bwOn7Ow5m+dI6L4w5USsh4Lqr1cgJjS9aasP51oSxBxZuooJPAA7kpCg7JBczI2m
FhA3rL16QlLXU9Ld2uhPhpnyVjO4E49m2ftg4rWDSfQUID6toV17JOLMxMqB7NIA
553g6a4lB4tzOvPGbeXQXAjzSys38BuSvGjMe0lG6gjsSheMatJ8qVj4lcpXTOYa
Gpwx5DKMq2pnpu1vNiVlTWdjpRC2PU5ua/Oo5sxLxny0HWTw4bo7T0rKRG4O5rKQ
zatp20VPadXIqGXj36cAS92+g7T9e8yPfk65F8qGHbQwF+v/BstQj8eFSvZZEvys
CbmOl6MT7bpQVJ/jC8odLQ6NdTUtvUpqgUgZDEMGlpSlMPXT1+Vi7FxajTinfcm5
NqUXZ0fie86DF4bA6JeKg9fbh42GSWxqm9YPBKk/qxKDs8k1yf6sPIqXSARDjhPL
NngQDgZvXIKv4ItzQNygCcxlvgorcbjT37C9V8m0y+bUM9CF9UaxYcKeYE93Oxsf
7WMQabTYIsRkT/SJgniTlpVCzJTevZJvKAOPgZ3kJXFCtm+Tw754SLNk+86viSBL
J5iRPqYeKwA76Rk2bAw5
=HyAC
-----END PGP SIGNATURE-----

--LZFKeWUZP29EKQNE--


--===============1931570542950262735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1931570542950262735==--
