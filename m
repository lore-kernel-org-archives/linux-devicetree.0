From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 01/22] arm64: dts: qcom: sm8150: add base dts file
Date: Wed, 14 Aug 2019 12:02:57 -0700
Message-ID: <20190814190257.GI6167@minitux>
References: <20190814125012.8700-1-vkoul@kernel.org>
 <20190814125012.8700-2-vkoul@kernel.org>
 <20190814165855.098FD2063F@mail.kernel.org>
 <20190814174439.GE6167@minitux>
 <20190814183552.5FF062133F@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190814183552.5FF062133F@mail.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, sibis@codeaurora.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed 14 Aug 11:35 PDT 2019, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2019-08-14 10:44:39)
> > On Wed 14 Aug 09:58 PDT 2019, Stephen Boyd wrote:
> > 
> > > Quoting Vinod Koul (2019-08-14 05:49:51)
> > > > diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > [..]
> > > > +       clocks {
> > > > +               xo_board: xo-board {
> > > > +                       compatible = "fixed-clock";
> > > > +                       #clock-cells = <0>;
> > > > +                       clock-frequency = <19200000>;
> > > 
> > > Is it 19.2 or 38.4 MHz? It seems like lately there are dividers, but I
> > > guess it doesn't really matter in the end.
> > > 
> > 
> > As with previous platforms, the board's XO feeds the PMIC at 38.4MHz and
> > the SoC's CXO_IN pin (i.e. bi_tcxo) is fed from the PMIC's LNBBCLK1,
> > which is ticking at 19.2MHz.
> > 
> > [..]
> > > > +               gcc: clock-controller@100000 {
> > > > +                       compatible = "qcom,gcc-sm8150";
> > > > +                       reg = <0x00100000 0x1f0000>;
> > > > +                       #clock-cells = <1>;
> > > > +                       #reset-cells = <1>;
> > > > +                       #power-domain-cells = <1>;
> > > > +                       clock-names = "bi_tcxo", "sleep_clk";
> > > > +                       clocks = <&xo_board>, <&sleep_clk>;
> > 
> > So this first one should actually be <&rpmhcc LNBBCLK1>.
> 
> Hrmm LNBBCLK1 doesn't make any sense to me. That's a buffer that is
> technically the net connected to the XO pin on the Soc, but it isn't
> really supposed to be used by anything from what I recall. Last time I
> tried to use the buffers the RPM team told me I was using the wrong
> resource and I should just use the XO resource instead. Doesn't RPMh
> expose the other "XO" resource that is supposed to prevent XO shutdown?

So while it's the LNBBCLK1 pin we're referring to, it's the RPMH_CXO_CLK
which has some level of magic involved that we should actually use in
the software.

> Just mark it critical for now so that XO isn't turned off at runtime.
> 
> > 
> > But while we now should handle this gracefully in the clock driver I
> > think we still have problems with the cascading probe deferral that
> > follows - last time I tried to do this the serial driver probe deferred
> > past user space initialization and the system crashed as we didn't have
> > a /dev/console.
> 
> Does the serial driver probe eventually? Maybe you can run agetty when
> the device appears based on some uevent for /dev/console. Or we have a
> bug where /dev/console is created by devtmpfs when there isn't actually
> a console?
> 

I don't remember the exact outcome, but presume it would depend on the
implementation details of early user space (e.g. my regression test
suite would not deal with this).

> > 
> > 
> > So, I think we should s/xo_board/lnbbclk1/ (at 19.2MHz) to make it
> > represent the schematics and then once we have rpmhcc and validated that
> > the system handles this gracefully we can switch it out.
> > 
> 
> Sure, some sort of approach that switches it later on is fine, just want
> to make sure that the board clk frequency is accurately reflected in the
> DT.
> 

We introduced the xo_board fixed clock to have a parent of gcc, but
given that there is a clock named "XO" and it is not the clock being
connected to gcc, nor is it ticking at the right frequency I think it
should at least have a different name.

Regards,
Bjorn
