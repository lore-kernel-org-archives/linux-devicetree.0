From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 2/2] of: changesets: Introduce changeset helper methods
Date: Mon, 14 Nov 2016 12:04:07 +0100
Message-ID: <b2cef3fb-cbb4-f34b-cb9a-84578bb67751@redhat.com>
References: <20161104144241.18002-1-hdegoede@redhat.com>
 <20161104144241.18002-2-hdegoede@redhat.com> <5827CCC3.90003@gmail.com>
 <582968FA.4020800@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <582968FA.4020800-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 14-11-16 08:34, Frank Rowand wrote:
> Hi Hans, Pantelis,
>
> On 11/12/16 18:15, Frank Rowand wrote:
>> On 11/04/16 07:42, Hans de Goede wrote:
>>> From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>>>
>>> Changesets are very powerful, but the lack of a helper API
>>> makes using them cumbersome. Introduce a simple copy based
>>> API that makes things considerably easier.
>>>
>>> To wit, adding a property using the raw API.
>>>
>>> 	struct property *prop;
>>> 	prop = kzalloc(sizeof(*prop)), GFP_KERNEL);
>>> 	prop->name = kstrdup("compatible");
>>> 	prop->value = kstrdup("foo,bar");
>>> 	prop->length = strlen(prop->value) + 1;
>>> 	of_changeset_add_property(ocs, np, prop);
>>>
>>> while using the helper API
>>>
>>> 	of_changeset_add_property_string(ocs, np, "compatible",
>>> 			"foo,bar");
>>>
>>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>> ---
>>> Changes in v2 (hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org):
>>> -Address review comments from:
>>>  https://www.spinics.net/lists/kernel/msg2252845.html
>>
>> That points to the May 9 version 1 patches from Pantelis (as expected),
>> but containing 4, not 2, patches.  Patch 1/4 was applied.  Patch 4/4
>> seems to have disappeared?
>>
>> Pantelis then sent a version 2 set of the patches on May 16.
>>
>> Your version is a modification of the May 9 patches (as would be expected
>> of a version 2).  It is confusing to have two different version 2 patch
>> sets.  I don't have any brilliant ideas on how this patch set could have
>> been named differently to avoid that confusion.
>>
>> The point of this little side-track is simply to note the existence of two
>> different version 2 series so I won't be confused when I revisit this
>> thread in the future.
>>
>>>  -Simplify (and fix) __of_changeset_add_update_property_copy OOM handling
>>>  -Remove (by manual inlining) these 2 static helpers:
>>>   __of_changeset_add_update_property_u32
>>>   __of_changeset_add_update_property_bool
>>>  -Remove the following exported helper method:
>>>   of_changeset_node_move_to
>>
>> Not all comments were addressed.
>>
>> There are some other changes made that are not noted in the changelog.
>>
>> I am still reading through the patches. I will reply again either with
>> a reviewed-by or specific comments when I finish.
>
> Replying here for the entire patchset (there was no patch 0 to reply to).
>
> After reading through the patches, my reply is meta instead of specific
> comments about the code.
>
> There are very few users of change sets in tree.  I do not see the need to
> add these helpers until such users are likely to appear.
>
> I would expect change sets to be _mostly_ used internally by the device tree
> overlay framework, not directly by drivers.  If change sets are an attractive
> technology for drivers, I want to approach that usage very carefully to avoid
> inappropriate use, which could be very difficult to reign in after the fact.
>
> Even if helpers should be added, this seems to be an overly complex approach.
> If the need for these helpers becomes apparent I can provide review comments
> with the specifics about how it appears to be overly complex.
>
> Can you please  provide some more insights into the needs driving the desire
> to have change set helpers and the expected use cases of them?  Please put
> your architect's hat on when replying to this question.

My use case for this is discussed in this thread:
https://www.spinics.net/lists/arm-kernel/msg536111.html

With the dt-bindings for the hardware-manager I want to add here:
https://www.spinics.net/lists/arm-kernel/msg536109.html

Note that there is a lot of discussion in this thread whether or
not this belongs in the kernel. I strongly believe though that
some functionality like this will be needed in the kernel for
ARM+dt devices going forward, just like there is plenty of x86
code which adjusts itself to specific hardware, because whether
we like it or not hardware (revisions) will always have quirks.

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
