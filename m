From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v3 5/8] pinctrl: Add core support for Aspeed SoCs
Date: Thu, 08 Sep 2016 13:28:25 +0930
Message-ID: <1473307105.10397.23.camel@aj.id.au>
References: <20160830075427.11493-1-andrew@aj.id.au>
         <20160830075427.11493-6-andrew@aj.id.au>
         <CACRpkdb2ftH5B5VqKW9rPU=LMeWjrfo9jBTP5DKbNYeZAoMC8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-qeU/vWnpy8W66rRoLqYD"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdb2ftH5B5VqKW9rPU=LMeWjrfo9jBTP5DKbNYeZAoMC8Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Joel Stanley <joel@jms.id.au>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--=-qeU/vWnpy8W66rRoLqYD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-09-07 at 16:50 +0200, Linus Walleij wrote:
> On Tue, Aug 30, 2016 at 9:54 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
> >=20
> > The Aspeed SoCs typically provide more than 200 pins for GPIO and other
> > functions. The signal enabled on a pin is determined on a priority
> > basis, where a given pin can provide a number of different signal types=
.
> >=20
> > In addition to the priority levels, the Aspeed pin controllers describe
> > the signal active on a pin by compound logical expressions involving
> > multiple operators, registers and bits. Some difficulty arises as a
> > pin's function bit masks for each priority level are frequently not the
> > same (i.e. we cannot just flip a bit to change from a high to low
> > priority signal), or even in the same register(s). Some configuration
> > bits affect multiple pins, while in other cases the signals for a bus
> > must each be enabled individually.
> >=20
> > Together, these features give rise to some complexity in the
> > implementation. A more complete description of the complexities is
> > provided in the associated header file.
> >=20
> > The patch doesn't implement pinctrl/pinmux/pinconf for any particular
> > Aspeed SoC, rather it adds the framework for defining pinmux
> > configurations.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> Patch applied! It's not getting better than this through iteration, it is=
 better
> to get the system up and develop inside the mainline tree from now on.
>=20
> >=20
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1027,6 +1027,7 @@ S:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Maintained
> > =C2=A0F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0arch/arm/mach-aspeed/
> > =C2=A0F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0arch/arm/boot/dts/aspeed-*
> > =C2=A0F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/*/*aspeed*
> > +F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/pinctrl/aspeed/
> > =C2=A0F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Documentation/devicetree/bindings=
/*/*aspeed*
> I dropped this hunk of the patch, because:
>=20
> (A) I didn't merge the glob patch and

Okay

> (B) the glob covers this driver too, it is a tautology/truism

So experimenting with this my results don't agree - without the hunk
get_maintainer.pl falls back to git and s-o-bs to pick up the Aspeed
maintainer:

With the hunk:

    $ ./scripts/get_maintainer.pl drivers/pinctrl/aspeed/pinctrl-aspeed.c
    Joel Stanley <    joel@jms.id.au    > (maintainer:ARM/ASPEED MACHINE SU=
PPORT)
    Linus Walleij <    linus.walleij@linaro.org    > (maintainer:PIN CONTRO=
L SUBSYSTEM)
    linux-gpio@vger.kernel.org     (open list:PIN CONTROL SUBSYSTEM)

Without the hunk:

    $ ./scripts/get_maintainer.pl drivers/pinctrl/aspeed/pinctrl-aspeed.c
    Linus Walleij <    linus.walleij@linaro.org    > (maintainer:PIN CONTRO=
L SUBSYSTEM)
    Joel Stanley <    joel@jms.id.au    > (commit_signer:1/1=3D100%)
    Andrew Jeffery <    andrew@aj.id.au    > (commit_signer:1/1=3D100%,auth=
ored:1/1=3D100%,added_lines:498/498=3D100%)
    linux-gpio@vger.kernel.org     (open list:PIN CONTROL SUBSYSTEM)
    linux-kernel@vger.kernel.org     (open list)

So removing git as a fallback Joel isn't listed as a relevant
maintainer despite the glob:

    $ ./scripts/get_maintainer.pl --no-git-fallback drivers/pinctrl/aspeed/=
pinctrl-aspeed.c
    Linus Walleij <    linus.walleij@linaro.org    > (maintainer:PIN CONTRO=
L SUBSYSTEM)
    linux-gpio@vger.kernel.org     (open list:PIN CONTROL SUBSYSTEM)
    linux-kernel@vger.kernel.org     (open list)

I expect it's the case that the globbing doesn't match directories like
the hunk in question does with its trailing '/'. However, given we will
likely do something different in light of Arnd's suggestion it probably
doesn't matter.

Cheers,

Andrew
--=-qeU/vWnpy8W66rRoLqYD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX0OHhAAoJEJ0dnzgO5LT5cfoP/jG46VWSd8VSqbHrc/MTtl+Q
xa/YtU9PEXHP5pkcTr6Hh7GWV1vSoMf/q1SAWITawM/wuzUW7U3+L+maqwJp2g4d
m6yrCSwlGvOjeW7z6H+HSU7lMBd1xjHAX29qg8g994+5woj8ofdtsrJlgFSBbBbf
v7/PxTBvHBA1spYXsF078ooy7JdZSfsdK1JDcgW1uz2Obf7A5xLGvV/YvIXtow4O
n6hSj/L8enQpfNmTg3vAv3xGBVEKm1V/WvXQMeUHyozRJHvLJOt1XLww9tTM62E3
qwEq7gd/GzGW+Bqqq+0jttURgU0iolfMr6d+0GMsHniN0LfnFAkrym9wsBKBReq0
8WIkF1SFSZ3CCSd3sx2SGzUb1F0TpSN8opPerl3nNlTNjzaox4083r0FsS5F6lK6
eqy5Jj8ypLrEXvyVlnQnzmNLfiNrGllfQzkFn2crIZu+gEpmKtEFF9+ZqzZ1UfMy
93B7PvAd+ZHIQONiQ2grwcL4pveGI+OlA3agjXZCwXKTtYUYGzlz5NntXkTTj05u
aUjjyVlPZTwIYGQ0hbTyZZotuHjmigbcirUKPgEfSYsDSYU0dgNGiJpKHEK58Ape
huM67jzOnzfthto5U4NvoyCTBde7G+CkQ/jTzcT23S0NCGRzhGWM+rIVopsaBZyN
+jW4eqh443ZS9aTm2mgF
=HKLk
-----END PGP SIGNATURE-----

--=-qeU/vWnpy8W66rRoLqYD--

