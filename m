From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 3/5] Documentation: dt-bindings: Add
 snps,need-phy-for-wake for dwc2 USB
Date: Thu, 25 Apr 2019 11:09:59 -0700
Message-ID: <CAD=FV=V=6dUkXAsX0+XR2y=688VcyDa8aPvD8JkKHTFZrs=YDg@mail.gmail.com>
References: <20190418001356.124334-1-dianders@chromium.org>
 <20190418001356.124334-4-dianders@chromium.org> <87pnpas1fx.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87pnpas1fx.fsf@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Minas Harutyunyan <hminas@synopsys.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Alan Stern <stern@rowland.harvard.edu>, Artur Petrosyan <Arthur.Petrosyan@synopsys.com>, Alexandru M Stan <amstan@chromium.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, William Wu <william.wu@rock-chips.com>, linux-usb@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>, Randy Li <ayaka@soulik.info>, Chris <zyw@rock-chips.com>, Matthias Kaehlcke <mka@chromium.org>, Ryan Case <ryandcase@chromium.org>, Amelie Delaunay <amelie.delaunay@st.com>, Julius Werner <jwerner@chromium.org>, Dinh Nguyen <dinguyen@opensource.altera.com>, Elaine Zhang <zhangqing@rock-chips.com>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rob
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Apr 25, 2019 at 5:40 AM Felipe Balbi
<felipe.balbi@linux.intel.com> wrote:
>
> Douglas Anderson <dianders@chromium.org> writes:
>
> > Some SoCs with a dwc2 USB controller may need to keep the PHY on to
> > support remote wakeup.  Allow specifying this as a device tree
> > property.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > For relevant prior discussion on this patch, see:
> >
> > https://lkml.kernel.org/r/1435017144-2971-3-git-send-email-dianders@chromium.org
> >
> > I didn't make any changes from the prior version since I never found
> > out what Rob thought of my previous arguments.  If folks want a
> > change, perhaps they could choose from these options:
> >
> > 1. Assume that all dwc2 hosts would like to keep their PHY on for
> >    suspend if there's a USB wakeup enabled, thus we totally drop this
> >    binding.  This doesn't seem super great to me since I'd bet that
> >    many devices that use dwc2 weren't designed for USB wakeup (they
> >    may not keep enough clocks or rails on) so we might be wasting
> >    power for nothing.
> > 2. Rename this property to "snps,wakeup-from-suspend-with-phy" to make
> >    it more obvious that this property is intended both to document
> >    that wakeup from suspend is possible and that we need the PHY for
> >    said wakeup.
> > 3. Rename this property to "snps,can-wakeup-from-suspend" and assume
> >    it's implicit that if we can wakeup from suspend that we need to
> >    keep the PHY on.  If/when someone shows that a device exists using
> >    dwc2 where we can wakeup from suspend without the PHY they can add
> >    a new property.
> >
> > Changes in v2: None
> >
> >  Documentation/devicetree/bindings/usb/dwc2.txt | 3 +++
> >  1 file changed, 3 insertions(+)
>
> checking file Documentation/devicetree/bindings/usb/dwc2.txt
> Hunk #1 FAILED at 37.
> Hunk #2 succeeded at 52 (offset -1 lines).
> 1 out of 2 hunks FAILED

Yeah, as Minas pointed out in the cover letter [1] my series conflicts
with Artur's.  I have it on my list to try out his series and see if,
perhaps, it allows me to enable the partial power down and also just
generally rebase.  It's fairly high on my list to do that--hopefully
in the next week.

[1] https://lkml.kernel.org/r/e4b3cd69-1c91-dfbe-bea7-bbca89ca1348@synopsys.com

-Doug
