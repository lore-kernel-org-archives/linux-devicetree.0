From: Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/7] ARM: dts: socfpga: add gpio pieces
Date: Tue, 6 May 2014 10:01:11 -0500
Message-ID: <CANk1AXQXWrsgbypTFENFf+X9yhE2t967icK0=3WAvxCPwsXFYA@mail.gmail.com>
References: <1395505004-22650-1-git-send-email-bigeasy@linutronix.de>
	<1395505004-22650-2-git-send-email-bigeasy@linutronix.de>
	<CAOesGMi_0fT4UbfGUp9jkrwYMXgfxC5gmXOBviU9PjAutPdHiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMi_0fT4UbfGUp9jkrwYMXgfxC5gmXOBviU9PjAutPdHiw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Alan Tull <atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, LinusW <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 5, 2014 at 5:02 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> Hi,
>
> I saw this patch as it came in through Dinh's pull request, see below=
:
>
>
> On Sat, Mar 22, 2014 at 9:16 AM, Sebastian Andrzej Siewior
> <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org> wrote:
>> The cycloneV has three gpio controllers, the first two with 29 gpios=
, the last
>> one with 27. This patch adds the three controller with the gpio driv=
er which is
>> now sitting the gpio tree.
>>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Acked-by: Alan Tull <atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
>> ---
>> v1=E2=80=A6v2:
>>         - #gpio-cells =3D <2>
>>         - third gpio block has now only 27 gpios
>>
>>  arch/arm/boot/dts/socfpga.dtsi | 64 +++++++++++++++++++++++++++++++=
+++++++++++
>>  1 file changed, 64 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socf=
pga.dtsi
>> index 537f1a5..2a84e67 100644
>> --- a/arch/arm/boot/dts/socfpga.dtsi
>> +++ b/arch/arm/boot/dts/socfpga.dtsi
>> @@ -463,6 +463,70 @@
>>                         status =3D "disabled";
>>                 };
>>
>> +               gpio@ff708000 {
>> +                       #address-cells =3D <1>;
>> +                       #size-cells =3D <0>;
>> +                       compatible =3D "snps,dw-apb-gpio";
>> +                       reg =3D <0xff708000 0x1000>;
>> +                       clocks =3D <&per_base_clk>;
>> +                       status =3D "disabled";
>> +
>> +                       gpio0: gpio-controller@0 {
>> +                               compatible =3D "snps,dw-apb-gpio-por=
t";
>> +                               gpio-controller;
>> +                               #gpio-cells =3D <2>;
>> +                               snps,nr-gpios =3D <29>;
>> +                               reg =3D <0>;
>> +                               interrupt-controller;
>> +                               #interrupt-cells =3D <2>;
>> +                               interrupts =3D <0 164 4>;
>> +                       };
>> +               };
>
> This is an odd setup. We usually would have it all in one node, since
> the @ff708000 is the GPIO controller, instead of adding a subnode wit=
h
> the actual GPIO info.
>
> So I would have expected something more like:
>
>
> gpio0: gpio-controller@ff708000 {
>                        #address-cells =3D <1>;
>                        #size-cells =3D <0>;
>                        compatible =3D "snps,dw-apb-gpio";
>                        reg =3D <0xff708000 0x1000>;
>                        interrupts =3D <0 164 4>;
>                       clocks =3D <&per_base_clk>;
>                        status =3D "disabled";
>                        gpio-controller;
>                        #gpio-cells =3D <2>;
>                        snps,nr-gpios =3D <29>;
>                        interrupt-controller;
>                        #interrupt-cells =3D <2>;
>                };
>
>
> ... or is there some underlying reason for having the two-layer
> approach that isn't obvious from this device tree?
>
>
> -Olof

The synopsys gpio ip can have 1, 2, or 3 gpio ports of varying widths
per IP block.  The simpler bindings assume one gpio port per IP block.

Alan Tull
aka
delicious quinoa
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
