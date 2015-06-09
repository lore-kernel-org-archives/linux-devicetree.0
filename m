From: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 05/22] doc: dt-binding: usb: add otg related
 properties
Date: Tue, 9 Jun 2015 15:49:14 +0300
Message-ID: <20150609154914.0f800a23@rockdesk>
References: <1433775737-9816-1-git-send-email-jun.li@freescale.com>
	<1433775737-9816-6-git-send-email-jun.li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433775737-9816-6-git-send-email-jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Mon, 8 Jun 2015 23:02:00 +0800
Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:

> Add otg version, srp, hnp and adp support for usb OTG port, then those OTG
> features don't have to be decided by usb gadget drivers.
> 
> Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/generic.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/generic.txt b/Documentation/devicetree/bindings/usb/generic.txt
> index 477d5bb..7386f4a 100644
> --- a/Documentation/devicetree/bindings/usb/generic.txt
> +++ b/Documentation/devicetree/bindings/usb/generic.txt
> @@ -11,6 +11,12 @@ Optional properties:
>  			"peripheral" and "otg". In case this attribute isn't
>  			passed via DT, USB DRD controllers should default to
>  			OTG.
> + - otg-rev: tells usb driver the release number of the OTG and EH supplement
> +			with which the device and its descriptors are compliant,
> +			in binary-coded decimal (i.e. 2.0 is 0200H).
> + - srp-support: tells OTG controllers we want to enable SRP.
> + - hnp-support: tells OTG controllers we want to enable HNP.
> + - adp-support: tells OTG controllers we want to enable ADP.

should we call these enable-<foo> as it doesn't indicate whether controller supports it or not
but just that the board DT wants to enable it.

>  
>  This is an attribute to a USB controller such as:
>  
> @@ -21,4 +27,8 @@ dwc3@4a030000 {
>  	usb-phy = <&usb2_phy>, <&usb3,phy>;
>  	maximum-speed = "super-speed";
>  	dr_mode = "otg";
> +	otg-rev = <0x0200>;
> +	srp-support;
> +	hnp-support;
> +	adp-support;
>  };

cheers,
-roger
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
