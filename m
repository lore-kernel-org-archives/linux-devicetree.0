From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 2/5] mfd: lochnagar: Add support for the Cirrus Logic
 Lochnagar
Date: Thu, 1 Nov 2018 12:01:32 +0000
Message-ID: <20181101120132.GB6425@sirena.org.uk>
References: <20181008132542.19775-2-ckeepax@opensource.cirrus.com>
 <20181025074459.GF4939@dell>
 <20181025082621.GD16508@imbe.wolfsonmicro.main>
 <b2f85f45-cbe9-5a27-e9e8-ad28f2bd9bd6@opensource.cirrus.com>
 <20181025114205.GC4870@dell>
 <33ea391c-aa6e-2709-6faf-4905e84229e4@opensource.cirrus.com>
 <20181026080051.GK4870@dell>
 <20181026203223.GC27137@sirena.org.uk>
 <20181029110439.GS4870@dell>
 <20181101102828.GM16508@imbe.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181101102828.GM16508@imbe.wolfsonmicro.main>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Lee Jones <lee.jones@linaro.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, mturquette@baylibre.com, sboyd@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 01, 2018 at 10:28:28AM +0000, Charles Keepax wrote:

>      1.2) Read all the registers from the device on boot
>           + Uses less memory
>           - Potentially very slow boot time
>      1.3) Only read values as you touch registers
>           + Uses less memory
>           + Usually no significant impact on boot time
>           - Can't do read or read/write/modify operations on
>             previously untouched registers whilst chip is off

Both of these options also require that you be able to reset the device
which isn't possible with all devices and systems.

> I think this really the crux of my concerns here about updating
> the regmap API are that it feels like almost any path we take
> from here results in worse runtime performance and probably
> equal or worse memory usage. In return we gain a reduction of
> some, whilst admittedly large, very simple data tables from
> the driver. Which is a trade it feels hard to get invested in.

Right, I don't see an urgent problem either - if the tables were
complicated to think about it'd be a bit different but they aren't
particularly and like you say there's tradeoffs both at runtime and
at development time for trying to make the source code smaller.

Equally if there are useful things we can add to the API for some use
cases I'm all for that so long as they don't get in the way of other
users, most of the extensions in the API have come from someone having
problems and coming up with a fix that meets their needs.

--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlva6xsACgkQJNaLcl1U
h9AUYwf+IUmDzPcdlodvzcs+ZOUhcBjC7S/MICFtj7twgXZi+BO5NgW1PaM8h7Lf
AS37zt9SaHAuEIiSjUMx4NCrVxyJde5vXCIpTgMSZDtcRcIkZupkoXhK7Wsugdou
gNPlXZTCn05PUocMgD+krPxt82X5mvaFwIQN82YATqZ35FAdGGAX60r+aJUIfqdQ
Qdk0TpfiAbbigxC9r440lOdx0SD96GNrOhNF8bpF97AyGUQbwDMrgDWMxYewjxKI
hdY8rsQjteyNl9OrD8efCfTsMzdv3Oc+ttdOqWuC7sLtEO60FCvwUWc48cDw1KOl
oKDtYPqeEHWjNjT6JMzsjsrH8w2FqQ==
=w1Pu
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--
