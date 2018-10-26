From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 2/5] mfd: lochnagar: Add support for the Cirrus Logic
 Lochnagar
Date: Fri, 26 Oct 2018 16:49:52 +0100
Message-ID: <20181026154952.GB27137@sirena.org.uk>
References: <20181008132542.19775-1-ckeepax@opensource.cirrus.com>
 <20181008132542.19775-2-ckeepax@opensource.cirrus.com>
 <20181025074459.GF4939@dell>
 <20181025082621.GD16508@imbe.wolfsonmicro.main>
 <b2f85f45-cbe9-5a27-e9e8-ad28f2bd9bd6@opensource.cirrus.com>
 <20181025114205.GC4870@dell>
 <20181025124905.GF16508@imbe.wolfsonmicro.main>
 <20181025132043.GG16508@imbe.wolfsonmicro.main>
 <d0e76752-1b31-e9e3-d684-9d78ddc98172@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+g7M9IMkV8truYOl"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d0e76752-1b31-e9e3-d684-9d78ddc98172@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, Lee Jones <lee.jones@linaro.org>, mturquette@baylibre.com, sboyd@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--+g7M9IMkV8truYOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 25, 2018 at 02:47:59PM +0100, Richard Fitzgerald wrote:

> access. What does regmap debugfs do if you don't have a readables
> list? Just reading a debugfs shouldn't be able to kill the hardware.
> You might need to add a precious list which is more error prone
> than listing the valid readables we are using.

It assumes everything is readable unless it's explicitly told otherwise
or the register map is overall write only (like a 7x9 one).  You could
mark the registers as precious to cause it to only do explicit I/O
operations on them but that's not what you mean and won't be as good a
guarantee that nothing can trigger a read.

--+g7M9IMkV8truYOl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlvTN58ACgkQJNaLcl1U
h9DKSAf8DrGd/YKE8uiDncD7yHUOAm5PmrEulBdc2Kx0IjDAheyuOQdPuEBzwipb
E3rAWQartSyoTM4K3fgxJm45N1Be73cqlt271sdxrVuagBOqz/UJFXtUSGr80dlo
/KY2l7w/Z7LPatZT1QvnBuMop/0sZ5FDCB9a2rbAJ7RWoyJaY0uMC4SrznNEn60g
Ac0ppAPREE9oZqlaCLFNCGGC6jYig20LjH27kR4ZdW36mDo9IoRuoBMRpWlIoHZ/
yYcSyo/f2aKGWHosiOZ4Bfe8kodcxkDHjX0uMX5G+nacdY1y2IFfNYg0zOZwrI69
OJkiD2i4sLZ6cJBK9MI8O4X2wpCYkA==
=i4X0
-----END PGP SIGNATURE-----

--+g7M9IMkV8truYOl--
