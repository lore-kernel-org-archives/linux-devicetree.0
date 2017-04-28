From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: dts: r7s72100: add usb clocks to device tree
Date: Fri, 28 Apr 2017 17:39:30 +0200
Message-ID: <20170428153927.GA21522@verge.net.au>
References: <20170427191045.21199-1-chris.brandt@renesas.com>
 <CAMuHMdXEtefpaUJbbJ7LYjYR2oHaE-epy=eZnAyE-+=GWsy9xg@mail.gmail.com>
 <20170428080400.GI10196@verge.net.au>
 <SG2PR06MB1165D398BD7100FAC5AAEDC68A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdXp75yepEMh-S0YNYqKRESb4m3DtcfG09x=uj1Fm51b_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdXp75yepEMh-S0YNYqKRESb4m3DtcfG09x=uj1Fm51b_A@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Brandt <Chris.Brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 28, 2017 at 04:27:45PM +0200, Geert Uytterhoeven wrote:
> Hi Chris,
> 
> On Fri, Apr 28, 2017 at 2:47 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> > On Friday, April 28, 2017, Simon Horman wrote:
> >> On Fri, Apr 28, 2017 at 09:34:54AM +0200, Geert Uytterhoeven wrote:
> >> > On Thu, Apr 27, 2017 at 9:10 PM, Chris Brandt <chris.brandt@renesas.com>
> >> wrote:
> >> > > This adds the USB0 and USB1 clocks to the device tree.
> 
> >> > Simon: see Section 29.3.2 (BUSWAIT) for the reference to the P1 clock.
> >>
> >> Thanks, I see that now.
> >
> > I was going to say that I simply look at sections:
> >   6.10.6 Internal Clock Signals (1)
> >   6.10.7 Internal Clock Signals (2)
> >
> > Because it lists all the IP blocks and their corresponding clock sources in one place.
> 
> Cool, I grew up with rev. 0.60 of the user manual, so I wasn't aware of
> that secton.

Thanks, now I'm not looking at 0.60 any more I see the sections Chris
mentions too.
