From: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH 4/5] dt-bindings: usb: dwc3: of-simple: add compatible for HiSi
Date: Wed, 2 Oct 2019 13:45:17 -0700
Message-ID: <CALAqxLUo59DDn=XhofOTHHkpuQPPTxx_jiTTA_o8sedCsxEkiw@mail.gmail.com>
References: <20190925234224.95216-1-john.stultz@linaro.org>
 <20190925234224.95216-5-john.stultz@linaro.org> <1569461658.32135.12.camel@mhfsdcap03>
 <CALAqxLX=csTtnqr2Hc9v_R8ex8zPj_P1JvSyjZXUKEqSaF=gPA@mail.gmail.com> <1569480152.32135.16.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1569480152.32135.16.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: lkml <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Yu Chen <chenyu56@huawei.com>, Matthias Brugger <matthias.bgg@gmail.com>, Linux USB List <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 25, 2019 at 11:42 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> On Wed, 2019-09-25 at 21:06 -0700, John Stultz wrote:
> > On Wed, Sep 25, 2019 at 6:34 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> > > On Wed, 2019-09-25 at 23:42 +0000, John Stultz wrote:
> > > > +++ b/Documentation/devicetree/bindings/usb/hisi,dwc3.txt
> > > > @@ -0,0 +1,52 @@
> > > > +HiSi SuperSpeed DWC3 USB SoC controller
> > > > +
> > > > +Required properties:
> > > > +- compatible:                should contain "hisilicon,hi3660-dwc3" for HiSi SoC
> > > > +- clocks:            A list of phandle + clock-specifier pairs for the
> > > > +                     clocks listed in clock-names
> > > > +- clock-names:               Should contain the following:
> > > > +  "clk_usb3phy_ref"  Phy reference clk
> > > It's not good idea to apply phy's clock in dwc3's node
...
> > Given the name clk_usb3phy_ref I'm assuming its a phy reference clock,
> > but I honestly don't know if I'm getting that wrong.  It all seems to
> > be leveraging the fact that the dwc-of-simple driver batch enables and
> > disables all the clocks w/o really looking at the names.
> >
...
> If it's phy clock, we should enable/disable it in phy driver, maybe we'd
> better ask for help from Yu Chen

So I've been looking around the existing code and I'm not sure how we
got to clk_usb3phy_ref here.

Really it is the HI3660_CLK_ABB_USB, who's name is "clk_abb_usb" and
who's parent is "clk_gate_usb_tcxo_en"

So I'm thinking just specifying clk_abb_usb is more accurate here?

Does that sound reasonable?

thanks
-john
