From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 10/12] hikey960: Support usb functionality of Hikey960
Date: Mon, 4 Mar 2019 08:50:39 +0200
Message-ID: <CAHp75Vdkp40e5-Bv+LnLBxgPkTDJ0FA1ooq+C4-do=4k5prTiQ@mail.gmail.com>
References: <20190302090505.65542-1-chenyu56@huawei.com> <20190302090505.65542-11-chenyu56@huawei.com>
 <1551664069.2210.64.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551664069.2210.64.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Yu Chen <chenyu56@huawei.com>, USB <linux-usb@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, John Stultz <john.stultz@linaro.org>, Suzhuangluan <suzhuangluan@hisilicon.com>, Kongfei <kongfei@hisilicon.com>, liuyu712@hisilicon.com, wanghu17@hisilicon.com, butao@hisilicon.com, Yao Chen <chenyao11@huawei.com>, fangshengzhou@hisilicon.com, lipengcheng8@huawei.com, songxiaowei <songxiaowei@hisilicon.com>, xu yiping <xuyiping@hisilicon.com>, xuyoujun4@huawei.com, yudongbin@hisilicon.com, zangleigang@hisilicon.com, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Binghui Wang <wangbinghui@hisilicon.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 4, 2019 at 3:47 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> On Sat, 2019-03-02 at 17:05 +0800, Yu Chen wrote:

> > +     hisi_hikey_usb->role_sw = usb_role_switch_get(dev);
> > +     if (!hisi_hikey_usb->role_sw)
> > +             return -EPROBE_DEFER;
> Here return EPROBE_DEFFER means the related device_connection is
> registered after this probe is called, right?
> if not, use IS_ERR_OR_NULL then return PTR_ERR is enough

How enough? If return value is NULL it would be transformered to 0,
which is success return code from the ->probe() which means we will
have ->probed() and not functional device.

Am I missing something?

-- 
With Best Regards,
Andy Shevchenko
