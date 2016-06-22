From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH V2] coresight: document binding acronyms
Date: Wed, 22 Jun 2016 17:40:11 +0100
Message-ID: <576ABF6B.6000901@arm.com>
References: <1466607663-22599-1-git-send-email-mathieu.poirier@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466607663-22599-1-git-send-email-mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Suzuki.Poulose-5wv7dgnIgG8@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 22/06/16 16:01, Mathieu Poirier wrote:
> It can be hard for people not familiar with the CoreSight IP blocks
> to make sense of the acronyms found in the current bindings.  As such
> this patch expands each acronym in the hope of providing a better
> description of the IP block they represent.
>
> Signed-off-by: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>   .../devicetree/bindings/arm/coresight.txt          | 35 +++++++++++++++++-----
>   1 file changed, 27 insertions(+), 8 deletions(-)
>
> Changes since V1:
>     - Expanded ETB, ETF and ETR acronyms.
>     - Added note about using the same binding
>       for all 3 modes (ETB, ETF, ETR).
>
> diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
> index 93147c0c8a0e..fcbae6a5e6c1 100644
> --- a/Documentation/devicetree/bindings/arm/coresight.txt
> +++ b/Documentation/devicetree/bindings/arm/coresight.txt
> @@ -12,14 +12,33 @@ its hardware characteristcs.
>
>   	* compatible: These have to be supplemented with "arm,primecell" as
>   	  drivers are using the AMBA bus interface.  Possible values include:
> -		- "arm,coresight-etb10", "arm,primecell";
> -		- "arm,coresight-tpiu", "arm,primecell";
> -		- "arm,coresight-tmc", "arm,primecell";
> -		- "arm,coresight-funnel", "arm,primecell";
> -		- "arm,coresight-etm3x", "arm,primecell";
> -		- "arm,coresight-etm4x", "arm,primecell";
> -		- "qcom,coresight-replicator1x", "arm,primecell";
> -		- "arm,coresight-stm", "arm,primecell"; [1]
> +		- Embedded Trace Buffer (version 1.0):
> +			"arm,coresight-etb10", "arm,primecell";
> +
> +		- Trace Port Interface Unit:
> +			"arm,coresight-tpiu", "arm,primecell";
> +
> +		- Trace Memory Controller, used for Embedded Trace Buffer(ETB),
> +		  Embedded Trace FIFO(ETF) and Embedded Trace Router(ETR)
> +		  configuration.  The configuration mode (ETB, ETF, ETR) is
> +		  discovered at boot time when the device is probed.
> +			"arm,coresight-tmc", "arm,primecell";
> +
> +		- Trace Funnel:
> +			"arm,coresight-funnel", "arm,primecell";
> +
> +		- Embedded Trace Macrocell (version 3.x) and
> +					Program Flow Trace Macrocell:
> +			"arm,coresight-etm3x", "arm,primecell";
> +
> +		- Embedded Trace Macrocell (version 4.x):
> +			"arm,coresight-etm4x", "arm,primecell";
> +
> +		- Qualcomm Configurable Replicator (version 1.x):
> +			"qcom,coresight-replicator1x", "arm,primecell";
> +
> +		- System Trace Macrocell:
> +			"arm,coresight-stm", "arm,primecell"; [1]


Looks good to me.

Acked-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
