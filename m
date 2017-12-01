From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: meson-axg: add clock DT info for
 Meson AXG SoC
Date: Fri, 01 Dec 2017 17:59:43 +0100
Message-ID: <1512147583.12869.10.camel@baylibre.com>
References: <20171128125330.363-1-yixun.lan@amlogic.com>
         <20171128125330.363-4-yixun.lan@amlogic.com>
         <20171129193536.GB19419@codeaurora.org>
         <8353c264-3253-0268-91fc-8d42fbe82611@amlogic.com>
         <20171201163437.GE19419@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171201163437.GE19419@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Yixun Lan <yixun.lan@amlogic.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Carlo Caione <carlo@caione.org>, Qiufang Dai <qiufang.dai@amlogic.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 2017-12-01 at 08:34 -0800, Stephen Boyd wrote:
> On 11/30, Yixun Lan wrote:
> > Hi Stephen
> > 
> > On 11/30/17 03:35, Stephen Boyd wrote:
> > > On 11/28, Yixun Lan wrote:
> > > > diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> > > > b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> > > > index b932a784b02a..36a2e98338a8 100644
> > > > --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> > > > +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> > > > @@ -7,6 +7,7 @@
> > > >  #include <dt-bindings/gpio/gpio.h>
> > > >  #include <dt-bindings/interrupt-controller/irq.h>
> > > >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > > +#include <dt-bindings/clock/axg-clkc.h>
> > > >  
> > > >  / {
> > > >  	compatible = "amlogic,meson-axg";
> > > > @@ -148,6 +149,20 @@
> > > >  			#address-cells = <0>;
> > > >  		};
> > > >  
> > > > +		hiubus: hiubus@ff63c000 {
> > > 
> > > Maybe just call the node "bus@ff63c000"?
> > > 
> > 
> > isn't this just a name? what's the benefits to change?
> > personally, I tend to keep it this way, because it's better map to the
> > data sheet
> > 
> > we also has 'aobus', 'cbus' scattered there..
> 
> Per the ePAPR node names are supposed to be generic, like disk,
> cpu, display-controller, gpu, etc. I've never heard of a hiubus,
> so probably it's some vendor specific thing? We have the phandle
> anyway so it's not like we're losing much information here.

Stephen, there is a lot of busses on platform. We can't just call them all
'bus'.
I don't get the problem with this name.
We are re-using the name from the datasheet here, no fancy invention. It seems
to be quite common. 

> 
