From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH 8/8] ARM: dts: aspeed: Clean up UART nodes
Date: Wed, 4 Oct 2017 15:30:10 +0930
Message-ID: <CACPK8Xe6eftZvZzuXChUr3+Nd+Hj5nDB723d-9QwrMszxto6-A@mail.gmail.com>
References: <20170928075149.8154-1-joel@jms.id.au> <20170928075149.8154-9-joel@jms.id.au>
 <1507094931.5452.20.camel@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507094931.5452.20.camel-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rick Altherr <raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 4, 2017 at 2:58 PM, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org> wrote:
> On Thu, 2017-09-28 at 17:21 +0930, Joel Stanley wrote:

>> -                     uart6: serial@1e787000 {
>> -                             compatible = "ns16550a";
>> -                             reg = <0x1e787000 0x1000>;
>> +                     vuart: vuart@1e787000 {
>
> Bit of a nit, but arguably this should be `vuart: serial@...`?

Yep, that makes sense.

>
>> +                             compatible = "aspeed,ast2400-vuart";
>> +                             reg = <0x1e787000 0x40>;
>>                               reg-shift = <2>;
>>                               interrupts = <10>;
>>                               clocks = <&clk_uart>;
>> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
>> index 251fc9f4637e..0b793305120a 100644
>> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
>> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi

>> @@ -287,9 +278,19 @@
>>                               };
>>                       };
>>
>> +                     uart1: serial@1e783000 {
>
> Earlier in the series you had a patch moving the ADC node to be in
> address-order with respect to the rest of the nodes but this change puts uart1
> out of address-order. As it turns out the uarts blocks are sprayed around in
> the address-space: uart1 and uart5 are together, the vuart is elsewhere, then
> uarts 2-4 are lumped together in another spot. I think it makes sense to
> consolidate them, but it is inconsistent. Thoughts?

Yeah. I'll move them to where they should be.

Cheers,

Joel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
