From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/3] Documentation: Update the APM X-Gene SoC EDAC DTS
 binding for missing RB
Date: Wed, 20 Jan 2016 10:46:36 -0600
Message-ID: <20160120164636.GA25195@rob-hp-laptop>
References: <1453250812-15097-1-git-send-email-lho@apm.com>
 <1453250812-15097-2-git-send-email-lho@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1453250812-15097-2-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Cc: bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 19, 2016 at 05:46:50PM -0700, Loc Ho wrote:
> This patch updates the APM X-Gene SoC EDAC documentation binding to
> reference the missing register bus for the the SoC EDAC.
> 
> Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
> ---
>  .../devicetree/bindings/edac/apm-xgene-edac.txt    |   12 ++++++++++++
>  1 files changed, 12 insertions(+), 0 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt b/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt
> index 78e2a31..17b29af 100644
> --- a/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt
> +++ b/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt
> @@ -20,6 +20,12 @@ Required properties:
>  - interrupts            : Interrupt-specifier for MCU, PMD, L3, or SoC error
>  			  IRQ(s).
>  
> +Optional property:
> +- regmap-rb		: Regmap of the register bus resource. This properity

s/properity/property/

> +			  is optional only for compatibility. If the RB
> +			  erorr conditions are not cleared, it will
> +			  continuously generates interrupt.

s/generates/generate/

Given this is pretty much required. I think I would move this back to 
required in the documentation, but keep the driver to allow it to be 
missing.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
