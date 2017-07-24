From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/9] firmware: arm_scmi: add basic driver infrastructure
 for SCMI
Date: Mon, 24 Jul 2017 17:21:38 +0100
Message-ID: <cd935dab-06b8-a91b-d393-cfc2f085c600@arm.com>
References: <1498492513-29771-4-git-send-email-sudeep.holla@arm.com>
 <1499446341-5956-1-git-send-email-jaswinder.singh@linaro.org>
 <5f2e4f3c-297b-c5f8-9244-399c1c4e2c21@arm.com>
 <CABb+yY3Xo-meg5bTZ5Cj1DAvf_0yOw0QB5Kq6U7VG+L_L+Mo3w@mail.gmail.com>
 <f165d171-a55b-662f-888c-3be2c3e8f11a@arm.com>
 <CABb+yY3NNUE7YXAhBLpMzVZkB7Kgx6iZk8a--crHa9Wpw6Ls4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABb+yY3NNUE7YXAhBLpMzVZkB7Kgx6iZk8a--crHa9Wpw6Ls4Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Roy Franz <roy.franz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Harb Abdulhamid <harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>, ALKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 24/07/17 16:41, Jassi Brar wrote:
> On Mon, Jul 24, 2017 at 3:20 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>>
>>
>> On 08/07/17 06:32, Jassi Brar wrote:
>>> Hi Roy, Matt, Nishant, Harb Abdulhamid, Loc,
>>>
>>> I have a gut feeling you guys were part of the SCMI spec committee. If
>>> so, could you please chime in?
>>>
>>
>> I take complete silence as no objection.
>>
> I take it as no self respecting developer/architect would stand by
> your FUBAR implementation of SCMI.
>

Wow really ? This is exactly how ACPI PCC works today IIUC.

> SCMI  calls
>     mbox_send_message(struct mbox_chan *chan, struct scmi_xfer *xfer);
> 
> whereas the API expects
>     mbox_send_message(struct mbox_chan *chan, struct controller_specific *xfer);
> 

That's not hard to change but you seem to have combined my ARM MHU
changes into this which is totally wrong and now I say also stupid after
mentioning the same thing so many times. Consider them independently and
try to understand.

> As the maintainer I have tried to explain it to you in a dozen ways.
> If you still can't see how it's broken, you can't be helped.
> 

Sorry but you wanted driver to explain initially. I posted them. But you
haven't answer my specific questions yet.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
