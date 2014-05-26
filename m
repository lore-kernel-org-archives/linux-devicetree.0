From: Sebastian Reichel <sre@ring0.de>
Subject: Re: [PATCH v4 2/8] OF: Introduce DT overlay support.
Date: Mon, 26 May 2014 17:09:44 +0200
Message-ID: <20140526150942.GA26787@earth.universe>
References: <E204285C-D6CD-4518-A94F-26BF0570C1B1@konsulko.com>
 <CAMuHMdUWfQ=2xPhNsS36mT6nv-CfR3_1exZ+5qYgdkjbBntrWg@mail.gmail.com>
 <20140516105814.3EA3FC403C2@trevor.secretlab.ca>
 <CAMuHMdWw39n8O0fFWECR6v6GaEJ3aB5S3ront4eDdXwxNO6Fgw@mail.gmail.com>
 <20140520055026.E3A98C412DA@trevor.secretlab.ca>
 <CAMuHMdXjWENrq0MW-DU2x7WnaCsWyipN4DO=y0ZTL+3G_fPYGg@mail.gmail.com>
 <20140526104824.63F13C42129@trevor.secretlab.ca>
 <CAMuHMdUGdjVKBR5rRzZ274rf7p8XfztNRWEojH1RrZV8c_V1uA@mail.gmail.com>
 <20140526112348.907B7C421A5@trevor.secretlab.ca>
 <A6195DFD-0447-4444-AC09-501C43F09924@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <A6195DFD-0447-4444-AC09-501C43F09924@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pete Popov <pete.popov@ko>
List-Id: devicetree@vger.kernel.org


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, May 26, 2014 at 02:55:37PM +0300, Pantelis Antoniou wrote:
> On May 26, 2014, at 2:23 PM, Grant Likely wrote:
> > On Mon, 26 May 2014 12:57:32 +0200, Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> > Heeheehee. We're back where we started. The original question is whether
> > or not that is a valid approach. If the overlay represents something
> > that can be hot plugged/unplugged, then passing it through to the second
> > kernel would be the wrong thing to do. If it was a permenant addition,
> > then it probably doesn't need to be removed.
> >=20
> > We do actually keep the overlay info in memory for the purpose of
> > removal exactly so we can support hot unbinding of devices and drivers
> > that make use of overlays.
>=20
> We can support either method. I am not feeling any wiser about which one =
should be
> the default TBH, so what about exporting a property and let the platform=
=20
> figure out which is more appropriate?

What about supporting "negative" overlays (so an overlay, that
removes DT entries)? That way one could reverse apply an overlay.
All the dependency stuff would basically be the users problem.  The
kernel only checks if it can apply an overlay (and return some error
code if it can't). This this code is needed anyway to check the
input from userspace.

As a result the overlay handling would basically have the same
behaviour as diff and patch :)

P.S.: Sorry if this has already been suggested. I have only read
mails from PATCHv4.

-- Sebastian

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJTg1k2AAoJENju1/PIO/qauC4P/R59MM9Uon5O924VUUsCLfKQ
zcICgBs8a6NvaJmo83pQYPIPgwGY9dmkT6i8OSCPPIY6RELsOTh2e0ClEjAGZyzX
Hw+16jMd7it7dH7EFufC2eOHAZRyqRkOk/oo6JIomboBBg3tBiQHe7JjOddZuZKR
JAv23xp1RcQwnBsAC8qkum3ELcaHciRhWS1r4kmrDATPAhTWqvUMPlieHGXA89Qx
HJYxMTXxxdMvdFopmitnVKa7NUI3m/lyF2frWrkgDWx7lZ3iWqii8iJrxlAi2E2k
BgiFTEq//ZCEHy51PkFtpyNGag7llkzJSupDbudUV/ZZoURVV955qIZluCCusj34
NlRKacA047DpFohakWsHfQXo4xCIRQPy22byrNEqM/pZs7sFq3b8ZwaUfV8FIJU1
8QMbujEZ/4MCAAJBkpR9xiAeZXJ5chgcUZJfd9fiM1lQn10M0KOX+KhnpquyWsbs
o4IT/9YfblBRnfaToBhflf8YsO+K5bgz1B4gyti/TjFQNm4tjG1jmZdFjuDnd+jv
CnBpUQYxiX1Qtqh8AsjYdqaCEjEWM2mF3cOfnufKuaL+7SqLjS9gPow/0OPx8P9n
gWJe8YxhkVajXscUMu/Cdn+l2l6XsMc9m7IUM0ZnwYB0RMPE+aD/yLu1QnXRz14e
YWfgcyJOopecI4o+f5C7
=KgqV
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
