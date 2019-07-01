From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v5 08/12] dt-bindings: mediatek: Change the binding for
 mmsys clocks
Date: Mon, 1 Jul 2019 11:55:18 +0800
Message-ID: <1561953318.25914.9.camel@mtksdaap41>
References: <20181116125449.23581-1-matthias.bgg@kernel.org>
 <20181116125449.23581-9-matthias.bgg@kernel.org>
 <20181116231522.GA18006@bogus>
 <2a23e407-4cd4-2e2b-97a5-4e2bb96846e0@gmail.com>
 <CAL_JsqKJQwfDJbpmwW+oCxiDkSp5+6mG-uoURmCQVEMP_jFOEg@mail.gmail.com>
 <154281878765.88331.10581984256202566195@swboyd.mtv.corp.google.com>
 <458178ac-c0fc-9671-7fc8-ed2d6f61424c@suse.com>
 <154356023767.88331.18401188808548429052@swboyd.mtv.corp.google.com>
 <a229bfc7-683f-5b0d-7b71-54f934de6214@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <a229bfc7-683f-5b0d-7b71-54f934de6214@suse.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <mbrugger@suse.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sean Wang <Sean.Wang@mediatek.com>, "moderated list:ARM/FREESCALE IMX /
 MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Sean Wang <sean.wang@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Randy Dunlap <rdunlap@infradead.org>, Philipp Zabel <p.zabel@pengutronix.de>, "matthias.bgg@kernel.org" <matthias.bgg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-clk <linux-clk@vger.kernel.org>, Ulrich
List-Id: devicetree@vger.kernel.org

Hi, Matthias:

On Fri, 2018-11-30 at 16:59 +0800, Matthias Brugger wrote:
> 
> On 30/11/2018 07:43, Stephen Boyd wrote:
> > Quoting Matthias Brugger (2018-11-21 09:09:52)
> >>
> >>
> >> On 21/11/2018 17:46, Stephen Boyd wrote:
> >>> Quoting Rob Herring (2018-11-19 11:15:16)
> >>>> On Sun, Nov 18, 2018 at 11:12 AM Matthias Brugger
> >>>> <matthias.bgg@gmail.com> wrote:
> >>>>> On 11/17/18 12:15 AM, Rob Herring wrote:
> >>>>>> On Fri, Nov 16, 2018 at 01:54:45PM +0100, matthias.bgg@kernel.org wrote:
> >>>>>>> -    #clock-cells = <1>;
> >>>>>>> +
> >>>>>>> +    mmsys_clk: clock-controller@14000000 {
> >>>>>>> +            compatible = "mediatek,mt2712-mmsys-clk";
> >>>>>>> +            #clock-cells = <1>;
> >>>>>>
> >>>>>> This goes against the general direction of not defining separate nodes
> >>>>>> for providers with no resources.
> >>>>>>
> >>>>>> Why do you need this and what does it buy if you have to continue to
> >>>>>> support the existing chips?
> >>>>>>
> >>>>>
> >>>>> It would show explicitly that the mmsys block is used to probe two
> >>>>> drivers, one for the gpu and one for the clocks. Otherwise that is
> >>>>> hidden in the drm driver code. I think it is cleaner to describe that in
> >>>>> the device tree.
> >>>>
> >>>> No, that's maybe cleaner for the driver implementation in the Linux
> >>>> kernel. What about other OS's or when Linux drivers and subsystems
> >>>> needs change? Cleaner for DT is design bindings that reflect the h/w.
> >>>> Hardware is sometimes just messy.
> >>>>
> >>>
> >>> I agree. I fail to see what this patch series is doing besides changing
> >>> driver probe and device creation methods and making a backwards
> >>> incompatible change to DT. Is there any other benefit here?
> >>>
> >>
> >> You are referring whole series?
> >> Citing the cover letter:
> >> "MMSYS in Mediatek SoCs has some registers to control clock gates (which is
> >> used in the clk driver) and some registers to set the routing and enable
> >> the differnet (sic!) blocks of the display subsystem.
> >>
> >> Up to now both drivers, clock and drm are probed with the same device tree
> >> compatible. But only the first driver get probed, which in effect breaks
> >> graphics on mt8173 and mt2701.
> > 
> > Ouch!
> > 
> 
> Yes :)
> 
> >>
> >> This patch uses a platform device registration in the DRM driver, which
> >> will trigger the probe of the corresponding clock driver. It was tested on the
> >> bananapi-r2 and the Acer R13 Chromebook."
> > 
> > Alright, please don't add nodes in DT just to make device drivers probe.
> > Instead, register clks from the drm driver or create a child platform
> > device for the clk bits purely in the drm driver and have that probe the
> > associated clk driver from there.
> > 
> 
> I'll make the other SoCs probe via a child platform device from the drm driver,
> as already done in 2/12 and 3/12.

This series have been pending for half an year, would you keep going on
this series? If you're busy, I could complete this series, but I need to
know what you have plan to do.

I guess that 1/12 ~ 5/12 is for MT2701/MT8173 and that patches meet this
discussion. 6/12 ~ 12/12 is for MT2712/MT6797 but that patches does not
meet this discussion. So the unfinished work is to make MT2712/MT6797 to
align MT2701/MT8173, is this right?

Regards,
CK

> 
> Regards,
> Matthias
> 
> >>
> >> DT is broken right now, because two drivers rely on the same node, which gets
> >> consumed just once. The new DT introduced does not break anything because it is
> >> only used for boards that: "[..] are not available to the general public
> >> (mt2712e) or only have the mmsys clock driver part implemented (mt6797)."
> > 
> > Ok, so backwards compatibility is irrelevant then. Sounds fine to me.
> > 
> > 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
