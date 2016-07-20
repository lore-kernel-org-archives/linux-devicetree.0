From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] doc: usb: ci-hdrc-usb2: add property
 over-current-polarity
Date: Tue, 19 Jul 2016 20:09:02 -0500
Message-ID: <20160720010902.GA972@rob-hp-laptop>
References: <1468840547-17899-1-git-send-email-jun.li@nxp.com>
 <1468840547-17899-2-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1468840547-17899-2-git-send-email-jun.li-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
Cc: peter.chen-3arQi8VN3Tc@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 18, 2016 at 07:15:45PM +0800, Li Jun wrote:
> Adding over-current-polarity to indicate the over current flag
> is low active or high active.
> 
> Signed-off-by: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> index 341dc67..c5d35f4 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> @@ -81,6 +81,8 @@ i.mx specific properties
>  - fsl,usbmisc: phandler of non-core register device, with one
>    argument that indicate usb controller index
>  - disable-over-current: disable over current detect
> +- over-current-polarity: 0 if the over current signal polarity is low active,
> +  1 if the over current signal polarity is high active.

Make the common case be no property and make this bool. So if typically 
active high, the property is "over-current-active-low".

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
