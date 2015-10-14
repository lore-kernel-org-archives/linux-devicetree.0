From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 4/5] mfd: arizona: Update DT binding documentation for
 mic detection
Date: Wed, 14 Oct 2015 08:28:12 +0100
Message-ID: <20151014072812.GE32409@x1>
References: <1443803363-3251-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1443803363-3251-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20151007100017.GB12635@sirena.org.uk>
 <20151007122642.GH17172@x1>
 <20151012084554.GB8805@ck-lbox>
 <20151012134309.GE1542@sirena.org.uk>
 <20151013080218.GV17172@x1>
 <20151013151252.GH14956@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151013151252.GH14956@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, cw00.choi@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Tue, 13 Oct 2015, Mark Brown wrote:
> On Tue, Oct 13, 2015 at 09:02:18AM +0100, Lee Jones wrote:
> > On Mon, 12 Oct 2015, Mark Brown wrote:
> > > On Mon, Oct 12, 2015 at 09:45:54AM +0100, Charles Keepax wrote:
>=20
> > > > I am guessing Mark is slightly hesitant to ack as he probably
> > > > doesn't want to add reviewing all our jack detection bindings t=
o
> > > > his already fairly sizable work load and doing so here likely
> > > > means it will be expected in the future. From talking to people=
 at
>=20
> > Providing Acks should not (and has not to my knowledge) be a bindin=
g
> > contract to continue providing Acks.  However, should more bindings=
 be
> > submitted which appear as though they are related to a particular
> > maintainer, then sure, you'll be asked for your expert eye again.
>=20
> It's a bit concerning when it seems like my review is becoming a bloc=
ker
> for something and I don't understand why.

Not necessarily _your_ review.  Just someone, other than the
submitter, who I trust and knows about this stuff.  You just happen=20
to tick those boxes this time.  Cross pollination and knowledge sharing
is one of the characteristics of MLs which I'm particularly proud of.

> > > Pretty much (plus generally being busy at ELC-E last week) - if t=
here's
> > > specific questions that's one thing but if it's just general requ=
ests to
> > > look at bindings then it seems like the relevant subsystem mainta=
iners
>=20
> > This is exactly my point.  I am not the 'relevant subsystem
> > maintainer' for these properties and subsequently know nothing of
> > microphone detection, headsets, bias', etc.  These look like Audio
> > related properties to me (the uninitiated), which is why you were
> > asked.
>=20
> They're extcon things (and there are accompanying driver changes to t=
he
> extcon driver parsing them).

Yes, I'm aware of that now.  Hence the "(uninitiated)" part.

> > > should have the confidence to review straightfoward device proper=
ties
> > > like this.
>=20
> > I don't think these bindings are particularly straightforward.  The
> > contain many terms which I'm unfamiliar with, and again, to me (the
> > uninitiated) this looks like way too many bindings just to see if a=
n
> > audio jack is plugged in or not.
>=20
> When your power budget is in the low double digit microamps and you'r=
e
> trying to respond promptly and reliably to rapidly changing and varia=
ble
> physical inputs it gets complicated.

This is exactly why I asked you.

Thanks for adding structure to my PoV. ;)=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
