From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: bindings: Add DT bindings for ARM's
 FVP models.
Date: Tue, 21 Jun 2016 08:22:57 -0500
Message-ID: <20160621132257.GA2263@rob-hp-laptop>
References: <1466424796-13769-1-git-send-email-tixy@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1466424796-13769-1-git-send-email-tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 20, 2016 at 01:13:15PM +0100, Jon Medhurst wrote:
> List the required properties used to describe ARM's FVP models.
> 
> Signed-off-by: Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/arm-boards | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm-boards b/Documentation/devicetree/bindings/arm/arm-boards
> index ab318a5..4639a9b 100644
> --- a/Documentation/devicetree/bindings/arm/arm-boards
> +++ b/Documentation/devicetree/bindings/arm/arm-boards
> @@ -234,3 +234,24 @@ Example:
>  	};
>  
>  };
> +
> +ARM Fixed Virtual Platforms (FVP)
> +---------------------------------
> +FVPs are simulated platforms produced by ARM to aid software development without
> +the requirement for actual hardware. They come in several families, each of
> +which (usually) contain variants for different configurations of simulated
> +hardware. These are documented in the Fixed Virtual Platforms FVP Reference
> +Guide (reference number ARM DUI0837H).
> +
> +Required properties (in root node):
> +- compatible value:
> +	compatible = "arm,<family>,<variant>", "arm,<family>";
> +  where <family> is one of:
> +  - "fvp-base" for the Base FVP
> +  - "fvp-ve" for the VE FVP
> +  and <variant> is the part of the model's executable filename with the family
> +  name omitted, converted to lower case, and with non-alphanumeric characters
> +  replaced with '-'. E.g. the Base FVP that has two AEMv8 CPU clusters has an
> +  executable file called FVP_Base_AEMv8A-AEMv8A, so the compatible value for

Naming conventions of the exe aren't going to change?

> +  this would be:
> +	compatible = "arm,fvp-base,aemv8a-aemv8a", "arm,fvp-base";
> -- 
> 2.1.4
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
