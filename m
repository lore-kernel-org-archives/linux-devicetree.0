From: Stanimir Vabanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] ARM: qcom: Add initial APQ8064 SoC and IFC6410 board
 device trees
Date: Wed, 09 Apr 2014 01:02:24 +0300
Message-ID: <534471F0.5050800@mm-sol.com>
References: <1396972391-11759-1-git-send-email-galak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396972391-11759-1-git-send-email-galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Kumar,

<snip>

> +		intc: interrupt-controller@2000000 {
> +			compatible = "qcom,msm-qgic2";
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +			reg = < 0x02000000 0x1000 >,
> +			      < 0x02002000 0x1000 >;

extra space around numbers.

I wonder what is the preferred way of describing the properties:

reg = <0x02000000 0x1000>,
      <0x02002000 0x1000>;
or

reg = <0x02000000 0x1000>, <0x02002000 0x1000>;

This file mixes the above two ways of describing.

> +		};
> +
> +		timer@200a000 {
> +			compatible = "qcom,kpss-timer", "qcom,msm-timer";
> +			interrupts = <1 1 0x301>,
> +				     <1 2 0x301>,
> +				     <1 3 0x301>;
> +			reg = <0x0200a000 0x100>;
> +			clock-frequency = <27000000>,
> +					  <32768>;
> +			cpu-offset = <0x80000>;
> +		};
> +
> +		acc0: clock-controller@2088000 {
> +			compatible = "qcom,kpss-acc-v1";
> +			reg = <0x02088000 0x1000>, <0x02008000 0x1000>;
> +		};
> +

regards,
Stan

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
