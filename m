From: Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH v2] usb: chipidea: Hook into mux framework to toggle usb
 switch
Date: Fri, 20 Apr 2018 02:00:08 +0000
Message-ID: <HE1PR04MB14504981D8B409CD8F9E7B7D8BB40@HE1PR04MB1450.eurprd04.prod.outlook.com>
References: <1523973148-2094-1-git-send-email-yossim@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1523973148-2094-1-git-send-email-yossim@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Yossi Mansharoff <yossim@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:CHIPIDEA USB HIGH SPEED DUAL ROLE CONTROLLER" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: "robh@kernel.org" <robh@kernel.org>, "swboyd@chromium.org" <swboyd@chromium.org>, Peter Rosin <peda@axentia.se>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephen Boyd <stephen.boyd@linaro.org>
List-Id: devicetree@vger.kernel.org

=20
=20
> --- a/drivers/usb/chipidea/Kconfig
> +++ b/drivers/usb/chipidea/Kconfig
> @@ -3,6 +3,8 @@ config USB_CHIPIDEA
>  	depends on ((USB_EHCI_HCD && USB_GADGET) || (USB_EHCI_HCD
> && !USB_GADGET) || (!USB_EHCI_HCD && USB_GADGET)) && HAS_DMA
>  	select EXTCON
>  	select RESET_CONTROLLER
> +	select MULTIPLEXER
> +	select MUX_GPIO

The above two configurations are only used at your specific platforms, plea=
se add
them at either your platform defconfig or the related hardware driver's Kco=
nfig.=20

>  	help
>  	  Say Y here if your system has a dual role high speed USB
>  	  controller based on ChipIdea silicon IP. It supports:
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c in=
dex
> 33ae87f..8fa0991 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -61,6 +61,7 @@
>  #include <linux/of.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/usb/ehci_def.h>
> +#include <linux/mux/consumer.h>
>=20
>  #include "ci.h"
>  #include "udc.h"
> @@ -687,6 +688,10 @@ static int ci_get_platdata(struct device *dev,
>  	if (of_find_property(dev->of_node, "non-zero-ttctrl-ttha", NULL))
>  		platdata->flags |=3D CI_HDRC_SET_NON_ZERO_TTHA;
>=20
> +	platdata->usb_switch =3D devm_mux_control_get_optional(dev, "usb_switch=
");
> +	if (IS_ERR(platdata->usb_switch))
> +		return PTR_ERR(platdata->usb_switch);
> +
>  	ext_id =3D ERR_PTR(-ENODEV);
>  	ext_vbus =3D ERR_PTR(-ENODEV);
>  	if (of_property_read_bool(dev->of_node, "extcon")) { diff --git
> a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c index af45aa3=
2..d9d2d00
> 100644
> --- a/drivers/usb/chipidea/host.c
> +++ b/drivers/usb/chipidea/host.c
> @@ -13,6 +13,7 @@
>  #include <linux/usb/hcd.h>
>  #include <linux/usb/chipidea.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/mux/consumer.h>
>=20
>  #include "../host/ehci.h"
>=20
> @@ -161,6 +162,10 @@ static int host_start(struct ci_hdrc *ci)
>  		if (ci_otg_is_fsm_mode(ci)) {
>  			otg->host =3D &hcd->self;
>  			hcd->self.otg_port =3D 1;
> +		} else {
> +			ret =3D mux_control_select(ci->platdata->usb_switch, 1);
> +			if (ret)
> +				goto disable_reg;

What will happen if ci->platdata->usb_switch  is NULL?

>  		}
>  	}
>=20
> @@ -181,6 +186,8 @@ static void host_stop(struct ci_hdrc *ci)
>  	struct usb_hcd *hcd =3D ci->hcd;
>=20
>  	if (hcd) {
> +		if (!ci_otg_is_fsm_mode(ci))
> +			mux_control_deselect(ci->platdata->usb_switch);

Ditto.

>  		if (ci->platdata->notify_event)
>  			ci->platdata->notify_event(ci,
>  				CI_HDRC_CONTROLLER_STOPPED_EVENT);
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c inde=
x
> 9852ec5..209d3f6 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -19,6 +19,7 @@
>  #include <linux/usb/gadget.h>
>  #include <linux/usb/otg-fsm.h>
>  #include <linux/usb/chipidea.h>
> +#include <linux/mux/consumer.h>
>=20
>  #include "ci.h"
>  #include "udc.h"
> @@ -1965,16 +1966,26 @@ void ci_hdrc_gadget_destroy(struct ci_hdrc *ci)
>=20
>  static int udc_id_switch_for_device(struct ci_hdrc *ci)  {
> +	int ret =3D 0;
> +
>  	if (ci->is_otg)
>  		/* Clear and enable BSV irq */
>  		hw_write_otgsc(ci, OTGSC_BSVIS | OTGSC_BSVIE,
>  					OTGSC_BSVIS | OTGSC_BSVIE);
>=20
> -	return 0;
> +	if (!ci_otg_is_fsm_mode(ci))
> +		ret =3D mux_control_select(ci->platdata->usb_switch, 0);
> +

Ditto

> +	if (ci->is_otg && ret)
> +		hw_write_otgsc(ci, OTGSC_BSVIE | OTGSC_BSVIS,
> OTGSC_BSVIS);
> +
> +	return ret;
>  }
>=20
>  static void udc_id_switch_for_host(struct ci_hdrc *ci)  {
> +	mux_control_deselect(ci->platdata->usb_switch);
> +
>  	/*
>  	 * host doesn't care B_SESSION_VALID event
>  	 * so clear and disbale BSV irq
> diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h =
index
> 07f9936..9ea55a1 100644
> --- a/include/linux/usb/chipidea.h
> +++ b/include/linux/usb/chipidea.h
> @@ -10,6 +10,7 @@
>  #include <linux/usb/otg.h>
>=20
>  struct ci_hdrc;
> +struct mux_control;
>=20
>  /**
>   * struct ci_hdrc_cable - structure for external connector cable state t=
racking @@ -
> 76,6 +77,7 @@ struct ci_hdrc_platform_data {
>  	/* VBUS and ID signal state tracking, using extcon framework */
>  	struct ci_hdrc_cable		vbus_extcon;
>  	struct ci_hdrc_cable		id_extcon;
> +	struct mux_control		*usb_switch;
>  	u32			phy_clkgate_delay_us;
=20
If CONFIG_USB_CHIPIDEA_HOST is not defined, it may cause build error

Peter
=20
