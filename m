From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 0/6] mailbox: arm_mhu: add support for doorbell mode
Date: Thu, 25 May 2017 14:53:33 +0100
Message-ID: <7291e5d7-fb63-57cf-c029-7a9f3b757c35@arm.com>
References: <1495621003-4291-1-git-send-email-sudeep.holla@arm.com>
 <CABb+yY1eS_cXjCCpgQs18-W3KXPy-K7mPJSkWNb6wFe-is5fDw@mail.gmail.com>
 <cd57b90c-4250-64df-9142-d12ac7ed7ad3@arm.com>
 <CABb+yY0jKPUW3i69jO+ZhmNum7-MS8xabns+R7hmjCOz+imgJA@mail.gmail.com>
 <ae22d77a-845c-2189-8512-5ca13ba60af1@arm.com>
 <CABb+yY1r+bQCHUxzsH3DLx1kTkz8g=jOT1_S9PnqjfBrLhe9TA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABb+yY1r+bQCHUxzsH3DLx1kTkz8g=jOT1_S9PnqjfBrLhe9TA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 25/05/17 14:44, Jassi Brar wrote:
> On Thu, May 25, 2017 at 7:05 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>>>> 1. The client driver is generic and expects it to be doorbell like
>>>>    mailbox controller. I am referring to SCMI which will be released
>>>>    soon. We can't embed ARM MHU or any other mailbox controller info
>>>>    into that.
>>>>
>>> If SCMI is to be usable over different platforms, there has to be 2
>>> sub-parts of the SCMI - one platform agnostic high level protocol
>>> implementation, and the other platform specific 'transport' layer
>>> where actual message xfer is done.
>>>
>>
>> It recommends doorbell kind of interface for the transport.
>>
>>> For the Nth time:-
>>>     The 'mssg' in mbox_send_message(struct mbox_chan *chan, void
>>> *mssg) is platform specific. For MHU it is simple u32*, whereas for
>>> other platform it will be like 'struct my_protocol_message *'
>>>
>>> I can't make it any clearer.
>>>
>>
>> Why is that ? Just because it was used on your platform like that ?
>> Sorry that's not a valid reason.
>>
> To be clear, by "other platform" I mean platforms with mailbox
> controller other than MHU.  (Not to mean SCMI can't run on MHU as of
> today).
> 

It can't run along with existing SCPI without some hacking. You need to
add a layer that is platform specific which is *hacky*.

> Do you intend SCMI to run only on platforms that have MHU controller?
> I hope not.
> 

Definitely not, that's the whole point. It should work with any
controller that supports doorbell mode.

> Now re-read my last post until you get it.
> 
Just propose the binding yourself.

On juno, say we will use low priority channel

BIT(0) - SCPI
BIT(1) - SCMI (general)
BIT(2) - SCMI (notification)
BIT(3) - A totally new protocol
:
:
with each of the above with specific shared memory reserved for them.

Beware we don't need any of these info in either of the driver as it
may change with another platform. So this info has to come from DT.
So I am requesting you to propose the binding if you think you can
better than the one I have.

I can base my code on that.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
