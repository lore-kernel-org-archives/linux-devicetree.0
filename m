From: Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: sdm845: add UFS controller
Date: Wed, 28 Nov 2018 15:43:13 -0800
Message-ID: <CAE=gft55NLPAD4Z5w5aDDPB0YRPJP9xX-RmD1sz4ZfNCxURb+Q@mail.gmail.com>
References: <20181026173544.136037-1-evgreen@chromium.org> <20181026173544.136037-4-evgreen@chromium.org>
 <20181122071847.GL2225@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181122071847.GL2225@minitux>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: robh@kernel.org, Andy Gross <andy.gross@linaro.org>, kishon@ti.com, Doug Anderson <dianders@chromium.org>, swboyd@chromium.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, David Brown <david.brown@linaro.org>, mark.rutland@arm.com, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 21, 2018 at 11:18 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 26 Oct 10:35 PDT 2018, Evan Green wrote:
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > index b72bdb0a31a5..9c72edb678ec 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > @@ -808,6 +808,73 @@
> >                       };
> >               };
> >
> > +             ufshc1: ufshc@1d84000 {
>
> There's only one ufshc and one ufsphy, so no need to include the index.

Aren't there two UFS controllers on SDM845, a "card" one and a "mem"
one? I'm only adding the "mem" one here since that's all I can test,
but I thought it made sense to leave the number there so someone could
add the "card" one later if needed.
>
> [..]
> > +                     resets = <&gcc GCC_UFS_PHY_BCR>;
> > +                     reset-names = "rst";
>
> I have this as well, but this is not used by the upstream driver nor is
> it mentioned in the dt-binding.

I see it in Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt,
but then the only place I see it being used is ufs-hisi.c. So you're
right, I think I should spin and remove this. Since I'm spinning, let
me know about the numbering thing above.


>
> > +
> > +                     status = "disabled";
> > +             };
> > +
> > +             ufsphy1: phy@1d87000 {
>
> With reservation for the "reset" issue:
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> Regards,
> Bjorn
