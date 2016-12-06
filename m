From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH v2 2/4] phy: qcom-qusb2: New driver for QUSB2 PHY on Qcom chips
Date: Tue, 6 Dec 2016 13:41:56 +0530
Message-ID: <CAFp+6iG1yib=NLicQ_8SWB6iMurzqhmpMmp=b8K2=w_2=pLx+w@mail.gmail.com>
References: <1479816163-5260-1-git-send-email-vivek.gautam@codeaurora.org>
 <1479816163-5260-3-git-send-email-vivek.gautam@codeaurora.org>
 <20161128231424.GN6095@codeaurora.org> <CAFp+6iGdDnTvod7g8FOMWvUv22rrDCC0LL1BWYfiAggiQd+QvA@mail.gmail.com>
 <563a7a72-1209-2457-6f11-a890d17c3dd0@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <563a7a72-1209-2457-6f11-a890d17c3dd0@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: kishon <kishon@ti.com>, robh+dt <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Dec 3, 2016 at 12:17 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 12/01/2016 12:42 AM, Vivek Gautam wrote:
>> On Tue, Nov 29, 2016 at 4:44 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
>>> On 11/22, Vivek Gautam wrote:
>>>> +     }
>>>> +
>>>> +     /*
>>>> +      * we need to read only one byte here, since the required
>>>> +      * parameter value fits in one nibble
>>>> +      */
>>>> +     val = (u8 *)nvmem_cell_read(cell, &len);
>>> Shouldn't need the cast here. Also it would be nice if
>>> nvmem_cell_read() didn't require a second argument if we don't
>>> care for it. We should update the API to allow NULL there.
>> Will remove the u8 pointer cast.
>>
>> Correct, it makes sense to allow the length pointer to be passed as NULL.
>> We don't care about this length. Will update the nvmem API, to allow this.
>>
>> Also, we should add a check for 'cell' as well. This pointer can be
>> NULL, and the first thing that  nvmem_cell_read does is - deference
>> the pointer 'cell'
>
> It would be pretty stupid to read a cell and pass NULL as the first
> argument. I imagine things would blow up there like we want and we would
> see a nice big stacktrace.

Right, reading a 'NULL' cell doesn't make a sense at all.

>>>> +     } else {
>>>> +             reset_val |= CLK_REF_SEL;
>>>> +     }
>>>> +
>>>> +     writel_relaxed(reset_val, qphy->base + QUSB2PHY_PLL_TEST);
>>>> +
>>>> +     /* Make sure that above write is completed to get PLL source clock */
>>>> +     wmb();
>>>> +
>>>> +     /* Required to get PHY PLL lock successfully */
>>>> +     usleep_range(100, 110);
>>>> +
>>>> +     if (!(readb_relaxed(qphy->base + QUSB2PHY_PLL_STATUS) &
>>>> +                                     PLL_LOCKED)) {
>>>> +             dev_err(&phy->dev, "QUSB PHY PLL LOCK fails:%x\n",
>>>> +                     readb_relaxed(qphy->base + QUSB2PHY_PLL_STATUS));
>>> Would be pretty funny if this was locked now when the error
>>> printk runs. Are there other bits in there that are helpful?
>> This is the only bit that's there to check the PLL locking status.
>> Should we rather poll ?
>>
>
> I'm just saying that the printk may have the "correct" status but the
> check would have failed earlier making the printk confusing. Perhaps
> just save the register value from the first read and print it instead of
> reading it again? Polling would probably be a better design anyway?
> Hopefully the status bit isn't toggling back and forth during those
> 100-100us though, which may be the case here and that would explain why
> it's not a polling design.

Okay, will save the register value.
Will also stick to just checking the status after the delay, like we have in
downstream kernel.


Regards
Vivek

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
