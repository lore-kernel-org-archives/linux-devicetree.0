From: Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH v1 3/8] arm64: dts: sdm845: Add UFS PHY reset
Date: Tue, 22 Jan 2019 10:13:44 -0800
Message-ID: <CAE=gft6=WdPyA6WF_3oSNGYPEhqjGVB7Cpwybr0kzp+9ys821Q@mail.gmail.com>
References: <20190111230129.127037-1-evgreen@chromium.org> <20190111230129.127037-4-evgreen@chromium.org>
 <20190122002549.GA20481@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190122002549.GA20481@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Andy Gross <andy.gross@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Can Guo <cang@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Asutosh Das <asutoshd@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 21, 2019 at 4:25 PM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Jan 11, 2019 at 03:01:24PM -0800, Evan Green wrote:
> > Wire up the reset controller in the Qcom UFS controller for the PHY.
> > This will be used to toggle PHY reset during initialization of the PHY.
> >
> > Signed-off-by: Evan Green <evgreen@chromium.org>
> > ---
> > This commit is based atop the series at [1]. Patches 1 and 2 of that
> > series have landed, but 3, 4, and 5 are still outstanding.
> >
> > [1] https://lore.kernel.org/lkml/20181210192826.241350-1-evgreen@chromium.org/
> >
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > index b29332b265d9e..029ab66405cf4 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > @@ -990,6 +990,7 @@
> >                       phy-names = "ufsphy";
> >                       lanes-per-direction = <2>;
> >                       power-domains = <&gcc UFS_PHY_GDSC>;
> > +                     #reset-cells = <1>;
>
> Is this documented?
>

No, I'll add this in my next spin. Thanks.
-Evan
