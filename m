From: Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] arm64: dts: actions: add s900 clock controller nodes
Date: Sat, 4 Nov 2017 14:32:33 +0530
Message-ID: <20171104090230.GA14705@linaro.org>
References: <1509479663-8985-1-git-send-email-manivannan.sadhasivam@linaro.org>
 <1509479663-8985-2-git-send-email-manivannan.sadhasivam@linaro.org>
 <20171102000616.ug7s7s6fmnubq7y5@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171102000616.ug7s7s6fmnubq7y5@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, liuwei-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,
On Wed, Nov 01, 2017 at 07:06:16PM -0500, Rob Herring wrote:
> On Wed, Nov 01, 2017 at 01:24:21AM +0530, Manivannan Sadhasivam wrote:
> > This patch adds clock controller nodes for Actions Semi s900 SoC
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  arch/arm64/boot/dts/actions/s900.dtsi | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/actions/s900.dtsi b/arch/arm64/boot/dts/actions/s900.dtsi
> > index 11406f6..c099ef1 100644
> > --- a/arch/arm64/boot/dts/actions/s900.dtsi
> > +++ b/arch/arm64/boot/dts/actions/s900.dtsi
> > @@ -5,6 +5,7 @@
> >   */
> >  
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/clock/actions,s900-clock.h>
> >  
> >  / {
> >  	compatible = "actions,s900";
> > @@ -88,6 +89,24 @@
> >  		#clock-cells = <0>;
> >  	};
> >  
> > +	losc: losc {
> > +		compatible = "fixed-clock";
> > +		clock-frequency = <32768>;
> > +		#clock-cells = <0>;
> > +	};
> > +
> > +	diff_24M: diff_24M {
> > +		compatible = "fixed-clock";
> > +		clock-frequency = <24000000>;
> > +		#clock-cells = <0>;
> > +	};
> 
> These 2 are inputs to the clock ctrlr? The clock controller should have 
> a clocks property then.
> 
Actually losc and hosc (already defined) are the sources to the clock
controller. There isn't much documentation about diff_24M clock which
seems to be only sourcing eDP. Since, the vendor driver defined these
3 clocks (losc, hosc, diff_24M) as fixed rate clocks I have added them
in the device tree as "fixed-clock" nodes.

So, as per your suggestion I will add hosc and losc as clock providers
for the clock controller like below in next revision:

clocks = <&hosc>,  <&losc>;

Thanks,
Mani
> > +
> > +	clock: clock-controller@e0160000 {
> > +		compatible = "actions,s900-clock";
> > +		reg = <0 0xe0160000 0 0x1000>;
> > +		#clock-cells = <1>;
> > +	};
> > +
> >  	soc {
> >  		compatible = "simple-bus";
> >  		#address-cells = <2>;
> > -- 
> > 2.7.4
> > 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
