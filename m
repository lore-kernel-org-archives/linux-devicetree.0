From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH 2/4] dmaengine: qcom_bam_dma: clear BAM interrupt only if
 it is rised
Date: Wed, 2 Dec 2015 18:47:12 +0200
Message-ID: <565F2090.8040103@linaro.org>
References: <1448961299-15161-1-git-send-email-stanimir.varbanov@linaro.org>
 <6461444.oollnBsbrb@wuerfel> <565EEA99.3070207@linaro.org>
 <11168224.Usic9kvUpA@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <11168224.Usic9kvUpA@wuerfel>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Mark Rutland <mark.rutland@arm.com>, Archit Taneja <architt@codeaurora.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 12/02/2015 03:05 PM, Arnd Bergmann wrote:
> On Wednesday 02 December 2015 14:56:57 Stanimir Varbanov wrote:
>> On 12/01/2015 12:29 PM, Arnd Bergmann wrote:
>>> On Tuesday 01 December 2015 11:14:57 Stanimir Varbanov wrote:
>>>> +       if (srcs & BAM_IRQ) {
>>>>                 clr_mask = readl_relaxed(bam_addr(bdev, 0, BAM_IRQ_STTS));
>>>>  
>>>> -       /* don't allow reorder of the various accesses to the BAM registers */
>>>> -       mb();
>>>> +               /*
>>>> +                * don't allow reorder of the various accesses to the BAM
>>>> +                * registers
>>>> +                */
>>>> +               mb();
>>>>  
>>>> -       writel_relaxed(clr_mask, bam_addr(bdev, 0, BAM_IRQ_CLR));
>>>> +               writel_relaxed(clr_mask, bam_addr(bdev, 0, BAM_IRQ_CLR));
>>>> +       }
>>>>
>>>
>>> I think the comment here should be moved: change the writel_relaxed()
>>> to writel(), which already includes the appropriate barriers, and
>>
>> If we agree with such a change it should be subject to another patch.
> 
> Correct.
> 
>>> add a comment at the readl_relaxed() to explain why it doesn't need
>>> a barrier.
>>
>> Infact I'm not sure that readl_relaxed(BAM_IRQ_STTS) does not need
>> barrier. If I read the code above correctly the mb() should guarantee
>> that all load and store operations before it are happened before the
>> write to BAM_IRQ_CLR register, and on the other hand if we replace
>> writel_relaxed with writel, the writel has wmb() which guarantees only
>> store operations. Did I miss something?
> 
> You are right, we only guarantee that stores to memory are complete
> before we writel() an MMIO register.
> 
> What do you gain from synchronizing reads before an MMIO write?

I don't know just tried to understand the meaning of mb() above.

-- 
regards,
Stan
