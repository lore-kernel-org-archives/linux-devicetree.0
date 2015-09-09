From: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: Re: [PATCH v2 1/9] ARM: dts: imx6dql-nitrogen6x: add touchscreen support
Date: Wed, 9 Sep 2015 12:03:04 +0200
Message-ID: <CAAMH-ytWT12x8-h4zF7WfgxVPnZxq2hxkXC0MeP7ucTO-nYQbw@mail.gmail.com>
References: <1441645069-27263-1-git-send-email-gary.bisson@boundarydevices.com>
	<1441722886-22798-1-git-send-email-gary.bisson@boundarydevices.com>
	<1441722886-22798-2-git-send-email-gary.bisson@boundarydevices.com>
	<1441723760.3241.26.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441723760.3241.26.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Sep 8, 2015 at 4:49 PM, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> Am Dienstag, den 08.09.2015, 16:34 +0200 schrieb Gary Bisson:
>> This patch adds the different touchscreens that can be connected using
>> the displays available for this board.
>> http://boundarydevices.com/product-category/displays/
>>
>> Signed-off-by: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi b/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
>> index ad16dce..24b667d 100644
>> --- a/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
>> +++ b/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
>> @@ -284,6 +284,22 @@
>>       pinctrl-names = "default";
>>       pinctrl-0 = <&pinctrl_i2c3>;
>>       status = "okay";
>> +
>> +     egalax_ts@04 {
>
> I'd prefer to use generic names for the nodes, such as "touchscreen@04",
> and "touchscreen@38" below.

Ok will do. Plus for the two new boards, I'll try to follow Russell comment.

>> +             compatible = "eeti,egalax_ts";
>> +             reg = <0x04>;
>> +             interrupt-parent = <&gpio1>;
>> +             interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
>> +             wakeup-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
>> +     };
>> +
>> +     ft5x06_ts@38 {
>> +             compatible = "edt,edt-ft5x06";
>> +             reg = <0x38>;
>> +             interrupt-parent = <&gpio1>;
>> +             interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
>> +             wakeup-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
>
> This should be wake-gpios and GPIO_ACTIVE_HIGH according to the other
> users.

Actually I'm going to remove that line. First it should be wake-gpios
instead of wakeup-gpios. When I realized and changed it the driver
wouldn't work at all. Indeed looking at the source code and other
example it looks like it should be a different GPIO than the interrupt
one.

For the eGalax, the driver output a 1 and 0 to create the falling edge
that wakes the controller up and then releases the gpio as an input
for interrupts. But in the edt driver, the GPIO is kept as an output
which prevents from receiving any interrupt. Seems that the ft5x06
controllers on our display doesn't need any wake-up signal.

I'll submit a v3 very soon.

Regards,
Gary
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
