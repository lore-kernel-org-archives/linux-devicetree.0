From: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v5 11/13] hikey960: Support usb functionality of Hikey960
Date: Thu, 11 Apr 2019 17:55:32 -0700
Message-ID: <CALAqxLVjKNYbzqaYZ=L0NGgpDUzs+xU53Z4-3OFnJuHGCAZ2GA@mail.gmail.com>
References: <20190329041409.70138-1-chenyu56@huawei.com> <20190329041409.70138-12-chenyu56@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190329041409.70138-12-chenyu56@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yu Chen <chenyu56@huawei.com>
Cc: Linux USB List <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Zhuangluan Su <suzhuangluan@hisilicon.com>, Kongfei <kongfei@hisilicon.com>, "Liuyu (R)" <liuyu712@hisilicon.com>, wanghu17@hisilicon.com, butao <butao@hisilicon.com>, chenyao11@huawei.com, fangshengzhou@hisilicon.com, Li Pengcheng <lipengcheng8@huawei.com>, songxiaowei@hisilicon.com, YiPing Xu <xuyiping@hisilicon.com>, xuyoujun4@huawei.com, Yudongbin <yudongbin@hisilicon.com>, Zang Leigang <zangleigang@hisilicon.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bingh
List-Id: devicetree@vger.kernel.org

On Thu, Mar 28, 2019 at 9:14 PM Yu Chen <chenyu56@huawei.com> wrote:
>
> This driver handles usb hub power on and typeC port event of HiKey960 board:
> 1)DP&DM switching between usb hub and typeC port base on typeC port
> state
> 2)Control power of usb hub on Hikey960
> 3)Control vbus of typeC port

Hey Yu Chen!
  Wanted to say thanks again for sending these patches out so
persistently. I did catch an issue with this driver that I wanted to
let you know about.

> +static int hisi_hikey_role_switch(struct notifier_block *nb,
> +                       unsigned long state, void *data)
> +{
> +       struct hisi_hikey_usb *hisi_hikey_usb;
> +
> +       hisi_hikey_usb = container_of(nb, struct hisi_hikey_usb, nb);
> +
> +       switch (state) {
> +       case USB_ROLE_NONE:
> +               usb_typec_power_ctrl(hisi_hikey_usb, TYPEC_VBUS_POWER_OFF);
> +               usb_switch_ctrl(hisi_hikey_usb, USB_SWITCH_TO_HUB);
> +               hub_power_ctrl(hisi_hikey_usb, HUB_VBUS_POWER_ON);
> +               break;
> +       case USB_ROLE_HOST:
> +               usb_switch_ctrl(hisi_hikey_usb, USB_SWITCH_TO_TYPEC);
> +               usb_typec_power_ctrl(hisi_hikey_usb, TYPEC_VBUS_POWER_ON);
> +               break;
> +       case USB_ROLE_DEVICE:
> +               hub_power_ctrl(hisi_hikey_usb, HUB_VBUS_POWER_OFF);
> +               usb_typec_power_ctrl(hisi_hikey_usb, TYPEC_VBUS_POWER_OFF);
> +               usb_switch_ctrl(hisi_hikey_usb, USB_SWITCH_TO_TYPEC);
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       return 0;
> +}
> +
> +static int hisi_hikey_usb_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct hisi_hikey_usb *hisi_hikey_usb;
> +       int ret;
> +
> +       hisi_hikey_usb = devm_kzalloc(dev, sizeof(*hisi_hikey_usb), GFP_KERNEL);
> +       if (!hisi_hikey_usb)
> +               return -ENOMEM;
> +
> +       hisi_hikey_usb->nb.notifier_call = hisi_hikey_role_switch;
> +
> +       hisi_hikey_usb->typec_vbus = devm_gpiod_get(dev, "typec-vbus",
> +                       GPIOD_OUT_LOW);
> +       if (IS_ERR(hisi_hikey_usb->typec_vbus))
> +               return PTR_ERR(hisi_hikey_usb->typec_vbus);
> +
> +       hisi_hikey_usb->otg_switch = devm_gpiod_get(dev, "otg-switch",
> +                       GPIOD_OUT_HIGH);
> +       if (IS_ERR(hisi_hikey_usb->otg_switch))
> +               return PTR_ERR(hisi_hikey_usb->otg_switch);
> +
> +       /* hub-vdd33-en is optional */
> +       hisi_hikey_usb->hub_vbus = devm_gpiod_get_optional(dev, "hub-vdd33-en",
> +                       GPIOD_OUT_HIGH);
> +       if (IS_ERR(hisi_hikey_usb->hub_vbus))
> +               return PTR_ERR(hisi_hikey_usb->hub_vbus);
> +
> +       hisi_hikey_usb->role_sw = usb_role_switch_get(dev);
> +       if (!hisi_hikey_usb->role_sw)
> +               return -EPROBE_DEFER;
> +       if (IS_ERR(hisi_hikey_usb->role_sw))
> +               return PTR_ERR(hisi_hikey_usb->role_sw);
> +
> +       ret = usb_role_switch_register_notifier(hisi_hikey_usb->role_sw,
> +                       &hisi_hikey_usb->nb);
> +       if (ret) {
> +               usb_role_switch_put(hisi_hikey_usb->role_sw);
> +               return ret;
> +       }
> +
> +       platform_set_drvdata(pdev, hisi_hikey_usb);
> +
> +       return 0;
> +}

The issue I found is that if due to module load order or other
randomization in bootup timing, this driver loads much later then the
other USB infrastructure, the usb_role_switch notifier that is
registered may be registered after any state initialization or change
has occurred that would trigger the notifier callbacks.

This means initially this driver could be out of sync with the core
usb_role_switch state.

I've tried doing something like the following on probe to force the
initialization:
   cur_role = usb_role_switch_get_role(hisi_hikey_usb->role_sw);
   usb_role_switch_set_role(hisi_hikey_usb->role_sw, cur_role);

But this is racy, as a state change can happen in between the call to
get_role and set_role, which would end up overwriting the proper
state.

I suspect a proper fix needs to happen in the
usb_role_switch_register_notifier(), where the callback gets called
with the initial state while holding the lock to avoid races.

I'll comment more in that patch.

thanks
-john
