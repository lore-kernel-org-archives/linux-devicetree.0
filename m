From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] of/irq: Drop obsolete 'interrupts' vs 'interrupts-extended'
 text
Date: Mon, 3 Nov 2014 10:07:53 -0700
Message-ID: <CAErSpo4pFCie-+fjRvyERMJuPxCV9DwX8uMWGO7UU=bNLdOi7A@mail.gmail.com>
References: <20141101233531.4958.96713.stgit@bhelgaas-glaptop2.roam.corp.google.com>
 <20141103101516.GA29621@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141103101516.GA29621@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 3, 2014 at 3:15 AM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> On Sat, Nov 01, 2014 at 11:35:31PM +0000, Bjorn Helgaas wrote:
>> a9ecdc0fdc54 ("of/irq: Fix lookup to use 'interrupts-extended' property
>> first") updated the description to say that:
>>
>>   - Both 'interrupts' and 'interrupts-extended' may be present
>>   - Software should prefer 'interrupts-extended'
>>   - Software that doesn't comprehend 'interrupts-extended' may use
>>     'interrupts'
>>
>> But there is still a paragraph at the end that prohibits having both and
>> says 'interrupts' should be preferred.
>>
>> Remove the contradictory text.
>>
>> Fixes: a9ecdc0fdc54 ("of/irq: Fix lookup to use 'interrupts-extended' property first")
>> Signed-off-by: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
>> CC: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org    # v3.13+
>> ---
>>  .../bindings/interrupt-controller/interrupts.txt   |    4 ----
>>  1 file changed, 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt b/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
>> index ce6a1a072028..8a3c40829899 100644
>> --- a/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
>> @@ -30,10 +30,6 @@ should only be used when a device has multiple interrupt parents.
>>    Example:
>>       interrupts-extended = <&intc1 5 1>, <&intc2 1 0>;
>>
>> -A device node may contain either "interrupts" or "interrupts-extended", but not
>> -both. If both properties are present, then the operating system should log an
>> -error and use only the data in "interrupts".
>
> Why not update the binding to explain that interrupts-extended is
> typically preferred?

I'm only trying to fix the contradictory text.  It's fine with me if
somebody wants to go farther and prefer interrupts-extended (though it
does look like "interrupts" will be more concise for machines with a
single interrupt controller).

Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
