From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH V11 4/7] dma: add Qualcomm Technologies HIDMA channel
 driver
Date: Tue, 5 Jan 2016 09:05:06 -0500
Message-ID: <568BCD92.7020306@codeaurora.org>
References: <1451865996-12808-1-git-send-email-okaya@codeaurora.org>
 <1451865996-12808-5-git-send-email-okaya@codeaurora.org>
 <CAHp75Vcw1V6AB8VMJuJVz9LS7MJPzQSHsPAvN-4C6AoBS7aQnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vcw1V6AB8VMJuJVz9LS7MJPzQSHsPAvN-4C6AoBS7aQnw@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: dmaengine <dmaengine@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Timur Tabi <timur@codeaurora.org>, devicetree <devicetree@vger.kernel.org>, Christopher Covington <cov@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, jcm@redhat.com, Andy Gross <agross@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 1/4/2016 1:43 PM, Andy Shevchenko wrote:
>> his patch adds support for hidma engine. The driver consists of two
>> > logical blocks. The DMA engine interface and the low-level interface.
>> > The hardware only supports memcpy/memset and this driver only support
>> > memcpy interface. HW and driver doesn't support slave interface.
>> >
> Looks fine now.
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 

Thanks. I'll wait until the end of the week to address your other comments.
I'm hoping to hear from devicetree folks until that time.

-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
