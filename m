From: Chen Yu <chenyu56@huawei.com>
Subject: Re: [PATCH v2 04/10] usb: dwc3: Add two quirks for Hisilicon Kirin
 Soc Platform
Date: Mon, 18 Feb 2019 20:31:52 +0800
Message-ID: <d5f8db99-15bf-51a7-553f-c97cf2b70cfd@huawei.com>
References: <20190218112310.17860-1-chenyu56@huawei.com>
 <20190218112310.17860-5-chenyu56@huawei.com>
 <CAHp75VdrSyORjd0OXS11poCL-3PofgsiejzgZ=m56sZegfGyMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VdrSyORjd0OXS11poCL-3PofgsiejzgZ=m56sZegfGyMw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: liuyu712@hisilicon.com, USB <linux-usb@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, John Stultz <john.stultz@linaro.org>, Suzhuangluan <suzhuangluan@hisilicon.com>, Kongfei <kongfei@hisilicon.com>, wanghu17@hisilicon.com, butao@hisilicon.com, Yao Chen <chenyao11@huawei.com>, fangshengzhou@hisilicon.com, lipengcheng8@huawei.com, songxiaowei <songxiaowei@hisilicon.com>, xu yiping <xuyiping@hisilicon.com>, xuyoujun4@huawei.com, yudongbin@hisilicon.com, zangleigang@hisilicon.com, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Binghui Wang <wangbinghui@hisilicon.com>
List-Id: devicetree@vger.kernel.org

Hi,

On 2019/2/18 20:21, Andy Shevchenko wrote:
> On Mon, Feb 18, 2019 at 1:23 PM Yu Chen <chenyu56@huawei.com> wrote:
>>
>> There are tow quirks for DesignWare USB3 DRD Core of Hisilicon Kirin Soc.
>> 1)SPLIT_BOUNDARY_DISABLE should be set for Host mode
>> 2)A GCTL soft reset should be executed when switch mode
> 
> Thus, it must be two patches, no?
> 
>> +static void dwc3_gctl_core_soft_reset(struct dwc3 *dwc)
>> +{
>> +       u32 reg;
>> +
>> +       reg = dwc3_readl(dwc->regs, DWC3_GCTL);
> 
>> +       reg |= (DWC3_GCTL_CORESOFTRESET);
> 
> Redundant parens.
> 
>> +       dwc3_writel(dwc->regs, DWC3_GCTL, reg);
>> +
>> +       reg = dwc3_readl(dwc->regs, DWC3_GCTL);
> 
>> +       reg &= ~(DWC3_GCTL_CORESOFTRESET);
> 
> Ditto.
> 
>> +       dwc3_writel(dwc->regs, DWC3_GCTL, reg);
>> +}
> 
>> +static void dwc3_complete(struct device *dev)
>> +{
> 
>> +       struct dwc3     *dwc = dev_get_drvdata(dev);
>> +       u32             reg;
> 
> Indentation style is different to the other functions in the same patch.
> Use simple space here.
> 
>> +       if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST &&
>> +                       dwc->dis_split_quirk) {
>> +               dev_dbg(dwc->dev, "set DWC3_GUCTL3_SPLITDISABLE\n");
>> +               reg = dwc3_readl(dwc->regs, DWC3_GUCTL3);
>> +               reg |= DWC3_GUCTL3_SPLITDISABLE;
>> +               dwc3_writel(dwc->regs, DWC3_GUCTL3, reg);
>> +       }
>> +}
> 
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -269,7 +269,7 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned cmd,
>>  {
>>         const struct usb_endpoint_descriptor *desc = dep->endpoint.desc;
>>         struct dwc3             *dwc = dep->dwc;
> 
>> -       u32                     timeout = 1000;
>> +       u32                     timeout = 5000;
> 
> I don't see anything about this change in commit message. Moreoever,
> it looks like it must be a separate logical change with its own
> description.
> 
>>         u32                     saved_config = 0;
>>         u32                     reg;
> 
> 

I will separate these changes into different patches. Thanks!
