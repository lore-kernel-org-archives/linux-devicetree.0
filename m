From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Issue with dt_to_config with dts files that include headers from
 dt-bindings
Date: Mon, 7 Nov 2016 10:51:13 -0800
Message-ID: <5820CD21.5010603@gmail.com>
References: <CALeDE9NVuztzMe8iO+OhOrwg3YxCr9VbEwh24-3MLK+5U82fYg@mail.gmail.com>
 <CA+rpMbK=T+Z=-pML4RHLJpLziy-UuANpUcgKNbq06tMNrdAPKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+rpMbK=T+Z=-pML4RHLJpLziy-UuANpUcgKNbq06tMNrdAPKw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter Robinson <pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/05/16 13:56, Gaurav Minocha wrote:
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
> 

Were there any other error messages reported? There should have
been a message suggesting that $ARCH was not set (if it wasn't)
and that it did not have the value of "arm".

If that message did not exist, I would like to understand why.

If the message did exist, but was not clear, how could the
message change to be more helpful?

-Frank
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
