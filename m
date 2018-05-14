From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: reply: [PATCH v3 1/2] PCI: kirin: Add MSI support
Date: Mon, 14 May 2018 10:16:54 +0300
Message-ID: <CAHp75VfHfUCNKNun4-bb2BhwV6D9jg2+hzVjrDER+af0SrzqjA@mail.gmail.com>
References: <99B4C6BADD9E3241B25E52B02BA737C54127E3BF@DGGEMA505-MBS.china.huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <99B4C6BADD9E3241B25E52B02BA737C54127E3BF@DGGEMA505-MBS.china.huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: songxiaowei <songxiaowei@hisilicon.com>
Cc: "chenyao (F)" <chenyao11@huawei.com>, Wangbinghui <wangbinghui@hisilicon.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, "xuwei (O)" <xuwei5@huawei.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, "dimitrysh@google.com" <dimitrysh@google.com>, "guodong.xu@linaro.org" <guodong.xu@linaro.org>, Suzhuangluan <suzhuangluan@hisilicon.com>, Kongfei <kongfei@hisilicon.com>
List-Id: devicetree@vger.kernel.org

On Mon, May 14, 2018 at 4:11 AM, songxiaowei <songxiaowei@hisilicon.com> wrote:

>> > +       int ret;
>> > +
>> > +       if (IS_ENABLED(CONFIG_PCI_MSI)) {
>>
>> > +               pci->pp.msi_irq = platform_get_irq(pdev, 0);
>> > +               if (pci->pp.msi_irq < 0) {
>> > +                       dev_err(&pdev->dev, "failed to get MSI IRQ
>> (%d)\n",
>> > +                               pci->pp.msi_irq);
>>
>> > +                       return -ENODEV;
>>
>> Why shadowing actual error code?
> [songxiaowei]  Sorry, I can't get your point about this, would you explain it for me.

platform_get_irq() returns either correct IRQ number or negative error code.
In the code above you shadow the actual error (as returned by that
call) by -ENODEV. Any reason why?

-- 
With Best Regards,
Andy Shevchenko
