From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 07/12] phy: Add usb phy support for hi3660 Soc of Hisilicon
Date: Sat, 2 Mar 2019 17:56:17 +0200
Message-ID: <CAHp75VeZWQ42eaGqwUJ6r=XebKRk=nJM9c+OFaKoOT+jXxkDHw@mail.gmail.com>
References: <20190302090505.65542-1-chenyu56@huawei.com> <20190302090505.65542-8-chenyu56@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190302090505.65542-8-chenyu56@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yu Chen <chenyu56@huawei.com>
Cc: USB <linux-usb@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, John Stultz <john.stultz@linaro.org>, Suzhuangluan <suzhuangluan@hisilicon.com>, Kongfei <kongfei@hisilicon.com>, liuyu712@hisilicon.com, wanghu17@hisilicon.com, butao@hisilicon.com, Yao Chen <chenyao11@huawei.com>, fangshengzhou@hisilicon.com, lipengcheng8@huawei.com, songxiaowei <songxiaowei@hisilicon.com>, xu yiping <xuyiping@hisilicon.com>, xuyoujun4@huawei.com, yudongbin@hisilicon.com, zangleigang@hisilicon.com, Kishon Vijay Abraham I <kishon@ti.com>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 2, 2019 at 11:06 AM Yu Chen <chenyu56@huawei.com> wrote:
>
> This driver handles usb phy power on and shutdown for hi3660 Soc of
> Hisilicon.

Few comments below. After fixing them, FWIW
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> +#define HI3660_USB_DEFAULT_PHY_PARAM           0x1c466e3

A bit of description would be nice to have what this value means.

> +       /* delay for exit from IDDQ mode */
> +       usleep_range(100, 100);

100,100 ? I think you need to give a room to scheduler, at least 20%
margin would be good to have.

> +       /* delay for vbus valid */
> +       usleep_range(100, 100);

Ditto.


-- 
With Best Regards,
Andy Shevchenko
