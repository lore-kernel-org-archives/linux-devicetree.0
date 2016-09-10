From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: add rockchip PX3 board
Date: Sat, 10 Sep 2016 12:07:47 +0200
Message-ID: <2476266.BiuZDgbs5G@phil>
References: <1473498094-16279-1-git-send-email-andy.yan@rock-chips.com> <1777115.uSB6Aee8zy@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1777115.uSB6Aee8zy@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Samstag, 10. September 2016, 12:03:38 CEST schrieb Heiko Stuebner:
> Am Samstag, 10. September 2016, 17:01:34 CEST schrieb Andy Yan:
> > PX3 board is designed by Rockchip for automotive field,
> > which intergrated with CVBS(TP2825)/MIPI DSI/LVDS/HDMI
> > video input/output interface, WIFI/BT/GPS(on a module
> > named S500 which based on MT6620), Gsensor BMA250E and
> > light&proximity sensor STK3410.
> > 
> > Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
> [...]
> 
> > diff --git a/arch/arm/boot/dts/rk3188-px3.dts
> > b/arch/arm/boot/dts/rk3188-px3.dts new file mode 100644
> > index 0000000..ece45d7
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/rk3188-px3.dts
> > @@ -0,0 +1,337 @@
> > +/*
> > + * Copyright (c) 2016 Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > + *
> > + * This file is dual-licensed: you can use it either under the terms
> > + * of the GPL or the X11 license, at your option. Note that this dual
> > + * licensing only applies to this file, and not this project as a
> > + * whole.
> > + *
> > + *  a) This file is free software; you can redistribute it and/or
> > + *     modify it under the terms of the GNU General Public License as
> > + *     published by the Free Software Foundation; either version 2 of the
> > + *     License, or (at your option) any later version.
> > + *
> > + *     This file is distributed in the hope that it will be useful,
> > + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + *     GNU General Public License for more details.
> > + *
> > + * Or, alternatively,
> > + *
> > + *  b) Permission is hereby granted, free of charge, to any person
> > + *     obtaining a copy of this software and associated documentation
> > + *     files (the "Software"), to deal in the Software without
> > + *     restriction, including without limitation the rights to use,
> > + *     copy, modify, merge, publish, distribute, sublicense, and/or
> > + *     sell copies of the Software, and to permit persons to whom the
> > + *     Software is furnished to do so, subject to the following
> > + *     conditions:
> > + *
> > + *     The above copyright notice and this permission notice shall be
> > + *     included in all copies or substantial portions of the Software.
> > + *
> > + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> > + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> > + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> > + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> > + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > + *     OTHER DEALINGS IN THE SOFTWARE.
> > + */
> > +
> > +/dts-v1/;
> > +#include <dt-bindings/input/input.h>
> > +#include "rk3188.dtsi"
> > +
> > +/ {
> > +	model = "Rockchip PX3";
> > +	compatible = "rockchip,px3", "rockchip,rk3188";
> > +
> > +	chosen {
> > +		bootargs = "console=ttyS2,115200 earlyprintk";
> > +	};
> 
> setting bootargs isn't favoured, you can instead use
> 	stdout-path = "serial2:115200n8";
> 
> to define the default console
> 
> > +&i2c0 {
> > +	status = "okay";
> > +
> > +	 /* Accelerometer */
> > +	bma250@18 {
> > +		compatible = "bma250";
> > +		reg = <0x18>;
> > +		interrupt-parent = <&gpio0>;
> > +		interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
> > +	};
> 
> driver seems to be missing a devicetree binding (module_id_table
> and dt-binding document)

found it, should be

	bosch,bma250

according to Documentation/devicetree/bindings/iio/accel/bma180.txt

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
