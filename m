From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 15/22] firmware: arm_scmi: abstract mailbox interface
Date: Wed, 4 Oct 2017 12:32:22 +0100
Message-ID: <f316b938-c6d5-3aa9-4f03-6b5c6ad4bfa7@arm.com>
References: <1506604306-20739-1-git-send-email-sudeep.holla@arm.com>
 <1506604306-20739-16-git-send-email-sudeep.holla@arm.com>
 <CAK8P3a0EUr_aEZdOrjHixzp44yXqsNxTMzBceSBTmk-x8x2MAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK8P3a0EUr_aEZdOrjHixzp44yXqsNxTMzBceSBTmk-x8x2MAg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, ALKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Roy Franz <roy.franz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Harb Abdulhamid <harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>, Ryan Harkin <Ryan.Harkin-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 04/10/17 12:24, Arnd Bergmann wrote:
> On Thu, Sep 28, 2017 at 3:11 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>> Some of the mailbox controller expects controller specific data in order
>> to implement simple doorbell mechanism as expected by SCMI specification.
>>
>> This patch creates a shim layer to abstract the mailbox interface so
>> that it can support any mailbox controller. It also provides default
>> implementation which maps to standard mailbox client APIs, so that
>> controllers implementing doorbell mechanism need not require any
>> additional layer.
>>
>> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> 
> Another level? Now we have three levels of stacked mailboxes, with
> the highest level being the combined mailbox/memory, then the shim,
> and below it the hardware mailbox.
> 
> Can you try to come up with a way to do this with fewer abstractions?
> 

I completely agree with you. I was against this but Jassi recommended
this. I just wanted this SCMI to work with mailbox controllers that
support simple doorbell mechanism as specified in the specification but
Jassi disagrees with that.

> Maybe you could assume that the mailbox itself can take variable-length
> data packets, and then use the shim here for those that require
> something else?
> 

As per SCMI specification, we pass all the data in shared memory and it
just expects to use a simple doorbell feature from hardware mailbox
controllers. It's done that way intentionally to avoid dependency on h/w
and we for sure will have variety of it and that defeats the purpose
of this standard specification.

Also, I have added shim only for specific controllers that need them.
E.g. ARM MHU as Jassi disagreed to add doorbell mechanism to that.
mbox_if provides default implementation that just calls direct mailbox
APIs.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
