From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: dwc2: Document quirk to reset
 PHY upon wakeup
Date: Tue, 30 Apr 2019 08:51:43 -0500
Message-ID: <CAL_JsqJGMBhqRw0D9ehsV=A7cQ4cPah=Ot335npraBdGm1Yhag@mail.gmail.com>
References: <20190416215351.242246-1-dianders@chromium.org>
 <20190416215351.242246-2-dianders@chromium.org> <20190430005357.GA13695@bogus>
 <CAD=FV=V3_NcBHdg5A8LvGMoVd_eLN0q=pXo_3f2GCdi5u2GP-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=V3_NcBHdg5A8LvGMoVd_eLN0q=pXo_3f2GCdi5u2GP-Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Minas Harutyunyan <hminas@synopsys.com>, Heiko Stuebner <heiko@sntech.de>, Felipe Balbi <felipe.balbi@linux.intel.com>, Alexandru M Stan <amstan@chromium.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Linux USB List <linux-usb@vger.kernel.org>, Randy Li <ayaka@soulik.info>, Matthias Kaehlcke <mka@chromium.org>, Ryan Case <ryandcase@chromium.org>, Julius Werner <jwerner@chromium.org>, Elaine Zhang <zhangqing@rock-chips.com>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 30, 2019 at 12:29 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Apr 29, 2019 at 5:54 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Tue, Apr 16, 2019 at 02:53:48PM -0700, Douglas Anderson wrote:
> > > On Rockchip rk3288 there's a hardware quirk where we need to assert
> > > the reset signal to the PHY when we get a remote wakeup on one of the
> > > two ports.  Document this quirk in the bindings.
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> > > ---
> > >
> > > Changes in v2: None
> > >
> > >  Documentation/devicetree/bindings/usb/dwc2.txt | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
> > > index 6dc3c4a34483..f70f3aee4bfc 100644
> > > --- a/Documentation/devicetree/bindings/usb/dwc2.txt
> > > +++ b/Documentation/devicetree/bindings/usb/dwc2.txt
> > > @@ -37,6 +37,8 @@ Refer to phy/phy-bindings.txt for generic phy consumer properties
> > >  - g-rx-fifo-size: size of rx fifo size in gadget mode.
> > >  - g-np-tx-fifo-size: size of non-periodic tx fifo size in gadget mode.
> > >  - g-tx-fifo-size: size of periodic tx fifo per endpoint (except ep0) in gadget mode.
> > > +- snps,reset-phy-on-wake: If present indicates that we need to reset the PHY when
> > > +                          we detect a wakeup.  This is due to a hardware errata.
> >
> > Synopsys or Rockchip errata?
> >
> > Ideally, this should be implied by the controller or phy compatible.
>
> I have no idea.  The errata was described to me by Rockchip but I
> don't know if it's common to more than one board.
>
> You're right that we could do it on the controller compatible, but we
> have to be careful.  The two ports on rk3288 currently have the same
> compatible string but the errata only applies to one of them.  ...so
> I'd have to cue on not just the compatible string but also detect
> whether we're on the "OTG" port of the "host only" port.  That's not
> too hard, though since it is probe-able.
>
> I'm happy to spin this but I'll wait to hear from Felipe.  This is
> already in his testing tree, so presumably I should do a follow-up
> patch.  ...but if he wants me to re-post I can do that too.

Okay, I guess it is fine as-is.

Rob
