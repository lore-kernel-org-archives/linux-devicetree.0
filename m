From: Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v5 1/2] ARM: dts: bcm283x: Use stdout-path instead of
 console bootarg
Date: Fri, 8 Sep 2017 20:35:00 +0200
Message-ID: <6A817466-FA04-4181-AB07-434EC9781FB8@holtmann.org>
References: <1504125721-4760-1-git-send-email-loic.poulain@gmail.com>
 <19D1F3B6-A05B-425B-A06D-AD44EEE39BFE@holtmann.org>
 <874lsdnkk5.fsf@anholt.net>
 <C7897D52-34DE-4EAD-BA79-67ED91929D85@holtmann.org>
 <9153f30c-adf5-8563-8333-3ff2e2e46dc9@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9153f30c-adf5-8563-8333-3ff2e2e46dc9-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Florian,

>>>>> Add the serial port config to "chosen/stdout-path".
>>>>> Create serial0/1 aliases referring to uart0 ant uart1 paths.
>>>>> Remove unneeded earlyprintk.
>>>>> 
>>>>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>>>> Signed-off-by: Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>> ---
>>>>> arch/arm/boot/dts/bcm283x.dtsi | 7 ++++++-
>>>>> 1 file changed, 6 insertions(+), 1 deletion(-)
>>>>> 
>>>>> v2: dt-bindings as separate patch
>>>>>   rebase on upcoming pi3 dts changes
>>>>> v3: changes in bcm serdev drivers:
>>>>>   name refactoring and additional comments
>>>>>   Add generic host_set_baudrate method
>>>>>   Use agnostic device_property_read
>>>>> v4: changes in doc and dts:
>>>>>   Add additional params to broadcom bt dt-bindings
>>>>>   Set the max baudrate to 2000000 instead of 921600
>>>>>   use chosen/stdout-path instead of console=
>>>>>   remove useless earlyprintk
>>>>>   same changes in bcm283x.dtsi
>>>>> v5: remove 1/4 dt-bindings and 4/4 hci_bcm serdev support
>>>>>   1/4 and 4/4 merged in bluetooth-next tree
>>>>> 
>>>>> diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
>>>>> index 431dcfc..013431e 100644
>>>>> --- a/arch/arm/boot/dts/bcm283x.dtsi
>>>>> +++ b/arch/arm/boot/dts/bcm283x.dtsi
>>>>> @@ -20,8 +20,13 @@
>>>>> 	#address-cells = <1>;
>>>>> 	#size-cells = <1>;
>>>>> 
>>>>> +	aliases {
>>>>> +		serial0 = &uart0;
>>>>> +		serial1 = &uart1;
>>>>> +	};
>>>>> +
>>>>> 	chosen {
>>>>> -		bootargs = "earlyprintk console=ttyAMA0";
>>>>> +		stdout-path = "serial0:115200n8";
>>>>> 	};
>>>> 
>>>> is anybody taking care of these two patches. I do not see them in Linus’ tree yet?
>>> 
>>> arm-soc process unfortunately doesn't accept PRs between rc5 or 6 and
>>> the next rc1, so they're still in my TODO pile for when we get -rc1
>>> again.
>> 
>> the aliases change is actually fixing a real issue. The RPI 3 has the Bluetooth controller where the older models had the console. Leave the bluetooth { } section out of it, but at least fix the bootargs bug and use stdout-path with the correct aliases. Postponing real fixes like this until next -rc1 is a stupid process.
> 
> Since this is a real fix, what's the proper Fixes: tag for that so it
> can also be backported to -stable trees?
> 
> Fixes can be submitted pretty much at any time, and having a Fixes: tag
> helps everyone maintaining -stable trees to get that backported where
> appropriate.

backporting will be hard since these patches depend on changes that will only be available in 4.14-rc1. I don’t really know how invasive the patch that introduces uart0 for RPI 3 is.

However I am pretty sure that Loic can combine these two patches (and leaving the bluetooth { } section out) and send it with a proper annotation as fix.

Regards

Marcel

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
