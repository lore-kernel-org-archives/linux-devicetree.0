From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 4/5] mfd: arizona: Update DT binding documentation for
 mic detection
Date: Tue, 13 Oct 2015 15:18:22 +0100
Message-ID: <20151013141822.GC32409@x1>
References: <1443803363-3251-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20151007100017.GB12635@sirena.org.uk>
 <20151007122642.GH17172@x1>
 <20151012084554.GB8805@ck-lbox>
 <20151012134309.GE1542@sirena.org.uk>
 <20151013080218.GV17172@x1>
 <20151013121450.GD8805@ck-lbox>
 <20151013135053.GB32409@x1>
 <561D0E4C.4010205@samsung.com>
 <561D10A6.7040504@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <561D10A6.7040504@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Mark Brown <broonie@kernel.org>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Tue, 13 Oct 2015, Chanwoo Choi wrote:
> On 2015=EB=85=84 10=EC=9B=94 13=EC=9D=BC 22:59, Chanwoo Choi wrote:
> > On 2015=EB=85=84 10=EC=9B=94 13=EC=9D=BC 22:50, Lee Jones wrote:
> >> On Tue, 13 Oct 2015, Charles Keepax wrote:
> >>
> >>> On Tue, Oct 13, 2015 at 09:02:18AM +0100, Lee Jones wrote:
> >>>> On Mon, 12 Oct 2015, Mark Brown wrote:
> >>>>
> >>>>> On Mon, Oct 12, 2015 at 09:45:54AM +0100, Charles Keepax wrote:
> >>>>>> On Wed, Oct 07, 2015 at 01:26:42PM +0100, Lee Jones wrote:
> >>>>>>> On Wed, 07 Oct 2015, Mark Brown wrote:
> >>>>>
> >>>>>>>> This all seems pretty much fine to me - the things it is con=
trolling are
> >>>>>>>> fairly specific to the way the former Wolfson devices do, th=
ey only
> >>>>>>>> really make sense with a fairly particular algorithm which i=
sn't widely
> >>>>>>>> implemented.
> >>>>>
> >>>>>>> Is that an Ack?
> >>>>>
> >>>>>> I am guessing Mark is slightly hesitant to ack as he probably
> >>>>>> doesn't want to add reviewing all our jack detection bindings =
to
> >>>>>> his already fairly sizable work load and doing so here likely
> >>>>>> means it will be expected in the future. From talking to peopl=
e at
> >>>>
> >>>> Providing Acks should not (and has not to my knowledge) be a bin=
ding
> >>>> contract to continue providing Acks.  However, should more bindi=
ngs be
> >>>> submitted which appear as though they are related to a particula=
r
> >>>> maintainer, then sure, you'll be asked for your expert eye again=
=2E
> >>>
> >>> Its not a binding contract to continue providing them but we are
> >>> making that a condition of merging any patches, which means I
> >>> will need to chase Mark for Acks, as it seems the DT maintainers
> >>> won't have any interest in reviewing/acking these.
> >>
> >> I've already made it a condition, as I refuse to blindly accept
> >> unknown bindings.  Taking a sea of bindings I have no knowledge of
> >> would be a bad-thing(tm).  If these were GPIO bindings, I'd be ask=
ing
> >> Linus for help, likewise if they were I2C, I'd be asking Wolfram.
> >>
> >>>>> Pretty much (plus generally being busy at ELC-E last week) - if=
 there's
> >>>>> specific questions that's one thing but if it's just general re=
quests to
> >>>>> look at bindings then it seems like the relevant subsystem main=
tainers
> >>>>
> >>>> This is exactly my point.  I am not the 'relevant subsystem
> >>>> maintainer' for these properties and subsequently know nothing o=
f
> >>>> microphone detection, headsets, bias', etc.  These look like Aud=
io
> >>>> related properties to me (the uninitiated), which is why you wer=
e
> >>>> asked.
> >>>
> >>> It would be sensible I guess to define whether I should be
> >>> including audio people on jack detection patches even if they
> >>> don't touch audio subsystems. I was treating jack detection
> >>> as an extcon thing and thus assuming that the extcon maintainer
> >>> would be sufficient, but perhaps that is an incorrect assumption.
> >>
> >> Now I know that jack detection is an Extcon thing and Extcon Ack w=
ill
> >> do just nicely.  However, that begs the question; if they are an
> >> Extcon thing, why aren't they in the Extcon binding document?
> >=20
> > As I knew, the arizona-extcon is one device of the MFD devices=20
> > for WMxxxx series in the driver/mfd/arizona-core.c. So, If arizona-=
extcon
> > driver needs the some property for dt support, some property should=
 be
> > included in MFD device tree node. There is no separate device tree =
node for
> > arizona-extcon driver.
>=20
> If creating the separate extcon doc for extcon-arizona.c driver, it i=
s possible
> to make the child device tree node which is located at the below of a=
rizona MFD
> device tree node.
>=20
> I agree about Lee's opinion to make the separate the Extcon doc for e=
xtcon-arizona.c.

This is how we normally document MFDs.  Extcon doesn't even need to
have it's own child-node (it can if you want though -- it's however
you want to represent it), you can just put something like this in the
MFD binding doc:

Optional properties
this		: Does this
that		: Does that

Also any child device specific property:
	GPIO    See: ../extcon/arizona.txt
	Extcon  See: ../gpio/arizona.txt

Etc.  Or words to that effect.  See some other MFDs for examples.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
