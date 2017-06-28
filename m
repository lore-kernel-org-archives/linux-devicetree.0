From: Al Cooper <al.cooper@broadcom.com>
Subject: Re: [PATCH 4/8] usb: bdc: Small code cleanup
Date: Wed, 28 Jun 2017 10:56:03 -0400
Message-ID: <CAGh=XABghZ73=TNToMvpQWXP26dS1W8iujj1uQtOB8ewf+Mpew@mail.gmail.com>
References: <1498587806-24781-1-git-send-email-alcooperx@gmail.com>
 <1498587806-24781-5-git-send-email-alcooperx@gmail.com> <063D6719AE5E284EB5DD2968C1650D6DD002C93C@AcuExch.aculab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <063D6719AE5E284EB5DD2968C1650D6DD002C93C@AcuExch.aculab.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Laight <David.Laight@aculab.com>
Cc: Al Cooper <alcooperx@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, yuan linyu <Linyu.Yuan@alcatel-sbell.com.cn>, Florian Fainelli <f.fainelli@gmail.com>, "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 28, 2017 at 4:47 AM, David Laight <David.Laight@aculab.com> wrote:
>>
>>       temp = bdc_readl(bdc->regs, BDC_BDCSC);
>>       if ((temp & BDC_P64) &&
>>                       !dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64))) {
>> -             dev_dbg(bdc->dev, "Using 64-bit address\n");
>> +             dev_dbg(dev, "Using 64-bit address\n");
>>       } else {
>> -             ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
>> +             ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
>
> That just wrong...
> Or was wrong before.

Why is this wrong?

Al
