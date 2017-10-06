From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 16/22] firmware: arm_scmi: add arm_mhu specific mailbox interface
Date: Fri, 6 Oct 2017 19:17:17 +0530
Message-ID: <CABb+yY1w358uw2EoeioAvZy06LTuOO0krGFFXoQSNAR5m5ANmQ@mail.gmail.com>
References: <1506604306-20739-1-git-send-email-sudeep.holla@arm.com>
 <1506604306-20739-17-git-send-email-sudeep.holla@arm.com> <CAK8P3a0XmiXqZ-z7WV+nk7B86p23Jmf31Q=pVovXVebhA28_0Q@mail.gmail.com>
 <CABb+yY1N6hmC6Kd2QteMw_oCf=-mYHf7p6RdhYPQK+QUO7VP4A@mail.gmail.com> <f142dac2-a27c-4c46-4d22-4df4f2e8cfb1@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f142dac2-a27c-4c46-4d22-4df4f2e8cfb1-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, ALKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Roy Franz <roy.franz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Harb Abdulhamid <harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>, Ryan Harkin <Ryan.Harkin-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 6, 2017 at 7:02 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>
>
> On 06/10/17 12:26, Jassi Brar wrote:
>> On Wed, Oct 4, 2017 at 5:06 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>>> On Thu, Sep 28, 2017 at 3:11 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>>>> This patch adds ARM MHU specific mailbox interface for SCMI.
>>>>
>>>> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>>>> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
>>>
>>> This clearly needs an explanation why we need another driver.
>>>
>> Yes the patch needs explanation which is that we need a shim layer to
>> map SCMI requests onto what the underlying controller expects. The
>> alternative was to clone the controller driver (MHU now and others
>> later when their platforms support SCMI) and pretend SCMI is the only
>> client they are ever going to serve.
>>
>
> Again that's not the point, doorbell is more common feature and that can
> be supported. As SCMI expects doorbell feature in the specification, it
> just need to support that class of controllers.
>
NO.  All SCMI expects is SHMEM and a signal reaching the other end.
The signal mechanism need not necessarily be "doorbell".
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
