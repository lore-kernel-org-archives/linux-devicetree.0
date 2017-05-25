From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v2 0/6] mailbox: arm_mhu: add support for doorbell mode
Date: Thu, 25 May 2017 19:14:42 +0530
Message-ID: <CABb+yY1r+bQCHUxzsH3DLx1kTkz8g=jOT1_S9PnqjfBrLhe9TA@mail.gmail.com>
References: <1495621003-4291-1-git-send-email-sudeep.holla@arm.com>
 <CABb+yY1eS_cXjCCpgQs18-W3KXPy-K7mPJSkWNb6wFe-is5fDw@mail.gmail.com>
 <cd57b90c-4250-64df-9142-d12ac7ed7ad3@arm.com> <CABb+yY0jKPUW3i69jO+ZhmNum7-MS8xabns+R7hmjCOz+imgJA@mail.gmail.com>
 <ae22d77a-845c-2189-8512-5ca13ba60af1@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ae22d77a-845c-2189-8512-5ca13ba60af1@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>, Alexey Klimov <alexey.klimov@arm.com>
List-Id: devicetree@vger.kernel.org

On Thu, May 25, 2017 at 7:05 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:
>>> 1. The client driver is generic and expects it to be doorbell like
>>>    mailbox controller. I am referring to SCMI which will be released
>>>    soon. We can't embed ARM MHU or any other mailbox controller info
>>>    into that.
>>>
>> If SCMI is to be usable over different platforms, there has to be 2
>> sub-parts of the SCMI - one platform agnostic high level protocol
>> implementation, and the other platform specific 'transport' layer
>> where actual message xfer is done.
>>
>
> It recommends doorbell kind of interface for the transport.
>
>> For the Nth time:-
>>     The 'mssg' in mbox_send_message(struct mbox_chan *chan, void
>> *mssg) is platform specific. For MHU it is simple u32*, whereas for
>> other platform it will be like 'struct my_protocol_message *'
>>
>> I can't make it any clearer.
>>
>
> Why is that ? Just because it was used on your platform like that ?
> Sorry that's not a valid reason.
>
To be clear, by "other platform" I mean platforms with mailbox
controller other than MHU.  (Not to mean SCMI can't run on MHU as of
today).

Do you intend SCMI to run only on platforms that have MHU controller?
I hope not.

Now re-read my last post until you get it.

Thanks.
