From: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v5 10/13] usb: dwc3: Registering a role switch in the DRD code.
Date: Thu, 11 Apr 2019 17:48:04 -0700
Message-ID: <CALAqxLVdrzNS2t1OYT=Pziu81VO+zWq5LYghHhMJO53cSvNNtQ@mail.gmail.com>
References: <20190329041409.70138-1-chenyu56@huawei.com> <20190329041409.70138-11-chenyu56@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190329041409.70138-11-chenyu56@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yu Chen <chenyu56@huawei.com>
Cc: Linux USB List <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Zhuangluan Su <suzhuangluan@hisilicon.com>, Kongfei <kongfei@hisilicon.com>, "Liuyu (R)" <liuyu712@hisilicon.com>, wanghu17@hisilicon.com, butao <butao@hisilicon.com>, chenyao11@huawei.com, fangshengzhou@hisilicon.com, Li Pengcheng <lipengcheng8@huawei.com>, songxiaowei@hisilicon.com, YiPing Xu <xuyiping@hisilicon.com>, xuyoujun4@huawei.com, Yudongbin <yudongbin@hisilicon.com>, Zang Leigang <zangleigang@hisilicon.com>, Jun Li <lijun.kernel@gmail.com>, Valentin Schneider <valentin.schneider@arm.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki
List-Id: devicetree@vger.kernel.org

On Thu, Mar 28, 2019 at 9:14 PM Yu Chen <chenyu56@huawei.com> wrote:
>
> The Type-C drivers use USB role switch API to inform the
> system about the negotiated data role, so registering a role
> switch in the DRD code in order to support platforms with
> USB Type-C connectors.
>

Hey Yu Chen!
  Thanks so much for sending these patches out!  I have run into some
troubles on bootup where things aren't working properly at first, that
seem to be due to state initialization races.  In chasing those down,
I've found some other quirks I wanted to bring up.

> --- a/drivers/usb/dwc3/drd.c
> +++ b/drivers/usb/dwc3/drd.c
> @@ -479,6 +479,43 @@ static struct extcon_dev *dwc3_get_extcon(struct dwc3 *dwc)
>         return edev;
>  }
>
> +static int dwc3_usb_role_switch_set(struct device *dev, enum usb_role role)
> +{
> +       struct dwc3 *dwc = dev_get_drvdata(dev);
> +       u32 mode;
> +
> +       switch (role) {
> +       case USB_ROLE_HOST:
> +               mode = DWC3_GCTL_PRTCAP_HOST;
> +               break;
> +       case USB_ROLE_DEVICE:
> +               mode = DWC3_GCTL_PRTCAP_DEVICE;
> +               break;
> +       default:
> +               if (dwc->role_switch_default_mode == USB_DR_MODE_HOST)
> +                       mode = DWC3_GCTL_PRTCAP_HOST;
> +               else
> +                       mode = DWC3_GCTL_PRTCAP_DEVICE;
> +               break;
> +       }
> +
> +       dwc3_set_mode(dwc, mode);
> +       return 0;
> +}
> +
> +static enum usb_role dwc3_usb_role_switch_get(struct device *dev)
> +{
> +       struct dwc3 *dwc = dev_get_drvdata(dev);
> +       unsigned long flags;
> +       enum usb_role role;
> +
> +       spin_lock_irqsave(&dwc->lock, flags);
> +       role = dwc->current_otg_role;
> +       spin_unlock_irqrestore(&dwc->lock, flags);
> +
> +       return role;
> +}
> +

So the two functions above are a bit asymmetric.  The
dwc3_usb_role_switch_set() can put the device into host or device
mode, which eventually sets the current_dr_role value.  However on the
dwc3_usb_role_switch_get() we return the current_otg_role value.
current_otg_role isn't set unless current_dr_role is
DWC3_GCTL_PRTCAP_OTG, which doesn't seem to happen here.

I suspect in dwc3_usb_role_switch_get() we should return
current_dr_role, unless current_dr_role==DWC3_GCTL_PRTCAP_OTG, in
which case we'd want to return current_otg_role.

Does that make sense?

Nothing really actually use this dwc3_usb_role_switch_get() yet, so
this was easy to overlook, and I only caught it as I was trying to
debug some of the initialization races.

thanks
-john
