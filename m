From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 5/5] gpio: of: Add support to have multiple gpios in
 gpio-hog
Date: Wed, 16 Mar 2016 16:48:20 +0530
Message-ID: <56E940FC.3030506@nvidia.com>
References: <1457703804-3016-1-git-send-email-ldewangan@nvidia.com>	<1457703804-3016-6-git-send-email-ldewangan@nvidia.com> <CACRpkdaoKeKAJX1mOD2v1rG_5ZVjAo66agoZrs6E606syUDLSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdaoKeKAJX1mOD2v1rG_5ZVjAo66agoZrs6E606syUDLSQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?B?UGF3ZcWCIE1vbGw=?= <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Tuesday 15 March 2016 07:51 PM, Linus Walleij wrote:
> On Fri, Mar 11, 2016 at 2:43 PM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
>> The child node for gpio hogs under gpio controller's node
>> provide the mechanism to automatic GPIO request and
>> configuration as part of the gpio-controller's driver
>> probe function.
>>
>> Currently, property "gpio" takes one gpios for such
>> configuration. Add support to have multiple GPIOs in
>> this property so that multiple GPIOs of gpio-controller
>> can be configured by this mechanism with one child node.
>>
>> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Cc: Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>
>> Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> ---
>> Changes from V1:
>> - Add "labels" property for GPIO label names.
> Actually it's just "label" as seen from the code and the binding.
> Though it would make sense to have labels (pluralis) as it can be more
> than one and accompanies "gpios" which is plural.
>
> Rob: what is the pattern here?
>
> (Grep the existing bindings to check how multiple labels are handled
> in other subsystems...)

No property found for "labels" in the bindings folder. However, "label" 
is used for single string.

If Rob is fine then we can go with "labels" to start something new..


> (...)
>> -       if (name && of_property_read_string(np, "line-name", name))
>> -               *name = np->name;
>> +       if (!name)
>> +               goto out;
>>
>> +       ret = of_property_read_string(np, "line-name", name);
>> +       if (ret)
>> +               ret = of_property_read_string_index(np, "label", gpio_index,
>> +                                                   name);
>> +       if (ret)
>> +               *name = np->name;
> This looks to me like if "line-name" is specified, all lines will get the
> same name if gpios contain more than one item. Is this what we want?
yaah, line-name is deprecated property and so not adding array string 
here. Array string will be supported with label only. I did not add 
print as deprecated property to avoid noise in log.

We will be hardly have "labels" and "line-names" together.



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
