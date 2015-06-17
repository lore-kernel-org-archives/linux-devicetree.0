From: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 06/23] doc: dt-binding: usb: add otg related
 properties
Date: Wed, 17 Jun 2015 11:30:20 +0300
Message-ID: <20150617113020.2a3f9554@rockdesk>
References: <1434519835-27745-1-git-send-email-jun.li@freescale.com>
	<1434519835-27745-7-git-send-email-jun.li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434519835-27745-7-git-send-email-jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Wed, 17 Jun 2015 13:43:38 +0800
Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:

> Add otg version, srp, hnp and adp support for usb OTG port, then those OTG
> features don't have to be decided by usb gadget drivers.
> 
> Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Reviewed-by: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>

cheers,
-roger

> ---
>  Documentation/devicetree/bindings/usb/generic.txt | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/generic.txt b/Documentation/devicetree/bindings/usb/generic.txt
> index 477d5bb..bba8257 100644
> --- a/Documentation/devicetree/bindings/usb/generic.txt
> +++ b/Documentation/devicetree/bindings/usb/generic.txt
> @@ -11,6 +11,19 @@ Optional properties:
>  			"peripheral" and "otg". In case this attribute isn't
>  			passed via DT, USB DRD controllers should default to
>  			OTG.
> + - otg-rev: tells usb driver the release number of the OTG and EH supplement
> +			with which the device and its descriptors are compliant,
> +			in binary-coded decimal (i.e. 2.0 is 0200H). This
> +			property is used if any real OTG features(HNP/SRP/ADP)
> +			is enabled, if ADP is required, otg-rev should be
> +			0x0200 or above.
> + - hnp-disable: tells OTG controllers we want to disable OTG HNP, normally HNP
> +			is the basic function of real OTG except you want it
> +			to be a srp-capable only B device.
> + - srp-disable: tells OTG controllers we want to disable OTG SRP, SRP is
> +			optional for OTG device.
> + - adp-disable: tells OTG controllers we want to disable OTG ADP, ADP is
> +			optional for OTG device.
>  
>  This is an attribute to a USB controller such as:
>  
> @@ -21,4 +34,6 @@ dwc3@4a030000 {
>  	usb-phy = <&usb2_phy>, <&usb3,phy>;
>  	maximum-speed = "super-speed";
>  	dr_mode = "otg";
> +	otg-rev = <0x0200>;
> +	adp-disable;
>  };

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
