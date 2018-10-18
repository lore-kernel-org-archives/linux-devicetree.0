From: Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845: add UFS controller
Date: Thu, 18 Oct 2018 08:37:37 -0700
Message-ID: <CAE=gft79oeGdTLsRiTgP_eSoCD452sfPLQEvFsOMKE+k2z=h=A@mail.gmail.com>
References: <20181017172312.194281-1-evgreen@chromium.org> <20181017172312.194281-2-evgreen@chromium.org>
 <CAFp+6iHRECKosJWQZoaZa6QxAmW0MZLNPsFAbD21vW+kG0xJ-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFp+6iHRECKosJWQZoaZa6QxAmW0MZLNPsFAbD21vW+kG0xJ-A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vivek.gautam@codeaurora.org
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, swboyd@chromium.org, Doug Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 18, 2018 at 4:33 AM Vivek Gautam
<vivek.gautam@codeaurora.org> wrote:
>
> Hi Evan,
>
> On Wed, Oct 17, 2018 at 10:55 PM Evan Green <evgreen@chromium.org> wrote:
> >
> > This change adds the UFS controller and PHY to SDM845.
> >
> > Signed-off-by: Evan Green <evgreen@chromium.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 66 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 66 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > index b72bdb0a31a5..20b2c258816a 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > @@ -808,6 +808,72 @@
> >                         };
> >                 };
> >
> > +               ufshc1: ufshc@1d84000 {
> > +                       compatible = "qcom,sdm845-ufshc", "qcom,ufshc",
> > +                                    "jedec,ufs-2.0";
> > +                       reg = <0x1d84000 0x2500>;
> > +                       interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> > +                       phys = <&ufsphy1_lanes>;
> > +                       phy-names = "ufsphy";
> > +                       lanes-per-direction = <2>;
> > +                       power-domains = <&gcc UFS_PHY_GDSC>;
> > +
> > +                       clock-names =
> > +                               "core_clk",
> > +                               "bus_aggr_clk",
> > +                               "iface_clk",
> > +                               "core_clk_unipro",
> > +                               "ref_clk",
> > +                               "tx_lane0_sync_clk",
> > +                               "rx_lane0_sync_clk",
> > +                               "rx_lane1_sync_clk";
> > +                       clocks =
> > +                               <&gcc GCC_UFS_PHY_AXI_CLK>,
> > +                               <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
> > +                               <&gcc GCC_UFS_PHY_AHB_CLK>,
> > +                               <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
> > +                               <&rpmhcc RPMH_CXO_CLK>,
> > +                               <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
> > +                               <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
> > +                               <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
> > +                       freq-table-hz =
> > +                               <50000000 200000000>,
> > +                               <0 0>,
> > +                               <0 0>,
> > +                               <37500000 150000000>,
> > +                               <0 0>,
> > +                               <0 0>,
> > +                               <0 0>,
> > +                               <0 0>;
> > +
> > +                       resets = <&gcc GCC_UFS_PHY_BCR>;
> > +                       reset-names = "rst";
> > +
> > +                       status = "disabled";
> > +               };
> > +
> > +               ufsphy1: ufsphy@1d87000 {
>
> nit: s/ufsphy@1d87000/phy@1d87000

Ok, will change.

>
> > +                       compatible = "qcom,sdm845-qmp-ufs-phy";
> > +                       reg = <0x1d87000 0x18c>;
> > +                       #clock-cells = <1>;
>
> why do we need this clock-cells? ufsphy i think is not providing any
> clocks. Is it?

Right. USB provides the pipe clock, but you're right, UFS doesn't
provide any clocks, so I'll remove.

> Rest looks good.
>
> Best regards
> Vivek
>
> > +                       #address-cells = <1>;
> > +                       #size-cells = <1>;
> > +                       ranges;
> > +                       clock-names = "ref",
> > +                                     "ref_aux";
> > +                       clocks = <&gcc GCC_UFS_MEM_CLKREF_CLK>,
> > +                                <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
> > +
> > +                       status = "disabled";
> > +
> > +                       ufsphy1_lanes: lanes@1d87400 {
> > +                               reg = <0x1d87400 0x108>,
> > +                                     <0x1d87600 0x1e0>,
> > +                                     <0x1d87c00 0x1dc>;

Doug, Stephen and I were looking more at the PHY driver and realized
it overreaches its registers here by adding 0x400 to get at the second
lane. We found this unappealing. Our current thinking is to add two
more reg regions here and fix up the binding, so that tx2 and rx2 are
properly specified. I'll try to come up with that patch today and
resend along with this.

-Evan
