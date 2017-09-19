From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] regulator: core: Add coupled regulators mechanism
Date: Tue, 19 Sep 2017 15:47:38 +0100
Message-ID: <20170919144738.g2xwjaph6bjvwt35@sirena.co.uk>
References: <1505723992-11772-1-git-send-email-m.purski@samsung.com>
 <CGME20170918084022eucas1p1398f18c5c90535ce484e3952fae80882@eucas1p1.samsung.com>
 <1505723992-11772-2-git-send-email-m.purski@samsung.com>
 <20170919130944.ldoskrm54tx2oemd@sirena.co.uk>
 <8ac4fa17-43ed-7a4d-d086-6ad81d97900e@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mz7u2bgfyjphaezv"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8ac4fa17-43ed-7a4d-d086-6ad81d97900e@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maciej Purski <m.purski@samsung.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: devicetree@vger.kernel.org


--mz7u2bgfyjphaezv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 19, 2017 at 04:35:54PM +0200, Maciej Purski wrote:

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

> On 09/19/2017 03:09 PM, Mark Brown wrote:

> and from my new function regulator_set_coupled_voltage(). I added this in order to avoid
> code duplication. I agree that the name might not be adequate. What name would you find more suitable?

I think if the single regulator case isn't just a special case of the
multi regulator case then we're doing this wrong and there will be
maintainability problems so I'm not sure if this split makes sense at
all.

> > There's no locking here, and we appear to take no action when these
> > counts change - do we need to bother with this at all?

> Variable enable_count is used for checking if both regulators are enabled and there's a need for
> using the coupling mechanism. It is checked in regulator_set_coupled_voltage_unlocked(), where the
> mutex is already locked. I think that locking it here would be useful. Thanks.

So what happens if one regulator is enabled after the other and the
constraints become unsatisified?

> > > +	/* Get voltages desired by all consumers of the coupled regulator */
> > > +	for (i = 0; i < 2; i++) {

> > It appears we can't couple more than two regulators?

> We can couple just two regulators. We have never found any case for coupling
> more than two regulators. Limiting the mechanism to just two regulators simplifies
> algorithm a little bit. Would you prefer it working for more than two
> regulators also even if there isn't any use case?

It seems cleaner.

--mz7u2bgfyjphaezv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnBLgoACgkQJNaLcl1U
h9BpbAf+O6y+47GMZTUjelTc9NmYcIJ+lgdn62IWxghy2KrjeBBLOuEhk7m3R8FI
8k2eglu/mC4Wl8ydXsjFWecMDJHDqw1L6EzsMbfFKuTk7/PfrRdoHjbugb7Nk1YW
N980oWAsVxQfgY/dZWGllQ/AzXNv6EesImh8/IvJ67/FU5VHmLUHMeQn7gr0LThK
756pkShQWQzhF8UTPvC22PNsxGRWWP43Yapd49sx44f6+DoN7pwUZNjOmu8iTB95
42Sq0hsOiXd7U24jX4MMMn9831z0yJ+LAEBDjm3UMrgAf1SrIIk1m94Cq2Nu2/Td
FJWCjeulQdJY5ZF5e9UTnVubG/Jz+w==
=tuXM
-----END PGP SIGNATURE-----

--mz7u2bgfyjphaezv--
