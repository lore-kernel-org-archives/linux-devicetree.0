From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 2/6] Documentation: devicetree: add bindings to support
 ARM MHU subchannels
Date: Tue, 9 May 2017 15:20:33 +0100
Message-ID: <ffc23b4c-d7f5-9bc7-7060-fd77878ef258@arm.com>
References: <1493733353-25812-1-git-send-email-sudeep.holla@arm.com>
 <1493733353-25812-3-git-send-email-sudeep.holla@arm.com>
 <20170508161026.5vdqnv52ub7hurwf@rob-hp-laptop>
 <CABb+yY1+rU=gEnqML=ybZ61WDW6Brz_QLw4LpYNNe-XsEgi8dw@mail.gmail.com>
 <ff6535ec-fa31-e0b7-53a1-9f4a2f03693d@arm.com>
 <CABb+yY3tXMgQdQratM56mQVEV4Med1i0NyT=zkXk1P4oCao6+A@mail.gmail.com>
 <ec7869d0-fa18-ec9e-3df7-ac841e06b2d1@arm.com>
 <CABb+yY1S_aRGDZJwVt+p7U6PcO2dQGsg5bi21-yvx715HGjUtw@mail.gmail.com>
 <bca5e8bd-3c18-6ed4-2a74-eee513ddc41d@arm.com>
 <CABb+yY0nMQMrrKTUKu2ZPfEZTzuWN=sFk4PxJFQHvtd=dSE2_w@mail.gmail.com>
 <6bd1e3d5-5e8b-6d02-cd80-9ff2c21de15d@arm.com>
 <CABb+yY1x=Z2est1jnqnQu=VnmGSpMiJJxVnZ36buh21eJo8ULw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABb+yY1x=Z2est1jnqnQu=VnmGSpMiJJxVnZ36buh21eJo8ULw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexey Klimov <alexey.klimov@arm.com>, Jassi Brar <jaswinder.singh@linaro.org>, Devicetree List <devicetree@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: devicetree@vger.kernel.org



On 09/05/17 14:29, Jassi Brar wrote:
> On Tue, May 9, 2017 at 6:11 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:
>> On 09/05/17 12:55, Jassi Brar wrote:
> 
>>>>>>>
>>>>>>> If it is still not clear, please share your client driver. I
>>>>>>> will adapt that to work with existing MHU driver & bindings.
>>>>>>>
>>>>>>
>>>>>> Just take example of SCPI in the mainline. Assume there's another
>>>>>> protocol SCMI which uses few more bits in the same channel and the
>>>>>> remote firmware implements both but both are totally independent
>>>>>> and not related/linked. Also be keep in mind that SCPI is used by
>>>>>> other platforms and so will be the new protocol. We simply make
>>>>>> SCPI or SCMI bindings aligned to ARM MHU. That's ruled out.
>>>>>>
>>>>> Not sure what you mean by "that's ruled out".
>>>>
>>>> 1. The mailbox client bindings should be independent of this ARM MHU
>>>>    mailbox bindings
>>>> 2. All we need in client is a mailbox to point at and not any meta data
>>>>    That's what I meant by ruled-out as both client and MHU can be used
>>>>    independent of each other and *should not* be linked.
>>>>
>>> I am shocked at this coming from you.
>>>
>>> You design SCMI based upon MHU assumption of single bit "doorbell" and
>>> then you say a client should be independent of the underlying
>>> controller? Do you intend SCMI to work only over MHU?
>>>
>>
>> No, I never said that. What I said is SCMI protocol will be on doorbell
>> based.
>>
> What if a controller does not support your definition of "doorbell"?
> Like PL320 from ARM and many others.
> 

OK, why are we discussing that here ?

>>>  What if some controller does not support the simple "doorbell" and
>>> expects detailed info? For example, apart from SCMI, the remote also
>>> supports platform specific functions like thermal, watchdog, wakeup
>>> etc. The SCMI's would just be a subset of the full command set.
>>> You/SCMI can not dictate what numerical value the platform assigns to
>>> SCMI commands...
>>
>> What ? That's the whole point of specification. The command set is
>> *fixed* and can be implemented on any platform and have generic driver
>> for that.
>>
> The code/value for commands in SHM data packet is SCMI specific. But
> what a platform assigns to THIS_IS_SCMI_DOORBELL is going to be
> platform specific i.e, not always BIT(x)
> 

Platform which uses this as single bit doorbell has to just choose the
tuple(bit and the register set) as shown in the example binding

>>>> On digging more about different mailbox controllers, I found
>>>> mailbox-sti.c has exactly similar logic as what I have done in this series.
>>>>
>>
>> Did you look at this driver ?
>>
> Dude, I merged this driver upstream! I don't remember exactly about
> STI controller, but it definitely is different from MHU.
> 

Yes I can know and can see you have upstreamed the driver. I have spoken
to the ARM MHU hardware IP designers and I know what it's designed for.
And that's why I gave you example to look at STI driver
to help you understand what I am trying to say faster.

>>>> Also don't mix implementation with the binding. I need a simple answer
>>>> in this binding. How do I represent specific bits if each bit is
>>>> implemented as a doorbell ? That's all. First let's agree on that when
>>>> we use this mailbox independently and please *don't mix* with any
>>>> client here. It's simple, this controller has 2-3 sets of 32 doorbell
>>>> bits. And I am aiming to come up with the binding for that as your
>>>> initial bindings didn't consider that.
>>>>
>>> Please send in whatever changes you plan to do, and I'll modify it so
>>> we don't have to bloat the MHU driver and add bindings for a software
>>> feature. Until then ... Cheers!
>>>
>>
>> Changes to what ? arm_mhu.c ? This series is complete and implements
>> doorbell completely.
>>
> Send in the user/client driver that you think can not work with
> existing driver/bindings.
> 

Again for the 3rd time see arm_scpi.c
ARM is now generalizing it with multiple vendors under the new name ARM
SCMI. And Juno is implementing using few doorbell bits on the same
channel as SCPI.

-- 
Regards,
Sudeep
