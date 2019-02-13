From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] arm64: dts: msm8996: fix blsp2_uart1 4-pin pinconfig
Date: Wed, 13 Feb 2019 10:05:44 +0100
Message-ID: <20190213090544.GE28278@localhost>
References: <20181220161750.12587-1-johan@kernel.org>
 <20190212210656.GA6642@hector.attlocal.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190212210656.GA6642@hector.attlocal.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 12, 2019 at 03:06:56PM -0600, Andy Gross wrote:
> On Thu, Dec 20, 2018 at 05:17:50PM +0100, Johan Hovold wrote:
> > Fix "gpiio5" typo in the (currently unused) blsp2_uart1 4-pin sleep
> > config.
> > 
> > Fixes: 22e6789f9493 ("arm64: dts: msm8996: add blsp2_uart1 pinctrl")
> > Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> > ---
> >  arch/arm64/boot/dts/qcom/msm8996-pins.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
> > index c5c42e94f387..1d1f7f91739a 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
> > @@ -139,7 +139,7 @@
> >  		};
> >  
> >  		pinconf {
> > -			pins = "gpio4", "gpiio5", "gpio6", "gpio7";
> > +			pins = "gpio4", "gpio5", "gpio6", "gpio7";
> >  			drive-strength = <2>;
> >  			bias-disable;
> >  		};
> 
> I took one in slightly older than this one.  However, it doesn't have the fixes
> line.
> 
> 
> commit ff10032fb309d0baa0b79e28009bf154de08d341
> Author: Jakob Wuhrer <jakobwuhrer@airmail.cc>
> Date:   Fri Dec 14 18:01:30 2018 +0100
> 
>     arm64: dts: qcom: Correct "gpiio" typo in msm8996-pins
> 
>     gpiio5 is missspelt in msm8996-pins.dtsi, fix that.
> 
>     Signed-off-by: Jakob Wuhrer <jakobwuhrer@airmail.cc>
>     Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>     Signed-off-by: Andy Gross <andy.gross@linaro.org>

That's funny, submitted six days before mine for a 2+ year old issue.

The typo would prevent the pin from being reconfigured (hence the stable
tag), but at least you'd get a runtime warning when trying to set this
config.

Johan
