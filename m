From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 4/7] dma: of: introduce of_dma_is_coherent() helper
Date: Fri, 28 Feb 2014 10:17:13 -0500
Message-ID: <5310A879.40509@ti.com>
References: <1393535872-20915-1-git-send-email-santosh.shilimkar@ti.com>	<1393535872-20915-5-git-send-email-santosh.shilimkar@ti.com>	<10040083.PbPEQQPCjl@wuerfel> <CAL_JsqL6-hoD4F7+adPhsOJXeM5f+wpEuBWg_6AWqj3k2v0NEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqL6-hoD4F7+adPhsOJXeM5f+wpEuBWg_6AWqj3k2v0NEw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 28 February 2014 10:14 AM, Rob Herring wrote:
> On Fri, Feb 28, 2014 at 3:39 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>> On Thursday 27 February 2014 16:17:49 Santosh Shilimkar wrote:
>>> +
>>> +/**
>>> + * of_dma_is_coherent - Check if device is coherent
>>> + * @np:        device node
>>> + *
>>> + * It returns true if "dma-coherent" property was found
>>> + * for this device in DT.
>>> + */
>>> +bool of_dma_is_coherent(struct device_node *np)
>>> +{
>>> +       struct device_node *node = np;
>>> +
>>> +       while (node) {
>>> +               if (of_property_read_bool(node, "dma-coherent")) {
>>> +                       of_node_put(node);
>>> +                       return true;
>>> +               }
>>> +               node = of_get_next_parent(node);
>>> +       }
>>> +       return false;
>>> +}
>>> +EXPORT_SYMBOL_GPL(of_dma_is_coherent);
>>>
>>
>> This won't work on architectures that are always coherent and
>> did not need 'dma-coherent' properties before, such as IBM
>> Power servers.
>>
>> That said, I think the property makes sense, and we already have
>> platforms using it (highbank is the one I'm aware of).
>>
>> We probably need ways to override this function in both ways:
>> "always coherent" (powerpc, x86), and "never coherent" (keystone
>> without LPAE) from platform code, and it would be nice to put
>> either option into DT in a global location as well. We may have
>> to go through a few iterations of this patch to get the best
>> algorithm, but I think the interface is good at least.
> 
> I know Will D was not a fan of this property. Primarily I believe
> because you may need to describe more than just a boolean in more
> complex bus topologies.
> 
> Effectively, highbank is always coherent. It was only PCI that is
> non-coherent, but I can safely say PCI will never be enabled at this
> point. There are no designs with PCI beyond 1 or 2 validation boards
> (total boards, not designs), and getting PCI to work was quite hacky
> due to only a 1MB window. The other masters are programmable, but only
> the coherent path is used as the non-coherent path actually has some
> issues. I had expected the opposite believing the ACP port would
> actually have issues which is also why I made it configurable.
> 
I also like it to be configurable per device since you can handle
the broken masters if any. On Keystone we have one of the master
broken(non-PCI) and this helps to take care of that case.

Regards,
Santosh


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
