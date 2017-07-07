From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v2 2/6] Documentation: devicetree: add bindings to support
 ARM MHU doorbells
Date: Fri, 7 Jul 2017 14:32:57 +0100
Message-ID: <aa546a58-06d4-e116-af37-c89fe7d6dff0@arm.com>
References: <1495621003-4291-1-git-send-email-sudeep.holla@arm.com>
 <1495621003-4291-3-git-send-email-sudeep.holla@arm.com>
 <CABb+yY0gXDEfoRmfHPOoEKgGjp_e5B5orYZ2qjcypL7ven50hw@mail.gmail.com>
 <e85c913d-0188-8780-9ea6-c82849e87d58@arm.com>
 <20170531170801.u6d4fhsfu5mmqgta@rob-hp-laptop>
 <CABb+yY1mA5Hzce5c5JGVtqmRjoTBj=YTZcajVpANq1oQP0Gc0A@mail.gmail.com>
 <9a38040c-8062-870e-ab2a-beb4934428b3@arm.com>
 <73cf3d55-f2ec-eb15-746a-0db5e7e28dad@arm.com>
 <CABb+yY04F0zuiD8iW=m2wPCqftoe+VmcGzzRCXp184JKr25KPw@mail.gmail.com>
 <1e1fc7b3-ba5a-da30-a601-3b79122ff959@arm.com>
 <CABb+yY3QRz9pcSTMsgNUnBkzQAedFFbbwu0fXY-2oJCFARz60g@mail.gmail.com>
 <012a9039-23e0-be8c-add9-2c0e83a1d97e@arm.com>
 <CABb+yY3GdAGeWUUyFfofff7Y9=j5DK-QcLXua1o-a6Hb_+nNcQ@mail.gmail.com>
 <36ea8010-f22a-e0d9-b9a9-bb6be19db45d@arm.com>
 <CABb+yY0j--t-VcOJnMxq25gnsb+QGi5ifw_K4qu1vgTJjKXBxg@mail.gmail.com>
 <aef7fc89-5e4d-95c6-cee3-444c4c89a113@arm.com>
 <CABb+yY1U8u1sJUH7NeDDxNRUafABmsYaPOXZCWOYctw1PbT7hw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABb+yY1U8u1sJUH7NeDDxNRUafABmsYaPOXZCWOYctw1PbT7hw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>, Alexey Klimov <alexey.klimov@arm.com>, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org



On 07/07/17 14:12, Jassi Brar wrote:
> On Fri, Jul 7, 2017 at 5:02 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:
>>
>>
>> On 06/07/17 19:37, Jassi Brar wrote:
>>> On Thu, Jul 6, 2017 at 10:14 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:
>>>>
>>>> On 06/07/17 15:37, Jassi Brar wrote:
>>>>> On Thu, Jul 6, 2017 at 3:03 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:
>>>>
>>>
>>>>> I see no reason why you must have SCPI and SCMI both running.
>>>>>
>>>>
>>>> We can still have 2 different protocols using same MHU channel with
>>>> different doorbells, what's wrong with that ?
>>>>
>>> Only for SCMI and SCPI - both written by same person to achieve the
>>> same thing - I think it should not be necessary.
>>>
>>
>> Really ? you decide based on that and repeatedly ignore what ARM MHU
>> specification offers. Wow, I am surprised.
>>
>>> But yes, SCMI running alongside some complementary protocol (that
>>> implements what SCMI doesn't provide) is a very solid usecase. And
>>> that is the reason you need a platform specific 'transport layer'.
>>>
>>
>> The whole SCMI exercise is to reduce such platform specific code.
>> It's made to work with ACPI using doorbells via PCC channels. Now, you
>> say for DT we need per platform shim. Mailbox is my transport, why do I
>> need anything more as I don't care what is sent in mailbox controller as
>> long as the signal is sent to the other side.
>>
>>>>> And even then there is a solution - a shim arbitrator. Other
>>>>> platforms, those share a channel, do that. No big deal.
>>>>>
>>>>
>>>> Example please? Please remember these protocols are generic and we
>>>> can't add any platform specific code into them.
>>>>
>>> You do need to have platform specific glue as I said.
>>>
>>
>> Yes, please propose along bindings to do that as you are objecting the
>> one in $subject. I have asked you many times the same thing.
>>
> "platform specific transport layer"  =>  no generic bindings for the controller.
> 

It's not platform specific. It's in MHU specification and please stop
making it platform specific just because your platform didn't use it.
STOP this nonsense argument and read the MHU specification. I am tired
of mentioning that again and again.

> The bindings, that already exist for mailbox controllers plus what
> properties the SCMI need, are to be used by a thin platform specific
> driver to provide an interface to the generic SCMI implementation to
> send the "doorbell".
> 

It's non-sense to provide such layer for each and every controller and
platform. MHU supports doorbells and I need to add that support. You
still fail to make any technical issues adding such feature. What is the
problem you see adding that feature. Please list them.

> For example, look at how the common DWC3 driver is used by platforms
> that have different h/w integrations.
>    $ grep synopsys,dwc3 -rw -B15 arch/arm/boot/dts/
> 
> That is, SCMI node as a child of platform specific SCMI node. Or maybe
> even SCMI as a library kinda thing.
> 

1. It's not topic of this patch
2. SCMI is discoverable and we want to have as minimum binding as
   possible and now you are asking to add unnecessary layers of binding
   which I don't agree with and I am fine if you propose and convince
   DT maintainers.

>>>>>  BTW, I hope you realise that we need a 'transport layer' which will
>>>>> be the platform specific glue between mailbox controller specifics and
>>>>> the generic SCMI code.
>>>>
>>>> Why ?
>>>>
>>> Because you should not restrict the usage of SCMI to only platforms
>>> with mailbox controller that does not require any information to
>>> trigger a signal on the other side -- what you call "doorbell".
>>>
>>
>> Indeed, it's restricted, read the specification....
>>
> Its a shame to hear that.
> 

Sorry, but I am not author of the specification. Also just FYI it was
reviewed and accepted by multiple vendors.

>>> Why shouldn't Rockchip be able to implement SCMI? Just because it uses
>>> different mechanism to signal the other end?
>>>
>>
>> They can, all we need is just a mailbox channel, we don't care wants
>> sent in the controller as along as signal is sent. The shared memory has
>> to be as per the specification. I still don't know what I am missing to
>> convey you.
>>
> 
> In scmi_do_xfer() you pass pointer to 'struct scmi_xfer' as 'data'. That is
> 
>     mbox_send_message(struct mbox_chan *, struct scmi_xfer*);
> 
> A controller driver defines is own format for the data it needs to
> send a message.
> 

Exactly the point and that's why I didn't bother much to drag you into
SCMI. The main reason why I am adding doorbel to MHU is not just SCMI.
It's to support multiple protocols implemented using different bit of
each channel as a doorbell. Please don't link that with SCMI. You are
the one who wanted to look at the code. Hence I pointed to SCMI, I am
*not* saying SCMI cares what MHU driver send.

But as another requirement, I have 4 different channel with 2 different
protocol. It may also extend to 6 different channels where we want to
reserve 2 for DVFS alone and which may not do interrupt based
communication. This is to achieve fast switching patch from the schedutil.

> For example, Rockchip driver expects
> rockchip_mbox_send_data(struct mbox_chan *, struct rockchip_mbox_msg *)
> 
> Fow the huck will it work ?!
> 

Yes, did I make any comment anywhere objecting that ? Sorry and I am
wrong if did.

> SCMI is purely a s/w protocol which can work over any physical link.
> But it wouldn't because you have funny notions of a "doorbell".
> 

Really ? Doorbell is very well know mechanism in hardware. SCMI didn't
invent it, it just *uses* it.

-- 
Regards,
Sudeep
