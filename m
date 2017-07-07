From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/6] Documentation: devicetree: add bindings to support
 ARM MHU doorbells
Date: Fri, 7 Jul 2017 18:42:21 +0530
Message-ID: <CABb+yY1U8u1sJUH7NeDDxNRUafABmsYaPOXZCWOYctw1PbT7hw@mail.gmail.com>
References: <1495621003-4291-1-git-send-email-sudeep.holla@arm.com>
 <1495621003-4291-3-git-send-email-sudeep.holla@arm.com> <CABb+yY0gXDEfoRmfHPOoEKgGjp_e5B5orYZ2qjcypL7ven50hw@mail.gmail.com>
 <e85c913d-0188-8780-9ea6-c82849e87d58@arm.com> <20170531170801.u6d4fhsfu5mmqgta@rob-hp-laptop>
 <CABb+yY1mA5Hzce5c5JGVtqmRjoTBj=YTZcajVpANq1oQP0Gc0A@mail.gmail.com>
 <9a38040c-8062-870e-ab2a-beb4934428b3@arm.com> <73cf3d55-f2ec-eb15-746a-0db5e7e28dad@arm.com>
 <CABb+yY04F0zuiD8iW=m2wPCqftoe+VmcGzzRCXp184JKr25KPw@mail.gmail.com>
 <1e1fc7b3-ba5a-da30-a601-3b79122ff959@arm.com> <CABb+yY3QRz9pcSTMsgNUnBkzQAedFFbbwu0fXY-2oJCFARz60g@mail.gmail.com>
 <012a9039-23e0-be8c-add9-2c0e83a1d97e@arm.com> <CABb+yY3GdAGeWUUyFfofff7Y9=j5DK-QcLXua1o-a6Hb_+nNcQ@mail.gmail.com>
 <36ea8010-f22a-e0d9-b9a9-bb6be19db45d@arm.com> <CABb+yY0j--t-VcOJnMxq25gnsb+QGi5ifw_K4qu1vgTJjKXBxg@mail.gmail.com>
 <aef7fc89-5e4d-95c6-cee3-444c4c89a113@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <aef7fc89-5e4d-95c6-cee3-444c4c89a113-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 7, 2017 at 5:02 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>
>
> On 06/07/17 19:37, Jassi Brar wrote:
>> On Thu, Jul 6, 2017 at 10:14 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>>>
>>> On 06/07/17 15:37, Jassi Brar wrote:
>>>> On Thu, Jul 6, 2017 at 3:03 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>>>
>>
>>>> I see no reason why you must have SCPI and SCMI both running.
>>>>
>>>
>>> We can still have 2 different protocols using same MHU channel with
>>> different doorbells, what's wrong with that ?
>>>
>> Only for SCMI and SCPI - both written by same person to achieve the
>> same thing - I think it should not be necessary.
>>
>
> Really ? you decide based on that and repeatedly ignore what ARM MHU
> specification offers. Wow, I am surprised.
>
>> But yes, SCMI running alongside some complementary protocol (that
>> implements what SCMI doesn't provide) is a very solid usecase. And
>> that is the reason you need a platform specific 'transport layer'.
>>
>
> The whole SCMI exercise is to reduce such platform specific code.
> It's made to work with ACPI using doorbells via PCC channels. Now, you
> say for DT we need per platform shim. Mailbox is my transport, why do I
> need anything more as I don't care what is sent in mailbox controller as
> long as the signal is sent to the other side.
>
>>>> And even then there is a solution - a shim arbitrator. Other
>>>> platforms, those share a channel, do that. No big deal.
>>>>
>>>
>>> Example please? Please remember these protocols are generic and we
>>> can't add any platform specific code into them.
>>>
>> You do need to have platform specific glue as I said.
>>
>
> Yes, please propose along bindings to do that as you are objecting the
> one in $subject. I have asked you many times the same thing.
>
"platform specific transport layer"  =>  no generic bindings for the controller.

The bindings, that already exist for mailbox controllers plus what
properties the SCMI need, are to be used by a thin platform specific
driver to provide an interface to the generic SCMI implementation to
send the "doorbell".

For example, look at how the common DWC3 driver is used by platforms
that have different h/w integrations.
   $ grep synopsys,dwc3 -rw -B15 arch/arm/boot/dts/

That is, SCMI node as a child of platform specific SCMI node. Or maybe
even SCMI as a library kinda thing.

I can't explain it any better.


>>>>  BTW, I hope you realise that we need a 'transport layer' which will
>>>> be the platform specific glue between mailbox controller specifics and
>>>> the generic SCMI code.
>>>
>>> Why ?
>>>
>> Because you should not restrict the usage of SCMI to only platforms
>> with mailbox controller that does not require any information to
>> trigger a signal on the other side -- what you call "doorbell".
>>
>
> Indeed, it's restricted, read the specification....
>
Its a shame to hear that.


>> Why shouldn't Rockchip be able to implement SCMI? Just because it uses
>> different mechanism to signal the other end?
>>
>
> They can, all we need is just a mailbox channel, we don't care wants
> sent in the controller as along as signal is sent. The shared memory has
> to be as per the specification. I still don't know what I am missing to
> convey you.
>

In scmi_do_xfer() you pass pointer to 'struct scmi_xfer' as 'data'. That is

    mbox_send_message(struct mbox_chan *, struct scmi_xfer*);

A controller driver defines is own format for the data it needs to
send a message.

For example, Rockchip driver expects
rockchip_mbox_send_data(struct mbox_chan *, struct rockchip_mbox_msg *)

Fow the huck will it work ?!

SCMI is purely a s/w protocol which can work over any physical link.
But it wouldn't because you have funny notions of a "doorbell".
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
