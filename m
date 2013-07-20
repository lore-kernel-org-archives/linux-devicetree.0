From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of/irq: init struct resource to 0 in of_irq_to_resource()
Date: Fri, 19 Jul 2013 21:48:35 -0500
Message-ID: <CAL_JsqJN1MNymK1pojLdPwr6tUJoA1dSxAV913C2+jPZKgT4eQ@mail.gmail.com>
References: <1374143050-25848-1-git-send-email-bigeasy@linutronix.de>
 <51E8A937.9030109@gmail.com> <51E8E359.2030908@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51E8E359.2030908-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 19, 2013 at 1:57 AM, Sebastian Andrzej Siewior
<bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org> wrote:
> On 07/19/2013 04:49 AM, Rob Herring wrote:
>> On 07/18/2013 05:24 AM, Sebastian Andrzej Siewior wrote:
>>> It almost does not matter because most users use only the ->start member
>>> of the struct. However if this struct is passed to a platform device
>>> which is then added via platform_device_add() then the ->parent member is
>>> also used.
>>
>> Most users don't use the resource struct at all. The ones that do, all
>> seem to do a memset beforehand. So I think current behavior is correct.
>
> Seriously? That is your argument here? Most users use memset()
> beforehand and that makes it correct? Now look at this: you pass a
> pointer to fill out a struct and you don't do it properly.

>From a standpoint of initializing variables close to the point it is
allocated, yes.

> There is of_address_to_resource() which does a memset() why is okay
> here use memset()?

Fair enough. Consistency is important too. Rather than a memset, I'd
rather see the 3 remaining fields initialized and avoid setting most
of them twice.

Rob

>
>>
>> There are some occurrences that pass a resource in, but then don't
>> actually use the resource. Those we should fix.
>
>
>
>>
>> Rob
>>
>>>
>>> Signed-off-by: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
>>> ---
>>>  drivers/of/irq.c | 1 +
>>>  1 file changed, 1 insearch/powerpc/sysdev/mv64x60_dev.crtion(+)
>>>
>>> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
>>> index a3c1c5a..e0a72fb 100644
>>> --- a/drivers/of/irq.c
>>> +++ b/drivers/of/irq.c
>>> @@ -345,6 +345,7 @@ int of_irq_to_resource(struct device_node *dev, int index, struct resource *r)
>>>      if (r && irq) {
>>>              const char *name = NULL;
>>>
>>> +            memset(r, 0, sizeof(*r));
>>>              /*
>>>               * Get optional "interrupts-names" property to add a name
>>>               * to the resource.
>>>
>>
>
> Sebastian
