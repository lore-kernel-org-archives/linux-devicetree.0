From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/6] Documentation: devicetree: add bindings to support
 ARM MHU subchannels
Date: Tue, 9 May 2017 10:58:30 +0100
Message-ID: <ec7869d0-fa18-ec9e-3df7-ac841e06b2d1@arm.com>
References: <1493733353-25812-1-git-send-email-sudeep.holla@arm.com>
 <1493733353-25812-3-git-send-email-sudeep.holla@arm.com>
 <20170508161026.5vdqnv52ub7hurwf@rob-hp-laptop>
 <CABb+yY1+rU=gEnqML=ybZ61WDW6Brz_QLw4LpYNNe-XsEgi8dw@mail.gmail.com>
 <ff6535ec-fa31-e0b7-53a1-9f4a2f03693d@arm.com>
 <CABb+yY3tXMgQdQratM56mQVEV4Med1i0NyT=zkXk1P4oCao6+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABb+yY3tXMgQdQratM56mQVEV4Med1i0NyT=zkXk1P4oCao6+A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 09/05/17 03:50, Jassi Brar wrote:
> On Mon, May 8, 2017 at 10:37 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>>
>>
>> On 08/05/17 17:46, Jassi Brar wrote:
>>> On Mon, May 8, 2017 at 9:40 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>>> +Bjorn
>>>>
>>>> On Tue, May 02, 2017 at 02:55:49PM +0100, Sudeep Holla wrote:
>>>>> The ARM MHU has mechanism to assert interrupt signals to facilitate
>>>>> inter-processor message based communication. It drives the signal using
>>>>> a 32-bit register, with all 32-bits logically ORed together. It also
>>>>> enables software to set, clear and check the status of each of the bits
>>>>> of this register independently. Each bit of the register can be
>>>>> associated with a type of event that can contribute to raising the
>>>>> interrupt thereby allowing it to be used as independent subchannels.
>>>>>
>>>>> Since the first version of this binding can't support sub-channels,
>>>>> this patch extends the existing binding to support them.
>>>>>
>>>>> Cc: Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>
>>>>> Cc: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>>>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>>>> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
>>>>> ---
>>>>>  .../devicetree/bindings/mailbox/arm-mhu.txt        | 44 ++++++++++++++++++++--
>>>>>  1 file changed, 41 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/mailbox/arm-mhu.txt b/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
>>>>> index 4971f03f0b33..86a66f7918e2 100644
>>>>> --- a/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
>>>>> +++ b/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
>>>>> @@ -10,21 +10,40 @@ STAT register and the remote clears it after having read the data.
>>>>>  The last channel is specified to be a 'Secure' resource, hence can't be
>>>>>  used by Linux running NS.
>>>>>
>>>>> +The MHU drives the interrupt signal using a 32-bit register, with all
>>>>> +32-bits logically ORed together. It provides a set of registers to
>>>>> +enable software to set, clear and check the status of each of the bits
>>>>> +of this register independently. The use of 32 bits per interrupt line
>>>>> +enables software to provide more information about the source of the
>>>>> +interrupt. For example, each bit of the register can be associated with
>>>>> +a type of event that can contribute to raising the interrupt.
>>>>
>>>> Sounds like a doorbell? (i.e. a single bit mailbox). Bjorn is doing
>>>> something similar for QCom h/w. I guess the difference here is you have
>>>> 32 sources and 1 output. It seems to me these should be described
>>>> similarly.
>>>>
>>> Yes, QCom controller triggers different interrupt for each bit of a
>>> 32bits register i.e, each signal is associated with 1bit information.
>>> Whereas MHU signals 32bits at a time to the target cpu.
>>
>> Agreed. I had a look at Qcom driver, not entirely clear if each bit as
>> interrupt as I don't see any interrupt support there. Also, it just adds
>> all the 32 channels which I am trying to avoid as at-most 4-5 will be
>> used while we end up creating 64 channels.
>>
> OK, so you just need to use 4 singles bits. That is, 4 different
> commands to remote.
> 
> #define SCMI_CMD_1   BIT(a)
> #define SCMI_CMD_2   BIT(b)
> #define SCMI_CMD_3   BIT(c)
> #define SCMI_CMD_4   BIT(d)
> 

OK, how will I get this info from the device tree ?

> 
>>>   Both these cases are already supported by mailbox framework, so
>>> Bjorn has implemented QCom's 'doorbell' driver over mailbox api. And
>>> we can do without this "arm,mhu-v2" driver. I believe Sudeep already
>>> knows well how to use the MHU driver as such to get what his client
>>> drivers need.
>>>
>>
>> As I mentioned above one reason for adding the complexity is avoiding
>> creation of 32*2 channels. Secondly we still need a way to distinguish
>> between the 2 use-cases(existing and new one). Any thoughts ?
>>
> I say, your usecase is an instance of the supported usecases by the
> existing driver.
> Just send the BIT(x) as a 32-bit value. Remote doesn't even need to
> find which bit is set, it can simply switch-case the value it got
> against SCMI_CMD_[1,4]
> 

How will the right client get the call from mbox_chan_received_data ?

>>>>> +
>>>>>  Mailbox Device Node:
>>>>>  ====================
>>>>>
>>>>>  Required properties:
>>>>>  --------------------
>>>>> -- compatible:                Shall be "arm,mhu" & "arm,primecell"
>>>>> +- compatible:                Shall be "arm,primecell" and one of the below:
>>>>> +                     "arm,mhu" - if the controller doesn't support
>>>>> +                                 subchannels
>>>>> +                     "arm,mhu-v2" - if the controller supports subchannels
>>>>
>>>> How do I know if I have v2? This correlates to an IP version or
>>>> IP configuration or ?
>>>>
>>> This is purely a software concept - virtual channel. There are only 3
>>> physical channels and that are managed by existing version of driver &
>>> bindings. This is another reason I am against this patchset.
>>>
>>
>> I understand your concern. Please suggest alternative if we need to use
>> each bit in the single set register as a different doorbell ?
>>
> Your commands are encoded as a simple BIT(x) which is an instance of u32
> 

Yes that's what I did for SCPI and it was all fine as long as we had
just one client. It simply can't scale with multiple client implementing
different protocols.

> If you want to send 2 commands together to remote, even that is just
> as simple... send BIT(a) | BIT(b).
> The remote will figure which bits are set and take action priority wise.
> 

That's not at all the use case. I will never ever need that when used as
a doorbell bit.

> [[ BTW, today you may need only 4bits because you have only 4
> different commands. 

Let me clarify once again, they are not commands, they are just doorbell
bits and hence form a different channel as they will have associated
command set, response and the shared memory as part of their protocol.

> What if the command set grows beyond 32bits? The

Just not that use case here. They are just 32 bit doorbell and can be
used by 32 different protocol/clients. That's all. Nothing more nothing
less.

> perfectly capable h/w will be rendered useless just because of s/w
> design decisions. So instead of assigning BIT(x) type command codes,
> please consider using full range of u32. Remote does not need it to be
> BIT(x) but just a unique number.  The same "doorbell" will ring and
> the remote will use switch-case to figure who is it. ]]
> 

FYI it will be totally different remote firmware/protocol and hence
channel even there.

E.g. on Juno SCPI protocol uses BIT(0) on one channel and a new protocol
SCMI uses say BIT(1) and BIT(2). It's not the same remote firmware protocol.

>> We need
>> this from DT as we need to specify each bit as a channel for different
>> client.
>>
> The client DT node could carry the command code (as a u32 value) that
> it is going to work with.
> 

Really ? What if it's generic protocol like SCPI or SCMI used with
different mailbox. What you are saying is to make it special with ARM
MHU ? Yuck !

>> The specification clearly states each bit can be used as a
>> doorbell.
>>
> Doorbell and Mailbox are the same thing.
>  Its just that we are used to pass data packets over shared-memory
> that we think mailbox is different. It is perfectly possible to not
> need shared-memory, if command+data can be encoded within 32bits. In
> that case you would call Mailbox a 32bit Doorbell :)   For example,
> PL320 has 8 32bit registers that can carry data for remote.
> 
> If it is still not clear, please share your client driver. I will
> adapt that to work with existing MHU driver & bindings.
> 

Just take example of SCPI in the mainline. Assume there's another
protocol SCMI which uses few more bits in the same channel and the
remote firmware implements both but both are totally independent and not
related/linked. Also be keep in mind that SCPI is used by other
platforms and so will be the new protocol. We simply make SCPI or SCMI
bindings aligned to ARM MHU. That's ruled out.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
