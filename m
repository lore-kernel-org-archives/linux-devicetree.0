From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v6 4/4] net: phy: realtek: Add LED configuration support
 for RTL8211E
Date: Mon, 26 Aug 2019 11:40:20 -0700
Message-ID: <20190826184020.GA70797@google.com>
References: <20190813191147.19936-1-mka@chromium.org>
 <20190813191147.19936-5-mka@chromium.org>
 <20190816201342.GB1646@bug>
 <20190816212728.GW250418@google.com>
 <31dc724d-77ba-3400-6abe-4cf2e3c2a20a@gmail.com>
 <CAD=FV=WvWjcVX1YNxKsi_TmJP6vdBZ==bYOVGs2VjUqVhEjpuA@mail.gmail.com>
 <f1fd7aba-b36f-8cc4-9ed7-9977c0912b9d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f1fd7aba-b36f-8cc4-9ed7-9977c0912b9d@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Doug Anderson <dianders@chromium.org>, Pavel Machek <pavel@ucw.cz>, "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 23, 2019 at 12:58:09PM -0700, Florian Fainelli wrote:
> On 8/16/19 3:39 PM, Doug Anderson wrote:
> > Hi,
> > 
> > On Fri, Aug 16, 2019 at 3:12 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
> >>
> >> On 8/16/19 2:27 PM, Matthias Kaehlcke wrote:
> >>> On Fri, Aug 16, 2019 at 10:13:42PM +0200, Pavel Machek wrote:
> >>>> On Tue 2019-08-13 12:11:47, Matthias Kaehlcke wrote:
> >>>>> Add a .config_led hook which is called by the PHY core when
> >>>>> configuration data for a PHY LED is available. Each LED can be
> >>>>> configured to be solid 'off, solid 'on' for certain (or all)
> >>>>> link speeds or to blink on RX/TX activity.
> >>>>>
> >>>>> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> >>>>
> >>>> THis really needs to go through the LED subsystem,
> >>>
> >>> Sorry, I used what get_maintainers.pl threw at me, I should have
> >>> manually cc-ed the LED list.
> >>>
> >>>> and use the same userland interfaces as the rest of the system.
> >>>
> >>> With the PHY maintainers we discussed to define a binding that is
> >>> compatible with that of the LED one, to have the option to integrate
> >>> it with the LED subsystem later. The integration itself is beyond the
> >>> scope of this patchset.
> >>>
> >>> The PHY LED configuration is a low priority for the project I'm
> >>> working on. I wanted to make an attempt to upstream it and spent
> >>> already significantly more time on it than planned, if integration
> >>> with the LED framework now is a requirement please consider this
> >>> series abandonded.
> >>
> >> While I have an appreciation for how hard it can be to work in a
> >> corporate environment while doing upstream first and working with
> >> virtually unbounded goals (in time or scope) due to maintainers and
> >> reviewers, that kind of statement can hinder your ability to establish
> >> trust with peers in the community as it can be read as take it or leave it.
> > 
> > You think so?  I feel like Matthias is simply expressing the reality
> > of the situation here and I'd rather see a statement like this posted
> > than the series just silently dropped.  Communication is good.
> > 
> > In general on Chrome OS we don't spent lots of time tweaking with
> > Ethernet and even less time tweaking with Ethernet on ARM boards where
> > you might need a binding like this, so it's pretty hard to justify up
> > the management chain spending massive amounts of resources on it.  In
> > this case we have two existing ARM boards which we're trying to uprev
> > from 3.14 to 4.19 which were tweaking the Ethernet driver in some
> > downstream code.  We thought it would be nice to try to come up with a
> > solution that could land upstream, which is usually what we try to do
> > in these cases.
> > 
> > Normally if there is some major architecture needed that can't fit in
> > the scope of a project, we would do a downstream solution for the
> > project and then fork off the task (maybe by a different Engineer or a
> > contractor) to get a solution that can land upstream.  ...but in this
> > case it seems hard to justify because it's unlikely we would need it
> > again anytime remotely soon.
> > 
> > So I guess the alternatives to what Matthias did would have been:
> > 
> > A) Don't even try to upstream.  Seems worse.  At least this way
> > there's something a future person can start from and the discussion is
> > rolling.
> > 
> > B) Keep spending tons of time on something even though management
> > doesn't want him to.  Seems worse.
> > 
> > C) Spend his nights and weekends working on this.  Seems worse.
> > 
> > D) Silently stop working on it without saying "I'm going to stop".  Seems worse.
> > 
> > ...unless you have a brilliant "E)" I think what Matthias did here is
> > exactly right.
> 
> I must apologize for making that statement since it was not fair to
> Matthias, and he has been clear about how much time he can spend on that
> specific, please accept my apologies for that.
> 
> Having had many recent encounters with various people not driving
> projects to completion lately (not specifically within Linux), it looks
> like I am overly sensitive about flagging words and patch status that
> may fall within that lexicon. The choice of word is what triggered me.

No worries, I understand that it can be frustrating if you repeatedly
experience that projects remain unfinished.

Hopefully this series can be revived eventually when somebody finds
the time to work on the integration with the LED framework.
