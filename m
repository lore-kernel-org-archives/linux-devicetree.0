From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v4 01/18] arm64: dts: qcom: qcs404: add base dts files
Date: Fri, 9 Nov 2018 10:30:58 +0530
Message-ID: <20181109050058.GI12092@vkoul-mobl>
References: <20181108184009.18430-1-vkoul@kernel.org>
 <20181108184009.18430-2-vkoul@kernel.org>
 <CAL_JsqKsCpofdsP_TojGxeCkv59r5Ce7-4Sz1B1V_QCL1eQDVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKsCpofdsP_TojGxeCkv59r5Ce7-4Sz1B1V_QCL1eQDVg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 08-11-18, 15:45, Rob Herring wrote:
> > +/ {
> > +       interrupt-parent = <&intc>;
> > +
> > +       #address-cells = <2>;
> > +       #size-cells = <2>;
> > +
> > +       chosen { };
> > +
> > +       clocks {
> > +               xo_board: xo_board {
> 
> Build your dtbs with "W=12" and fix any warnings. You should get a
> warning about '_'.

I did built it with W=1 though, so _ is not allowed?

> > +                       compatible = "fixed-clock";
> > +                       #clock-cells = <0>;
> > +                       clock-frequency = <19200000>;
> > +               };
> > +       };
> > +
> > +       cpus {
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +
> > +               CPU0: cpu@0 {
> 
> unit address is wrong.

Sorry am not sure I follow, can you please explain how..

> > +                       device_type = "cpu";
> > +                       compatible = "arm,cortex-a53";
> > +                       reg = <0x100>;
> > +                       enable-method = "psci";
> > +                       next-level-cache = <&L2_0>;
> > +               };
> > +
> > +               CPU1: cpu@1 {
> > +                       device_type = "cpu";
> > +                       compatible = "arm,cortex-a53";
> > +                       reg = <0x101>;
> > +                       enable-method = "psci";
> > +                       next-level-cache = <&L2_0>;
> > +               };
> > +
> > +               CPU2: cpu@2 {
> > +                       device_type = "cpu";
> > +                       compatible = "arm,cortex-a53";
> > +                       reg = <0x102>;
> > +                       enable-method = "psci";
> > +                       next-level-cache = <&L2_0>;
> > +               };
> > +
> > +               CPU3: cpu@3 {
> > +                       device_type = "cpu";
> > +                       compatible = "arm,cortex-a53";
> > +                       reg = <0x103>;
> > +                       enable-method = "psci";
> > +                       next-level-cache = <&L2_0>;
> > +               };
> > +
> > +               L2_0: l2-cache {
> > +                       compatible = "cache";
> > +                       cache-level = <2>;
> > +               };
> > +       };
> > +
> > +       memory@80000000 {
> > +               device_type = "memory";
> > +               /* We expect the bootloader to fill in the reg */
> 
> Can't you put in a default or base address at least.

Okay will try

-- 
~Vinod
