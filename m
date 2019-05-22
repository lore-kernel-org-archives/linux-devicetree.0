Return-Path: <SRS0=dQs5=TW=sirena.org.uk=broonie@kernel.org>
Date: Wed, 22 May 2019 12:09:06 +0100
From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 3/3] spi: Add spi driver for Socionext Synquacer
 platform
Message-ID: <20190522110906.GD8582@sirena.org.uk>
References: <20190521115958.22504-1-masahisa.kojima@linaro.org>
 <20190521115958.22504-4-masahisa.kojima@linaro.org>
 <20190521181609.GB16633@sirena.org.uk>
 <CADQ0-X9yKQ2akerpxKfjxOxmRhPiaaxe7ALDO7VQiH+-+SHo3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3Pql8miugIZX0722"
Content-Disposition: inline
In-Reply-To: <CADQ0-X9yKQ2akerpxKfjxOxmRhPiaaxe7ALDO7VQiH+-+SHo3w@mail.gmail.com>
To: Masahisa Kojima <masahisa.kojima@linaro.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, geert@linux-m68k.org, tpiepho@impinj.com, andy.shevchenko@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Satoru Okamoto <okamoto.satoru@socionext.com>, Yoshitoyo Osaki <osaki.yoshitoyo@socionext.com>
List-ID: <devicetree@vger.kernel.org>


--3Pql8miugIZX0722
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 22, 2019 at 05:27:23PM +0900, Masahisa Kojima wrote:
> On Wed, 22 May 2019 at 03:16, Mark Brown <broonie@kernel.org> wrote:
> > On Tue, May 21, 2019 at 08:59:58PM +0900, Masahisa Kojima wrote:

> > > +     ret = devm_request_irq(&pdev->dev, rx_irq, sq_spi_rx_handler,
> > > +                             0, "synquacer-spi-rx", sspi);
> > > +     ret = devm_request_irq(&pdev->dev, tx_irq, sq_spi_tx_handler,
> > > +                             0, "synquacer-spi-tx", sspi);

> > The code looked awfully like we depend on having interrupts?

> I"m not sure I correctly understand what this comment means,
> should driver assume the case interrupt is not available?
> Do I need to support both interrupt and polling handling?

If the driver requires interrupts it should not just ignore errors when
it requests interrupts.

--3Pql8miugIZX0722
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzlLdEACgkQJNaLcl1U
h9Bxtgf+O7Ql3XV1v0OFmPYGNxKhM7hKmFIojgupkf2VbuPOioXJq+YR4xqGXDpQ
b05un6ESQyyilrI/JXIY3m8pRYbBQh0AMscC/OxWEOThmZCVafXJS3WRxCeFhIqu
i3fA94KsTpAjgOOGhkDfOiBsthK9je+SMrE1S7eNqGRTi82IfmBVoGr4ecQPKFn9
dV8QHIcHuzqHKs4iCC+kYpTYpCH6s4VJk5ZkElABX6ewekbot17FBe5bFJp9pWni
uFC8d1xp66heSVTwc4lA7SbDqWY1zZbhJyeJDjw0Uv2PauyH3HgnN1MKFRCvGBRL
+ZO4mmN5t1jhZ90vlxbwPkyvODb+6A==
=mko4
-----END PGP SIGNATURE-----

--3Pql8miugIZX0722--
