From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 09/10] dts: versatile: add clock tree
Date: Wed, 28 May 2014 14:30:37 -0500
Message-ID: <CAL_JsqJZ8jVfCP2EaUrR7eongKqy89iw=iLUnQmVSYhQfdzcRg@mail.gmail.com>
References: <1400620176-7239-1-git-send-email-robherring2@gmail.com>
	<1400620176-7239-10-git-send-email-robherring2@gmail.com>
	<CACRpkdaBdNo=Nkoe62j9ZUspWZx7+cuisHT9EHVKR5aEdRWgBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdaBdNo=Nkoe62j9ZUspWZx7+cuisHT9EHVKR5aEdRWgBg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 23, 2014 at 8:28 AM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Tue, May 20, 2014 at 11:09 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>
>> The versatile dts is missing any clock data. Add the clocks.
>>
>> It is not clear from the documentation where pclk comes from, so for
>> now it is a dummy clock which is sufficient for things to work.
>
> AFAICT (from experiments and measurements on some boards, during which
> I destroyed some boards) that is actually just the 24MHz clock right off.
>
>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
>> +       core-module@10000000 {
>> +               compatible = "arm,core-module-versatile";
>> +               reg = <0x10000000 0x200>;
>> +
>> +               osc24M: oscillator@24M {
>> +                       #clock-cells = <0>;
>> +                       compatible = "fixed-clock";
>> +                       clock-frequency = <24000000>;
>> +               };
>
> Please follow the naming convention from the Integrator DTS, I am
> pretty sure this is a chrystal:
>
>         /* 24 MHz chrystal on the core module */
>         xtal24mhz: xtal24mhz@24M {
>                 #clock-cells = <0>;
>                 compatible = "fixed-clock";
>                 clock-frequency = <24000000>;
>         };

I'm not too sure I'm happy about this naming convention (yours or
mine). Following that node names are generic, it should probably be
just clk or clock. The unit address is a bit of an abuse as there is
no reg property, but we do need some way to make it unique. I don't
see the point of having the frequency in the name twice either.

>> +               /* OSC1 on AB, OSC4 on PB */
>> +               osc1: cm_aux_osc@24M {
>> +                       #clock-cells = <0>;
>> +                       compatible = "arm,versatile-cm-auxosc";
>> +                       clocks = <&osc24M>;
>> +               };
>
> Name xtal, also: why is this inside the core module node?
> You're explicitly saying it is on the PB (platform baseboard)
> and *not* on the core module!

But it is not a crystal. It is an output of the clock chip. This
follows what you have for integrator in name and location and it is
part of the AB core-module.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
