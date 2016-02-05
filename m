From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/1] Drivers: USB: DA8xx MUSB: added DT support
Date: Fri, 05 Feb 2016 23:22:26 +0100
Message-ID: <364593765.PbysHF8iXJ@wuerfel>
References: <1454693676-20211-1-git-send-email-petr@barix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454693676-20211-1-git-send-email-petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 05 February 2016 18:34:36 Petr Kulhavy wrote:
> TI DA8xx MUSB driver equipped with DeviceTree support.
> Tested with AM1808 board and USB2.0 (OTG) in host mode.
> 
> Signed-off-by: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/usb/da8xx-usb.txt          |  63 ++++++++
>  drivers/usb/musb/da8xx.c                           | 162 +++++++++++++++++++++
>  include/linux/platform_data/usb-davinci.h          |   3 +-

The changes look good, thanks.

One more thing:

>  3 files changed, 227 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/da8xx-usb.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/da8xx-usb.txt b/Documentation/devicetree/bindings/usb/da8xx-usb.txt
> new file mode 100644
> index 0000000..69c0961
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/da8xx-usb.txt
> @@ -0,0 +1,63 @@
> +TI DA8xx MUSB
> +~~~~~~~~~~~~~
> +
> +Required properties:
> +~~~~~~~~~~~~~~~~~~~~
> + - compatible : Should be "ti,da8xx-musb"
> +

Please make this

	Should be one of "ti,da850-musb" or "ti,da830-musb"

We don't use wildcards in compatible strings, so better use specific model
names in case we later find something that is different betweent the models.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
