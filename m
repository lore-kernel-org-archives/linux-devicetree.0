From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 4/5] mfd: arizona: Update DT binding documentation for
 mic detection
Date: Wed, 14 Oct 2015 10:49:03 +0100
Message-ID: <20151014094903.GP14956@sirena.org.uk>
References: <1443803363-3251-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1443803363-3251-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20151007100017.GB12635@sirena.org.uk>
 <20151007122642.GH17172@x1>
 <20151012084554.GB8805@ck-lbox>
 <20151012134309.GE1542@sirena.org.uk>
 <20151013080218.GV17172@x1>
 <20151013151252.GH14956@sirena.org.uk>
 <20151014072812.GE32409@x1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vIXBmblrD40XNCy4"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151014072812.GE32409@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, cw00.choi@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org


--vIXBmblrD40XNCy4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2015 at 08:28:12AM +0100, Lee Jones wrote:
> On Tue, 13 Oct 2015, Mark Brown wrote:
> > On Tue, Oct 13, 2015 at 09:02:18AM +0100, Lee Jones wrote:

> > > Providing Acks should not (and has not to my knowledge) be a binding
> > > contract to continue providing Acks.  However, should more bindings be
> > > submitted which appear as though they are related to a particular
> > > maintainer, then sure, you'll be asked for your expert eye again.

> > It's a bit concerning when it seems like my review is becoming a blocker
> > for something and I don't understand why.

> Not necessarily _your_ review.  Just someone, other than the
> submitter, who I trust and knows about this stuff.  You just happen=20
> to tick those boxes this time.  Cross pollination and knowledge sharing
> is one of the characteristics of MLs which I'm particularly proud of.

That was what it read like.

> > When your power budget is in the low double digit microamps and you're
> > trying to respond promptly and reliably to rapidly changing and variable
> > physical inputs it gets complicated.

> This is exactly why I asked you.

> Thanks for adding structure to my PoV. ;)=20

So, a more specific question would have helped - just a general "any
thoughts" type question isn't very clear.

--vIXBmblrD40XNCy4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWHiUOAAoJECTWi3JdVIfQxgsH/iwa4j3RWO4lUX97zP7QkwnQ
gXxnSR8FvPaHESLYEeQTE85Ky4EObDeUvvjaVLrUZOzM/3PCi8faj2qCxvttVQzd
FNn2CU74+V7Gd4XIEGkY3L+fWgdNEuG5qTdEf0iiYTQblr/B6UOEeBmQKbHTHGC/
KARCYqME5xv6DCIm9CsofNMVf5Oe7n1jTAHaPCOv/m3UbFruxBIlt6e0VLBGDQPJ
OeKwG89uAsqwFr9IIMMkoZlGIEb4TEXkNfdxPgFsbbHpKnKYoeOHU2/7+pEiodrg
wHp0ElA/WTXGsuGmOQSzka5lBDBJyzlh33zjgKqjo/nO2QcqGK+e5rnE+UveGjc=
=NAG3
-----END PGP SIGNATURE-----

--vIXBmblrD40XNCy4--
