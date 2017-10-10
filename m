From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 09/12] of: overlay: avoid race condition between applying
 multiple overlays
Date: Tue, 10 Oct 2017 12:39:31 -0700
Message-ID: <59DD21F3.6080001@gmail.com>
References: <1507002826-16393-1-git-send-email-frowand.list@gmail.com>
 <1507002826-16393-10-git-send-email-frowand.list@gmail.com>
 <CAL_JsqKHkPp6M-aE9yVM1Bs599NTpjV33hGXvnOo-W8KKPPsJw@mail.gmail.com>
 <59D5A737.9090905@gmail.com> <20171010184014.m2chslx36kbhvgug@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171010184014.m2chslx36kbhvgug@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/10/17 11:40, Rob Herring wrote:
> On Wed, Oct 04, 2017 at 08:29:59PM -0700, Frank Rowand wrote:
>> On 10/04/17 08:19, Rob Herring wrote:
>>> On Mon, Oct 2, 2017 at 10:53 PM,  <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>>>>
>>>> The process of applying an overlay consists of:
>>>>   - unflatten an overlay FDT (flattened device tree) into an
>>>>     EDT (expanded device tree)
>>>>   - fixup the phandle values in the overlay EDT to fit in a
>>>>     range above the phandle values in the live device tree
>>>>   - create the overlay changeset to reflect the contents of
>>>>     the overlay EDT
>>>>   - apply the overlay changeset, to modify the live device tree,
>>>>     potentially changing the maximum phandle value in the live
>>>>     device tree
>>>>
>>>> There is currently no protection against two overlay applies
>>>> concurrently determining what range of phandle values are in use
>>>> in the live device tree, and subsequently changing that range.
>>>> Add a mutex to prevent multiple overlay applies from occurring
>>>> simultaneously.
>>>>
>>>> Ignoring 2 checkpatch warnings: Prefer using '"%s...", __func__'
>>>> so that the WARN() string will be more easily grepped.
>>>>
>>>> Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>>>> ---
>>>>  drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c |  7 +++++++
>>>>  drivers/of/overlay.c                         | 22 ++++++++++++++++++++++
>>>>  drivers/of/unittest.c                        | 21 +++++++++++++++++++++
>>>>  include/linux/of.h                           | 19 +++++++++++++++++++
>>>>  4 files changed, 69 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c b/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
>>>> index 7a7be0515bfd..c99f7924b1c6 100644
>>>> --- a/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
>>>> +++ b/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
>>>> @@ -221,6 +221,11 @@ static void __init tilcdc_convert_slave_node(void)
>>>>                 goto out;
>>>>         }
>>>>
>>>> +       /*
>>>> +        * protect from of_resolve_phandles() through of_overlay_apply()
>>>> +        */
>>>> +       of_overlay_mutex_lock();
>>>> +
>>>
>>> We can't be relying on callers to get the locking right...
>>
>> Agreed.
>>
>>
>>>
>>>>         overlay = tilcdc_get_overlay(&kft);
>>>>         if (!overlay)
>>>>                 goto out;
>>>> @@ -256,6 +261,8 @@ static void __init tilcdc_convert_slave_node(void)
>>>>                 pr_info("%s: ti,tilcdc,slave node successfully converted\n",
>>>>                         __func__);
>>>>  out:
>>>> +       of_overlay_mutex_unlock();
>>>> +
>>>>         kfree_table_free(&kft);
>>>>         of_node_put(i2c);
>>>>         of_node_put(slave);
>>>> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
>>>> index a0d3222febdc..4ed372af6ce7 100644
>>>> --- a/drivers/of/overlay.c
>>>> +++ b/drivers/of/overlay.c
>>>> @@ -71,6 +71,28 @@ static int build_changeset_next_level(struct overlay_changeset *ovcs,
>>>>                 const struct device_node *overlay_node,
>>>>                 bool is_symbols_node);
>>>>
>>>> +/*
>>>> + * of_resolve_phandles() finds the largest phandle in the live tree.
>>>> + * of_overlay_apply() may add a larger phandle to the live tree.
>>>> + * Do not allow race between two overlays being applied simultaneously:
>>>> + *    mutex_lock(&of_overlay_phandle_mutex)
>>>> + *    of_resolve_phandles()
>>>> + *    of_overlay_apply()
>>>> + *    mutex_unlock(&of_overlay_phandle_mutex)
>>>
>>> Why do these need to be separate functions? I think I mentioned it
>>> before, but essentially overlay_data_add() should be part of the
>>> overlay API. We may need to allow for callers to do each step, but
>>> generally I think the interface should just be "apply this fdt blob".
>>
>> Yes, that is where I want to end up.
> 
> So, is that not doable now? To put it another way, why does 
> of_resolve_phandles need to be a separate call? Seems like an internal 
> detail of how you apply an overlay to me.
> 
> Rob

Yes, of_resolve_phandles() should become an internal call made from
the "apply this fdt blob" function.

The biggest obstacle is drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
using overlays in a convoluted manner.  The second obstacle will
probably be the older overlay tests in drivers/of/unittest.c.  I
need to look at how to convert them to using actual overlays.

There are other fixes and improvements to the overlay code that
need to occur, but it is like pulling on a loose thread in a
sweater - it just goes on and on.  I'd like to get this set of
patches in, with whatever changes are absolutely essential,
then continue on with more patch sets.  This code will be
much easier for me to modify in the future if this patch set
is applied.

-Frank







--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
