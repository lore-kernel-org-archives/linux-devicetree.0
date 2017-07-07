From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 2/6] Documentation: devicetree: add bindings to support
 ARM MHU doorbells
Date: Fri, 7 Jul 2017 12:32:44 +0100
Message-ID: <aef7fc89-5e4d-95c6-cee3-444c4c89a113@arm.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABb+yY0j--t-VcOJnMxq25gnsb+QGi5ifw_K4qu1vgTJjKXBxg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 06/07/17 19:37, Jassi Brar wrote:
> On Thu, Jul 6, 2017 at 10:14 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>>
>> On 06/07/17 15:37, Jassi Brar wrote:
>>> On Thu, Jul 6, 2017 at 3:03 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>>
> 
>>> I see no reason why you must have SCPI and SCMI both running.
>>>
>>
>> We can still have 2 different protocols using same MHU channel with
>> different doorbells, what's wrong with that ?
>>
> Only for SCMI and SCPI - both written by same person to achieve the
> same thing - I think it should not be necessary.
> 

Really ? you decide based on that and repeatedly ignore what ARM MHU
specification offers. Wow, I am surprised.

> But yes, SCMI running alongside some complementary protocol (that
> implements what SCMI doesn't provide) is a very solid usecase. And
> that is the reason you need a platform specific 'transport layer'.
> 

The whole SCMI exercise is to reduce such platform specific code.
It's made to work with ACPI using doorbells via PCC channels. Now, you
say for DT we need per platform shim. Mailbox is my transport, why do I
need anything more as I don't care what is sent in mailbox controller as
long as the signal is sent to the other side.

>>> And even then there is a solution - a shim arbitrator. Other
>>> platforms, those share a channel, do that. No big deal.
>>>
>>
>> Example please? Please remember these protocols are generic and we
>> can't add any platform specific code into them.
>>
> You do need to have platform specific glue as I said.
> 

Yes, please propose along bindings to do that as you are objecting the
one in $subject. I have asked you many times the same thing.

>>>  BTW, I hope you realise that we need a 'transport layer' which will
>>> be the platform specific glue between mailbox controller specifics and
>>> the generic SCMI code.
>>
>> Why ?
>>
> Because you should not restrict the usage of SCMI to only platforms
> with mailbox controller that does not require any information to
> trigger a signal on the other side -- what you call "doorbell".
> 

Indeed, it's restricted, read the specification. We have all the
information in the channel shared memory and we just need doorbell
in the transport. It's clear in the specification. You seem to not read
any of the specification and continue to ignore.

> Why shouldn't Rockchip be able to implement SCMI? Just because it uses
> different mechanism to signal the other end?
> 

They can, all we need is just a mailbox channel, we don't care wants
sent in the controller as along as signal is sent. The shared memory has
to be as per the specification. I still don't know what I am missing to
convey you.

> You are actually putting in effort to restrict the usage of SCMI. Its
> like you buy a usb device and the first thing you do is solder it to
> the plug.
> 

I don't think you have read the SCMI specification, sorry.

> 
>> Clearly you have not made a since technical argument so far as why
>> MHU doorbell is not correct way even when MHU specification is clearly
>> allows it. I have given example of ST mailbox which has this doorbell
>> kind of support.
>>
>>> I see your confusion in the form of some issues in the SCMI
>>> implementation, please CC me on the next revision.
>>>
>>
>> Care to elaborate on what's my confusion or at-least what you think so ?
>>
> See me last point.
> 

I think you are just fixiated on one usage of ARM MHU and so hard to
convince otherwise..

>> Also if you have concern on implementation, ok we can discuss further.
>> But can you make it clear as what your objections are for the doorbell
>> MHU binding. How will I get the bit assigned for different protocols
>> which are platform specific ? I still need some binding , right ?
>>
> Sorry, No. I'll try to get lkml fwd me the patchset so I can explain
> there further.
> 

Sure, thanks.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
