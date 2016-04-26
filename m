From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH V17 1/3] dmaengine: qcom_hidma: implement lower level
 hardware interface
Date: Tue, 26 Apr 2016 11:23:09 -0400
Message-ID: <571F87DD.2010909@codeaurora.org>
References: <1460384473-5775-1-git-send-email-okaya@codeaurora.org>
 <1460384473-5775-2-git-send-email-okaya@codeaurora.org>
 <20160426032805.GA2274@localhost> <571F8397.5000803@codeaurora.org>
 <CAHp75VeZQnhaiSDuGJtgcKtek7yUwgQWd3J5QSJbdisehmBGqA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VeZQnhaiSDuGJtgcKtek7yUwgQWd3J5QSJbdisehmBGqA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Vinod Koul <vinod.koul@intel.com>, dmaengine <dmaengine@vger.kernel.org>, Timur Tabi <timur@codeaurora.org>, devicetree <devicetree@vger.kernel.org>, Christopher Covington <cov@codeaurora.org>, Jon Masters <jcm@redhat.com>, shankerd@codeaurora.org, vikrams@codeaurora.org, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, eric.auger@linaro.org, Andy Gross <agross@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, Dan Williams <dan.j.williams@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 4/26/2016 11:10 AM, Andy Shevchenko wrote:
> On Tue, Apr 26, 2016 at 6:04 PM, Sinan Kaya <okaya@codeaurora.org> wrote:
>> On 4/25/2016 11:28 PM, Vinod Koul wrote:
>>> On Mon, Apr 11, 2016 at 10:21:11AM -0400, Sinan Kaya wrote:
> 
>>>> +    while (cause) {
>>>> +            if ((cause & BIT(HIDMA_IRQ_TR_CH_INVALID_TRE_BIT_POS)) ||
>>>> +                (cause & BIT(HIDMA_IRQ_TR_CH_TRE_RD_RSP_ER_BIT_POS)) ||
>>>> +                (cause & BIT(HIDMA_IRQ_EV_CH_WR_RESP_BIT_POS)) ||
>>>> +                (cause & BIT(HIDMA_IRQ_TR_CH_DATA_RD_ER_BIT_POS)) ||
>>>> +                (cause & BIT(HIDMA_IRQ_TR_CH_DATA_WR_ER_BIT_POS))) {
>>>
>>> Switch please
>>
>> Cause is a combined status register. Let's say it contains 0x41. I need to check
>> if bit 0 or bit 6 is set in this value for each case condition. The value is not 0x40
>> or 0x1.
>>
>> I created macro like this instead.
>>
>> +#define HIDMA_IS_ERR_INTERRUPT(cause)                          \
>> +       (cause & BIT(HIDMA_IRQ_TR_CH_INVALID_TRE_BIT_POS))   || \
>> +       (cause & BIT(HIDMA_IRQ_TR_CH_TRE_RD_RSP_ER_BIT_POS)) || \
>> +       (cause & BIT(HIDMA_IRQ_EV_CH_WR_RESP_BIT_POS))       || \
>> +       (cause & BIT(HIDMA_IRQ_TR_CH_DATA_RD_ER_BIT_POS))    || \
>> +       (cause & BIT(HIDMA_IRQ_TR_CH_DATA_WR_ER_BIT_POS))
> 
> This looks overheaded.
> 
> #define HIDMA_XXX (BIT(a) | BIT (b) ... BIT(n))
> 
>>
>> and replaced the if statement as follows
>>
>> if (HIDMA_IS_ERR_INTERRUPT(cause)) {
> 
> if (cause & HIDMA_XXX) {
> 

This is even better.

-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
