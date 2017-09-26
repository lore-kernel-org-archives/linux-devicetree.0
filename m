From: Stewart Smith <stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] drivers: of: static DT reservations incorrectly added to dynamic list
Date: Tue, 26 Sep 2017 18:38:37 +1000
Message-ID: <87mv5hyhv6.fsf@linux.vnet.ibm.com>
References: <20170914102415.26395-1-stewart@linux.vnet.ibm.com> <CAL_JsqL29j59wJtmOAuD=N7Tccv2rxEMav90yxTyGTfhwHQUsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqL29j59wJtmOAuD=N7Tccv2rxEMav90yxTyGTfhwHQUsw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: obh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel@vger.kernel.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:
> On Thu, Sep 14, 2017 at 5:24 AM, Stewart Smith
> <stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org> wrote:
>> There are two types of memory reservations firmware can ask the kernel
>> to make in the device tree: static and dynamic.
>> See Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>>
>> If you have greater than 16 entries in /reserved-memory (as we do on
>> POWER9 systems) you would get this scary looking error message:
>> [    0.000000] OF: reserved mem: not enough space all defined regions.
>>
>> This is harmless if all your reservations are static (which with OPAL on
>> POWER9, they are).
>>
>> It is not harmless if you have any dynamic reservations after the 16th.
>>
>> In the first pass over the fdt to find reservations, the child nodes of
>> /reserved-memory are added to a static array in of_reserved_mem.c so that
>> memory can be reserved in a 2nd pass. The array has 16 entries. This is why,
>> on my dual socket POWER9 system, I get that error 4 times with 20 static
>> reservations.
>>
>> We don't have a problem on ppc though, as in arch/powerpc/kernel/prom.c
>> we look at the new style /reserved-ranges property to do reservations,
>> and this logic was introduced in 0962e8004e974 (well before any powernv
>> system shipped).
>>
>> Google shows up no occurances of that exact error message, so we're probably
>> safe in that no machine that people use has memory not being reserved when
>> it should be.
>>
>> The fix is simple, as there's a different code path for static and dynamic
>> allocations, we just don't add the region to the list if it's static. Since
>> it's a static *OR* dynamic region, this is a perfectly valid thing to do
>> (although I have not checked every real world device tree on the planet
>> for this condition)
>
> If the region is dynamic (i.e. no reg prop), then we bail from
> __reserved_mem_reserve_reg. So wouldn't this change make the list be
> empty always?

We get the dynamic node in __fdt_scan_reserved_mem() rather
than__reserved_mem_reserve_reg():


static int __init __reserved_mem_reserve_reg(unsigned long node,
                                             const char *uname)
{
...
        prop = of_get_flat_dt_prop(node, "reg", &len);
        if (!prop)
                return -ENOENT;
...
}

static int __init __fdt_scan_reserved_mem(unsigned long node, const char *uname,
                                          int depth, void *data)
{
....
....
        err = __reserved_mem_reserve_reg(node, uname);
        if (err == -ENOENT && of_get_flat_dt_prop(node, "size", NULL))
                fdt_reserved_mem_save_node(node, uname, 0, 0);

        /* scan next node */
        return 0;
}

So that should capture the dynamic reservations (as they're the ones
with the size property) to be handled by fdt_init_reserved_mem() later
in boot.

> Won't we have problems with lookups for devices with a "memory-region"
> property if static allocations are not in the list?

Ahh yep, I see the issue.

The array is being used for two things: reserving the memory and looking it
up during device init (seems like only used on ARM, which is why it
Worked For Me(TM) on POWER :)

It looks a bit more involved making that work, although not impossible.

> I'm inclined to just make the safe and easy change of increasing the
> array to 32 entries. That should be enough for everyone (TM).

that would certainly solve my immediate problem :)

(of course, given a CPU generation or two I'm sure we'd hit it again)

I'll send a patch that does that, and can asynchronously work on a patch
that addresses the device lookup of memory region problem (although
that'll be fairly down on my list of things to look at).

-- 
Stewart Smith
OPAL Architect, IBM.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
