From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: arm64: dts: zx: support cpu-freq for zx296718
Date: Fri, 2 Dec 2016 08:24:47 +0530
Message-ID: <20161202025447.GD7682@vireshk-i7>
References: <1480594135-27273-1-git-send-email-baoyou.xie@linaro.org>
 <20161202023627.GA6657@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161202023627.GA6657@dragon>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Baoyou Xie <baoyou.xie@linaro.org>, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, jun.nie@linaro.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, xie.baoyou@zte.com.cn, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn
List-Id: devicetree@vger.kernel.org

On 02-12-16, 10:36, Shawn Guo wrote:
> + Viresh, the author of the bindings.
> 
> On Thu, Dec 01, 2016 at 08:08:55PM +0800, Baoyou Xie wrote:
> > This patch adds the CPU clock phandle in CPU's node
> > and uses operating-points-v2 to register operating points.
> > 
> > So it can be used by cpufreq-dt driver.
> > 
> > Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
> 
> Just out of curiosity, why is there no '[PATCH]' prefix in the subject?
> 
> > ---
> >  arch/arm64/boot/dts/zte/zx296718.dtsi | 37 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/zte/zx296718.dtsi b/arch/arm64/boot/dts/zte/zx296718.dtsi
> > index 7a1aed7..16f7d5e 100644
> > --- a/arch/arm64/boot/dts/zte/zx296718.dtsi
> > +++ b/arch/arm64/boot/dts/zte/zx296718.dtsi
> > @@ -44,6 +44,7 @@
> >  #include <dt-bindings/input/input.h>
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >  #include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/clock/zx296718-clock.h>
> >  
> >  / {
> >  	compatible = "zte,zx296718";
> > @@ -81,6 +82,8 @@
> >  			compatible = "arm,cortex-a53","arm,armv8";
> >  			reg = <0x0 0x0>;
> >  			enable-method = "psci";
> > +			clocks = <&topcrm A53_GATE>;
> > +			operating-points-v2 = <&cluster0_opp>;
> >  		};
> >  
> >  		cpu1: cpu@1 {
> > @@ -88,6 +91,7 @@
> >  			compatible = "arm,cortex-a53","arm,armv8";
> >  			reg = <0x0 0x1>;
> >  			enable-method = "psci";
> > +			operating-points-v2 = <&cluster0_opp>;
> >  		};
> >  
> >  		cpu2: cpu@2 {
> > @@ -95,6 +99,7 @@
> >  			compatible = "arm,cortex-a53","arm,armv8";
> >  			reg = <0x0 0x2>;
> >  			enable-method = "psci";
> > +			operating-points-v2 = <&cluster0_opp>;
> >  		};
> >  
> >  		cpu3: cpu@3 {
> > @@ -102,6 +107,38 @@
> >  			compatible = "arm,cortex-a53","arm,armv8";
> >  			reg = <0x0 0x3>;
> >  			enable-method = "psci";
> > +			operating-points-v2 = <&cluster0_opp>;
> > +		};
> > +	};
> > +
> > +	cluster0_opp: opp_table0 {

Also, you better add "clocks" property in all above nodes.

-- 
viresh
