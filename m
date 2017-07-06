From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v2 2/6] Documentation: devicetree: add bindings to support
 ARM MHU doorbells
Date: Thu, 6 Jul 2017 20:07:54 +0530
Message-ID: <CABb+yY3GdAGeWUUyFfofff7Y9=j5DK-QcLXua1o-a6Hb_+nNcQ@mail.gmail.com>
References: <1495621003-4291-1-git-send-email-sudeep.holla@arm.com>
 <1495621003-4291-3-git-send-email-sudeep.holla@arm.com> <CABb+yY0gXDEfoRmfHPOoEKgGjp_e5B5orYZ2qjcypL7ven50hw@mail.gmail.com>
 <e85c913d-0188-8780-9ea6-c82849e87d58@arm.com> <20170531170801.u6d4fhsfu5mmqgta@rob-hp-laptop>
 <CABb+yY1mA5Hzce5c5JGVtqmRjoTBj=YTZcajVpANq1oQP0Gc0A@mail.gmail.com>
 <9a38040c-8062-870e-ab2a-beb4934428b3@arm.com> <73cf3d55-f2ec-eb15-746a-0db5e7e28dad@arm.com>
 <CABb+yY04F0zuiD8iW=m2wPCqftoe+VmcGzzRCXp184JKr25KPw@mail.gmail.com>
 <1e1fc7b3-ba5a-da30-a601-3b79122ff959@arm.com> <CABb+yY3QRz9pcSTMsgNUnBkzQAedFFbbwu0fXY-2oJCFARz60g@mail.gmail.com>
 <012a9039-23e0-be8c-add9-2c0e83a1d97e@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <012a9039-23e0-be8c-add9-2c0e83a1d97e@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Rob Herring <robh@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>, Alexey Klimov <alexey.klimov@arm.com>, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 6, 2017 at 3:03 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
>
> On 06/07/17 10:27, Jassi Brar wrote:
>> On Thu, Jul 6, 2017 at 2:48 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:
>>> Hi Jassi,
>>>
>>> On 06/07/17 07:28, Jassi Brar wrote:
>>>> On Wed, Jul 5, 2017 at 11:32 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:
>>>>
>>>>>
>>>>> I have posted the SCMI patches now[1],
>>>>>
>>>> I wish I was CC'ed on that. Now LKML seems too busy to forward it.
>>>>
>>>
>>> Yes, my mistake, I should have cc-ed you.
>>>
>>>>> please let me know how to get
>>>>> both SCPI and SCMI working together with different doorbell bits on the
>>>>> same channel.
>>>>>
>>>> You say in the cover letter :
>>>> "Let me begin admitting that we are introducing yet another protocol to
>>>> achieve same things as many existing protocols like ARM SCPI, TI SCI,
>>>> QCOM RPM, Nvidia Tegra BPMP, and so on"
>>>>
>>>>  So SCMI is supposed to replace SCPI, SCI, RPM and BPMP   or   SCMI is
>>>> to be used for future platforms.
>>>> If SCPI and SCMI achieve the same, why have them both active simultaneously?
>>>>
>>>
>>> Yes it may not be used, but the firmware might support both for backward
>>> compatibility. E.g. on Juno, we still may continue supporting SCPI while
>>> we transition to SCMI. So both old and new DTs must work.
>>>
>> Sure, but still there is no reason to have both SCMI and SCPI active
>> during _runtime_.
>> Either SCMI or SCPI should be populated by DT, not both.
>>
>>>> Assuming there really is some sane excuse :-
>>>
>>> Yes as I mentioned above.
>>>
>> If you specify only one of SCPI/SCMI, you wouldn't need the shim arbitrator.
>>
>
> I said it *may not be used*, currently it is used.
>
SCPI provides more than what SCMI currently does - dvfs, clock, sensor.
I see no reason why you must have SCPI and SCMI both running.

And even then there is a solution - a shim arbitrator. Other
platforms, those share a channel, do that. No big deal.

 BTW, I hope you realise that we need a 'transport layer' which will
be the platform specific glue between mailbox controller specifics and
the generic SCMI code.
I see your confusion in the form of some issues in the SCMI
implementation, please CC me on the next revision.

Thanks.
