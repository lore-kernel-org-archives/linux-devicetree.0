From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 03/22] dt-bindings: arm: scmi: add ARM MHU specific
 mailbox client bindings
Date: Mon, 9 Oct 2017 15:37:25 +0100
Message-ID: <bf70dc4e-0977-00c7-94ac-d9de408ef4d2@arm.com>
References: <1506604306-20739-1-git-send-email-sudeep.holla@arm.com>
 <1506604306-20739-4-git-send-email-sudeep.holla@arm.com>
 <20171005232031.7373ni5ssln4wlpr@rob-hp-laptop>
 <CABb+yY1ra5bgRB1VND+NvCcDFqfggG04a+JPWFZ+HpNg08eR8g@mail.gmail.com>
 <CAL_Jsq+0paGePmJVjsyFJiHx0UaDPjQrbe3C030U+fuUkWCJ+A@mail.gmail.com>
 <CABb+yY2v8D9NFVsG9OwSpL8cswKihY6OUru8QA6Jfq5YmVVD7A@mail.gmail.com>
 <CAL_JsqKy+WzEiHRS0BrE3_3Md4CGOr0e2ZZ_vBCB-Opgg49s+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKy+WzEiHRS0BrE3_3Md4CGOr0e2ZZ_vBCB-Opgg49s+A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, ALKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Roy Franz <roy.franz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Harb Abdulhamid <harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>, Ryan Harkin <Ryan.Harkin-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 09/10/17 14:52, Rob Herring wrote:
> On Fri, Oct 6, 2017 at 9:26 PM, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Fri, Oct 6, 2017 at 9:24 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>> On Fri, Oct 6, 2017 at 6:01 AM, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>> On Fri, Oct 6, 2017 at 4:50 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>>>> On Thu, Sep 28, 2017 at 02:11:27PM +0100, Sudeep Holla wrote:
>>
>>>>>
>>>>>> +- mbox-data : For each phandle listed in mboxes property, an unsigned 32-bit
>>>>>> +           data as expected by the mailbox controller
>>>>>
>>>>> Shouldn't that be cells as part of mboxes property?
>>>>>
>>>> A MHU client can send any number of commands (such u32 values) over a channel.
>>>> This client (SCMI) sends just one command over a channel, but other
>>>> clients may/do send two or more.
> 
> The above definition doesn't support 2 or more as it is 1-1 with channels.
> 

In case of MHU, we just need one u32 per channel in SCMI context.

>>> Okay, then I guess I don't understand why this is in DT.
>>>
>> Yeah the client has to provide code (u32 value) for the commands it
>> sends, and that value is going to be platform specific. For example,
>> on Juno the ITS_AN_SCMI_COMMAND may be defined as BIT(7) while on my
>> platform it may be 0x4567
>>
>> For MHU based platforms, it becomes easy if the u32 is passed from DT.
>> And that should be ok since that is like a h/w parameter - a value
>> chosen/expected by the remote firmware.
> 
> Could it ever be more than 1 cell?
> 

No, as mentioned above.

> I guess being in DT is fine, but I'm still not sure about the naming.
> The current name suggests it is part of the mbox binding. Do we want
> that or should it be SCMI specific? Then "data" is vague. Perhaps
> "scmi-commands"?
> 

How about "scmi-mhu-commands" ? As scmi-commands sounds too generic
and part of SCMI specification. But they are rather MHU specific to
make use of each 32 bit in physical channel for a virtual channel.
IOW, it's just different way of representing the doorbell bits I
proposed previously as a 32-bit command expected by the driver.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
