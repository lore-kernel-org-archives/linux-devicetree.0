From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH v2] gpio: Add Avionic Design N-bit GPIO expander support
Date: Fri, 10 Aug 2012 10:48:59 +0200
Message-ID: <20120810084859.GA16550@avionic-0098.mockup.avionic-design.de>
References: <1343044770-6591-1-git-send-email-thierry.reding@avionic-design.de>
 <CACRpkdaZcUvcJMUZTqCEU5FQYhE3EvSSfUEnEx0dYRt-6x5Nig@mail.gmail.com>
 <20120809202054.GA24503@avionic-0098.mockup.avionic-design.de>
 <CACRpkdaSk9xBaiSAKCj4Pa2kyyfP178XN53i2Q2+CBFx=RoE0g@mail.gmail.com>
 <20120810083508.GA16251@avionic-0098.mockup.avionic-design.de>
 <CACRpkdaGWhTR3Zr40dtigQqPPkxQZ=zYqYVBfpwbnkf3P2Qhhg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdaGWhTR3Zr40dtigQqPPkxQZ=zYqYVBfpwbnkf3P2Qhhg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Grant Likely <grant.likely@secretlab.ca>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Linus Walleij <linus.walleij@stericsson.com>, Rob Herring <rob.herring@calxeda.com>, Wolfram Sang <w.sang@pengutronix.de>
List-Id: devicetree@vger.kernel.org


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 10, 2012 at 10:41:58AM +0200, Linus Walleij wrote:
> On Fri, Aug 10, 2012 at 10:35 AM, Thierry Reding
> <thierry.reding@avionic-design.de> wrote:
> >> Consult the following article on LWN:
> >> http://lwn.net/Articles/470820/
> >>
> >> Then grep your gitlog and you'll see we got rid of it from ARM.
> >
> > Then why is there still the following in arch/arm/include/asm/irq.h?
> >
> >         /*
> >          * Use this value to indicate lack of interrupt
> >          * capability
> >          */
> >         #ifndef NO_IRQ
> >         #define NO_IRQ  ((unsigned int)(-1))
> >         #endif
>=20
> That's a question for Russell but I think it's basically there for
> old platforms, on a "don't use it"-basis. (Maybe a comment could
> be good.)
>=20
> As you see non-sparse platforms can redefine NO_IRQS in their
> <mach/irqs.h> file, but in practice things like the VIC and GIC
> drivers have been switched over to using irqdomain which
> in turn does *not* allow IRQ 0 to be used, so most platforms
> are indirectly disallowed to use IRQ 0 anyway. In fact I think
> some of them are just broken now.

In that case it might be better to just drop it altogether and wait
until people with the broken platforms start complaining.

Thierry

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQJMr7AAoJEN0jrNd/PrOhlZ8QAIZ8855/Wm9g5454USc2T8zv
PyM8+aOF9dSCiQBcZb8BG6A+figj60DhcEZtoVCzni9IrQHJY0NKZhOpCro9qinz
A61QQ7GjvEvNOpp/wbtG+BUNmFCRSGn5gGhszMlsngMVIrOerGNmwlT+A1F95Sqz
kaIUS636qOJaPucTYD9rgin3UIesoZmrzxwE8fdflx93lV4xYXzdYWkZXZey8Nx1
D1oLLU6MLjQwQvKix5XBu0CNCP0Xe2og0GTKJtuqI8sbQNunxzYIGzEeUDUvH6Qa
0duXUhxbc3vsVgtn1BmBWMT5Cy7ppi3UIYzdujIRmBChBl1Sj8O+KG1tBBv4pvVD
Tyj0pt1q8M22KRsS5pT5O29OwP8Wnb7Q8UqTona5f88T7KTjD59GC/0/cFilYELO
Z4+I38+HNUuUBfoQo1r2ZKtvQhuTYkXOULAY+sARFycaiAx6n+F0WmNRnpiNRjgY
EPjTIFp+MqBTRhEWFZln+Xcv7FSXAleSDyVJfGQhTjFoUTO1RaAAUecdpXkAKCLs
1K5NHadOSyVcoVoo5MdalludVpjTHnpyhGzI+RUfFb1USzIhZH+m+SsNAG7nKYpi
YsHSufdRohdA+DsSKaGu/oEMxsVLdHMNw7bLv01Plrk+4j4yx7iswxFSOs2+TQg0
qQDY4iEL6wFTzxYkyukn
=TiLA
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
