From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: meson: Fix UART compatible
Date: Mon, 13 Oct 2014 12:44:54 +0200
Message-ID: <CAOQ7t2ZYYLVAJ8XG-PdeBZJC1YoTdAzt6bdbFxoUwDZaSF_dhw@mail.gmail.com>
References: <1413141624-8949-1-git-send-email-carlo@caione.org>
	<20141013101337.GB14739@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141013101337.GB14739@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 13, 2014 at 12:13 PM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> On Sun, Oct 12, 2014 at 08:20:24PM +0100, Carlo Caione wrote:
>> Fix the compatible for the UART to make it consistent with the other
>> compatibles for Meson6 and Meson8 and to avoid problems when the
>> meson8b will be introduced with a different UART driver.
>
> I don't follow why this would cause problems -- you simply wouldn't use
> the "amlogic,meson-uart" string for a Meson8b UART because it's not
> compatible with the programming model of the other UARTs.

I know it isn't really a _real_ problem. I just want to avoid any
confusion in the future and I'm pretty sure that changing it at this
stage of development doesn't cause any trouble (I wouldn't have asked
otherwise).

>> Signed-off-by: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/meson.dtsi    | 8 ++++----
>>  drivers/tty/serial/meson_uart.c | 4 ++--
>>  2 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
>> index e6539ea..a0d34ee 100644
>> --- a/arch/arm/boot/dts/meson.dtsi
>> +++ b/arch/arm/boot/dts/meson.dtsi
>> @@ -76,7 +76,7 @@
>>               };
>>
>>               uart_AO: serial@c81004c0 {
>> -                     compatible = "amlogic,meson-uart";
>> +                     compatible = "amlogic,meson6-uart";
>>                       reg = <0xc81004c0 0x14>;
>>                       interrupts = <0 90 1>;
>>                       clocks = <&clk81>;
>> @@ -84,7 +84,7 @@
>>               };
>>
>>               uart_A: serial@c81084c0 {
>> -                     compatible = "amlogic,meson-uart";
>> +                     compatible = "amlogic,meson6-uart";
>>                       reg = <0xc81084c0 0x14>;
>>                       interrupts = <0 90 1>;
>>                       clocks = <&clk81>;
>> @@ -92,7 +92,7 @@
>>               };
>>
>>               uart_B: serial@c81084dc {
>> -                     compatible = "amlogic,meson-uart";
>> +                     compatible = "amlogic,meson6-uart";
>>                       reg = <0xc81084dc 0x14>;
>>                       interrupts = <0 90 1>;
>>                       clocks = <&clk81>;
>> @@ -100,7 +100,7 @@
>>               };
>>
>>               uart_C: serial@c8108700 {
>> -                     compatible = "amlogic,meson-uart";
>> +                     compatible = "amlogic,meson6-uart";
>>                       reg = <0xc8108700 0x14>;
>>                       interrupts = <0 90 1>;
>>                       clocks = <&clk81>;
>> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
>> index 15c7497..4c3de09 100644
>> --- a/drivers/tty/serial/meson_uart.c
>> +++ b/drivers/tty/serial/meson_uart.c
>> @@ -590,7 +590,7 @@ static int meson_uart_remove(struct platform_device *pdev)
>>
>>
>>  static const struct of_device_id meson_uart_dt_match[] = {
>> -     { .compatible = "amlogic,meson-uart" },
>> +     { .compatible = "amlogic,meson6-uart" },
>
> If this is already in a mainline release, we shouldn't be changing the
> string unless we're absolutely certain no-one is adversely affected by
> the removal. We can deprecate the old string while maintaining
> compatibility, however.

I doubt anybody else is using mainline kernel on Meson SoCs but me and
Beniamino. IMO better change it now that the development is at an
early stage.

> There doesn't seem to be a binding document. Please could you add one?

Right. Actually the documentation[1] was submitted together with the
driver but it seems that it was lost during mainlining

[1] https://patchwork.ozlabs.org/patch/388369/

-- 
Carlo Caione
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
