From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/3] ARM: dts: msm8974-hammerhead: Add regulator nodes
 for hammerhead
Date: Mon, 18 Jul 2016 10:11:55 -0700
Message-ID: <20160718171155.GE13516@tuxbot>
References: <20160717105208.9596-1-bshah@kde.org>
 <20160718033425.GB1966@archbox>
 <CAOCOHw5MNN9QAea1gJobpEHpn1S0=CTA3mEHzd+dVhv-GShYdg@mail.gmail.com>
 <1957086.XgnIUz2uOJ@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1957086.XgnIUz2uOJ@wuerfel>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bhushan Shah <bshah@kde.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon 18 Jul 00:44 PDT 2016, Arnd Bergmann wrote:

> On Sunday, July 17, 2016 8:44:01 PM CEST Bjorn Andersson wrote:
> > On Sun, Jul 17, 2016 at 8:34 PM, Bhushan Shah <bshah@kde.org> wrote:
> > > On Sun, Jul 17, 2016 at 09:21:48PM +0200, Arnd Bergmann wrote:
> > >> On Sunday, July 17, 2016 4:22:07 PM CEST Bhushan Shah wrote:
> > >> > +
> > >> > +       smd {
> > >> > +               rpm {
> > >> > +                       rpm_requests {
> > >> > +                               pm8841-regulators {
> > >> > +                                       s1 {
> > >> > +                                               regulator-min-microvolt = <675000>;
> > >> > +                                               regulator-max-microvolt = <1050000>;
> > >> > +                                       };
> > >>
> > >> Maybe add a label at either the rpm_requests or the pm8841-regulators
> > >> node so you can add properties in the leaf nodes withoutout having to
> > >> specify the whole path?
> > >
> > > Sure, I will adjust patch.
> > 
> > Please don't. After running into several cases where this would end us
> > up in having a multitude of nodes each describing just a snippet of
> > each level we decided not to do so in the general case for the
> > Qualcomm boards.
> > 
> > There are a few where we apparently ended up doing so anyways, but for
> > all other cases of regulators we express the full tree in the dts, so
> > please follow that so we don't mix the styles too much.
> 
> Ok, then how about this instead:
> 
> /smd/rpm/rpm_requests/pm8841-regulators {

The problem I have with this is that in the dtsi we have properties and
other nodes under each one of these, hence we end up with completely
different overall structure depending on if I look in the dtsi or the
dts.

The problem I have with it in the dts is that we have properties and
nodes under "smd" and "rpm_requests". So siblings are no longer grouped
together.


I have a hard time finding my way through flattened trees, often spread out
over multiple files, that I need to puzzle together in my head. Perhaps
there are better ways to keep this comprehensible, without maintaining
the structure.

> 	s1 {
> 		regulator-min-microvolt = <675000>;
> 		regulator-max-microvolt = <1050000>;
> 	};
> 
> 	...
> };
> 
> That avoids the ridiculous intendation level but uses no labels.
> 

I do share your dislike of the indentation level.


I do have a few other concerns about style and scalability in other
places. How about we follow how I've done this in the other files for
now (i.e.  keep the structure of the patch as is) and sit down at LAS16
to discuss what to do about this?

Regards,
Bjorn
