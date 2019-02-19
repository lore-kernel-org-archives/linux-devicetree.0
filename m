From: Jun Li <lijun.kernel@gmail.com>
Subject: Re: [PATCH v2 07/10] usb: dwc3: Registering a role switch in the DRD code.
Date: Tue, 19 Feb 2019 10:57:23 +0800
Message-ID: <CAKgpwJXgiJYkpTxddwLFJRSvadcCw7fMbd=d510NFkyRSKaswA@mail.gmail.com>
References: <20190218112310.17860-1-chenyu56@huawei.com> <20190218112310.17860-8-chenyu56@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190218112310.17860-8-chenyu56@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yu Chen <chenyu56@huawei.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, john.stultz@linaro.org, suzhuangluan@hisilicon.com, kongfei@hisilicon.com, liuyu712@hisilicon.com, wanghu17@hisilicon.com, butao@hisilicon.com, chenyao11@huawei.com, fangshengzhou@hisilicon.com, lipengcheng8@huawei.com, songxiaowei@hisilicon.com, xuyiping@hisilicon.com, xuyoujun4@huawei.com, yudongbin@hisilicon.com, zangleigang@hisilicon.com, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Li Jun <jun.li@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi
Yu Chen <chenyu56@huawei.com> =E4=BA=8E2019=E5=B9=B42=E6=9C=8818=E6=97=A5=
=E5=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=887:34=E5=86=99=E9=81=93=EF=BC=9A
>
> The Type-C drivers use USB role switch API to inform the
> system about the negotiated data role, so registering a role
> switch in the DRD code in order to support platforms with
> USB Type-C connectors.
>
> Cc: John Stultz <john.stultz@linaro.org>
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Yu Chen <chenyu56@huawei.com>
> ---
> v2:
> * Assign fwnode in dwc3_role_switch.
> ---
> ---
>  drivers/usb/dwc3/core.h |  2 ++
>  drivers/usb/dwc3/drd.c  | 45 +++++++++++++++++++++++++++++++++++++++++++=
++
>  2 files changed, 47 insertions(+)
>
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 402b3c29eb26..7385544b9936 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -25,6 +25,7 @@
>  #include <linux/usb/ch9.h>
>  #include <linux/usb/gadget.h>
>  #include <linux/usb/otg.h>
> +#include <linux/usb/role.h>
>  #include <linux/ulpi/interface.h>
>
>  #include <linux/phy/phy.h>
> @@ -1083,6 +1084,7 @@ struct dwc3 {
>         struct extcon_dev       *edev;
>         struct notifier_block   edev_nb;
>         enum usb_phy_interface  hsphy_mode;
> +       struct usb_role_switch  *role_sw;
>
>         u32                     fladj;
>         u32                     irq_gadget;
> diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
> index 869725d15c74..cf977bb0d62e 100644
> --- a/drivers/usb/dwc3/drd.c
> +++ b/drivers/usb/dwc3/drd.c
> @@ -474,8 +474,42 @@ static struct extcon_dev *dwc3_get_extcon(struct dwc=
3 *dwc)
>         return edev;
>  }
>
> +static int dwc3_usb_role_switch_set(struct device *dev, enum usb_role ro=
le)
> +{
> +       u32 mode;
> +
> +       switch (role) {
> +       case USB_ROLE_HOST:
> +               mode =3D DWC3_GCTL_PRTCAP_HOST;
> +               break;
> +       case USB_ROLE_DEVICE:
> +               mode =3D DWC3_GCTL_PRTCAP_DEVICE;
> +               break;
> +       default:
> +               mode =3D DWC3_GCTL_PRTCAP_HOST;

I'd propose let dwc3 stay at device mode at default case.

> +               break;
> +       };
> +
> +       dwc3_set_mode(dev_get_drvdata(dev), mode);
> +       return 0;
> +}
> +
> +static enum usb_role dwc3_usb_role_switch_get(struct device *dev)
> +{
> +       struct dwc3 *dwc =3D dev_get_drvdata(dev);
> +       unsigned long flags;
> +       enum usb_role role;
> +
> +       spin_lock_irqsave(&dwc->lock, flags);
> +       role =3D dwc->current_otg_role;
> +       spin_unlock_irqrestore(&dwc->lock, flags);
> +
> +       return role;
> +}
> +
>  int dwc3_drd_init(struct dwc3 *dwc)
>  {
> +       struct usb_role_switch_desc dwc3_role_switch =3D {0};
>         int ret, irq;
>
>         dwc->edev =3D dwc3_get_extcon(dwc);
> @@ -522,6 +556,15 @@ int dwc3_drd_init(struct dwc3 *dwc)
>                 dwc3_set_mode(dwc, DWC3_GCTL_PRTCAP_OTG);
>         }
>
> +       dwc3_role_switch.fwnode =3D dev_fwnode(dwc->dev);
> +       dwc3_role_switch.set =3D dwc3_usb_role_switch_set;
> +       dwc3_role_switch.get =3D dwc3_usb_role_switch_get;
> +       dwc->role_sw =3D usb_role_switch_register(dwc->dev, &dwc3_role_sw=
itch);
> +       if (ret) {
> +               dwc3_drd_exit(dwc);
> +               return PTR_ERR(dwc->role_sw);
> +       }
> +

My understanding is, if you use usb role switch, you don't need either edev=
 or
OTG block event, so this should be like:

if (device_property_read_bool(dwc->dev, "usb-role-switch")) {
           usb role switch register;
} else if (edev) {
...
} else {
...
}

Jun
>         return 0;
>  }
>
> @@ -557,4 +600,6 @@ void dwc3_drd_exit(struct dwc3 *dwc)
>
>         if (!dwc->edev)
>                 free_irq(dwc->otg_irq, dwc);
> +
> +       usb_role_switch_unregister(dwc->role_sw);
>  }
> --
> 2.15.0-rc2
>
