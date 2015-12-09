From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 1/2] usb: renesas_usbhs: add fallback compatibility string
Date: Wed, 9 Dec 2015 11:37:57 +0900
Message-ID: <20151209023757.GE17706@verge.net.au>
References: <1449553911-21412-1-git-send-email-horms+renesas@verge.net.au>
 <1449553911-21412-2-git-send-email-horms+renesas@verge.net.au>
 <5666EAB0.6000109@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5666EAB0.6000109-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 08, 2015 at 05:35:28PM +0300, Sergei Shtylyov wrote:
> On 12/08/2015 08:51 AM, Simon Horman wrote:
> 
> >Add fallback compatibility string.
> >This is in keeping with the fallback scheme being adopted wherever
> >appropriate for drivers for Renesas SoCs.
> >
> >Signed-off-by: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
> >---
> >  Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 4 ++--
> >  drivers/usb/renesas_usbhs/common.c                      | 4 ++++
> >  2 files changed, 6 insertions(+), 2 deletions(-)
> >
> >diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> >index 7d48f63db44e..8c50df8441c9 100644
> >--- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> >+++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> >@@ -1,7 +1,7 @@
> >  Renesas Electronics USBHS driver
> >
> >  Required properties:
> >-  - compatible: Must contain one of the following:
> >+  - compatible: "renesas,usbhs-<soctype>", "renesas,rcar-usbhs" as fallback.
> >  	- "renesas,usbhs-r8a7790"
> >  	- "renesas,usbhs-r8a7791"
> >  	- "renesas,usbhs-r8a7794"
> [...]
> >diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
> >index d82fa36c3465..2a9d4f405f30 100644
> >--- a/drivers/usb/renesas_usbhs/common.c
> >+++ b/drivers/usb/renesas_usbhs/common.c
> >@@ -481,6 +481,10 @@ static const struct of_device_id usbhs_of_match[] = {
> >  		.compatible = "renesas,usbhs-r8a7795",
> >  		.data = (void *)USBHS_TYPE_RCAR_GEN2,
> >  	},
> >+	{
> >+		.compatible = "renesas,usbhs",
> 
>    You just documented "renesas,rcar-usbhs".

Thanks. I meant to use "renesas,rcar-usbhs" throughout the patch.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
