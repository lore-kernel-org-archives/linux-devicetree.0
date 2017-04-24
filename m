From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] of: overlay_adjust_phandles() - do not modify const field
Date: Mon, 24 Apr 2017 16:40:05 -0500
Message-ID: <CAL_Jsq+CTM4Br2t8+hcNnfrDhmkJTmUtcgZQC__t+Ppn94e9zw@mail.gmail.com>
References: <1493011204-27635-1-git-send-email-frowand.list@gmail.com>
 <1493011204-27635-2-git-send-email-frowand.list@gmail.com>
 <CAL_Jsq+DxGJcggE6KKT_n76CpcCJkRB2sa3Lfm2GRTW78K_tUw@mail.gmail.com> <58FE49F4.7060600@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <58FE49F4.7060600-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

+Ben H

On Mon, Apr 24, 2017 at 1:54 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 04/24/17 09:56, Rob Herring wrote:
>> On Mon, Apr 24, 2017 at 12:20 AM,  <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>>>
>>> When adjusting overlay phandles to apply to the live device tree, can
>>> not modify the property value because it is type const.
>>>
>>> This is to resolve the issue found by Stephen Boyd [1] when he changed
>>> the type of struct property.value from void * to const void *.  As
>>> a result of the type change, the overlay code had compile errors
>>> where the resolver updates phandle values.
>>
>> Conceptually, I prefer your first version. phandles are special and
>> there's little reason to expose them except to generate a dts or dtb
>> from /proc/device-tree. We could still generate the phandle file in
>> that case, but I don't know if special casing phandle is worth it.
>
> The biggest thing that makes me wary about my first version is PPC
> and Sparc.  I can read their code, but do not know what the firmware
> is feeding into the kernel, so I felt like there might be some
> incorrect assumptions or fundamental misunderstandings that I
> may have.

I never let that stop me. ;) I guess one question is does
"ibm,phandle" need to be exposed to userspace. Maybe Ben has some
thoughts.

> If we do remove the phandle properties from the live tree, I think
> that phandle still needs to be exposed in /proc/device-tree
> because that is important information for being able to understand
> (or debug) code via reading the source.  It isn't a lot code.
>
> One factor I was not sure of to help choose between the first version
> and this approach is net memory size of the device tree:
>
>   first version:
>
>      Adds struct bin_attribute  (28 bytes on 32 bit arm) to every node

You could do a pointer to the struct instead.

>      Removes "linux,phandle" and "phandle" properties from nodes that
>      have a phandle (64 + 72 = 136 bytes)

I don't think it is that high because we don't copy the property names
and values. It's just 2x sizeof(struct property) plus whatever
overhead each unflatten_dt_alloc has.

>   second version plus subsequent "linux,phandle" removal:
>
>      Removes "linux,phandle" properties from nodes
>      that have a phandle (72 bytes)
>
> I do not have a feel of how many nodes have phandles in the many
> different device trees, so I'm not sure of the end result for the
> first version.

Probably well under half. Though in theory dtc could create a phandle
for every node.

> I do not have a strong preference between my first approach and second
> approach.  But now that I have done both, a choice can be made.  Let me
> know which way you want to go and I'll respin the one you prefer.
> For this version I'll make the change you suggested.  For the first
> version, I'll modify of_attach_mode() slightly more to remove any
> "phandle", "linux,phandle", and "ibm,phandle" property from the node
> before attaching it, and add the call to add the phandle sysfs
> file: __of_add_phandle_sysfs(np);

I still lean toward the former, but I guess it depends if there are
really any size savings.

Why would you remove properties in of_attach_mode? You would want to
convert populate_properties() to store the phandle from the start and
never create the properties.

[...]

>>> +               prop = __of_find_property(overlay, "phandle", NULL);
>>> +               newprop = __of_prop_alloc(prop->name, &phandle, sizeof(phandle),
>>> +                                         GFP_KERNEL);
>>> +               if (!newprop)
>>> +                       return -ENOMEM;
>>> +               __of_update_property(overlay, newprop, &prop);
>>> +
>>> +               prop = __of_find_property(overlay, "linux,phandle", NULL);
>>> +               newprop = __of_prop_alloc(prop->name, &phandle, sizeof(phandle),
>>> +                                         GFP_KERNEL);
>>
>> There is no reason to support "linux,phandle" for overlays. That is
>> legacy (pre ePAPR) which predates any overlays by a long time.
>
> I would like to have the same behavior for non-overlays as for overlays.
> The driver is the same whether the device tree description comes from
> the initial device tree or from an overlay.

Agreed. You only need to store one of them for both base and overlays.
You could go further and just ignore them altogether for overlays as
we should never have any with linux,phandle only, but that doesn't
really matter as it won't affect the memory usage.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
