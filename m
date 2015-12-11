From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v1 7/8] ARM: dts: rockchip: add core rk3228 dtsi
Date: Fri, 11 Dec 2015 11:12:10 +0100
Message-ID: <7783766.YsX4m8bWe1@diego>
References: <1449651853-1667-1-git-send-email-jeffy.chen@rock-chips.com> <24573164.okRNXjvZ1B@phil> <566A2CB7.4050801@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <566A2CB7.4050801-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jeffy,

Am Freitag, 11. Dezember 2015, 09:53:59 schrieb Jeffy Chen:
> On 2015-12-10 8:32, Heiko Stuebner wrote:
> > Am Mittwoch, 9. Dezember 2015, 17:04:12 schrieb Jeffy Chen:
> >> Initial release for rk3228 shared dtsi.
> >> 
> >> Signed-off-by: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >> ---
> >> 
> >>   arch/arm/boot/dts/rk3228.dtsi | 478
> >>   ++++++++++++++++++++++++++++++++++++++++++ 1 file changed, 478
> >>   insertions(+)
> >>   create mode 100644 arch/arm/boot/dts/rk3228.dtsi
> >> 
> >> diff --git a/arch/arm/boot/dts/rk3228.dtsi
> >> b/arch/arm/boot/dts/rk3228.dtsi
> >> new file mode 100644
> >> index 0000000..d6b3e40
> >> --- /dev/null
> >> +++ b/arch/arm/boot/dts/rk3228.dtsi
> >> @@ -0,0 +1,478 @@
> >> +/*
> >> + * This file is dual-licensed: you can use it either under the terms
> >> + * of the GPL or the X11 license, at your option. Note that this dual
> >> + * licensing only applies to this file, and not this project as a
> >> + * whole.
> >> + *
> >> + *  a) This file is free software; you can redistribute it and/or
> >> + *     modify it under the terms of the GNU General Public License as
> >> + *     published by the Free Software Foundation; either version 2 of
> >> the
> >> + *     License, or (at your option) any later version.
> >> + *
> >> + *     This file is distributed in the hope that it will be useful,
> >> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >> + *     GNU General Public License for more details.
> >> + *
> >> + * Or, alternatively,
> >> + *
> >> + *  b) Permission is hereby granted, free of charge, to any person
> >> + *     obtaining a copy of this software and associated documentation
> >> + *     files (the "Software"), to deal in the Software without
> >> + *     restriction, including without limitation the rights to use,
> >> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> >> + *     sell copies of the Software, and to permit persons to whom the
> >> + *     Software is furnished to do so, subject to the following
> >> + *     conditions:
> >> + *
> >> + *     The above copyright notice and this permission notice shall be
> >> + *     included in all copies or substantial portions of the Software.
> >> + *
> >> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> >> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> >> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> >> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> >> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> >> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> >> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> >> + *     OTHER DEALINGS IN THE SOFTWARE.
> >> + */
> >> +
> >> +#include <dt-bindings/gpio/gpio.h>
> >> +#include <dt-bindings/interrupt-controller/irq.h>
> >> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> >> +#include <dt-bindings/pinctrl/rockchip.h>
> >> +#include <dt-bindings/clock/rk3228-cru.h>
> >> +#include "skeleton.dtsi"
> >> +
> >> +/ {
> >> +	compatible = "rockchip,rk3228";
> >> +
> >> +	interrupt-parent = <&gic>;
> >> +
> >> +	aliases {
> >> +		serial0 = &uart0;
> >> +		serial1 = &uart1;
> >> +		serial2 = &uart2;
> >> +	};
> >> +
> >> +	memory {
> >> +		device_type = "memory";
> >> +		reg = <0x60000000 0x40000000>;
> >> +	};
> > 
> > The amount of memory is a property of the board
> 
> done.
> 
> >> +
> >> +	cpus {
> >> +		#address-cells = <1>;
> >> +		#size-cells = <0>;
> > 
> > no enable-method?
> > 
> > As the rk3228 also does not have a pmu, does the newly created
> > "rockchip,rk3036-smp" work for you?
> 
> unlucky, that doesn't work...and our 3.10 kernel is using psci for
> rk3228's smp ops, maybe i should check that too, but i know nothing
> about psci for now :(

Using PSCI on more rockchip socs will make the ARM people very happy ;-) .

So definitly no argument from me against it. I guess you should only need the 
enable-method and psci node you should already have in your 3.10 dts, to 
actually enable it.

cpu@xxx {
		enable-method = "psci";
};

psci {
	compatible = "arm,psci-0.2";
	...
};


But we can of course add that in a later patch as well.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
