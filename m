From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 1/5] dt-bindings: phy-qcom-qmp: Fix register underspecification
Date: Mon, 5 Nov 2018 08:52:39 -0800
Message-ID: <CAD=FV=UKfDsthT4W3H4jR0Qvw-izLShCjWngN2uBrY-FUEtDDQ@mail.gmail.com>
References: <20181026173544.136037-1-evgreen@chromium.org> <20181026173544.136037-2-evgreen@chromium.org>
 <154129921872.88331.15831802252403117971@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154129921872.88331.15831802252403117971@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, Evan Green <evgreen@chromium.org>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, cang@codeaurora.org, LKML <linux-kernel@vger.kernel.org>, Manu Gautam <mgautam@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Sat, Nov 3, 2018 at 7:40 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Evan Green (2018-10-26 10:35:40)
> >                         (or)
> > @@ -150,3 +153,54 @@ Example:
> >                 ...
> >                 ...
> >         };
> > +
> > +       phy@88eb000 {
> > +               compatible = "qcom,sdm845-qmp-usb3-uni-phy";
> > +               reg = <0x88eb000 0x18c>;
> > +               #clock-cells = <1>;
> > +               #address-cells = <1>;
> > +               #size-cells = <1>;
> > +               ranges;
> > +
> > +               clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
> > +                        <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> > +                        <&gcc GCC_USB3_SEC_CLKREF_CLK>,
> > +                        <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>;
> > +               clock-names = "aux", "cfg_ahb", "ref", "com_aux";
> > +
> > +               resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR>,
> > +                        <&gcc GCC_USB3_PHY_SEC_BCR>;
> > +               reset-names = "phy", "common";
> > +
> > +               lane@88eb200 {
> > +                       reg = <0x88eb200 0x128>,
> > +                             <0x88eb400 0x1fc>,
> > +                             <0x88eb800 0x218>,
> > +                             <0x88eb600 0x70>;
> > +                       #phy-cells = <0>;
> > +                       clocks = <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
> > +                       clock-names = "pipe0";
> > +                       clock-output-names = "usb3_uni_phy_pipe_clk_src";
>
> If this has clock-output-names then I would expect to see a #clock-cells
> property, but that isn't here in this node. Are we relying on the same
> property in the parent node?

If I had to guess, I believe it's yet more confusing than that.  I
believe you actually point to the parent phandle if you want to use
the clock.  I notice that the parent has #clock-cells as 1 so
presumably this is how you point to one child or the other?  ...but I
don't think it's documented how this works.  The lane nodes don't have
any sort of ID as far as I can tell.  ...and in any case having
#clock-cells of 1 makes no sense for USB 3 PHYs which are supposed to
only have one child?

Let's look at the code, maybe?  Hrm, phy_pipe_clk_register() takes no
ID or anything.  Huh?  OK, so as far as I can tell
of_clk_add_provider() is never called on this clock...

So I think the answer is that #clock-cells should be <0> and should
move to the child node to match with clock-output-names.  Then I guess
(if anyone references this clock from the device tree rather than
relying on the global clock-output-names) we should add the
of_clk_add_provider() into the code?

Maybe we can add that as a patch to the end of this series?  There are
so many crazy / random things wrong with these bindings that it makes
sense to make smaller / incremental changes?


-Doug
