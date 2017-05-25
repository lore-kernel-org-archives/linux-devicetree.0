From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 0/6] mailbox: arm_mhu: add support for doorbell mode
Date: Thu, 25 May 2017 14:35:40 +0100
Message-ID: <ae22d77a-845c-2189-8512-5ca13ba60af1@arm.com>
References: <1495621003-4291-1-git-send-email-sudeep.holla@arm.com>
 <CABb+yY1eS_cXjCCpgQs18-W3KXPy-K7mPJSkWNb6wFe-is5fDw@mail.gmail.com>
 <cd57b90c-4250-64df-9142-d12ac7ed7ad3@arm.com>
 <CABb+yY0jKPUW3i69jO+ZhmNum7-MS8xabns+R7hmjCOz+imgJA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABb+yY0jKPUW3i69jO+ZhmNum7-MS8xabns+R7hmjCOz+imgJA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 25/05/17 14:20, Jassi Brar wrote:
> On Thu, May 25, 2017 at 5:00 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>>
>>
>> On 24/05/17 11:56, Jassi Brar wrote:
>>> On Wed, May 24, 2017 at 3:46 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>>>>
>>>> Hi,
>>>>
>>>> This series adds doorbell support to ARM MHU mailbox controller driver.
>>>> Since we need to callback the different client based on the doorbel bits
>>>> triggered from the remote, we can manage with single channel for the set
>>>> of 32 doorbells.
>>>>
>>>> Regards,
>>>> Sudeep
>>>>
>>>> v1->v2:
>>>>         - Removed the notion od subchannels
>>>>         - Treat each bit in the MHU register as a doorbell and hence
>>>>           different channel with respect to mailbox framework
>>>>
>>> Whatever happened to the endless explanations I gave you, how the MHU
>>> driver already supports your usecase?
>>>
>>
>> Yes but you didn't respond to my queries:
>> 1. The client driver is generic and expects it to be doorbell like
>>    mailbox controller. I am referring to SCMI which will be released
>>    soon. We can't embed ARM MHU or any other mailbox controller info
>>    into that.
>>
> If SCMI is to be usable over different platforms, there has to be 2
> sub-parts of the SCMI - one platform agnostic high level protocol
> implementation, and the other platform specific 'transport' layer
> where actual message xfer is done.
> 

It recommends doorbell kind of interface for the transport.

> For the Nth time:-
>     The 'mssg' in mbox_send_message(struct mbox_chan *chan, void
> *mssg) is platform specific. For MHU it is simple u32*, whereas for
> other platform it will be like 'struct my_protocol_message *'
> 
> I can't make it any clearer.
> 

Why is that ? Just because it was used on your platform like that ?
Sorry that's not a valid reason. I too repeat for the nth time that the
MHU is designed to have 32 doorbells which can be used *independent* of
each other as *clearly* stated in the specification. So don't make it
platform issue. It just happened that *your* platform chose to write
some 32bit data as a whole doesn't mean that's the only use.

>> 2. How do we call multiple clients from mhu_irq ? I have Slot/bit 0
>>    being used by SCPI protocol(already in mainline) and slot 1/2 or more
>>    will be used by SCMI ?
>>
> Like other platforms do, have a common client that manages messages
> to/from clients working on same channel.
> 

Not possible as the protocols are not related. Please accept the fact
that protocol are not just platform specific. SCMI is all about generic
protocol layer that can be used on any transport.

Also each slot or bit has a different shared memory, how do you
represent that ? You are simply missing my point when I say it's proper
channel with a bit in MHU register as doorbell.

>> 3. We already have mailbox-sti.c which implements exactly the same logic
>>    of doorbell. Why did you not push back to implement something like
>>    arm_mhu.c then ? I am confused as why you are so particular in this
>>    case ?
>>
> The way STI's controller works (or as I was told), it warrants that
> design. I know MHU very well and I bet it needs no modification.
> 

It's exactly the same. I bet not better than the MHU hardware designer
I spoke to.

>  I explained in more than one way how to use the current driver, but
> you refuse to acknowledge. Then I offered to modify your code for you,
> but you don't agree to that either. I am running out of ways to
> respond and point you back to my old posts.
> 

Yes, you are simply missing the point that both ARM MHU and whatever
protocol sits on it has to be platform agnostic.

OK, you can stop pointing me back and simply propose alternate binding.
The binding needs to be changed to handle my use-case. I will then see
what need to be done.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
