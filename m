From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 3/5] clk: lochnagar: Add support for the Cirrus Logic
 Lochnagar
Date: Thu, 11 Oct 2018 15:54:22 +0100
Message-ID: <20181011145422.GG25351@sirena.org.uk>
References: <20181008132542.19775-1-ckeepax@opensource.cirrus.com>
 <20181008132542.19775-3-ckeepax@opensource.cirrus.com>
 <153924124658.207691.10370075148426001371@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="df+09Je9rNq3P+GE"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <153924124658.207691.10370075148426001371@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, lee.jones@linaro.org, linus.walleij@linaro.org, mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--df+09Je9rNq3P+GE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 11, 2018 at 12:00:46AM -0700, Stephen Boyd wrote:
> Quoting Charles Keepax (2018-10-08 06:25:40)

> > +struct lochnagar_regmap_clk {
> > +       unsigned int cfg_reg;
> > +       unsigned int ena_mask;
> > +       unsigned int dir_mask;
> > +
> > +       unsigned int src_reg;
> > +       unsigned int src_mask;

> Are these 32 bits or 16 bits or 8 bits? Please use a u32/u16/u8 so we
> know the register width.

Note that regmap always uses unsigned int to represent registers
regardless of the underlying physical register width, this can be an
issue on reads since we pass the destination for the read in by address.

> > +struct lochnagar_clk_priv {
> > +       struct device *dev;
> > +       struct lochnagar *lochnagar;

> Is this used for anything besides getting the regmap? Can you get the
> pointer to the parent in probe and use that to get the regmap pointer
> from dev_get_remap() and also use the of_node of the parent to register

dev_get_regmap() is pretty expensive, I'd not advise using it in
anything that might approximate a fast path.  It's kind of debatable
when I2C gets involved but still feels wrong.

--df+09Je9rNq3P+GE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlu/ZB4ACgkQJNaLcl1U
h9DNJAf9EKHrofZgBKsBnywuSARMnN1WAY1k6GAd/yVMp1Ri4P1CQ5MtrBdFEHce
IAGb09TNUUTrfG0VudexTn7YEc8zi/hZ7kNBFD383zkAlgyP2y3LRZRCftvgITOd
KvgC4yxNVD9exrB1T/WhZh7q9rxv7qwpZwvIOfYzO+vxAtxuAvaTJk+tfKOHSi2H
20kFHKH3BgbtZYucNSlh9spFqIwT2HP7H27TFWbfDd34Gbg4f/9VeKIrtDlEFbTb
EXfwpQasMEEBFv4SBJ056jPvDIzhxCZy7b7afuSbgwdjfWzfcaeS7MoqdaOVX1Ci
ekUtnCdiZ+ujH8ekjSWAEuDFjrs2GA==
=uWfp
-----END PGP SIGNATURE-----

--df+09Je9rNq3P+GE--
