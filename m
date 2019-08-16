From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v6 4/4] net: phy: realtek: Add LED configuration support
 for RTL8211E
Date: Fri, 16 Aug 2019 15:40:11 -0700
Message-ID: <20190816224011.GY250418@google.com>
References: <20190813191147.19936-1-mka@chromium.org>
 <20190813191147.19936-5-mka@chromium.org>
 <20190816201342.GB1646@bug>
 <20190816212728.GW250418@google.com>
 <31dc724d-77ba-3400-6abe-4cf2e3c2a20a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <31dc724d-77ba-3400-6abe-4cf2e3c2a20a@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 16, 2019 at 03:12:47PM -0700, Florian Fainelli wrote:
> On 8/16/19 2:27 PM, Matthias Kaehlcke wrote:
> > On Fri, Aug 16, 2019 at 10:13:42PM +0200, Pavel Machek wrote:
> >> On Tue 2019-08-13 12:11:47, Matthias Kaehlcke wrote:
> >>> Add a .config_led hook which is called by the PHY core when
> >>> configuration data for a PHY LED is available. Each LED can be
> >>> configured to be solid 'off, solid 'on' for certain (or all)
> >>> link speeds or to blink on RX/TX activity.
> >>>
> >>> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> >>
> >> THis really needs to go through the LED subsystem,
> > 
> > Sorry, I used what get_maintainers.pl threw at me, I should have
> > manually cc-ed the LED list.
> > 
> >> and use the same userland interfaces as the rest of the system.
> > 
> > With the PHY maintainers we discussed to define a binding that is
> > compatible with that of the LED one, to have the option to integrate
> > it with the LED subsystem later. The integration itself is beyond the
> > scope of this patchset.
> > 
> > The PHY LED configuration is a low priority for the project I'm
> > working on. I wanted to make an attempt to upstream it and spent
> > already significantly more time on it than planned, if integration
> > with the LED framework now is a requirement please consider this
> > series abandonded.
> 
> While I have an appreciation for how hard it can be to work in a
> corporate environment while doing upstream first and working with
> virtually unbounded goals (in time or scope) due to maintainers and
> reviewers, that kind of statement can hinder your ability to establish
> trust with peers in the community as it can be read as take it or leave it.

I'm really just stating the reality here. We strongly prefer landing
patches upstream over doing custom hacks, and depending on the
priority of a given feature/sub-system and impact on schedule we can
allocate more time on it or less. In some cases/at some point a
downstream patch is just good enough.

I definitely don't intend to get a patchset landed if it isn't deemed
ready or suitable at all. In this case I just can't justify to spend
significantly more time on it. IMO it is better to be clear on this,
not to pressure maintainers to take a patch, but so people know what
to expect. This information can also help if someone comes across this
patchset in the future and wonders about its status.

btw, a birdie told me there will be a talk next week at ELC in San
Diego on how Chrome OS works with upstream, discussing pros and
cons for both the project and upstream. For those who are intersted
in the topic but can't make it to the conference, the slides are
already online and IMO have good information:
https://static.sched.com/hosted_files/ossna19/9c/ELC19_ChromeOSAndUpstream.pdf

Cheers

Matthias
