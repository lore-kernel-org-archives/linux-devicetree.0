From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: sun7i: Add dts file for the
 Orangepi SBC
Date: Sat, 04 Apr 2015 15:00:10 +0200
Message-ID: <551FE05A.6000108@redhat.com>
References: <1428137994-18343-1-git-send-email-hdegoede@redhat.com> <20150404124754.GJ14618@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBXWA76UAKGQEXIEUQDI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150404124754.GJ14618@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 04-04-15 14:47, Maxime Ripard wrote:
> Hi Hans,
>
> On Sat, Apr 04, 2015 at 10:59:53AM +0200, Hans de Goede wrote:
>> The Orangepi is a development board using the Allwinner A20 SoC, with 1G RAM,
>> microsd slot, HDMI, 1Gbit ethernet, USB wifi, Micro USB (otg), sata, 4 USB A
>> ports, ir receiver and a headphones jack.
>>
>> Also see:
>> http://linux-sunxi.org/Xunlong_Orange_Pi
>> http://www.orangepi.org/
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/Makefile               |   1 +
>>   arch/arm/boot/dts/sun7i-a20-orangepi.dts | 229 +++++++++++++++++++++++++++++++
>>   2 files changed, 230 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/sun7i-a20-orangepi.dts
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 2426f0a..d9b609d 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -551,6 +551,7 @@ dtb-$(CONFIG_MACH_SUN7I) += \
>>   	sun7i-a20-olinuxino-lime.dtb \
>>   	sun7i-a20-olinuxino-lime2.dtb \
>>   	sun7i-a20-olinuxino-micro.dtb \
>> +	sun7i-a20-orangepi.dtb \
>>   	sun7i-a20-pcduino3.dtb \
>>   	sun7i-a20-pcduino3-nano.dtb \
>>   	sun7i-a20-wexler-tab7200.dtb
>> diff --git a/arch/arm/boot/dts/sun7i-a20-orangepi.dts b/arch/arm/boot/dts/sun7i-a20-orangepi.dts
>> new file mode 100644
>> index 0000000..2ef79b7
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/sun7i-a20-orangepi.dts
>> @@ -0,0 +1,229 @@
>> +/*
>> + * Copyright 2015 Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> + *
>> + * Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> + *
>> + * This file is dual-licensed: you can use it either under the terms
>> + * of the GPL or the X11 license, at your option. Note that this dual
>> + * licensing only applies to this file, and not this project as a
>> + * whole.
>> + *
>> + *  a) This file is free software; you can redistribute it and/or
>> + *     modify it under the terms of the GNU General Public License as
>> + *     published by the Free Software Foundation; either version 2 of the
>> + *     License, or (at your option) any later version.
>> + *
>> + *     This file is distributed in the hope that it will be useful,
>> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + *     GNU General Public License for more details.
>> + *
>> + *     You should have received a copy of the GNU General Public
>> + *     License along with this file; if not, write to the Free
>> + *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
>> + *     MA 02110-1301 USA
>> + *
>> + * Or, alternatively,
>> + *
>> + *  b) Permission is hereby granted, free of charge, to any person
>> + *     obtaining a copy of this software and associated documentation
>> + *     files (the "Software"), to deal in the Software without
>> + *     restriction, including without limitation the rights to use,
>> + *     copy, modify, merge, publish, distribute, sublicense, and/or
>> + *     sell copies of the Software, and to permit persons to whom the
>> + *     Software is furnished to do so, subject to the following
>> + *     conditions:
>> + *
>> + *     The above copyright notice and this permission notice shall be
>> + *     included in all copies or substantial portions of the Software.
>> + *
>> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
>> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
>> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
>> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + *     OTHER DEALINGS IN THE SOFTWARE.
>> + */
>> +
>> +/dts-v1/;
>> +#include "sun7i-a20.dtsi"
>> +#include "sunxi-common-regulators.dtsi"
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/pinctrl/sun4i-a10.h>
>> +
>> +/ {
>> +	model = "Orange Pi";
>> +	compatible = "xunlong,orangepi", "allwinner,sun7i-a20";
>> +
>> +	aliases {
>> +		serial0 = &uart0;
>> +	};
>
> This should have a matching /chosen/stdout-path property.
>
> The rest of the patch is fine, I can apply it and add the property, if
> that's ok for you.

Yes that ok with me.

Thanks,

Hans
