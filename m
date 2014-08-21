From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] Documentation: dts: fsl-usb: Document USB node
 compatible string for IP version
Date: Thu, 21 Aug 2014 17:22:54 -0500
Message-ID: <1408659774.2395.21.camel@snotra.buserror.net>
References: <1408612727-6774-1-git-send-email-nikhil.badola@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408612727-6774-1-git-send-email-nikhil.badola-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nikhil Badola <nikhil.badola-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2014-08-21 at 14:48 +0530, Nikhil Badola wrote:
> Document compatible string containing IP version in USB device tree node
> 
> Signed-off-by: Nikhil Badola <nikhil.badola-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/fsl-usb.txt | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)

Please CC devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org on all device tree patches (in
addition to linuxppc-dev).

> 
> diff --git a/Documentation/devicetree/bindings/usb/fsl-usb.txt b/Documentation/devicetree/bindings/usb/fsl-usb.txt
> index 4779c02..5a3a0a8 100644
> --- a/Documentation/devicetree/bindings/usb/fsl-usb.txt
> +++ b/Documentation/devicetree/bindings/usb/fsl-usb.txt
> @@ -10,7 +10,10 @@ Required properties :
>     controllers, or "fsl-usb2-dr" for dual role USB controllers
>     or "fsl,mpc5121-usb2-dr" for dual role USB controllers of MPC5121.
>     Wherever applicable, the IP version of the USB controller should
> -   also be mentioned (for eg. fsl-usb2-dr-v2.2 for bsc9132).
> +   also be mentioned in another string.
> +   For multi port host USB controller with IP version <IP_Ver>, it should be
> +   "fsl-usb2-mph-<IP_Ver>". For dual role USB controller with IP version
> +   <IP_Ver>, it should be "fsl-usb2-dr-<IP_Ver>".

It was documented before -- this is just making it more explicit, right?

FWIW, the version number can be read out of a USB register, so I'd
rather remove the suggestion to specify the version number and replace
it with a reference to the ID register.

>   - phy_type : For multi port host USB controllers, should be one of
>     "ulpi", or "serial". For dual role USB controllers, should be
>     one of "ulpi", "utmi", "utmi_wide", or "serial".
> @@ -42,9 +45,9 @@ Optional properties :
>   - fsl,invert-pwr-fault : boolean; for MPC5121 USB0 only. Indicates
>     the PWR_FAULT signal polarity is inverted.
>  
> -Example multi port host USB controller device node :
> +Example multi port host USB controller version 2.5 device node :
>  	usb@22000 {
> -		compatible = "fsl-usb2-mph";
> +		compatible = "fsl-usb2-mph-v2.5", "fsl-usb2-mph";
>  		reg = <22000 1000>;
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> @@ -55,9 +58,9 @@ Example multi port host USB controller device node :
>  		port1;
>  	};
>  
> -Example dual role USB controller device node :
> +Example dual role USB controller version 2.5 device node :
>  	usb@23000 {
> -		compatible = "fsl-usb2-dr";
> +		compatible = "fsl-usb2-dr-v2.5", "fsl-usb2-dr";
>  		reg = <23000 1000>;
>  		#address-cells = <1>;
>  		#size-cells = <0>;

This example doesn't correspond to any device tree I see.  Even after
your next patch that sets t2080's USB to v2.5, the addresses are
different.

Also, if you're going to update the example, please also update it to be
modern in other respects, such as using 0x for hex numbers (outside the
unit address).

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
