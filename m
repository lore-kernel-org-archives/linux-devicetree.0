From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/4] Documentation: Add documentation for APM X-Gene SoC
 PMU DTS binding
Date: Fri, 1 Apr 2016 13:30:01 +0100
Message-ID: <20160401123000.GC29876@leverpostej>
References: <1459467472-31561-1-git-send-email-ttnguyen@apm.com>
 <1459467472-31561-3-git-send-email-ttnguyen@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1459467472-31561-3-git-send-email-ttnguyen-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tai Nguyen <ttnguyen-qTEPVZfXA3Y@public.gmane.org>
Cc: will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

As per Documentation/devicetree/bindings/submitting-patches.txt, please
put binding patches earlier in a series than the code using them.

On Thu, Mar 31, 2016 at 04:37:50PM -0700, Tai Nguyen wrote:
> Documentation: Add documentation for APM X-Gene SoC PMU DTS binding
> 
> Signed-off-by: Tai Nguyen <ttnguyen-qTEPVZfXA3Y@public.gmane.org>
> ---
>  .../devicetree/bindings/perf/apm-xgene-pmu.txt     | 116 +++++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/perf/apm-xgene-pmu.txt
> 
> diff --git a/Documentation/devicetree/bindings/perf/apm-xgene-pmu.txt b/Documentation/devicetree/bindings/perf/apm-xgene-pmu.txt
> new file mode 100644
> index 0000000..40dfd4e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/perf/apm-xgene-pmu.txt
> @@ -0,0 +1,116 @@
> +* APM X-Gene SoC PMU bindings
> +
> +This is APM X-Gene SoC PMU (Performance Monitoring Unit) module.
> +The following PMU devices are supported:
> +
> +  L3C			- L3 cache controller
> +  IOB			- IO bridge
> +  MCB			- Memory controller bridge
> +  MC			- Memory controller

These sound like separate units. How do these relate?

Is there an SOC-wide PMU that aggregates counters, or are these actually
independent?

> +
> +The following section describes the SoC PMU DT node binding.
> +
> +Required properties:
> +- compatible		: Shall be "apm,xgene-pmu" for revision 1 or
> +                          "apm,xgene-pmu-v2" for revision 2.

That name is very general. Is there not a more specific name for the SOC
PMU?

> +Required properties for L3C subnode:
> +- compatible		: Shall be "apm,xgene-pmu-l3c".
> +- reg			: First resource shall be the L3C PMU resource.
> +- index			: Instance number of the L3C PMU.
> +
> +Required properties for IOB subnode:
> +- compatible		: Shall be "apm,xgene-pmu-iob".
> +- reg			: First resource shall be the IOB PMU resource.
> +- index			: Instance number of the IOB PMU.
> +
> +Required properties for MCB subnode:
> +- compatible		: Shall be "apm,xgene-pmu-mcb".
> +- reg			: First resource shall be the MCB PMU resource.
> +- index			: Instance number of the MCB PMU.
> +
> +Required properties for MC subnode:
> +- compatible		: Shall be "apm,xgene-pmu-mc".
> +- reg			: First resource shall be the MC PMU resource.
> +- index			: Instance number of the MC PMU.

What's the index property useful for?

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
