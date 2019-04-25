From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 3/5] Documentation: dt-bindings: Add
 snps,need-phy-for-wake for dwc2 USB
Date: Thu, 25 Apr 2019 12:58:10 -0700
Message-ID: <CAD=FV=WA07+gUkVvsikN=iDHZLUJQtzjkKtiBHAEDw4gLNWY7w@mail.gmail.com>
References: <20190418001356.124334-1-dianders@chromium.org>
 <20190418001356.124334-4-dianders@chromium.org> <87pnpas1fx.fsf@linux.intel.com>
 <CAD=FV=V=6dUkXAsX0+XR2y=688VcyDa8aPvD8JkKHTFZrs=YDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=V=6dUkXAsX0+XR2y=688VcyDa8aPvD8JkKHTFZrs=YDg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Minas Harutyunyan <hminas@synopsys.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Alan Stern <stern@rowland.harvard.edu>, Artur Petrosyan <Arthur.Petrosyan@synopsys.com>, Alexandru M Stan <amstan@chromium.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, William Wu <william.wu@rock-chips.com>, linux-usb@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>, Randy Li <ayaka@soulik.info>, Chris <zyw@rock-chips.com>, Matthias Kaehlcke <mka@chromium.org>, Ryan Case <ryandcase@chromium.org>, Amelie Delaunay <amelie.delaunay@st.com>, Julius Werner <jwerner@chromium.org>, Dinh Nguyen <dinguyen@opensource.altera.com>, Elaine Zhang <zhangqing@rock-chips.com>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rob
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Apr 25, 2019 at 11:09 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Apr 25, 2019 at 5:40 AM Felipe Balbi
> <felipe.balbi@linux.intel.com> wrote:
> >
> > Douglas Anderson <dianders@chromium.org> writes:
> >
> > > Some SoCs with a dwc2 USB controller may need to keep the PHY on to
> > > support remote wakeup.  Allow specifying this as a device tree
> > > property.
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > > For relevant prior discussion on this patch, see:
> > >
> > > https://lkml.kernel.org/r/1435017144-2971-3-git-send-email-dianders@chromium.org
> > >
> > > I didn't make any changes from the prior version since I never found
> > > out what Rob thought of my previous arguments.  If folks want a
> > > change, perhaps they could choose from these options:
> > >
> > > 1. Assume that all dwc2 hosts would like to keep their PHY on for
> > >    suspend if there's a USB wakeup enabled, thus we totally drop this
> > >    binding.  This doesn't seem super great to me since I'd bet that
> > >    many devices that use dwc2 weren't designed for USB wakeup (they
> > >    may not keep enough clocks or rails on) so we might be wasting
> > >    power for nothing.
> > > 2. Rename this property to "snps,wakeup-from-suspend-with-phy" to make
> > >    it more obvious that this property is intended both to document
> > >    that wakeup from suspend is possible and that we need the PHY for
> > >    said wakeup.
> > > 3. Rename this property to "snps,can-wakeup-from-suspend" and assume
> > >    it's implicit that if we can wakeup from suspend that we need to
> > >    keep the PHY on.  If/when someone shows that a device exists using
> > >    dwc2 where we can wakeup from suspend without the PHY they can add
> > >    a new property.
> > >
> > > Changes in v2: None
> > >
> > >  Documentation/devicetree/bindings/usb/dwc2.txt | 3 +++
> > >  1 file changed, 3 insertions(+)
> >
> > checking file Documentation/devicetree/bindings/usb/dwc2.txt
> > Hunk #1 FAILED at 37.
> > Hunk #2 succeeded at 52 (offset -1 lines).
> > 1 out of 2 hunks FAILED
>
> Yeah, as Minas pointed out in the cover letter [1] my series conflicts
> with Artur's.  I have it on my list to try out his series and see if,
> perhaps, it allows me to enable the partial power down and also just
> generally rebase.  It's fairly high on my list to do that--hopefully
> in the next week.
>
> [1] https://lkml.kernel.org/r/e4b3cd69-1c91-dfbe-bea7-bbca89ca1348@synopsys.com

Oh, it looks like you didn't apply Artur's patches, though.
Presumably you applied mine first and they won the race and thus I
guess it's up to Artur to rebase his patches atop mine.  This probably
explains why you told him the patches didn't apply.  I'll reply to
that thread.

...so it turns out that when I try now my patches apply fine [2].  I'm
guessing that you perhaps tried to apply these patches before my
"rk3288's remote wake quirk" which would indeed cause conflicts.  I
mentioned the dependency in my cover letter [1] but totally understand
that it's easy to miss stuff like that.  :-)

I'm going to assume you can just go-ahead and try applying patches 3,
4, and 5 in this series again.  If you want me to repost them then
please let me know.

Thanks, and sorry for the hassle.

[1] https://lkml.kernel.org/r/20190418001356.124334-1-dianders@chromium.org

[2] Showing that patches currently apply:

dianders@tictac2:v4.19 ((2e3cfcbbb140...))$ git checkout
linux_usb_balbi/testing/next
HEAD is now at 2e3cfcbbb140 dwc2: gadget: Fix completed transfer size
calculation in DDMA

dianders@tictac2:v4.19 ((2e3cfcbbb140...))$ curl -L
https://lore.kernel.org/patchwork/patch/1063477/mbox | git am
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100  7273  100  7273    0     0  35827      0 --:--:-- --:--:-- --:--:-- 35827
Applying: Documentation: dt-bindings: Add snps,need-phy-for-wake for dwc2 USB

dianders@tictac2:v4.19 ((84c34d7b9647...))$ curl -L
https://lore.kernel.org/patchwork/patch/1063478/mbox | git am
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100  9587  100  9587    0     0  46538      0 --:--:-- --:--:-- --:--:-- 46538
Applying: USB: dwc2: Don't turn off the usbphy in suspend if wakeup is enabled

dianders@tictac2:v4.19 ((ff5ab1cb16ab...))$ curl -L
https://lore.kernel.org/patchwork/patch/1063479/mbox | git am
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100  6045  100  6045    0     0  29778      0 --:--:-- --:--:-- --:--:-- 29778
Applying: ARM: dts: rockchip: Allow wakeup from rk3288-veyron's dwc2 USB ports

-Doug
