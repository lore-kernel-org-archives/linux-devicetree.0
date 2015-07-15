From: Tim Bird <tim.bird-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: qcom: Add binding for the qcom coincell
 charger
Date: Wed, 15 Jul 2015 15:27:40 -0700
Message-ID: <55A6DE5C.7020005@sonymobile.com>
References: <1436830772-32632-1-git-send-email-tim.bird@sonymobile.com> <CAL_JsqJ4poHe_644aOooAXJqwSvTW-3NPCFJ7LmaBj=wAQQp1w@mail.gmail.com> <55A58221.7040004@sonymobile.com> <CAL_Jsq+FUCvQgicWkJLQOVTSijWxqDyWDKwJgFr85KAvtC=bkg@mail.gmail.com> <55A6A55D.8000209@sonymobile.com> <CAL_Jsq+U7q1=BbRY47b077ys2NWMCTVE5SvgnWW4N2yKUAm95w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+U7q1=BbRY47b077ys2NWMCTVE5SvgnWW4N2yKUAm95w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?IkFuZGVyc3NvbiwgQmrDtnJuIg==?= <Bjorn.Andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 07/15/2015 02:22 PM, Rob Herring wrote:
> On Wed, Jul 15, 2015 at 1:24 PM, Tim Bird <tim.bird-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org> wrote:
>> On 07/14/2015 06:07 PM, Rob Herring wrote:
>>> On Tue, Jul 14, 2015 at 4:41 PM, Tim Bird <tim.bird-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org> wrote:
>>>> On 07/13/2015 08:59 PM, Rob Herring wrote:
>>>>> On Mon, Jul 13, 2015 at 6:39 PM, Tim Bird <tim.bird-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org> wrote:
>>>>>> This binding is used to configure the driver for the coincell charger
>>>>>> found in Qualcomm PMICs.
> 
> [...]
> 
>>>>>> +- qcom,charge-enable:
>>>>>> +       Usage: optional
>>>>>> +       Value type: <u32> or <none>
>>>>>> +       Definition: definining this property, with an optional non-zero
>>>>>> +               value, enables charging
>>>>>
>>>>> I'm not sure that this belongs in DT. Don't you want to enable
>>>>> charging when plugged in perhaps or at some voltage threshold?
>>>>
>>>> In practice this is never changed at runtime. It's only set at kernel boot.
>>>> The main use of this is to override (either on or off) whatever the firmware
>>>> did.
>>>
>>> If your firmware and dtb are separate from your kernel, then ... (well
>>> you know where I'm headed :) ).
>>
>> Sorry, I have no idea how the sentence would end, so I think I'm missing
>> where you are headed.
> 
> dtbs should be separate from the kernel and part of the firmware. I'm
> certain you recall those discussions or have sucessfully blocked them
> from memory.

Ah yes, those discussions. :-)

Having dtbs come from firmware is not on the horizon yet
for projects I'm working on, so I haven't really considered
the ramifications.

> If the dtb is part of the firmware, then changing the dtb
> to change the kernel's handling of this would not make a lot of sense.

Indeed.

> I was going to say if you want to change what firmware did, then you
> could just do it from userspace. A delay from kernel boot to userspace
> init would not matter here. However, if you have no other reason for
> having a userspace interface, that probably isn't worth it and it is
> fine as is.
> 
>>
>>> If we do keep this, I think it should be a disable property with not
>>> present being the default and enabling charging. Also, it only needs
>>> to be bool (i.e. no value).
>>
>> Are you suggesting something like this, then?
>>
>>   - qcom,charger-disable:
>>        Usage: optional
>>        Value type: <none>
> 
> s/<none>/boolean/
> 
> But otherwise, yes this looks fine.
> 
>>        Definition: defining this property disables charging
>>
>> The logic would be as follows:
>>  - if the developer wants to just use the firmware settings, then
>>   the kernel would just not define this dts node at all, and nothing
>>   would change on kernel boot
> 
> Well, the kernel doesn't decide dts settings, but yes I agree that
> removing or disabling the node would disable any kernel control.
> 
>>  - if the developers want to change the settings, either turning off
>>   the charger, or specifying desired settings, then they define
>>   the appropriate attributes.
>>
>> I'm OK with that.
> 
> I am too.
> 
>> It would make no sense to define rset and vset values when this
>> is defined.  Should I note that somewhere in the binding doc?
> 
> They are somewhat don't care unless changing them has some side
> effect. I'll leave it up to you.

OK - these are indeed "don't care" in that case.
I probably don't have to explain in the binding doc that
adjusting settings for disabled hardware doesn't make sense.

Thanks again for the quick feedback.
 -- Tim
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
