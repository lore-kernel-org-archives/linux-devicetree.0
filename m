From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] powerpc: dts: t208x: Change T208x USB controller version
Date: Thu, 21 Aug 2014 17:36:33 -0500
Message-ID: <1408660593.6510.0.camel@snotra.buserror.net>
References: <1408617090-29692-1-git-send-email-nikhil.badola@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408617090-29692-1-git-send-email-nikhil.badola-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nikhil Badola <nikhil.badola-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2014-08-21 at 16:01 +0530, Nikhil Badola wrote:
> Change USB controller version to 2.5 in compatible string for T2080/T2081
> 
> Signed-off-by: Nikhil Badola <nikhil.badola-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> 	Checkpatch warnings handled by commit 61a8c2c6fe71082de3ea8629589dcdd0cc5c3f02

That checkpatch warning is known to have false positives in cases where
the binding says "<CHIPNAME>-device" or "device-<VERSION>".  If you want
to update the binding to give an example with a version, that's fine,
but checkpatch shouldn't be why.  We're not going to update the binding
example again to match a different version the next time one is added to
a device tree...

> 	Documentation: dts: fsl-usb: Document USB node compatible string for IP version	
> 
>  arch/powerpc/boot/dts/fsl/t2081si-post.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi b/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi
> index 97479f0..aecee96 100644
> --- a/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi
> @@ -410,7 +410,7 @@
>  /include/ "qoriq-gpio-3.dtsi"
>  /include/ "qoriq-usb2-mph-0.dtsi"
>  	usb0: usb@210000 {
> -		compatible = "fsl-usb2-mph-v2.4", "fsl-usb2-mph";
> +		compatible = "fsl-usb2-mph-v2.5", "fsl-usb2-mph";

This is an example of why it's better to rely on version registers when
present.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
