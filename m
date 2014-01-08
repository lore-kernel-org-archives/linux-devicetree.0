From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 1/9] devicetree: bindings: Document Krait/Scorpion
 cpus and enable-method
Date: Wed, 8 Jan 2014 14:21:40 +0000
Message-ID: <20140108142139.GJ6701@e106331-lin.cambridge.arm.com>
References: <1387845593-10050-1-git-send-email-sboyd@codeaurora.org>
 <1387845593-10050-2-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1387845593-10050-2-git-send-email-sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rohit Vaswani <rvaswani-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 24, 2013 at 12:39:45AM +0000, Stephen Boyd wrote:
> From: Rohit Vaswani <rvaswani-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> 
> Scorpion and Krait don't use the spin-table enable-method.
> Instead they rely on mmio register accesses to enable power and
> clocks to bring CPUs out of reset. Document their enable-methods.
> 
> Cc: <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> Signed-off-by: Rohit Vaswani <rvaswani-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> [sboyd: Split off into separate patch, renamed methods to
> match compatible nodes]
> Signed-off-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/cpus.txt | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
> index 9130435..333f4ae 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.txt
> +++ b/Documentation/devicetree/bindings/arm/cpus.txt
> @@ -180,7 +180,11 @@ nodes to be present and contain the properties described below.
>  			  be one of:
>  			     "spin-table"
>  			     "psci"
> -			# On ARM 32-bit systems this property is optional.
> +			# On ARM 32-bit systems this property is optional and
> +			  can be one of:
> +			    "qcom,gcc-msm8660"
> +			    "qcom,kpss-acc-v1"
> +			    "qcom,kpss-acc-v2"

It would be nice to document "psci" here as valid for 32-bit.

Currently the PSCI code doesn't inspect the enable-method and assumes it
if there's a psci node, but KVM tool and others set enable-method to
"psci", and if we change the way the PSCI code probes it will require
enable-method to be set for PSCI to work.

>  
>  	- cpu-release-addr
>  		Usage: required for systems that have an "enable-method"
> @@ -191,6 +195,21 @@ nodes to be present and contain the properties described below.
>  			  property identifying a 64-bit zero-initialised
>  			  memory location.
>  
> +	- qcom,saw
> +		Usage: required for systems that have an "enable-method"
> +		       property value of "qcom,kpss-acc-v1" or
> +		       "qcom,kpss-acc-v2"
> +		Value type: <phandle>
> +		Definition: Specifies the SAW[1] node associated with this CPU.
> +
> +	- qcom,acc
> +		Usage: required for systems that have an "enable-method"
> +		       property value of "qcom,kpss-acc-v1" or
> +		       "qcom,kpss-acc-v2"
> +		Value type: <phandle>
> +		Definition: Specifies the ACC[2] node associated with this CPU.
> +
> +
>  Example 1 (dual-cluster big.LITTLE system 32-bit):

If this is going to get much longer, we should probably have
Documentation/devicetree/bindings/arm/boot/ or similar, but that can be
done later.

Otherwise, this looks fine to me.

Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
