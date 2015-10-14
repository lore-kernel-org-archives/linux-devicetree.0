From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 4/5] mfd: arizona: Update DT binding documentation for
 mic detection
Date: Wed, 14 Oct 2015 14:20:50 +0100
Message-ID: <20151014132050.GK32409@x1>
References: <20151007100017.GB12635@sirena.org.uk>
 <20151007122642.GH17172@x1>
 <20151012084554.GB8805@ck-lbox>
 <20151012134309.GE1542@sirena.org.uk>
 <20151013080218.GV17172@x1>
 <20151013151252.GH14956@sirena.org.uk>
 <20151014072812.GE32409@x1>
 <20151014094903.GP14956@sirena.org.uk>
 <20151014123014.GJ32409@x1>
 <20151014130920.GW14956@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151014130920.GW14956@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, cw00.choi@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Wed, 14 Oct 2015, Mark Brown wrote:

> On Wed, Oct 14, 2015 at 01:30:14PM +0100, Lee Jones wrote:
> > On Wed, 14 Oct 2015, Mark Brown wrote:
>=20
> > > > Not necessarily _your_ review.  Just someone, other than the
> > > > submitter, who I trust and knows about this stuff.  You just ha=
ppen=20
> > > > to tick those boxes this time.  Cross pollination and knowledge=
 sharing
> > > > is one of the characteristics of MLs which I'm particularly pro=
ud of.
>=20
> > > That was what it read like.
>=20
> ...
>=20
> > > So, a more specific question would have helped - just a general "=
any
> > > thoughts" type question isn't very clear.
>=20
> > To both comments -- this is how I phrased it:
>=20
> > "I either need an Ack from the DT folks, or at least someone who kn=
ows
> > about this stuff.  Mark perhaps."
>=20
> I'd have expected something that says why you're looking for this -
> something saying what you were unclear on, something more like "It se=
ems
> like there's an awful lot of properties for something that just check=
s
> if a jack".  From the above (especially with the request for the DT
> people to review) it seems like more just a review because there's DT
> properties.

Your perception is not correct.  I always used to ask for a DT review
if there are more than a couple being added.  These days I'm happy to
apply either complex properties, or just ones I'm not 100% on with a
suitable Maintainer Ack.  That continues to be the case.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
