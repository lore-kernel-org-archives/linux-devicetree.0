From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC][PATCH] pstore: use DT reserved-memory bindings
Date: Mon, 1 Aug 2016 14:50:42 -0500
Message-ID: <CAL_Jsq+LLbpPBKkUZ_TTDky8FzKv5EoY3dosQg4oLnSJTQ=0=g@mail.gmail.com>
References: <20160730011623.GA25495@www.outflux.net> <CAL_JsqKgQGzqpj+McSVap_8F1NHZxyBnx+wqX1FohcG2XTCFDg@mail.gmail.com>
 <CAGXu5jJC20vg2PuU2B-spzcLtuc=KhuYQ1YffvtyxsgfP7H=uw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGXu5jJC20vg2PuU2B-spzcLtuc=KhuYQ1YffvtyxsgfP7H=uw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Hackmann <ghackmann-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 1, 2016 at 2:02 PM, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> On Mon, Aug 1, 2016 at 8:54 AM, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Fri, Jul 29, 2016 at 8:16 PM, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>>> Instead of a ramoops-specific node, use a child node of /reserved-memory.
>>> This requires that of_platform_populate() be called for the node, though,
>>> since it does not have its own "compatible" property.
>>>
>>> Suggested-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>> Signed-off-by: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>> ---
>>> Here's what I've got for moving ramoops under /reserved-memory... still
>>> feels like a bit of a hack.
>>> ---
>>>  Documentation/devicetree/bindings/misc/ramoops.txt | 48 ----------------------
>>>  .../bindings/reserved-memory/ramoops.txt           | 48 ++++++++++++++++++++++
>>
>> Use -M option or so you don't forget you can set in your git config:
>>
>> [diff]
>>         renames = true
>
> Added, thanks.
>
>>
>>>  Documentation/ramoops.txt                          |  2 +-
>>>  drivers/of/platform.c                              |  5 +++
>>>  fs/pstore/ram.c                                    | 12 +-----
>>>  5 files changed, 56 insertions(+), 59 deletions(-)
>>
>> [...]
>>
>>> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
>>> index 16e8daffac06..c07adf72bb8e 100644
>>> --- a/drivers/of/platform.c
>>> +++ b/drivers/of/platform.c
>>> @@ -356,6 +356,11 @@ static int of_platform_bus_create(struct device_node *bus,
>>>         void *platform_data = NULL;
>>>         int rc = 0;
>>>
>>> +       /* Always populate reserved-memory nodes. */
>>> +       if (strict && strcmp(bus->full_name, "/reserved-memory") == 0) {
>>> +               return of_platform_populate(bus, matches, lookup, parent);
>>> +       }
>>> +
>>
>> This can be a lot cleaner now with the DT changes in 4.8. We could
>> make this more generic and call of_platform_populate with the
>> /reserved-memory node as the root, but that would :
>
> Is there a word missing above? "...but that would [need]:" ?

Uh, didn't finish that. ...would create devices for other nodes with
compatible strings. That's not really a problem, but not necessary
either presently.

>> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
>> index 765390e..4c36e06 100644
>> --- a/drivers/of/platform.c
>> +++ b/drivers/of/platform.c
>> @@ -499,8 +499,15 @@ EXPORT_SYMBOL_GPL(of_platform_default_populate);
>>
>>  static int __init of_platform_default_populate_init(void)
>>  {
>> -       if (of_have_populated_dt())
>> -               of_platform_default_populate(NULL, NULL, NULL);
>> +       struct device_node *node;
>> +
>> +       if (!of_have_populated_dt())
>> +               return -ENODEV;
>> +
>> +       node = of_find_compatible_node(NULL, NULL, "ramoops");
>> +       of_platform_device_create(node, NULL, NULL);
>
> Does of_platform_device_create() DTRT if node is NULL here? (Looks
> like "yes", but goes through a spin lock first: I think it'd be nicer
> to check for a NULL node here.)

It does, but either way is fine with me.

> Should this first look for
> /reserved-memory, then ramoops?

No, that's not necessary. It could match if located in other places,
but it's not really the kernel's job to be a DT validator beyond what
it requires.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
