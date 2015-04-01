From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: [PATCH] ARM: dts: sun5i: Enable touchscreen on
 Utoo P66
Date: Wed, 01 Apr 2015 17:29:13 +0200
Message-ID: <551C0EC9.8000103@redhat.com>
References: <1427652831-12838-1-git-send-email-hdegoede@redhat.com> <1427652831-12838-2-git-send-email-hdegoede@redhat.com> <20150330225255.GZ23664@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBTE56CUAKGQEZGID7KI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150330225255.GZ23664@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 31-03-15 00:52, Maxime Ripard wrote:
> Hi Hans,
>
> On Sun, Mar 29, 2015 at 08:13:51PM +0200, Hans de Goede wrote:
>> Add a node for the chipone-icn8318 touchscreen found on the Utoo P66 tablet.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/sun5i-a13-utoo-p66.dts | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts b/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts
>> index 0f0a411..d1d4d30 100644
>> --- a/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts
>> +++ b/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts
>> @@ -50,6 +50,7 @@
>>   #include "sunxi-common-regulators.dtsi"
>>   #include <dt-bindings/gpio/gpio.h>
>>   #include <dt-bindings/input/input.h>
>> +#include <dt-bindings/interrupt-controller/irq.h>
>>   #include <dt-bindings/pinctrl/sun4i-a10.h>
>>
>>   / {
>> @@ -93,6 +94,20 @@
>>   	pinctrl-0 = <&i2c1_pins_a>;
>>   	status = "okay";
>>
>> +	chipone_icn8318@40 {
>
> The node name should be the class of the device, something like
> touchscreen@40 in this case.

Ok I'll do a v2 fixing this.

>> +		compatible = "chipone,icn8318";
>> +		reg = <0x40>;
>> +		interrupt-parent = <&pio>;
>> +		interrupts = <9 IRQ_TYPE_EDGE_FALLING>; /* EINT9 (PG9) */
>
> Shouldn't you reference this pin in the pinctrl node too?

That is not necessary when specifying a gpio interrupt through the
irq chip (rather then through a gpios property), the mux is automatically
set to irq by the kernel when requesting the irq.

Also note that we must use the interrupts notation here as this is specified
by the i2c client bindings. None of the other boards using i2c + oob irq
pins specifies a pinmux for the irq pin either.

Regards,

Hans
