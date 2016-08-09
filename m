From: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx: ventana: add RS485 txen gpio support
Date: Tue, 9 Aug 2016 12:08:03 -0700
Message-ID: <CAJ+vNU3y7LuSs2eRPcuavwJh0w0rBgnmzpqh4V2o5UHLAzBVKQ@mail.gmail.com>
References: <1467207504-5218-1-git-send-email-tharvey@gateworks.com> <20160808084029.GE4678@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160808084029.GE4678@tiger>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 8, 2016 at 1:40 AM, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Wed, Jun 29, 2016 at 06:38:24AM -0700, Tim Harvey wrote:
>> The GW54xx, GW53xx, and GW52xx all have an RS485 transceiver that uses an
>> IMX GPIO for the TX enable of the transceiver. Declare this properly.
>>
>> Signed-off-by: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/imx6qdl-gw52xx.dtsi | 3 +++
>>  arch/arm/boot/dts/imx6qdl-gw53xx.dtsi | 3 +++
>>  arch/arm/boot/dts/imx6qdl-gw54xx.dtsi | 3 +++
>>  3 files changed, 9 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi b/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
>> index 8bf1020..25ed57d 100644
>> --- a/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
>> +++ b/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
>> @@ -315,6 +315,8 @@
>>  &uart1 {
>>       pinctrl-names = "default";
>>       pinctrl-0 = <&pinctrl_uart1>;
>> +     fsl,uart-has-rtscts;
>
> This vendor specific property is deprecated.  Please use generic
> uart-has-rtscts instead.
>

ok - will do for v2

>> +     rts-gpio = <&gpio7 1 GPIO_ACTIVE_HIGH>;
>
> I cannot find this property in any bindings doc.  What I found is
> rts-gpios in bindings/serial/serial.txt.  Also, I'm not sure how this
> property is supported by IMX driver.
>

This is supported by serial_mctrl_gpio
(drivers/tty/serial/serial_mctrl_gpio.c) and the IMX serial driver
does support mctrl-gpio. The serial_mctrl_gpio driver calls
devm_gpiod_get_index_optional for pin names of cts,dsr,dcd,rng,rts,
and dtr. This ends up calling 'of_find_gpio' for these names which
looks for them based on 'gpio_suffixes' which is defined as { "gpios",
"gpio" } so that plural or singular is supported.

Its not documented that gpio specifies can be singular in
Documentation/devicetree/bindings/serial/serial.txt but I always hate
seeing gpio properties named '*-gpios' that only specify a single gpio
so I figured I would use the singular representation. Because this is
not clear in the documentation and there is only one other board using
'rts-gpio' (am335x-nano.dts) vs 'rts-gpios' I will go ahead and change
it for v2 to be more consistent.

Regards,

Tim
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
