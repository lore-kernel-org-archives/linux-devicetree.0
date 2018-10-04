From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: fixed: Use more standard GPIO binding
Date: Thu, 4 Oct 2018 14:54:27 +0100
Message-ID: <20181004135427.GE6412@sirena.org.uk>
References: <20181004090654.32233-1-linus.walleij@linaro.org>
 <20181004105031.GD6412@sirena.org.uk>
 <CACRpkdZZHYSRXktPLHKRc4Afsegn4q3rOmcPMhXh5chC1jH-JQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JBi0ZxuS5uaEhkUZ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZZHYSRXktPLHKRc4Afsegn4q3rOmcPMhXh5chC1jH-JQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Leonard Crestez <leonard.crestez@nxp.com>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org


--JBi0ZxuS5uaEhkUZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 04, 2018 at 01:32:13PM +0200, Linus Walleij wrote:
> On Thu, Oct 4, 2018 at 12:50 PM Mark Brown <broonie@kernel.org> wrote:
> > On Thu, Oct 04, 2018 at 11:06:54AM +0200, Linus Walleij wrote:

> > >  Optional properties:
> > > -- gpio: gpio to use for enable control
> > > +- gpios: gpio to use for enable control

> > Are we supposed to be able to have just plain gpios as a standards
> > conforming property or would best practice be to call it enable-gpios or
> > something?

> Oh I didn't think of that really. The gpio-regulator indeed uses
> enable-gpio for the same thing. But it complicates things codewise,
> as the GPIO line is also optional. I'm a bit uncertain, I tend
> to think just "gpios" is fine when the usage is unambigous. but
> I don't know what the DT maintainers think.

Right, well from my point of view -gpio is perfectly fine also so... :)
Rob?

--JBi0ZxuS5uaEhkUZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlu2G5IACgkQJNaLcl1U
h9Dv0Af+NqNh4M686tx+nqKIgH4ozAC/fBA1Y2LfN1um8IE7pI7kh21OjK254T0f
pigDLEN7pTb7gqtFoAqx3mso846aQMR8mDKaxZgsd67P74gFBfQUoYwcLvxVkkWb
bE/EsXlDYkqbzFZrqWTj2RCPK2Y2ReMQ7eyVxg3UUdh8P7wHelzNa3+kQPx6lcu7
x624M/EFb9GMrxedKr+jbHKrnB4rPxhXQ1OTXo/ysHmtBB8nWSIdupX/MzcJJwnn
32orkEn4dnN390oR0lvChpDAD3GeOPevH7vOtbrrCYSWQXjE/QKw15GCuIG0rKEi
bSnbpLNwpACAgEjmdwOpQasN0rpbEw==
=604p
-----END PGP SIGNATURE-----

--JBi0ZxuS5uaEhkUZ--
