From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: sdm845: Add UFS nodes for sdm845-mtp
Date: Mon, 19 Nov 2018 11:25:08 -0800
Message-ID: <CAD=FV=WYhM2eJFdcum3aE2YhhhP9s=OzR=oRA2NXU4PFJc7Z5A@mail.gmail.com>
References: <20181026173544.136037-1-evgreen@chromium.org> <20181026173544.136037-5-evgreen@chromium.org>
 <154265514855.88331.12521366940818102477@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154265514855.88331.12521366940818102477@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, Evan Green <evgreen@chromium.org>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh@kernel.org>, cang@codeaurora.org, devicetree@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Nov 19, 2018 at 11:19 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Evan Green (2018-10-26 10:35:43)
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> > index eedfaf8922e2..d5fddea71a85 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> > @@ -356,6 +356,20 @@
> >         status = "okay";
> >  };
> >
> > +&ufshc1 {
> > +       status = "okay";
> > +
> > +       vcc-supply = <&vreg_l20a_2p95>;
> > +       vcc-max-microamp = <600000>;
>
> Is this board dependent? I would guess this is SoC specific and not
> board specific.
>
> > +};
> > +
> > +&ufsphy1 {
> > +       status = "okay";
> > +
> > +       vdda-phy-supply = <&vdda_ufs1_core>;
> > +       vdda-pll-supply = <&vdda_ufs1_1p2>;
>
> These two properties can be specified in the SoC dtsi file instead of
> each board variant file. This way we don't have to specify the things
> that are SoC independent in each board file. The board integrator just
> has to attach the labels to the right regulator nodes, in this case
> vdda_ufs1_core and vdda_ufs1_1p2, and then the sdm845.dtsi file will be
> matched up with the right regulator automatically. It's also nice so
> that board integrators don't have to know anything besides what
> regulator goes to what pin on the SoC.

This is an interesting proposal and it feels like we have to consider
the tradeoffs.

I agree that it would be nice not to have to specify this in every
single board .dts file, but at the same time what if you've got a
board that doesn't use UFS?  Such a board would bother adding the
labels "vdda_ufs1_core" and "vdda_ufs1_1p2".  This would lead to a
compile error in the device tree bindings.  That seems pretty
undesirable.

+Bjorn since I think Bjorn wasn't a huge fan of the labels like
"vdda_ufs1_core" to start with.


-Doug
