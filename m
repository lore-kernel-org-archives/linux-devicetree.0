From: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: gpio: Add binding documentation for
 gpio-thunderx
Date: Fri, 6 Jan 2017 15:26:15 -0800
Message-ID: <ed639d10-53d2-198b-c61a-1e0362bafc8b@caviumnetworks.com>
References: <1483491334-167095-1-git-send-email-ddaney.cavm@gmail.com>
 <1483491334-167095-2-git-send-email-ddaney.cavm@gmail.com>
 <20170104143350.7clanzqrxg4pchr6@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170104143350.7clanzqrxg4pchr6@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/04/2017 06:33 AM, Rob Herring wrote:
> On Tue, Jan 03, 2017 at 04:55:32PM -0800, David Daney wrote:
>> From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>>
>> Signed-off-by: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>> ---
>>  .../devicetree/bindings/gpio/gpio-thunderx.txt     | 33 ++++++++++++++++++++++
>>  1 file changed, 33 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-thunderx.txt
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-thunderx.txt b/Documentation/devicetree/bindings/gpio/gpio-thunderx.txt
>> new file mode 100644
>> index 0000000..ba3cdae
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpio/gpio-thunderx.txt
>> @@ -0,0 +1,33 @@
>> +Cavium ThunderX/OCTEON-TX GPIO controller bindings
>> +
>> +Required Properties:
>> +- reg: The controller bus address.
>> +- gpio-controller: Marks the device node as a GPIO controller.
>> +- #gpio-cells: Must be 2.
>> +  - First cell is the GPIO pin number relative to the controller.
>> +  - Second cell is standard of_gpio_flags:
>> +     1 - Active Low.
>> +     2 - Single Ended.
>
> Just reference where these are defined.

Thanks for the review.  This and the two changes below have been 
addressed in v2 of the patch set.

David.

>
>> +
>> +Optional Properties:
>> +- compatible: "cavium,thunder-8890-gpio", unused as PCI driver binding is used.
>> +- interrupt-controller: Marks the device node as an interrupt controller.
>> +- #interrupt-cells: Must be present and have value of 2 if
>> +                    "interrupt-controller" is present.
>> +  - First cell is the GPIO pin number relative to the controller.
>> +  - Second cell is triggering flags, one of:
>> +    1 - Edge Rising
>> +    2 - Edge Falling
>> +    4 - Level High
>> +    8 - Level Low
>
> Just reference interrupt-controller/interrupts.txt or the header
> defining these.
>
>> +
>> +Example:
>> +
>> +gpio_6_0: gpio0@6,0 {
>
> gpio@6,0
>
>> +	compatible = "cavium,thunder-8890-gpio";
>> +	reg = <0x3000 0 0 0 0>; /*  DEVFN = 0x30 (6:0) */
>> +	gpio-controller;
>> +	#gpio-cells = <2>;
>> +	interrupt-controller;
>> +	#interrupt-cells = <2>;
>> +};
>> --
>> 1.8.3.1
>>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
