From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/6] mailbox: arm_mhu: add support for doorbell mode
Date: Thu, 25 May 2017 18:50:31 +0530
Message-ID: <CABb+yY0jKPUW3i69jO+ZhmNum7-MS8xabns+R7hmjCOz+imgJA@mail.gmail.com>
References: <1495621003-4291-1-git-send-email-sudeep.holla@arm.com>
 <CABb+yY1eS_cXjCCpgQs18-W3KXPy-K7mPJSkWNb6wFe-is5fDw@mail.gmail.com> <cd57b90c-4250-64df-9142-d12ac7ed7ad3@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cd57b90c-4250-64df-9142-d12ac7ed7ad3-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 25, 2017 at 5:00 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>
>
> On 24/05/17 11:56, Jassi Brar wrote:
>> On Wed, May 24, 2017 at 3:46 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>>>
>>> Hi,
>>>
>>> This series adds doorbell support to ARM MHU mailbox controller driver.
>>> Since we need to callback the different client based on the doorbel bits
>>> triggered from the remote, we can manage with single channel for the set
>>> of 32 doorbells.
>>>
>>> Regards,
>>> Sudeep
>>>
>>> v1->v2:
>>>         - Removed the notion od subchannels
>>>         - Treat each bit in the MHU register as a doorbell and hence
>>>           different channel with respect to mailbox framework
>>>
>> Whatever happened to the endless explanations I gave you, how the MHU
>> driver already supports your usecase?
>>
>
> Yes but you didn't respond to my queries:
> 1. The client driver is generic and expects it to be doorbell like
>    mailbox controller. I am referring to SCMI which will be released
>    soon. We can't embed ARM MHU or any other mailbox controller info
>    into that.
>
If SCMI is to be usable over different platforms, there has to be 2
sub-parts of the SCMI - one platform agnostic high level protocol
implementation, and the other platform specific 'transport' layer
where actual message xfer is done.

For the Nth time:-
    The 'mssg' in mbox_send_message(struct mbox_chan *chan, void
*mssg) is platform specific. For MHU it is simple u32*, whereas for
other platform it will be like 'struct my_protocol_message *'

I can't make it any clearer.

> 2. How do we call multiple clients from mhu_irq ? I have Slot/bit 0
>    being used by SCPI protocol(already in mainline) and slot 1/2 or more
>    will be used by SCMI ?
>
Like other platforms do, have a common client that manages messages
to/from clients working on same channel.

> 3. We already have mailbox-sti.c which implements exactly the same logic
>    of doorbell. Why did you not push back to implement something like
>    arm_mhu.c then ? I am confused as why you are so particular in this
>    case ?
>
The way STI's controller works (or as I was told), it warrants that
design. I know MHU very well and I bet it needs no modification.

 I explained in more than one way how to use the current driver, but
you refuse to acknowledge. Then I offered to modify your code for you,
but you don't agree to that either. I am running out of ways to
respond and point you back to my old posts.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
