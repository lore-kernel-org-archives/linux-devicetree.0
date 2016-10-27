From: Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V3 2/2] iio: adc: spmi-vadc: Changes to support different
 scaling
Date: Thu, 27 Oct 2016 14:18:42 +0300
Message-ID: <8418e7f1-55d9-2dfa-1dc7-5960f9da0305@linaro.org>
References: <1477492887-1663-1-git-send-email-rphani@codeaurora.org>
 <1477492887-1663-3-git-send-email-rphani@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477492887-1663-3-git-send-email-rphani-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rama Krishna Phani A <rphani-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, smohanad-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mgautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sivaa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, Julia.Lawall-L2FTfq7BK8M@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rama,

On 10/26/2016 05:41 PM, Rama Krishna Phani A wrote:
> Polling can also be used for End of conversion completion. Implement logic
> to choose either polling or interrupt for End of conversion completion.
> Scaling can be done on the voltage to report adc code in physical units.
> Add changes to support different scale functions to convert adc code to
> physical units.
> 
> Signed-off-by: Rama Krishna Phani A <rphani-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  .../devicetree/bindings/iio/adc/qcom,spmi-vadc.txt |  14 ++
>  drivers/iio/adc/qcom-spmi-vadc.c                   | 263 +++++++++++++++++----
>  2 files changed, 236 insertions(+), 41 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.txt b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.txt
> index 0fb4613..39e31c0e 100644
> --- a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.txt
> +++ b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.txt
> @@ -37,6 +37,12 @@ VADC node:
>      Value type: <prop-encoded-array>
>      Definition: End of conversion interrupt.
>  
> +- qcom,vadc-poll-eoc:
> +    Usage: optional
> +    Value type: <bool>
> +    Definition: Use polling instead of interrupts for End of Conversion
> +		completion.

Why you need to add such a flag in DT?

The DT should describe hardware details not how the driver will choose
pooling vs interrupt.

On which use-case you would prefer pooling?

> +
>  Channel node properties:
>  
>  - reg:
> @@ -92,6 +98,14 @@ Channel node properties:
>              Valid values are: 1, 2, 4, 8, 16, 32, 64, 128, 256, 512
>              If property is not found, 1 sample will be used.
>  
> +- qcom,scale-function:
> +    Usage: optional
> +    Value type: <u32>
> +    Definition: Scaling function used to convert raw ADC code to
> +	units specific to a given channel. Scaled units can be
> +	microvolts, millidegC.Valid values are: 0, 1, 2, 3, 4.
> +	If property is not found, 0 scaling will be used.

This shouldn't be in DT binding. Just select the scale function for each
channel in the driver based on compatible property.


-- 
regards,
Stan
