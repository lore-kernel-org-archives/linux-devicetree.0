From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 0/6] mailbox: arm_mhu: add support for doorbell mode
Date: Thu, 25 May 2017 12:30:38 +0100
Message-ID: <cd57b90c-4250-64df-9142-d12ac7ed7ad3@arm.com>
References: <1495621003-4291-1-git-send-email-sudeep.holla@arm.com>
 <CABb+yY1eS_cXjCCpgQs18-W3KXPy-K7mPJSkWNb6wFe-is5fDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABb+yY1eS_cXjCCpgQs18-W3KXPy-K7mPJSkWNb6wFe-is5fDw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 24/05/17 11:56, Jassi Brar wrote:
> On Wed, May 24, 2017 at 3:46 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>>
>> Hi,
>>
>> This series adds doorbell support to ARM MHU mailbox controller driver.
>> Since we need to callback the different client based on the doorbel bits
>> triggered from the remote, we can manage with single channel for the set
>> of 32 doorbells.
>>
>> Regards,
>> Sudeep
>>
>> v1->v2:
>>         - Removed the notion od subchannels
>>         - Treat each bit in the MHU register as a doorbell and hence
>>           different channel with respect to mailbox framework
>>
> Whatever happened to the endless explanations I gave you, how the MHU
> driver already supports your usecase?
> 

Yes but you didn't respond to my queries:
1. The client driver is generic and expects it to be doorbell like
   mailbox controller. I am referring to SCMI which will be released
   soon. We can't embed ARM MHU or any other mailbox controller info
   into that.

2. How do we call multiple clients from mhu_irq ? I have Slot/bit 0
   being used by SCPI protocol(already in mainline) and slot 1/2 or more
   will be used by SCMI ?

3. We already have mailbox-sti.c which implements exactly the same logic
   of doorbell. Why did you not push back to implement something like
   arm_mhu.c then ? I am confused as why you are so particular in this
   case ?

Few more things to note here:

1. Just because the platform you worked used MHU to pass the command
   doesn't mean that's the only one use-case and others have to
   workaround in the client drivers.

2. Read the specification again. It's clear that it's designed for
   doorbell kind of usage. All I am asking is to support that both in
   the binding and implementation. And lets not assume or make it work
   with one protocol. It's generic IP and can be used in either
   doorbell way or the way it's currently supported.

3. That's one of the reason for just have 2 set's of registers as it's
   possible to use them as 32 different doorbells. Otherwise 2 channels
   is too limited for any platform.

Please address my queries instead of claiming that you can workout a
solution. I simply want the mailbox and protocol independent and hence
the binding. I don't like the idea of you proposed(i.e. 32-bit data to
be written to the controller register).

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
