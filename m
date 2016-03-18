From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 1/2] ARM: dts: at91: shdwc binding: add new shutdown
 controller documentation
Date: Fri, 18 Mar 2016 16:29:03 -0500
Message-ID: <20160318212903.GA9179@rob-hp-laptop>
References: <1458134390-23847-1-git-send-email-nicolas.ferre@atmel.com>
 <1458134390-23847-2-git-send-email-nicolas.ferre@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1458134390-23847-2-git-send-email-nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 16, 2016 at 02:19:49PM +0100, Nicolas Ferre wrote:
> The new shutdown controller compatible with sama5d2 has a new binding
> documentation and properties.
> 
> Signed-off-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> 
> doc
> 
> ---
> 
> Changes in v5:
> - change naming for this driver: instead of the "alternate shdwc" we choose a
>   more specific "sama5d2-compatible shdwc" wording.
> 
> Changes in v4:
> - change property to debounce-delay-us so that we can use a generic property
>   and we can have the unit explicitly included it the name according to
>   Documentation/devicetree/bindings/property-units.txt.
> - move to atmel,wakeup-active-high boolean property instead of a "high", "low"
>   string comparison.
> 
> Changes in v3:
> - get and use slow clock and specify its handler in binding
> 
> Changes in v2: None
> 
>  .../devicetree/bindings/arm/atmel-at91.txt         | 59 ++++++++++++++++++++++
>  1 file changed, 59 insertions(+)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
