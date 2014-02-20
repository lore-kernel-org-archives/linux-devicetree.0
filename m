From: Ian Campbell <Ian.Campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] arm/xen: Don't use xen DMA ops when the device is
 protected by an IOMMU
Date: Thu, 20 Feb 2014 17:13:21 +0000
Message-ID: <1392916401.32657.31.camel@kazak.uk.xensource.com>
References: <1392913301-25524-1-git-send-email-julien.grall@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392913301-25524-1-git-send-email-julien.grall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Julien Grall <julien.grall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Adding the -spec list for the generic IOMMU binding question.

On Thu, 2014-02-20 at 16:21 +0000, Julien Grall wrote:
> diff --git a/Documentation/devicetree/bindings/arm/xen.txt b/Documentation/devicetree/bindings/arm/xen.txt
> index 0f7b9c2..ee25a57 100644
> --- a/Documentation/devicetree/bindings/arm/xen.txt
> +++ b/Documentation/devicetree/bindings/arm/xen.txt
> @@ -15,6 +15,8 @@ the following properties:
>  - interrupts: the interrupt used by Xen to inject event notifications.
>    A GIC node is also required.
>  
> +- protected-devices: (optional) List of phandles to device node where the
> +IOMMU has been programmed by Xen. 

Is there some common/generic IOMMU binding which we can reuse here?
Although this isn't exactly an IOMMU it certainly has some similarities
-- it is providing IOMMU like functionality (albeit a very inflexible
IOMMU which you don't need to/can't actually program).

I'd far rather we followed existing patterns rather than invent our own
things.

I'm wondering if perhaps we didn't ought to integrate this as an actual
IOMMU driver, although I'm not convinced this would make sense.

I'm also not sure about shovelling everything as properties under a
single Xen node, should this not be its own node with compatible =
"xen,(pv)iommu"?

Ian.

--
To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
