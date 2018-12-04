From: Chen Yu <chenyu56@huawei.com>
Subject: Re: [PATCH v1 11/12] usb: gadget: Add configfs attribuite for
 controling match_existing_only
Date: Tue, 4 Dec 2018 09:22:42 +0800
Message-ID: <166134c3-22c5-44ce-56af-073bcaa530ec@huawei.com>
References: <20181203034515.91412-1-chenyu56@huawei.com>
 <20181203034515.91412-12-chenyu56@huawei.com>
 <CAHp75VcUQN_PuXDVkeR+jagTsUaOWLtytVt+f_eR+x2iw9B5-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VcUQN_PuXDVkeR+jagTsUaOWLtytVt+f_eR+x2iw9B5-A@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: wangbinghui@hisilicon.com, USB <linux-usb@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Suzhuangluan <suzhuangluan@hisilicon.com>, Kongfei <kongfei@hisilicon.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Stultz <john.stultz@linaro.org>
List-Id: devicetree@vger.kernel.org



On 2018/12/3 17:25, Andy Shevchenko wrote:
> On Mon, Dec 3, 2018 at 5:47 AM Yu Chen <chenyu56@huawei.com> wrote:
>>
>> Currently the "match_existing_only" of usb_gadget_driver in configfs is
>> set to one which is not flexible.
>> Dwc3 udc will be removed when usb core switch to host mode. This causes
>> failure of writing name of dwc3 udc to configfs's UDC attribuite.
>> To fix this we need to add a way to change the config of
>> "match_existing_only".
>> This patch adds a configfs attribuite for controling match_existing_only
>> which allow user to config "match_existing_only".
> 
>> +static ssize_t gadget_driver_match_existing_only_store(struct config_item *item,
>> +               const char *page, size_t len)
>> +{
> 
>> +       struct usb_gadget_driver *gadget_driver =
>> +               &(to_gadget_info(item)->composite.gadget_driver);
> 
> It would be easier for reader to see two lines with two variables
> instead of this.

OK.
> 
>> +       bool match_existing_only;
>> +       int ret;
>> +
>> +       ret = kstrtobool(page, &match_existing_only);
>> +       if (ret)
>> +               return ret;
>> +
> 
>> +       if (match_existing_only)
>> +               gadget_driver->match_existing_only = 1;
>> +       else
>> +               gadget_driver->match_existing_only = 0;
> 
>           gadget_driver->match_existing_only = match_existing_only;
> But the question rather why is it not direct parameter to kstrtobool?
> 
I wrote the code in this way to avoid type conversion.

>> +
>> +       return len;
>> +}
> 
>> +       struct usb_gadget_driver *gadget_driver =
>> +               &(to_gadget_info(item)->composite.gadget_driver);
> 
> Make it neat.
> 
OK.
