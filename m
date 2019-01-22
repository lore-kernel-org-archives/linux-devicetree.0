From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] usb: dwc3: Add avoiding vbus glitch happen during
 xhci reset
Date: Tue, 22 Jan 2019 07:45:07 -0600
Message-ID: <CAL_Jsq+SULX5Y2C1Br+3reUHQ+1xJ=oZbuRBP+QJsEWeRgnuPg@mail.gmail.com>
References: <20190116064820.20007-1-ran.wang_1@nxp.com> <20190116064820.20007-2-ran.wang_1@nxp.com>
 <20190122010310.GA5165@bogus> <AM5PR0402MB286524243DB67DA15AE4EA42F1980@AM5PR0402MB2865.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM5PR0402MB286524243DB67DA15AE4EA42F1980@AM5PR0402MB2865.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ran Wang <ran.wang_1@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 21, 2019 at 8:38 PM Ran Wang <ran.wang_1@nxp.com> wrote:
>
> Hi Rob,
>
> On January 22, 2019 09:03, Rob Herring wrote:
> >
> > On Wed, Jan 16, 2019 at 06:48:06AM +0000, Ran Wang wrote:
> > > When DWC3 is set to host mode by programming register DWC3_GCTL,
> > VUBS
> >
> > s/VUBS/VBUS/
>
> Yes, will fix it in next version.
>
> > > (or its control signal) will on immediately on related Root Hub ports.
> >
> > /will on/will turn on/
>
> Got it. Thanks.
>
> > > Then the VUBS will be de-asserted for a little while during xhci reset
> > > (conducted by xhci driver) for a little while and back to normal.
> > >
> > > This VBUS glitch might cause some USB devices emuration fail if kernel
> > > boot with them connected. One SW workaround which can fix this is to
> > > program all PORTSC[PP] to 0 to turn off VBUS immediately after setting
> > > host mode in DWC3 driver(per signal measurement result, it will be too
> > > late to do it in xhci-plat.c or xhci.c).
> > >
> > > Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> > > ---
> > >  Documentation/devicetree/bindings/usb/dwc3.txt |    3 +++
> > >  1 files changed, 3 insertions(+), 0 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt
> > > b/Documentation/devicetree/bindings/usb/dwc3.txt
> > > index 8e5265e..dadb530 100644
> > > --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> > > +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> > > @@ -106,6 +106,9 @@ Optional properties:
> > >                     When just one value, which means INCRX burst
> > mode enabled. When
> > >                     more than one value, which means undefined length
> > INCR burst type
> > >                     enabled. The values can be 1, 4, 8, 16, 32, 64, 128
> > and 256.
> > > + - snps,avoid-vbus-glitch-when-set-host: Power off all Root Hub ports
> > immediately
> > > +                   after setting host mode to avoid vbus (negative)
> > glitch happen in later
> > > +                   xhci reset. And the vbus will back to 5V automatically
> > when reset done.
> >
> > Can't you imply this from the compatible string. You should have an SoC
> > specific compatible.
>
> Sorry, not quite get your point here? Actually I have discussed with Soc design guys
> and Felipe, it seems to be DWC3 native behavior rather than SoC specific issue.
> https://lkml.org/lkml/2018/11/23/387
> https://lkml.org/lkml/2018/12/12/140
>
> I think there could be 2 reasons why we got no report for a long time till now:
> 1. Most USB devices are not so sensitive to this VBUS glitch, they would works fine.
> 2. A proper VBUS pump circuit design can successfully filter this glitch out. I have
> confirmed this with scope, which means some platforms might resolve issue in
> this way already (some might not, of cause).
>
> > Does this even need to be conditional? What would be the harm in doing
> > this unconditionally for all DWC3 hosts?
>
> From the logic level, I don't see a harm to DWC3 hosts if unconditionally apply this.
> However, since this is not a only solution (can fix it in HW way), I prefer to let it
> controlled by property in DTS node for those questionable board already existing
> in market.

Okay, sounds fine.

I would shorten the name a bit: snps,host-vbus-glitches

Rob
