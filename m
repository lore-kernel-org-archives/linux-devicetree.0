From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH 6/8] firmware: arm_scmi: add initial support for power
 protocol
Date: Thu, 8 Jun 2017 12:14:38 +0100
Message-ID: <4056bfe8-9df7-18cb-05ab-72186d44547e@arm.com>
References: <1496851812-19623-1-git-send-email-sudeep.holla@arm.com>
 <1496851812-19623-7-git-send-email-sudeep.holla@arm.com>
 <CAK8P3a3Vw2AvAr4hNd0A6Tih1YNorjiG2jkhcuo=CK1RF+aLFA@mail.gmail.com>
 <d610d205-aa19-cf2f-072a-8b64c8c8be66@arm.com>
 <CAK8P3a2wJ+hWro7+KYUBLRSTdbwKFjuzutajo436F-X=nMD5cQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK8P3a2wJ+hWro7+KYUBLRSTdbwKFjuzutajo436F-X=nMD5cQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Roy Franz <roy.franz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Harb Abdulhamid <harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 08/06/17 12:06, Arnd Bergmann wrote:
> On Thu, Jun 8, 2017 at 11:39 AM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>>
>>
>> On 07/06/17 21:38, Arnd Bergmann wrote:
>>> On Wed, Jun 7, 2017 at 6:10 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>>>
>>>> +struct scmi_msg_resp_power_attributes {
>>>> +       __le16 num_domains;
>>>> +       __le16 reserved;
>>>> +       __le32 stats_addr_low;
>>>> +       __le32 stats_addr_high;
>>>> +       __le32 stats_size;
>>>> +} __packed;
>>>> +
>>>> +struct scmi_msg_resp_power_domain_attributes {
>>>> +       __le32 flags;
>>>> +#define SUPPORTS_STATE_SET_NOTIFY(x)   ((x) & BIT(31))
>>>> +#define SUPPORTS_STATE_SET_ASYNC(x)    ((x) & BIT(30))
>>>> +#define SUPPORTS_STATE_SET_SYNC(x)     ((x) & BIT(29))
>>>> +           u8 name[SCMI_MAX_STR_SIZE];
>>>> +} __packed;
>>>
>>> I think it would be better to leave out the __packed here, which
>>> can lead to rather inefficient code. It's only really a problem when
>>> building with -mstrict-align, but it's better to write code in a way that
>>> doesn't rely on that.
>>>
>>
>> I assume you are referring to above structure only and not general
>> across all the structures ? I will have a look at this one.
> 
> I meant all of them, from my first look they all seem to have natural
> alignment on all members anyway. If there is one that doesn't, I would
> suggest annotating the individual unaligned members with __packed.
> 

OK, I will take a deeper look. Thanks for the suggestion.

>>>> +static int
>>>> +scmi_power_domain_attributes_get(struct scmi_handle *handle, u32 domain,
>>>> +                                struct power_dom_info *dom_info)
>>>> +{
>>>> +       int ret;
>>>> +       struct scmi_xfer *t;
>>>> +       struct scmi_msg_resp_power_domain_attributes *attr;
>>>> +
>>>> +       ret = scmi_one_xfer_init(handle, POWER_DOMAIN_ATTRIBUTES,
>>>> +                                SCMI_PROTOCOL_POWER, sizeof(domain),
>>>> +                                sizeof(*attr), &t);
>>>> +       if (ret)
>>>> +               return ret;
>>>> +
>>>> +       *(__le32 *)t->tx.buf = cpu_to_le32(domain);
>>>> +       attr = (struct scmi_msg_resp_power_domain_attributes *)t->rx.buf;
>>>
>>> It seems you require a similar pattern in each caller of scmi_one_xfer_init(),
>>> but it seems a little clumsy to always require those casts, so maybe there
>>> is a nicer way to do this. How about making scmi_one_xfer_init() act
>>> as an allocation function and having it return the buffer or a PTR_ERR?
>>>
>>
>> Yes I agree it doesn't looks all nice. I have changed these few times
>> while developing and then thought it's better to get some suggestions. I
>> am open to any suggestions that will help to make these nicer.
>>
>>> It also seems odd to have it named 'init' but actually allocate the scmi_xfer
>>> structure rather than filling a local variable that gets passed by reference.
>>>
>>
>> It does initialise but partially. scmi_one_xfer_get does pure allocation
>> while scmi_one_xfer_init initialise header variables and also tx/rx
>> size. But if you think it's odd, I will looks at ways to make it better.
> 
> Yes, I'm still thinking about it, but I think we can do better. If a function
> has both allocation and initialization parts in it, I would probably name
> it *_alloc() rather than *_init().
> 
> What is the relation between scmi_one_xfer_get() and
> scmi_one_xfer_init()? Do we need both in some callers, or
> just one of the two?

Currently only scmi_one_xfer_init is used. Initially I was using
scmi_one_xfer_get and initialising at callsite. Strictly speaking, all
the allocations are done at probe time, it's only grabbing and releasing
one at a time at runtime, hence the name _get and _put. I can merge
_init into _get. The way it-is is just artifact of how it got developed :(
-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
