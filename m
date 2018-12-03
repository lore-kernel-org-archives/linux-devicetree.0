From: Chen Yu <chenyu56@huawei.com>
Subject: Re: [PATCH v1 05/12] usb: dwc3: Add two quirks for Hisilicon Kirin
 Soc Platform
Date: Mon, 3 Dec 2018 16:23:09 +0800
Message-ID: <4214e332-dd8d-a6a3-b693-54287b178c80@huawei.com>
References: <20181203034515.91412-1-chenyu56@huawei.com>
 <20181203034515.91412-6-chenyu56@huawei.com>
 <CAHp75VcbNumAGa8NsYp9tL-ZRP4stApuTFtY1LARHMnJjxA4dw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VcbNumAGa8NsYp9tL-ZRP4stApuTFtY1LARHMnJjxA4dw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: wangbinghui@hisilicon.com, USB <linux-usb@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Suzhuangluan <suzhuangluan@hisilicon.com>, Kongfei <kongfei@hisilicon.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Stultz <john.stultz@linaro.org>
List-Id: devicetree@vger.kernel.org



On 2018/12/3 16:02, Andy Shevchenko wrote:
> On Mon, Dec 3, 2018 at 5:48 AM Yu Chen <chenyu56@huawei.com> wrote:
>>
>> There are tow quirks for DesignWare USB3 DRD Core of Hisilicon Kirin Soc.
>> 1)SPLIT_BOUNDARY_DISABLE should be set for Host mode
>> 2)A GCTL soft reset should be executed when switch mode
> 
>> +static void dwc3_gctl_core_soft_reset(struct dwc3 *dwc)
>> +{
> 
>> +       int reg;
> 
> u32? int for register value looks confusing a bit.

Yes, it should be u32.
> 
>> +       reg = dwc3_readl(dwc->regs, DWC3_GCTL);
>> +       reg |= (DWC3_GCTL_CORESOFTRESET);
>> +       dwc3_writel(dwc->regs, DWC3_GCTL, reg);
>> +
>> +       reg = dwc3_readl(dwc->regs, DWC3_GCTL);
>> +       reg &= ~(DWC3_GCTL_CORESOFTRESET);
>> +       dwc3_writel(dwc->regs, DWC3_GCTL, reg);
>> +}
> 
>> +       int reg;
> 
> Ditto.
> 
