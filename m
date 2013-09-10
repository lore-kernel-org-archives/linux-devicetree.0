From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] regulator: core: add support for configuring turn-on
 time through constraints
Date: Tue, 10 Sep 2013 17:33:58 +0100
Message-ID: <20130910163358.GP29403@sirena.org.uk>
References: <1378811888-2268-1-git-send-email-ldewangan@nvidia.com>
 <1378811888-2268-2-git-send-email-ldewangan@nvidia.com>
 <20130910120922.GH29403@sirena.org.uk>
 <522F1B40.3040801@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7316+HbuJYr43y0H"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <522F1B40.3040801@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "rob@landley.net" <rob@landley.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>
List-Id: devicetree@vger.kernel.org


--7316+HbuJYr43y0H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 10, 2013 at 06:44:40PM +0530, Laxman Dewangan wrote:

> Here my intention for turn-on time is the time from OFF state to ON
> state and the ON voltage settled on this time.
> This time is separate from underlying enable time of the device i.e.
> will not get added.
> We observe in some of platform that some of regulator is taking more
> time than time given as per datasheet.
> Yes, completely agree that this is not the data provided normally,
> just we observe on scope that some of platform shows  more than the
> datasheet value and hence this patch.

So, put this in the binding document then! :P  This was more a request
to improve the detail in the binding than anything else.

--7316+HbuJYr43y0H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSL0nzAAoJELSic+t+oim9Pn4QAJMFmNplzGJv7Q8YhCrxFVZy
dUdM43gvzYZD+mJPclyWNFJaGg4aQWAFUCFxhaHC+A8i2J13XpyJtjh9DHpu5u7S
EQvY1B49uP4J/79RgClQzpAcwKjJ8evpsFzn+r7e5p+5NFcG8t6sFBAT2JSB2v/7
SxzAxWtODQWswY/NIeFL/KsPkNfJM8IUtcgq4pEa7e2LAIYR2vOby8Eg5KQgN+s7
54ayDo2qyroeoZnrNQTrTUYlSgX/cGYcKugK8yZhjc3Lb14OUoIQwIuPRmGkJEj9
SyfqG4zf3cJ/igXMIjn4VOJz0RZMXgT2LkrEJYrmqXk3pat3tuA2TL8Cx0wgfIV0
Bu3ViNknIuDWO7GHWPG3rQzIcu9lsYq2ATmObEQvD5D8AgI4K4uGgbuhtlGH/1kL
qOX2PapH7mslhHu4CogY6MTD9Al2j8X24jlMwNt+kj+Mho2dDJYMuLSBdao5nlNx
/TlAfFggYj3qPZyKBNe9AOPfnLAVAe/AjBmodW58dY1TkRaK5bsO/u+6e18X0/Kj
yS3s6yX9DZiCy2vvYxEsr3pjjipBrAytr1GLj4KCttrf+Bmr5qfm/AmZ7kZ4z2V6
t/hkpW8NZRKAIfR/xvj/b8xC55thiaBYtvt45c7JLFtK0lN6TXllfaJNY/b4uOof
5TRfPzsNB7m55TdEKwf9
=tVsN
-----END PGP SIGNATURE-----

--7316+HbuJYr43y0H--
