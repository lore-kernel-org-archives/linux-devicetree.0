From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] doc: dt-binding: ci-hdrc-usb2: add i.mx specific
 binding "need-three-clocks"
Date: Wed, 16 Sep 2015 00:23:26 -0300
Message-ID: <CAOMZO5Aj_Txbg-nNH_xoAd=eCW9yfP6GMEE=H8jKvuoH9=e-ag@mail.gmail.com>
References: <1442368183-8103-1-git-send-email-peter.chen@freescale.com>
	<1442368183-8103-2-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442368183-8103-2-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 15, 2015 at 10:49 PM, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> Some SoCs needs three clock to let controller work, but others only
> need one, add one property to differentiate this.
>
> Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> index f15a317..4900092 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> @@ -54,6 +54,9 @@ i.mx specific properties
>    argument that indicate usb controller index
>  - disable-over-current: disable over current detect
>  - external-vbus-divider: enables off-chip resistor divider for Vbus
> +- need-three-clocks: the SoC before imx6 series (except for imx23/imx28)
> +  needs three clcoks for controller, others only need one. Without this
> +  property, the driver will consider this controller only need one clock.

Looking at mx31, mx35, mx25 reference manuals we see that they don't
really need three usb clocks.

Also, if we look at the old drivers/usb/host/ehci-mxc.c we only
require 'ipg' and 'ahb' clocks.

So it would be better to just require these two clocks and if they are
not found on dts, then we fall back to requesting clk_get(NULL),
without the need of an extra property.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
