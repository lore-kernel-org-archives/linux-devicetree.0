From: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Issue with dt_to_config with dts files that include headers from dt-bindings
Date: Sat, 5 Nov 2016 19:01:27 -0600
Message-ID: <CA+rpMbKmufA9O-n1o4JJpOFR+56pSL6hQy4OJmOqcB7hvixLzw@mail.gmail.com>
References: <CALeDE9NVuztzMe8iO+OhOrwg3YxCr9VbEwh24-3MLK+5U82fYg@mail.gmail.com>
 <CA+rpMbK=T+Z=-pML4RHLJpLziy-UuANpUcgKNbq06tMNrdAPKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+rpMbK=T+Z=-pML4RHLJpLziy-UuANpUcgKNbq06tMNrdAPKw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Nov 5, 2016 at 2:56 PM, Gaurav Minocha
<gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Nov 4, 2016 1:19 PM, "Peter Robinson" <pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>> Hi Gaurav, Rob and Frank,
>>
>> I've just discovered the dt_to_config script (awesome thanks!) but it
>> errors out when a dts(i) includes a header file from dt-bindings. EG
>>
>> ./scripts/dtc/dt_to_config arch/arm/boot/dts/am335x-boneblack.dts
>> In file included from arch/arm/boot/dts/am335x-boneblack.dts:10:0:
>> arch/arm/boot/dts/am33xx.dtsi:11:35: error: no include path in which
>> to search for dt-bindings/gpio/gpio.h
>>  #include <dt-bindings/gpio/gpio.h>
>>                                    ^
>> arch/arm/boot/dts/am33xx.dtsi:12:40: error: no include path in which
>> to search for dt-bindings/pinctrl/am33xx.h
>>  #include <dt-bindings/pinctrl/am33xx.h>
>>                                         ^
>> arch/arm/boot/dts/am335x-boneblack.dts:12:41: error: no include path
>> in which to search for dt-bindings/display/tda998x.h
>>  #include <dt-bindings/display/tda998x.h>
>>                                          ^
>> Error: arch/arm/boot/dts/am335x-bone-common.dtsi:33.23-24 syntax error
>> FATAL ERROR: Unable to parse input tree
>>
>
> In bash do, export ARCH=arm
>
> Works for me!
>
>>
>> Regards,
>> Peter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
