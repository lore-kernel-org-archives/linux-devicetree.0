From: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH v2 2/5] usb: dwc3: Execute GCTL Core Soft Reset while
 switch mdoe for Hisilicon Kirin Soc
Date: Mon, 7 Oct 2019 16:53:33 -0700
Message-ID: <CALAqxLWG0a_sRu08XL7q4MpD1ZfAEhVb3mKQ0FLAe8kjO2PV3A@mail.gmail.com>
References: <20191007175553.66940-1-john.stultz@linaro.org>
 <20191007175553.66940-3-john.stultz@linaro.org> <20191007233904.GC9754@jackp-linux.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007233904.GC9754@jackp-linux.qualcomm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jack Pham <jackp@codeaurora.org>
Cc: Yu Chen <chenyu56@huawei.com>, Felipe Balbi <balbi@kernel.org>, lkml <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Linux USB List <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 7, 2019 at 4:39 PM Jack Pham <jackp@codeaurora.org> wrote:
>
> Hi John, Yu, Felipe,
>
> On Mon, Oct 07, 2019 at 05:55:50PM +0000, John Stultz wrote:
> > From: Yu Chen <chenyu56@huawei.com>
> >
> > A GCTL soft reset should be executed when switch mode for dwc3 core
> > of Hisilicon Kirin Soc.
> >
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Felipe Balbi <balbi@kernel.org>
> > Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Yu Chen <chenyu56@huawei.com>
> > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > Cc: linux-usb@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Yu Chen <chenyu56@huawei.com>
> > Signed-off-by: John Stultz <john.stultz@linaro.org>
> > ---
> >  drivers/usb/dwc3/core.c | 20 ++++++++++++++++++++
> >  drivers/usb/dwc3/core.h |  3 +++
> >  2 files changed, 23 insertions(+)
> >
> > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> > index 999ce5e84d3c..440261432421 100644
> > --- a/drivers/usb/dwc3/core.c
> > +++ b/drivers/usb/dwc3/core.c
> > @@ -112,6 +112,19 @@ void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode)
> >       dwc->current_dr_role = mode;
> >  }
> >
> > +static void dwc3_gctl_core_soft_reset(struct dwc3 *dwc)
> > +{
> > +     u32 reg;
> > +
> > +     reg = dwc3_readl(dwc->regs, DWC3_GCTL);
> > +     reg |= DWC3_GCTL_CORESOFTRESET;
> > +     dwc3_writel(dwc->regs, DWC3_GCTL, reg);
> > +
> > +     reg = dwc3_readl(dwc->regs, DWC3_GCTL);
> > +     reg &= ~DWC3_GCTL_CORESOFTRESET;
> > +     dwc3_writel(dwc->regs, DWC3_GCTL, reg);
> > +}
> > +
> >  static void __dwc3_set_mode(struct work_struct *work)
> >  {
> >       struct dwc3 *dwc = work_to_dwc(work);
> > @@ -156,6 +169,10 @@ static void __dwc3_set_mode(struct work_struct *work)
> >
> >       dwc3_set_prtcap(dwc, dwc->desired_dr_role);
> >
> > +     /* Execute a GCTL Core Soft Reset when switch mode */
> > +     if (dwc->gctl_reset_quirk)
> > +             dwc3_gctl_core_soft_reset(dwc);
> > +
>
> In fact it is mentioned in the Synopsys databook to perform a GCTL
> CoreSoftReset when changing the PrtCapDir between device & host modes.
> So I think this should apply generally without a quirk. Further, it
> states to do this *prior* to writing PrtCapDir, so should it go before
> dwc3_set_prtcap() instead?

Sounds good. I have no such access to the hardware docs, so I really
appreciate your input here!

I'll refactor it as you describe and remove the quirk flag.

thanks
-john
