From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v5 00/10] Renesas RZ/A1 pin and gpio controller
Date: Fri, 28 Apr 2017 09:31:30 +0200
Message-ID: <20170428073129.GF10196@verge.net.au>
References: <1493281194-5200-1-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdWw1JpFLT0QY4yQK6VH0oSeQOHUWMuKFSj6b6vrhHPCdA@mail.gmail.com>
 <20170428072457.GA4911@w540>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170428072457.GA4911@w540>
Sender: linux-gpio-owner@vger.kernel.org
To: jmondi <jacopo@jmondi.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 28, 2017 at 09:24:57AM +0200, jmondi wrote:
> Hi Geert, Simon,
> 
> On Thu, Apr 27, 2017 at 10:42:02AM +0200, Geert Uytterhoeven wrote:
> > Hi Jacopo,
> >
> > On Thu, Apr 27, 2017 at 10:19 AM, Jacopo Mondi
> > <jacopo+renesas@jmondi.org> wrote:
> > >    this is 5th round of gpio/pincontroller for RZ/A1 devices.
> > >
> > > I have updated the pin controller driver to use the newly introduced
> > > "pinctrl_enable()" function.
> > > This is required since v4.11-rc7 as otherwise, as reported by Chris Brandt,
> > > the pin controller does not start.
> > >
> > > I have incorporated your comments on the device tree bindings documentation,
> > > and added to pinctrl-generic.h header file two macros to unpack generic
> > > properties and their arguments.
> > >
> > > Tested with SCIF, RIIC, ETHER and gpio-leds on Genmai board.
> >
> > Thanks for the update!
> >
> > > Jacopo Mondi (10):
> > >   pinctrl: generic: Add bi-directional and output-enable
> >
> > Already applied by LinusW.
> >
> > >   pinctrl: generic: Add macros to unpack properties
> >
> > LinusW: do you want me to queue this together with the driver for v4.13,
> > or will you take this single patch for v4.12?
> >
> > >   pinctrl: Renesas RZ/A1 pin and gpio controller
> > >   dt-bindings: pinctrl: Add RZ/A1 bindings doc
> >
> > Will queue in sh-pfc-for-v4.13.
> >
> > >   arm: dts: dt-bindings: Add Renesas RZ/A1 pinctrl header
> > >   arm: dts: r7s72100: Add pin controller node
> > >   arm: dts: genmai: Add SCIF2 pin group
> > >   arm: dts: genmai: Add RIIC2 pin group
> > >   arm: dts: genmai: Add user led device nodes
> > >   arm: dts: genmai: Add ethernet pin group
> >
> > These are for Simon.
> >
> > Does applying the DTS changes before the driver introduce regressions?
> > If no, Simon can queue them for v4.13.
> > If yes, they'll have to wait for v4.14.
> >
> 
> I tried reverting patch [03/10] which introduces the driver, and I
> lose serial output on Genmai. So I guess the dts patches have to be
> taken after the driver has been merged.
> 
> One question: why can't they be taken at the same time? (eg. for
> v4.13?)

The problem is that the changes go through different trees. It may,
however, be possible to arrange for both sets of changes to go into v4.13
by negotiating with the ARM-SoC maintainers.
