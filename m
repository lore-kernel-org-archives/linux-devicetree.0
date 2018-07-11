From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 2/2] regulator: uniphier: add regulator driver for
 UniPhier SoC
Date: Wed, 11 Jul 2018 10:32:41 +0100
Message-ID: <20180711093241.GA6561@sirena.org.uk>
References: <1531186037-16630-3-git-send-email-hayashi.kunihiko@socionext.com>
 <20180710174451.GE8104@sirena.org.uk>
 <20180711113134.497A.4A936039@socionext.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180711113134.497A.4A936039@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 11, 2018 at 11:31:35AM +0900, Kunihiko Hayashi wrote:
> On Tue, 10 Jul 2018 18:44:51 +0100 <broonie@kernel.org> wrote:
> > On Tue, Jul 10, 2018 at 10:27:17AM +0900, Kunihiko Hayashi wrote:

> > This isn't *quite* regulator_is_enabled_regmap() as it explicitly checks
> > if the disable value is set and errors otherwise which would be a good
> > fix for that.  Could you do a patch for that?

> Although I'm worried that the register have a value that is neither
> enable_val or disable_val, the "is_enabled" function returns whether
> the regulator is enabled or not, so I can apply regulator_is_enabled_regmap().

Yes, I think it's a good thing to add that check - it's possible that
there'll be some other value in there and it's better to be careful.

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAltFzrgACgkQJNaLcl1U
h9AW/wf9HMopIpYBQZqBzow6CX663DkLtJAlY/aVrzTaU1fupxzxrJiBwBAWZ5ss
+AV8zLdYjfvUcn5MXinafJ3Xx13pGkGnIYGm3f32z97jDAFb4+fxjjKL+Tc4Lozz
LV8+r7HRK3qB0kha7eqix8bydqByDFgLzvmIo0LOn+BqpIvKEE0nNLobTJe9swXG
S7brcJnRxmCGsVmNYejryIafIYPdrxiuWOoPXwj3qYX2oLB/aSDGDd8oOq6xnwQg
86HEfg1H7QeGnKOFCZBUJqoQuvMxtWr2QuqVX7u5htETFeTBstzPg/MmNdu8QQ0S
vLXOdgRNutcLlxTDDg1PKLXxJjMQkQ==
=A5ZE
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
