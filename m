From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 4/5] mfd: arizona: Update DT binding documentation for
 mic detection
Date: Tue, 13 Oct 2015 16:12:52 +0100
Message-ID: <20151013151252.GH14956@sirena.org.uk>
References: <1443803363-3251-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1443803363-3251-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20151007100017.GB12635@sirena.org.uk>
 <20151007122642.GH17172@x1>
 <20151012084554.GB8805@ck-lbox>
 <20151012134309.GE1542@sirena.org.uk>
 <20151013080218.GV17172@x1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lrvsYIebpInmECXG"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151013080218.GV17172@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, cw00.choi@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org


--lrvsYIebpInmECXG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 13, 2015 at 09:02:18AM +0100, Lee Jones wrote:
> On Mon, 12 Oct 2015, Mark Brown wrote:
> > On Mon, Oct 12, 2015 at 09:45:54AM +0100, Charles Keepax wrote:

> > > I am guessing Mark is slightly hesitant to ack as he probably
> > > doesn't want to add reviewing all our jack detection bindings to
> > > his already fairly sizable work load and doing so here likely
> > > means it will be expected in the future. From talking to people at

> Providing Acks should not (and has not to my knowledge) be a binding
> contract to continue providing Acks.  However, should more bindings be
> submitted which appear as though they are related to a particular
> maintainer, then sure, you'll be asked for your expert eye again.

It's a bit concerning when it seems like my review is becoming a blocker
for something and I don't understand why.

> > Pretty much (plus generally being busy at ELC-E last week) - if there's
> > specific questions that's one thing but if it's just general requests to
> > look at bindings then it seems like the relevant subsystem maintainers

> This is exactly my point.  I am not the 'relevant subsystem
> maintainer' for these properties and subsequently know nothing of
> microphone detection, headsets, bias', etc.  These look like Audio
> related properties to me (the uninitiated), which is why you were
> asked.

They're extcon things (and there are accompanying driver changes to the
extcon driver parsing them).

> > should have the confidence to review straightfoward device properties
> > like this.

> I don't think these bindings are particularly straightforward.  The
> contain many terms which I'm unfamiliar with, and again, to me (the
> uninitiated) this looks like way too many bindings just to see if an
> audio jack is plugged in or not.

When your power budget is in the low double digit microamps and you're
trying to respond promptly and reliably to rapidly changing and variable
physical inputs it gets complicated.

--lrvsYIebpInmECXG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWHR9zAAoJECTWi3JdVIfQLMMH/1QA8kn4M1b+kYlGr2ypFfma
tbYbN6oP7JHJSxlaKe3ueWem3gGKDQdnS3l/2WIGp2H0DPm4emMkyyvRJHj8iQYU
4SOZjsjkBeQubbXhEN2QdGDQ0Hsc0rqbFiCjoLS3rmWVO+Kvqpkvthkdg6MgKrnw
jEi7WI8OW5l6otiZUR7eSsmhPK4niY3rxhiapWKcFefDyhQWmAgibWQA+DZ0b170
KjWUA2zT8gZ8CZHWBoYLG7KJDdJl+xD6Nr55GRh1mTKq/BfoNilrlQ9b2p113UoN
OD9LOFGfjXtyZN3NUVI+JDPhKzZbcKw8m+3XO250+hES+RabYy//WYw/Nh3HznM=
=9c3y
-----END PGP SIGNATURE-----

--lrvsYIebpInmECXG--
