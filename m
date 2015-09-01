From: Badola Nikhil <nikhil.badola-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH 1/3][v2] Documentation: dt: dwc3: Add
 snps,quirk-frame-length-adjustment property
Date: Tue, 1 Sep 2015 03:26:54 +0000
Message-ID: <SN1PR0301MB1629F5CC8EA6FD8A489872A9F36A0@SN1PR0301MB1629.namprd03.prod.outlook.com>
References: <1439785413-27152-1-git-send-email-nikhil.badola@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439785413-27152-1-git-send-email-nikhil.badola-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Badola Nikhil <nikhil.badola-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Nikhil Badola [mailto:nikhil.badola-KZfg59tc24xl57MIdRCFDg@public.gmane.org]
> Sent: Monday, August 17, 2015 9:54 AM
> To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-
> usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: balbi-l0cyMroinI0@public.gmane.org; Badola Nikhil-B46172 <nikhil.badola-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Subject: [PATCH 1/3][v2] Documentation: dt: dwc3: Add snps,quirk-frame-
> length-adjustment property
> 
> Add snps,quirk-frame-length-adjustment property which provides value for
> post silicon frame length adjustment
> 
> Signed-off-by: Nikhil Badola <nikhil.badola-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> Changes for v2
> 	- changed quirk name as well description
> 
>  Documentation/devicetree/bindings/usb/dwc3.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt
> b/Documentation/devicetree/bindings/usb/dwc3.txt
> index 0815eac..8c7d585 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -40,6 +40,9 @@ Optional properties:
>   - snps,hird-threshold: HIRD threshold
>   - snps,hsphy_interface: High-Speed PHY interface selection between "utmi"
> for
>     UTMI+ and "ulpi" for ULPI when the DWC_USB3_HSPHY_INTERFACE has
> value 3.
> + - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ field of
> GFLADJ
> +	register for post-silicon frame length adjustment when the
> +	fladj_30mhz_sdbnd signal is invalid or incorrect.
> 
>  This is usually a subnode to DWC3 glue to which it is connected.
> 
> --
> 2.1.0

Hi Felipe,

I have incorporated the review comments provided by you. 
Could you please provide me review comments, if any, on this 2nd version of patch set.

Thanks,
Nikhil
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
