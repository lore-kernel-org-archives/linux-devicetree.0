From: Chen Yu <chenyu56@huawei.com>
Subject: Re: [PATCH v3 07/12] phy: Add usb phy support for hi3660 Soc of
 Hisilicon
Date: Mon, 4 Mar 2019 10:37:20 +0800
Message-ID: <d17d12d1-0f72-9820-5f1d-bc29578e7a68@huawei.com>
References: <20190302090505.65542-1-chenyu56@huawei.com>
 <20190302090505.65542-8-chenyu56@huawei.com>
 <CAHp75VeZWQ42eaGqwUJ6r=XebKRk=nJM9c+OFaKoOT+jXxkDHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VeZWQ42eaGqwUJ6r=XebKRk=nJM9c+OFaKoOT+jXxkDHw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: liuyu712@hisilicon.com, USB <linux-usb@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, John Stultz <john.stultz@linaro.org>, Suzhuangluan <suzhuangluan@hisilicon.com>, Kongfei <kongfei@hisilicon.com>, wanghu17@hisilicon.com, butao@hisilicon.com, Yao Chen <chenyao11@huawei.com>, fangshengzhou@hisilicon.com, lipengcheng8@huawei.com, songxiaowei <songxiaowei@hisilicon.com>, xu yiping <xuyiping@hisilicon.com>, xuyoujun4@huawei.com, yudongbin@hisilicon.com, zangleigang@hisilicon.com, Kishon Vijay Abraham I <kishon@ti.com>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Andrew Morton <akpm@linux>
List-Id: devicetree@vger.kernel.org

Hi Andy,

On 2019/3/2 23:56, Andy Shevchenko wrote:
> On Sat, Mar 2, 2019 at 11:06 AM Yu Chen <chenyu56@huawei.com> wrote:
>>
>> This driver handles usb phy power on and shutdown for hi3660 Soc of
>> Hisilicon.
> 
> Few comments below. After fixing them, FWIW
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
>> +#define HI3660_USB_DEFAULT_PHY_PARAM           0x1c466e3
> 
> A bit of description would be nice to have what this value means.
> 
OK.
>> +       /* delay for exit from IDDQ mode */
>> +       usleep_range(100, 100);
> 
> 100,100 ? I think you need to give a room to scheduler, at least 20%
> margin would be good to have.
> 
>> +       /* delay for vbus valid */
>> +       usleep_range(100, 100);
> 
> Ditto.
> 
> 
OK.

Thanks
Yu Chen
