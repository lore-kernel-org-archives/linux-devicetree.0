From: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH 4/5] dt-bindings: usb: dwc3: of-simple: add compatible for HiSi
Date: Wed, 25 Sep 2019 21:06:34 -0700
Message-ID: <CALAqxLX=csTtnqr2Hc9v_R8ex8zPj_P1JvSyjZXUKEqSaF=gPA@mail.gmail.com>
References: <20190925234224.95216-1-john.stultz@linaro.org>
 <20190925234224.95216-5-john.stultz@linaro.org> <1569461658.32135.12.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1569461658.32135.12.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: lkml <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Yu Chen <chenyu56@huawei.com>, Matthias Brugger <matthias.bgg@gmail.com>, Linux USB List <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 25, 2019 at 6:34 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> On Wed, 2019-09-25 at 23:42 +0000, John Stultz wrote:
> > +++ b/Documentation/devicetree/bindings/usb/hisi,dwc3.txt
> > @@ -0,0 +1,52 @@
> > +HiSi SuperSpeed DWC3 USB SoC controller
> > +
> > +Required properties:
> > +- compatible:                should contain "hisilicon,hi3660-dwc3" for HiSi SoC
> > +- clocks:            A list of phandle + clock-specifier pairs for the
> > +                     clocks listed in clock-names
> > +- clock-names:               Should contain the following:
> > +  "clk_usb3phy_ref"  Phy reference clk
> It's not good idea to apply phy's clock in dwc3's node

Hey! Thanks for taking a look at this!

So first, my apologies, I'm not the driver author and I don't have any
real specs on the hardware other then what's in the source tree I'm
working on.  Not the ideal person to be documenting the binding, but I
realized we still needed some binding documentation (although a few
other dwc-of-simple compat entries are undocumented), so this is my
rough stab at it. :/

Given the name clk_usb3phy_ref I'm assuming its a phy reference clock,
but I honestly don't know if I'm getting that wrong.  It all seems to
be leveraging the fact that the dwc-of-simple driver batch enables and
disables all the clocks w/o really looking at the names.

Do you have a recommendation for what would be best here? I suspect
it's necessary to enable/disable the clk in a similar path(though I'm
unfortunately traveling this week so I can't validate that). Do I try
to move the clk_usb3phy_ref clock enable/disable handling to somewhere
else?

thanks
-john
