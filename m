Return-Path: <SRS0=m1Og=FU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr40074.outbound.protection.outlook.com ([40.107.4.74]:63808
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751791AbeBZJXD (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 26 Feb 2018 04:23:03 -0500
From: Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH 2/4] usb: chipidea: Hook into mux framework to toggle usb
 switch
Date: Mon, 26 Feb 2018 09:23:00 +0000
Message-ID: <HE1PR04MB1450EF343D9A15AAE5B2A9478BC10@HE1PR04MB1450.eurprd04.prod.outlook.com>
References: <1519044665-16979-1-git-send-email-yossim@codeaurora.org>
 <1519044665-16979-2-git-send-email-yossim@codeaurora.org>
In-Reply-To: <1519044665-16979-2-git-send-email-yossim@codeaurora.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Yossi Mansharoff <yossim@codeaurora.org>, "qcomlt-patches@lists.linaro.org" <qcomlt-patches@lists.linaro.org>
Cc: Peter Rosin <peda@axentia.se>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephen Boyd <stephen.boyd@linaro.org>
List-ID: <devicetree@vger.kernel.org>

=20
=20
>=20
> Signed-off-by: Yossi Mansharoff <yossim@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt |  6 ++++++
>  drivers/usb/chipidea/Kconfig                           |  2 ++
>  drivers/usb/chipidea/core.c                            |  6 ++++++
>  drivers/usb/chipidea/host.c                            |  7 +++++++
>  drivers/usb/chipidea/udc.c                             | 13 ++++++++++++=
-
>  include/linux/usb/chipidea.h                           |  2 ++
>  6 files changed, 35 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> index 0e03344..2e93181 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> @@ -76,6 +76,10 @@ Optional properties:
>    needs to make sure it does not send more than 90%
>    maximum_periodic_data_per_frame. The use case is multiple transactions=
, but
>    less frame rate.
> +- mux-controls: The mux control for toggling host/device output of this
> +  controller. It's expected that a mux state of 0 indicates device mode
> +and a
> +  mux state of 1 indicates host mode.
> +- mux-control-names: Shall be "usb_switch" if mux-controls is specified.
>=20
>  i.mx specific properties
>  - fsl,usbmisc: phandler of non-core register device, with one @@ -102,4 =
+106,6
> @@ Example:
>  		rx-burst-size-dword =3D <0x10>;
>  		extcon =3D <0>, <&usb_id>;
>  		phy-clkgate-delay-us =3D <400>;
> +		mux-controls =3D <&usb_switch>;
> +		mux-control-names =3D "usb_switch";
>  	};
> diff --git a/drivers/usb/chipidea/Kconfig b/drivers/usb/chipidea/Kconfig =
index
> 51f4157..72aadfa 100644
> --- a/drivers/usb/chipidea/Kconfig
> +++ b/drivers/usb/chipidea/Kconfig
> @@ -3,6 +3,8 @@ config USB_CHIPIDEA
>  	depends on ((USB_EHCI_HCD && USB_GADGET) || (USB_EHCI_HCD
> && !USB_GADGET) || (!USB_EHCI_HCD && USB_GADGET)) && HAS_DMA
>  	select EXTCON
>  	select RESET_CONTROLLER
> +	select MULTIPLEXER
> +	select MUX_GPIO
>  	help
>  	  Say Y here if your system has a dual role high speed USB
>  	  controller based on ChipIdea silicon IP. It supports:
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c in=
dex
> 43ea5fb..aa71b96 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -64,6 +64,7 @@
>  #include <linux/of.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/usb/ehci_def.h>
> +#include <linux/mux/consumer.h>
>=20
>  #include "ci.h"
>  #include "udc.h"
> @@ -690,6 +691,11 @@ static int ci_get_platdata(struct device *dev,
>  	if (of_find_property(dev->of_node, "non-zero-ttctrl-ttha", NULL))
>  		platdata->flags |=3D CI_HDRC_SET_NON_ZERO_TTHA;
>=20
> +	platdata->usb_switch =3D devm_mux_control_get_optional(dev, "usb_switch=
");
> +	if (IS_ERR(platdata->usb_switch)){
> +		return PTR_ERR(platdata->usb_switch);
> +	}
> +
>  	ext_id =3D ERR_PTR(-ENODEV);
>  	ext_vbus =3D ERR_PTR(-ENODEV);
>  	if (of_property_read_bool(dev->of_node, "extcon")) { diff --git
> a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c index 18cb8e4=
..9ef3ecf
> 100644
> --- a/drivers/usb/chipidea/host.c
> +++ b/drivers/usb/chipidea/host.c
> @@ -25,6 +25,7 @@
>  #include <linux/usb/hcd.h>
>  #include <linux/usb/chipidea.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/mux/consumer.h>
>=20
>  #include "../host/ehci.h"
>=20
> @@ -175,6 +176,10 @@ static int host_start(struct ci_hdrc *ci)
>  		if (ci_otg_is_fsm_mode(ci)) {
>  			otg->host =3D &hcd->self;
>  			hcd->self.otg_port =3D 1;
> +		} else {
> +			ret =3D mux_control_select(ci->platdata->usb_switch, 1);
> +			if (ret)
> +				goto disable_reg;
>  		}
>  	}
>=20
> @@ -195,6 +200,8 @@ static void host_stop(struct ci_hdrc *ci)
>  	struct usb_hcd *hcd =3D ci->hcd;
>=20
>  	if (hcd) {
> +		if (!ci_otg_is_fsm_mode(ci))
> +			mux_control_deselect(ci->platdata->usb_switch);
>  		if (ci->platdata->notify_event)
>  			ci->platdata->notify_event(ci,
>  				CI_HDRC_CONTROLLER_STOPPED_EVENT);
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c inde=
x
> fe8a905..17f22e2 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -22,6 +22,7 @@
>  #include <linux/usb/gadget.h>
>  #include <linux/usb/otg-fsm.h>
>  #include <linux/usb/chipidea.h>
> +#include <linux/mux/consumer.h>
>=20
>  #include "ci.h"
>  #include "udc.h"
> @@ -1964,16 +1965,26 @@ void ci_hdrc_gadget_destroy(struct ci_hdrc *ci)
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
> d725cff..7e5d008 100644
> --- a/include/linux/usb/chipidea.h
> +++ b/include/linux/usb/chipidea.h
> @@ -9,6 +9,7 @@
>  #include <linux/usb/otg.h>
>=20
>  struct ci_hdrc;
> +struct mux_control;
>=20
=20
I am ok with this patch, would you please send series to linux-usb, then I =
can save and test it.

Peter
