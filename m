From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 08/10] dt-bindings: usb: Update bindings for LS1012A
Date: Mon, 29 Aug 2016 21:18:12 +0800
Message-ID: <20160829131812.GN30790@tiger>
References: <1472207269-18499-1-git-send-email-Bhaskar.Upadhaya@nxp.com>
 <1472207269-18499-8-git-send-email-Bhaskar.Upadhaya@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1472207269-18499-8-git-send-email-Bhaskar.Upadhaya-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bhaskar Upadhaya <Bhaskar.Upadhaya-3arQi8VN3Tc@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, linux-devel-XDVM779Km55Y1YpKYGMr2+TW4wlIGRCZ@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 26, 2016 at 03:57:47PM +0530, Bhaskar Upadhaya wrote:
> Signed-off-by: Bhaskar Upadhaya <Bhaskar.Upadhaya-3arQi8VN3Tc@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/fsl-usb.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/fsl-usb.txt b/Documentation/devicetree/bindings/usb/fsl-usb.txt
> index 4779c02..08ccc6e 100644
> --- a/Documentation/devicetree/bindings/usb/fsl-usb.txt
> +++ b/Documentation/devicetree/bindings/usb/fsl-usb.txt
> @@ -81,3 +81,13 @@ Example dual role USB controller device node for MPC5121ADS:
>  		fsl,invert-drvvbus;
>  		fsl,invert-pwr-fault;
>  	};
> +
> +Example dual role USB controller device node for LS1012A:
> +	usb@8600000 {
> +		compatible = "fsl-usb2-dr-v2.5", "fsl-usb2-dr";
> +		reg = <0x0 0x8600000 0x0 0x1000>;
> +		interrupts = <0 139 0x4>;
> +		dr_mode = "host";
> +		phy_type = "ulpi";
> +		fsl,usb-erratum-a005697;

I cannot find this 'fsl,usb-erratum-a005697' property definition in the
bindings doc.

Shawn

> +	};
> -- 
> 1.9.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
