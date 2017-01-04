From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [RFC PATCH] usb: dwc3: gadget: add support for OTG in gadget
 framework
Date: Wed, 04 Jan 2017 16:03:00 +0200
Message-ID: <87k2aax6qz.fsf@linux.intel.com>
References: <1483536181-22356-1-git-send-email-mnarani@xilinx.com>
 <1483536181-22356-4-git-send-email-mnarani@xilinx.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0867501416309912598=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1483536181-22356-4-git-send-email-mnarani@xilinx.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Manish Narani <manish.narani@xilinx.com>, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, gregkh@linuxfoundation.org, mathias.nyman@intel.com, agraf@suse.de, bharatku@xilinx.com, punnaiah.choudary.kalluri@xilinx.com, dhdang@apm.com, marc.zyngier@arm.com, mnarani@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc: anuragku@xilinx.com, anirudh@xilinx.com
List-Id: devicetree@vger.kernel.org

--===============0867501416309912598==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Manish Narani <manish.narani@xilinx.com> writes:
> This patch adds support for OTG in DWC3 gadget framework. This
> also adds support for HNP polling by host while in OTG mode.
>
> Modifications in couple of functions to make it in sync with
> OTG driver while keeping its original functionality intact.
>
> Signed-off-by: Manish Narani <mnarani@xilinx.com>
> ---
>  drivers/usb/dwc3/ep0.c    | 49 +++++++++++++++++++++++---
>  drivers/usb/dwc3/gadget.c | 87 +++++++++++++++++++++++++++++++++++++++--=
------
>  2 files changed, 116 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
> index 4878d18..aa78c1b 100644
> --- a/drivers/usb/dwc3/ep0.c
> +++ b/drivers/usb/dwc3/ep0.c
> @@ -334,6 +334,8 @@ static int dwc3_ep0_handle_status(struct dwc3 *dwc,
>  				usb_status |=3D 1 << USB_DEV_STAT_U2_ENABLED;
>  		}
>=20=20
> +		usb_status |=3D dwc->remote_wakeup << USB_DEVICE_REMOTE_WAKEUP;
> +
>  		break;
>=20=20
>  	case USB_RECIP_INTERFACE:
> @@ -448,11 +450,45 @@ static int dwc3_ep0_handle_device(struct dwc3 *dwc,
>=20=20
>  	switch (wValue) {
>  	case USB_DEVICE_REMOTE_WAKEUP:
> +		if (set)
> +			dwc->remote_wakeup =3D 1;
> +		else
> +			dwc->remote_wakeup =3D 0;
>  		break;
> -	/*
> -	 * 9.4.1 says only only for SS, in AddressState only for
> -	 * default control pipe
> -	 */
> +	case USB_DEVICE_B_HNP_ENABLE:
> +		dev_dbg(dwc->dev,
> +			"SET_FEATURE: USB_DEVICE_B_HNP_ENABLE\n");

sorry, but no thanks. It has taken me a lot of work to come up with
proper tracers so I could get rid of all dev_dbg() calls here. I'm not
accepting any new one :-)

> +		if (set && dwc->gadget.is_otg) {
> +			if (dwc->gadget.host_request_flag) {
> +				struct usb_phy *phy =3D
> +					usb_get_phy(USB_PHY_TYPE_USB3);
> +
> +				dwc->gadget.b_hnp_enable =3D 0;
> +				dwc->gadget.host_request_flag =3D 0;
> +				otg_start_hnp(phy->otg);
> +				usb_put_phy(phy);
> +			} else {
> +				dwc->gadget.b_hnp_enable =3D 1;
> +			}
> +		} else
> +			return -EINVAL;
> +		break;
> +
> +	case USB_DEVICE_A_HNP_SUPPORT:
> +		/* RH port supports HNP */
> +		dev_dbg(dwc->dev,
> +			"SET_FEATURE: USB_DEVICE_A_HNP_SUPPORT\n");

ditto

> +		break;
> +
> +	case USB_DEVICE_A_ALT_HNP_SUPPORT:
> +		/* other RH port does */
> +		dev_dbg(dwc->dev,
> +			"SET_FEATURE: USB_DEVICE_A_ALT_HNP_SUPPORT\n");

ditto

> +		break;
> +		/*
> +		 * 9.4.1 says only only for SS, in AddressState only for
> +		 * default control pipe
> +		 */
>  	case USB_DEVICE_U1_ENABLE:
>  		ret =3D dwc3_ep0_handle_u1(dwc, state, set);
>  		break;
> @@ -759,7 +795,10 @@ static int dwc3_ep0_std_request(struct dwc3 *dwc, st=
ruct usb_ctrlrequest *ctrl)
>=20=20
>  	switch (ctrl->bRequest) {
>  	case USB_REQ_GET_STATUS:
> -		ret =3D dwc3_ep0_handle_status(dwc, ctrl);
> +		if (le16_to_cpu(ctrl->wIndex) =3D=3D OTG_STS_SELECTOR)
> +			ret =3D dwc3_ep0_delegate_req(dwc, ctrl);
> +		else
> +			ret =3D dwc3_ep0_handle_status(dwc, ctrl);
>  		break;
>  	case USB_REQ_CLEAR_FEATURE:
>  		ret =3D dwc3_ep0_handle_feature(dwc, ctrl, 0);
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 6785595..3b0b771 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -34,6 +34,7 @@
>  #include "core.h"
>  #include "gadget.h"
>  #include "io.h"
> +#include "otg.h"
>=20=20
>  /**
>   * dwc3_gadget_set_test_mode - Enables USB2 Test Modes
> @@ -1792,25 +1793,51 @@ static int dwc3_gadget_start(struct usb_gadget *g,
>  	int			ret =3D 0;
>  	int			irq;
>=20=20
> -	irq =3D dwc->irq_gadget;
> -	ret =3D request_threaded_irq(irq, dwc3_interrupt, dwc3_thread_interrupt,
> -			IRQF_SHARED, "dwc3", dwc->ev_buf);
> -	if (ret) {
> -		dev_err(dwc->dev, "failed to request irq #%d --> %d\n",
> -				irq, ret);
> -		goto err0;
> -	}
> -
>  	spin_lock_irqsave(&dwc->lock, flags);
>  	if (dwc->gadget_driver) {
>  		dev_err(dwc->dev, "%s is already bound to %s\n",
>  				dwc->gadget.name,
>  				dwc->gadget_driver->driver.name);
>  		ret =3D -EBUSY;
> -		goto err1;
> +		goto err0;
>  	}
>=20=20
> -	dwc->gadget_driver	=3D driver;
> +	if (g->is_otg) {
> +		static struct usb_gadget_driver *prev_driver;

hehe, there's no way I'm taking this. There are platforms with more than
one dwc3 instance. Please go back to drawing board.

> +		/* There are two instances where OTG functionality is enabled :
> +		 * 1. This function will be called from OTG driver to start the
> +		 * gadget
> +		 * 2. This function will be called by the Linux Class Driver to
> +		 * start the gadget
> +		 * Below code will keep synchronization between these calls. The
> +		 * "driver" argument will be NULL when it is called from the OTG
> +		 * driver, so we are maintaning a global variable "prev_driver"
> +		 * to assign value of argument "driver" (from class driver) to
> +		 * dwc->gadget_driver when it is called from OTG.
> +		 */
> +		if (driver) {
> +			prev_driver	=3D driver;
> +			if (dwc->otg) {
> +				struct dwc3_otg		*otg =3D dwc->otg;
> +
> +				if ((otg->host_started ||
> +						(!otg->peripheral_started)))
> +					goto err0;
> +			}
> +			dwc->gadget_driver	=3D driver;
> +		} else
> +			dwc->gadget_driver	=3D prev_driver;
> +	} else
> +		dwc->gadget_driver	=3D driver;
> +
> +	irq =3D dwc->irq_gadget;
> +	ret =3D request_threaded_irq(irq, dwc3_interrupt, dwc3_thread_interrupt,
> +			IRQF_SHARED, "dwc3", dwc->ev_buf);
> +	if (ret) {
> +		dev_err(dwc->dev, "failed to request irq #%d --> %d\n",
> +				irq, ret);
> +		goto err0;
> +	}
>=20=20
>  	if (pm_runtime_active(dwc->dev))
>  		__dwc3_gadget_start(dwc);
> @@ -1819,11 +1846,9 @@ static int dwc3_gadget_start(struct usb_gadget *g,
>=20=20
>  	return 0;
>=20=20
> -err1:
> -	spin_unlock_irqrestore(&dwc->lock, flags);
> -	free_irq(irq, dwc);
> -
>  err0:
> +	dwc->gadget_driver =3D NULL;
> +	spin_unlock_irqrestore(&dwc->lock, flags);
>  	return ret;
>  }

you shouldn't have to change anything in this file to add OTG. If you
are changing then it's likely something's wrong with your approach. I
need further clarification as to why you think this change is necessary.

> @@ -2977,6 +3002,18 @@ int dwc3_gadget_init(struct dwc3 *dwc)
>=20=20
>  	dwc->irq_gadget =3D irq;
>=20=20
> +	if (dwc->dr_mode =3D=3D USB_DR_MODE_OTG) {
> +		struct usb_phy *phy;
> +		/* Switch otg to peripheral mode */
> +		phy =3D usb_get_phy(USB_PHY_TYPE_USB3);

serioulsy? Did you not notice we already *HAVE* a handle to the PHY
which we get during probe?? You don't need to contantly get the PHY like th=
is.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlhtAJQACgkQzL64meEa
mQadTRAAnnCv3GRVFAMcWNS26tFaAUsFWS7xRDBHnSS7LokFIah4hj7FO3P8leHX
iPNZNeOIheqVigTCVVl2PSmmlNxfaa0o9ayUL2hACP1338mWsoH6moyxxz6xd0ry
luRcXxJNT5EeQNtHn1hCznTaCTn7wbgF2CLn+ov0l++1KJX5LvRWnzhAo8UPR8Jl
jnYgmfbH/2ymB/54V2Gn35Wbvf2/HbPV/3f+uYLpp06kcB3s/nzPILQ45DsmOFOU
xwU5MDC6IfSy5f8TcLBjQJZge8r3qIs8PjWChzLyfdJ99PhboF1N84j3NOT0EgOH
CdVYLzS5Tpr3U0iVcNJoWZlhz+NX0RYZS8EEVohzA6p0dsFY9jbSJQV1vEKWMJIT
8AEqYbTnBSBKeRdR6tv8mPFEJqwgP5q36OG+bIM4e23ODa0oELEROKaGnI5cg3ys
mrD58ssCTWwTR41tG+xNMAWWmss13kyTxm5GtrJ8InwzOUkWF2smsqwzvSmIVcbY
qcYdE0gSKjHm8jFFlL8Yu9pzlIzleWR1IN/xto+sfMmknWaC4Zwi4z8DXQ9IVA0m
Y+lJWcMnLhMKRGU/ZbTqjAP83sCI4MhgAv+OxMxILU77tQoYRmPghcg6SncXxzsP
OD2b2Zv7cUH3od0tYaVwJxmNBEBkxeWuVVzxDWrZqoFiTSPjnuw=
=i9oH
-----END PGP SIGNATURE-----
--=-=-=--


--===============0867501416309912598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0867501416309912598==--
