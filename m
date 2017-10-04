From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 8/9 v2] usb: usb251xb: Add max power/current dts property support
Date: Wed, 4 Oct 2017 08:44:27 -0500
Message-ID: <CAL_Jsq+Z+5xHu4k3iGGGqf2CHLDy6mo9-TbkiniY67=xEbJzNQ@mail.gmail.com>
References: <20170915233113.17855-1-fancer.lancer@gmail.com>
 <20170916104220.3742-1-fancer.lancer@gmail.com> <20170916104220.3742-9-fancer.lancer@gmail.com>
 <20170920205255.5txbub3y6v6avolh@rob-hp-laptop> <20170920212739.GB3547@mobilestation>
 <CAL_Jsq+ftbGSQOOor_1L9NO9h7rjYm9nB26PxNOPgyHU6k3j_A@mail.gmail.com>
 <20170921171022.GA13721@mobilestation> <53559bc4-5faa-6797-7c12-f635049f1411@skidata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53559bc4-5faa-6797-7c12-f635049f1411-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Cc: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sergey.Semin-vHJ8rsvMqnUPfZBKTuL5GA@public.gmane.org, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 4, 2017 at 3:12 AM, Richard Leitner
<richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org> wrote:
>
> On 09/21/2017 07:10 PM, Serge Semin wrote:
>> On Thu, Sep 21, 2017 at 11:26:04AM -0500, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>> On Wed, Sep 20, 2017 at 4:27 PM, Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> ...
>
>>>> These are different parameters of the device. They got different configuration
>>>> registers and descriptions:
>>>> max_power* - ... This value also includes the power consumption of a
>>>> permanently attached peripheral if the hub is configured as a compound
>>>> device, and the embedded peripheral reports 0mA in its descriptors.
>>>> max_current* - ... This value does NOT include the power consumption of a
>>>> permanently attached peripheral if the hub is configured as a compound
>>>> device.
>>>
>>> Then the names here should somehow reflect the above. Perhaps
>>> "composite-current" and "hub-current" or something like that.
>>>
>>
>> I left the naming in accordance with the device datasheet. I thought it would be
>> better since the driver user would still need to consult with the device
>> documentation to properly set them. I don't really get how the difference is reflected
>> with the naming declared there though. So what naming would you prefer then? Might be
>> something like:
>> {sp,bp}-max-total-current - for so named {sp,bp}-max-power, since it includes all the
>> permanently attached peripherals.
>> {sp,bp}-max-removable-current - for so named {sp,bp}-max-current, since it doesn't
>> include the permanently attached peripherals.
>>
>> Or is it better to leave it in compliance with the documentation naming?
>
> I'd prefer the naming to be in accordance with the device datasheet too.
> Changing it will IMHO generate avoidable misunderstandings...

Okay, then add a vendor prefix.

> But if we should go with Robs proposal please make sure the name from
> the device datasheet is mentioned somewhere in the description of the
> binding.
>
>>
>>>>
>>>> Additionally as you can see, they both are measured in "mA", so it isn't
>>>> a real physical power.
>>>
>>> Well, I can't because there's no units.
>>>
>>
>> What this line means then?
>> - sp-max-{power,current} : ... The value is given in mA in a 0 - 100 range (default is 1mA).
>> - bp-max-{power,current} : ... The value is given in mA in a 0 - 510 range (default is 100mA).
>>
>> Maybe I don't know something and the description line should state the units somehow
>> clearer?

The reason we have units in the name is so we don't have to go lookup
the documentation to find the units and so people don't use the same
property name with different units.

> Append the unit to the binding name, just like in "power-on-time-ms". As
> there's no "Standard Unit Suffix" for mA stated in the documentation
> (Documentation/devicetree/bindings/property-units.txt) I think it should
> be "-milliamp"?

The reason being is we align around microamps and try to avoid
everyone picking their own units (celliamps anyone?). So unless
microamps is not enough range for you, I would stick with that.

If you have both units and vendor prefix, then I care less about the
poorly written datasheet naming used.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
