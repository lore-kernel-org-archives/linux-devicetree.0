From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC PATCH 1/4] usb: chipidea: Do not rely on OTG while using
 extcon
Date: Thu, 17 Mar 2016 15:15:50 +0900
Message-ID: <56EA4B96.8000700@samsung.com>
References: <cover.1458030082.git.maitysanchayan@gmail.com>
 <a3dc1c8adc4266d36267901ce6e975ddfca09abb.1458030082.git.maitysanchayan@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <a3dc1c8adc4266d36267901ce6e975ddfca09abb.1458030082.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter.Chen-3arQi8VN3Tc@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org, ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sanchayan,

I recommend that you use the unique id (ex. EXTCON_USB, EXTCON_USB_HOST=
)
when getting/setting the state of external connector with extcon functi=
ons
- extcon_get_cable_state() is deprecated -> extcon_get_cable_state_()
- extcon_set_cable_state() is deprecated -> extcon_set_cable_state_()

You can refer to usage for new function with unique id on patch[1]
[1] 5960387a2fb83 (usb: dwc3: omap: Replace deprecated API of extcon)

I'll remove the extcon_[get/set]_cable_state() functions using the stri=
ng type
to identify the external connector.

On 2016=EB=85=84 03=EC=9B=94 15=EC=9D=BC 17:38, Sanchayan Maity wrote:
> The existing usage of extcon in Chipidea driver relies on OTG
> registers. In case of SoC with dual role device but not a true
> OTG controller, this does not work. Such SoC's should specify
> the existing CI_HDRC_DUAL_ROLE_NOT_OTG flag and do the role
> switch without checking any of the OTG registers.
>=20
> This patch almost reverts most of commit "usb: chipidea: Use
> extcon framework for VBUS and ID detect". We do not rely
> anymore on emulating an OTG capable controller by faking OTG
> controller reads.
>=20
> Signed-off-by: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/usb/chipidea/core.c  | 64 ++++++++++++++++++++++++----------=
----------
>  drivers/usb/chipidea/otg.c   | 39 +--------------------------
>  include/linux/usb/chipidea.h |  2 --
>  3 files changed, 36 insertions(+), 69 deletions(-)
>=20
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.=
c
> index 7404064..d29118d 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -607,14 +607,15 @@ static int ci_vbus_notifier(struct notifier_blo=
ck *nb, unsigned long event,
>  	struct ci_hdrc_cable *vbus =3D container_of(nb, struct ci_hdrc_cabl=
e, nb);
>  	struct ci_hdrc *ci =3D vbus->ci;
> =20
> +	pm_runtime_get_sync(ci->dev);
> +
>  	if (event)
> -		vbus->state =3D true;
> +		usb_gadget_vbus_connect(&ci->gadget);
>  	else
> -		vbus->state =3D false;
> +		usb_gadget_vbus_disconnect(&ci->gadget);
> =20
> -	vbus->changed =3D true;
> +	pm_runtime_put_sync(ci->dev);
> =20
> -	ci_irq(ci->irq, ci);
>  	return NOTIFY_DONE;
>  }
> =20
> @@ -624,14 +625,19 @@ static int ci_id_notifier(struct notifier_block=
 *nb, unsigned long event,
>  	struct ci_hdrc_cable *id =3D container_of(nb, struct ci_hdrc_cable,=
 nb);
>  	struct ci_hdrc *ci =3D id->ci;
> =20
> -	if (event)
> -		id->state =3D false;
> -	else
> -		id->state =3D true;
> +	pm_runtime_get_sync(ci->dev);
> +
> +	ci_role_stop(ci);
> +
> +	hw_wait_phy_stable();
> +
> +	if (ci_role_start(ci, event ? CI_ROLE_HOST : CI_ROLE_GADGET))
> +		dev_err(ci->dev,
> +			"Can't start %s role\n",
> +			event ? "host" : "gadget");
> =20
> -	id->changed =3D true;
> +	pm_runtime_put_sync(ci->dev);
> =20
> -	ci_irq(ci->irq, ci);
>  	return NOTIFY_DONE;
>  }
> =20
> @@ -738,25 +744,10 @@ static int ci_get_platdata(struct device *dev,
>  	cable->nb.notifier_call =3D ci_vbus_notifier;
>  	cable->edev =3D ext_vbus;
> =20
> -	if (!IS_ERR(ext_vbus)) {
> -		ret =3D extcon_get_cable_state_(cable->edev, EXTCON_USB);
> -		if (ret)
> -			cable->state =3D true;
> -		else
> -			cable->state =3D false;
> -	}
> -
>  	cable =3D &platdata->id_extcon;
>  	cable->nb.notifier_call =3D ci_id_notifier;
>  	cable->edev =3D ext_id;
> =20
> -	if (!IS_ERR(ext_id)) {
> -		ret =3D extcon_get_cable_state_(cable->edev, EXTCON_USB_HOST);
> -		if (ret)
> -			cable->state =3D false;
> -		else
> -			cable->state =3D true;
> -	}
>  	return 0;
>  }
> =20
> @@ -896,6 +887,7 @@ static int ci_hdrc_probe(struct platform_device *=
pdev)
>  	void __iomem	*base;
>  	int		ret;
>  	enum usb_dr_mode dr_mode;
> +	struct ci_hdrc_cable *cable;
> =20
>  	if (!dev_get_platdata(dev)) {
>  		dev_err(dev, "platform data missing\n");
> @@ -963,6 +955,12 @@ static int ci_hdrc_probe(struct platform_device =
*pdev)
> =20
>  	ci_get_otg_capable(ci);
> =20
> +	ret =3D ci_extcon_register(ci);
> +	if (ret) {
> +		dev_err(dev, "extcon registration failed\n");
> +		goto deinit_phy;
> +	}
> +
>  	dr_mode =3D ci->platdata->dr_mode;
>  	/* initialize role(s) before the interrupt is requested */
>  	if (dr_mode =3D=3D USB_DR_MODE_OTG || dr_mode =3D=3D USB_DR_MODE_HO=
ST) {
> @@ -1003,6 +1001,12 @@ static int ci_hdrc_probe(struct platform_devic=
e *pdev)
>  			 * user can switch it through debugfs.
>  			 */
>  			ci->role =3D CI_ROLE_GADGET;
> +			cable =3D &ci->platdata->id_extcon;
> +			if (!IS_ERR(cable->edev)) {
> +				if (extcon_get_cable_state(cable->edev,

Use extcon_get_cable_state_() to use the EXTCON_USB_HOST id instead of =
using string type directly ("USB-HOST")

> +						"USB-HOST") =3D=3D true)
> +					ci->role =3D CI_ROLE_HOST;
> +			}
>  		}
>  	} else {
>  		ci->role =3D ci->roles[CI_ROLE_HOST]
> @@ -1021,6 +1025,12 @@ static int ci_hdrc_probe(struct platform_devic=
e *pdev)
>  						ci_role(ci)->name);
>  			goto stop;
>  		}
> +		cable =3D &ci->platdata->vbus_extcon;
> +		if (!IS_ERR(cable->edev)) {
> +			if ((ci->role =3D=3D CI_ROLE_GADGET) &&
> +			(extcon_get_cable_state(cable->edev, "USB") =3D=3D true))

Use extcon_get_cable_state_(cable->edev, EXTCON_USB)

[snip]

Best Regards,
Chanwoo Choi

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
