From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 4/4] regulator: qcom: Rework to single platform device
Date: Thu, 5 Mar 2015 10:38:10 +0000
Message-ID: <20150305103810.GF21293@sirena.org.uk>
References: <1425356740-26285-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1425356740-26285-5-git-send-email-bjorn.andersson@sonymobile.com>
 <54F75E8F.2070900@codeaurora.org>
 <20150305003004.GZ21293@sirena.org.uk>
 <54F7B571.7090705@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="syq6tW4XVuu5QJRy"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54F7B571.7090705@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@codeaurora.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--syq6tW4XVuu5QJRy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 04, 2015 at 05:46:25PM -0800, Stephen Boyd wrote:
> On 03/04/15 16:30, Mark Brown wrote:
> > On Wed, Mar 04, 2015 at 11:35:43AM -0800, Stephen Boyd wrote:

> > Dependency resolution isn't anything new, I'm not sure why you think
> > this is related to of_parse_cb()?  Open coding does exactly the same

> I was just using of_parse_cb to indicate the difference from
> of_regulator_match(). I could have said "between your design and my design".

Please do things like that - it makes things harder to follow if people
throw in random unrelated terms for things.

> > of.  There was a proposal quite recently from someone at Samsung Poland
> > to do something more coreish and basically split registrations in two,
> > one half registering the things needed for each resource and then a
> > second half which runs once the required resources are registered.
> > Pushing that along might be best, it's a more general approach.  The
> > component stuff Russell did has some similarities here.

> Ah you're talking about the res track stuff[1]? That patchset seemed to
> be doing a *lot* of different stuff where probe defer was just a part of
> it. Frmo what I recall that still operates on the device level, where
> here we want to be able to say that a particular regulator needs another
> resource, but it's ok to register it's sibling regulator within this
> device because that regulator doesn't need anything. Are you saying you
> want the restrack stuff to work at the regulator level? If we went that
> way we could do the same thing in the clock framework and get rid of the
> orphan list and rely on the notifications from restrack to figure out
> when a clock resource becomes fully available.

Yes, that's it.  It's not quite the same thing as registering individual
resources and there are definite issues to be addressed but I think it's
a promising approach for addressing the deferred probe problem in a more
elegant way.

--syq6tW4XVuu5QJRy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU+DIRAAoJECTWi3JdVIfQs+4H/2MM5nXmE8VST/7J/TrSjZ0X
RNb/h8y+e9SuJ335TfXR9JyGDG4SZzj+DzJQf3h9Zumuw60j8Qd67VYWTmg2P+Ix
hkGorNYDFcWGz6YW589KVPk/FwZzX0b6YXFzNWbGL73FddXbEy/R3JUQ8nE3xdik
rP4wiQSf0FX8EnjaUQ43+ZjnVt2mKb39HeHHBf9iF/ONpd0KGyRIc1TBXMYgTkpZ
SPfoutIlOu5OkHw9bKQASWFxfNjvXIS5aric7M6MuaDBy5QPpO4LCopqW7L5CBkw
N4OfwCR6ixwNNXMsbyDCtjew92tmPgQmd38LJTPgnXr1i874xg7HjS5UJIuhKtE=
=xuKY
-----END PGP SIGNATURE-----

--syq6tW4XVuu5QJRy--
