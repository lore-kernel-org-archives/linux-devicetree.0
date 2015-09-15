From: Mitchel Humpherys <mitchelh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH] of: Check for overlap in reserved memory regions
Date: Mon, 14 Sep 2015 18:16:31 -0700
Message-ID: <vnkwzj0o1nyo.fsf@codeaurora.org>
References: <CAL_JsqJB_EifnsgnU=ECzhoaSyeD=2652OEBnAjs-8+aKq5LZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJB_EifnsgnU=ECzhoaSyeD=2652OEBnAjs-8+aKq5LZQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Rob Herring's message of "Mon, 14 Sep 2015 14:21:04 -0500")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel@vger.kernel.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 14 2015 at 02:21:04 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Fri, Sep 11, 2015 at 12:31 PM, Mitchel Humpherys
> <mitchelh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>> Any overlap in the reserved memory regions (those specified in the
>> reserved-memory DT node) is a bug.  These bugs might go undetected as
>> long as the contested region isn't used simultaneously by multiple
>> software agents, which makes such bugs hard to debug.  Fix this by
>> printing a scary warning during boot if overlap is detected.

[...]

>> +
>> +static void __init __rmem_check_for_overlap(void)
>> +{
>> +       int i;
>> +
>> +       if (reserved_mem_count < 2)
>> +               return;
>> +
>> +       memcpy(sorted_reserved_mem, reserved_mem, sizeof(sorted_reserved_mem));
>> +       sort(sorted_reserved_mem, reserved_mem_count,
>> +            sizeof(sorted_reserved_mem[0]), __rmem_cmp, NULL);
>
> Why not just sort reserved_mem?

Yeah, I considered that but wasn't sure if it would break things in the
few places where the ordering of reserved_mem matters (like
__find_rmem).  Looking closer I think we're safe to sort reserved_mem
array directly to avoid the memcpy.  Will update in v2.

>
>> +       for (i = 0; i < reserved_mem_count - 1; i++) {
>> +               struct reserved_mem *this, *next;
>> +
>> +               this = &sorted_reserved_mem[i];
>> +               next = &sorted_reserved_mem[i + 1];
>> +               if (!(this->base && next->base))
>> +                       continue;
>> +               if (this->base + this->size > next->base) {
>> +                       phys_addr_t this_end, next_end;
>> +
>> +                       this_end = this->base + this->size;
>> +                       next_end = next->base + next->size;
>> +                       WARN(1, "Reserved mem: OVERLAP DETECTED!\n");
>> +                       pr_err("%s (%pa--%pa) overlaps with %s (%pa--%pa)\n",
>
> This seems overly verbose having both WARN and pr_err. I'd combine
> these. I don't think the stack trace from a WARN is too useful here
> given it is the DT file that users will need to go look at.

Yeah the reason for the WARN is to make it harder for this to slip by,
and I thought a BUG might be too heavy-handed.  I should be able to
squeeze the content of the pr_err into the WARN in v2.


-Mitch

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
