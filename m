From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/6] Documentation: devicetree: add bindings to support
 ARM MHU subchannels
Date: Tue, 9 May 2017 11:53:20 +0100
Message-ID: <bca5e8bd-3c18-6ed4-2a74-eee513ddc41d@arm.com>
References: <1493733353-25812-1-git-send-email-sudeep.holla@arm.com>
 <1493733353-25812-3-git-send-email-sudeep.holla@arm.com>
 <20170508161026.5vdqnv52ub7hurwf@rob-hp-laptop>
 <CABb+yY1+rU=gEnqML=ybZ61WDW6Brz_QLw4LpYNNe-XsEgi8dw@mail.gmail.com>
 <ff6535ec-fa31-e0b7-53a1-9f4a2f03693d@arm.com>
 <CABb+yY3tXMgQdQratM56mQVEV4Med1i0NyT=zkXk1P4oCao6+A@mail.gmail.com>
 <ec7869d0-fa18-ec9e-3df7-ac841e06b2d1@arm.com>
 <CABb+yY1S_aRGDZJwVt+p7U6PcO2dQGsg5bi21-yvx715HGjUtw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABb+yY1S_aRGDZJwVt+p7U6PcO2dQGsg5bi21-yvx715HGjUtw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 09/05/17 11:31, Jassi Brar wrote:
> On Tue, May 9, 2017 at 3:28 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> wrote:
> 
>>> 
>>> If it is still not clear, please share your client driver. I
>>> will adapt that to work with existing MHU driver & bindings.
>>> 
>> 
>> Just take example of SCPI in the mainline. Assume there's another 
>> protocol SCMI which uses few more bits in the same channel and the 
>> remote firmware implements both but both are totally independent
>> and not related/linked. Also be keep in mind that SCPI is used by
>> other platforms and so will be the new protocol. We simply make
>> SCPI or SCMI bindings aligned to ARM MHU. That's ruled out.
>> 
> Not sure what you mean by "that's ruled out".

1. The mailbox client bindings should be independent of this ARM MHU
   mailbox bindings
2. All we need in client is a mailbox to point at and not any meta data
   That's what I meant by ruled-out as both client and MHU can be used
   independent of each other and *should not* be linked.

> Anyways, to be clear, the bindings must remain same as long as the
> h/w doesn't change.

While I would generally agree with that, but since the existing binding
didn't consider the possibility of using it as sub-channels, I disagree
with your opinion now.

> It is the client driver (DT node) that should be versioned for SCPI
> or SCMI based on what the platform supports.

Why ? All that client care is about doorbell.

> I have tried many ways to explain how to implement it and apparently 
> failed. So lets talk code.

OK

> You have already shared this "v2" MHU driver, now please also share 
> your client driver. I'll make it work with original MHU driver and 
> that should settle your confusion.

It should first work with SCPI in the mainline. Then we will add another
similar protocol soon. So I think you have all you need in the mainline.
Today we have hack in the SCPI driver to pass bit 0 set in data. But
that's broken as we may want different slot on some other platform.
Basically SCPI is designed with the use of doorbell and it should not
have any details on how to write that into a particular register as
along as we just choose the right channel.

On digging more about different mailbox controllers, I found
mailbox-sti.c has exactly similar logic as what I have done in this series.

Also don't mix implementation with the binding. I need a simple answer
in this binding. How do I represent specific bits if each bit is
implemented as a doorbell ? That's all. First let's agree on that when
we use this mailbox independently and please *don't mix* with any
client here. It's simple, this controller has 2-3 sets of 32 doorbell
bits. And I am aiming to come up with the binding for that as your
initial bindings didn't consider that.

-- 
Regards,
Sudeep

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
