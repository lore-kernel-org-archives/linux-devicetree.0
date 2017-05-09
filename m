From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 2/6] Documentation: devicetree: add bindings to support
 ARM MHU subchannels
Date: Tue, 9 May 2017 17:25:04 +0530
Message-ID: <CABb+yY0nMQMrrKTUKu2ZPfEZTzuWN=sFk4PxJFQHvtd=dSE2_w@mail.gmail.com>
References: <1493733353-25812-1-git-send-email-sudeep.holla@arm.com>
 <1493733353-25812-3-git-send-email-sudeep.holla@arm.com> <20170508161026.5vdqnv52ub7hurwf@rob-hp-laptop>
 <CABb+yY1+rU=gEnqML=ybZ61WDW6Brz_QLw4LpYNNe-XsEgi8dw@mail.gmail.com>
 <ff6535ec-fa31-e0b7-53a1-9f4a2f03693d@arm.com> <CABb+yY3tXMgQdQratM56mQVEV4Med1i0NyT=zkXk1P4oCao6+A@mail.gmail.com>
 <ec7869d0-fa18-ec9e-3df7-ac841e06b2d1@arm.com> <CABb+yY1S_aRGDZJwVt+p7U6PcO2dQGsg5bi21-yvx715HGjUtw@mail.gmail.com>
 <bca5e8bd-3c18-6ed4-2a74-eee513ddc41d@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bca5e8bd-3c18-6ed4-2a74-eee513ddc41d@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Rob Herring <robh@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexey Klimov <alexey.klimov@arm.com>, Jassi Brar <jaswinder.singh@linaro.org>, Devicetree List <devicetree@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 9, 2017 at 4:23 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
>
> On 09/05/17 11:31, Jassi Brar wrote:
>> On Tue, May 9, 2017 at 3:28 PM, Sudeep Holla <sudeep.holla@arm.com>
>> wrote:
>>
>>>>
>>>> If it is still not clear, please share your client driver. I
>>>> will adapt that to work with existing MHU driver & bindings.
>>>>
>>>
>>> Just take example of SCPI in the mainline. Assume there's another
>>> protocol SCMI which uses few more bits in the same channel and the
>>> remote firmware implements both but both are totally independent
>>> and not related/linked. Also be keep in mind that SCPI is used by
>>> other platforms and so will be the new protocol. We simply make
>>> SCPI or SCMI bindings aligned to ARM MHU. That's ruled out.
>>>
>> Not sure what you mean by "that's ruled out".
>
> 1. The mailbox client bindings should be independent of this ARM MHU
>    mailbox bindings
> 2. All we need in client is a mailbox to point at and not any meta data
>    That's what I meant by ruled-out as both client and MHU can be used
>    independent of each other and *should not* be linked.
>
I am shocked at this coming from you.

You design SCMI based upon MHU assumption of single bit "doorbell" and
then you say a client should be independent of the underlying
controller? Do you intend SCMI to work only over MHU?

 What if some controller does not support the simple "doorbell" and
expects detailed info? For example, apart from SCMI, the remote also
supports platform specific functions like thermal, watchdog, wakeup
etc. The SCMI's would just be a subset of the full command set.
You/SCMI can not dictate what numerical value the platform assigns to
SCMI commands... all that is required is the remote firmware should
uniquely identify which command is it and implement what the SCMI
protocol expects.

Have a look at  mbox_send_message(struct mbox_chan *chan, void *mssg)
The 'mssg' is the pointer to _controller-specified_ structure. The
client driver (SCMI) _must_ know what the underlying controller
expects and pass that info. For example of 'mssg', look at "struct
brcm_message" in include/linux/mailbox/brcm-message.h   The client
driver must use that platform specific knowledge to send a message
i.e, you can not make a mailbox client driver 100% provider agnostic.

You need to divide SCMI into two parts - one that manages the SCMI
protocol and the other platform specific glue that talks to the
mailbox controller over the mailbox api.


>> You have already shared this "v2" MHU driver, now please also share
>> your client driver. I'll make it work with original MHU driver and
>> that should settle your confusion.
>
> It should first work with SCPI in the mainline. Then we will add another
> similar protocol soon. So I think you have all you need in the mainline.
> Today we have hack in the SCPI driver to pass bit 0 set in data. But
> that's broken as we may want different slot on some other platform.
> Basically SCPI is designed with the use of doorbell and it should not
> have any details on how to write that into a particular register as
> along as we just choose the right channel.
>
> On digging more about different mailbox controllers, I found
> mailbox-sti.c has exactly similar logic as what I have done in this series.
>
> Also don't mix implementation with the binding. I need a simple answer
> in this binding. How do I represent specific bits if each bit is
> implemented as a doorbell ? That's all. First let's agree on that when
> we use this mailbox independently and please *don't mix* with any
> client here. It's simple, this controller has 2-3 sets of 32 doorbell
> bits. And I am aiming to come up with the binding for that as your
> initial bindings didn't consider that.
>
Please send in whatever changes you plan to do, and I'll modify it so
we don't have to bloat the MHU driver and add bindings for a software
feature. Until then ... Cheers!
