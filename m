From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 10/13] arm64: dts: qcom: qcs404: Add HFPLL node
Date: Wed, 16 Jan 2019 22:38:04 -0800
Message-ID: <20190117063804.GJ25498@builder>
References: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1545039990-19984-11-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <154507555157.19322.2712807405425817338@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <154507555157.19322.2712807405425817338@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, jassisinghbrar@gmail.com, jorge.ramirez-ortiz@linaro.org, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org, will.deacon@arm.com, vkoul@kernel.org, niklas.cassel@linaro.org, sibis@codeaurora.org, georgi.djakov@linaro.org, arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de, enric.balletbo@collabora.com, jagan@amarulasolutions.com, olof@lixom.net, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon 17 Dec 11:39 PST 2018, Stephen Boyd wrote:

> Quoting Jorge Ramirez-Ortiz (2018-12-17 01:46:27)
> > The high frequency pll functionality is required to enable CPU
> > frequency scaling operation.
> > 
> > Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> > Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/qcs404.dtsi | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > index 4594fea7..ec3f6c7 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > @@ -375,6 +375,15 @@
> >                         #mbox-cells = <1>;
> >                 };
> >  
> > +               apcs_hfpll: clock-controller@0b016000 {
> 
> Drop leading 0 on unit address please.
> 
> > +                       compatible = "qcom,hfpll";
> > +                       reg = <0x0b016000 0x30>;
> 
> Wow that is small!
> 

I double checked and it's actually 0x34, but the last register is
protected.

Regards,
Bjorn

> > +                       #clock-cells = <0>;
> > +                       clock-output-names = "apcs_hfpll";
> > +                       clocks = <&xo_board>;
> > +                       clock-names = "xo";
> > +               };
> > +
