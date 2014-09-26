From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v4 2/3] watchdog: qcom: document device tree bindings
Date: Thu, 25 Sep 2014 20:19:15 -0700
Message-ID: <5424DB33.1060700@roeck-us.net>
References: <cover.1411684967.git.joshc@codeaurora.org> <84605584a0634ad35a7829daf5a148107aaabc72.1411684967.git.joshc@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <84605584a0634ad35a7829daf5a148107aaabc72.1411684967.git.joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/25/2014 03:51 PM, Josh Cartwright wrote:
> The Qualcomm Krait Processor Sub-system (KPSS) contains one or more
> instances of the WDT.  Provide documentation on how to describe these in
> the device tree.
>
> Signed-off-by: Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

> ---
>   .../devicetree/bindings/watchdog/qcom-wdt.txt      | 24 ++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
>
> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt b/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
> new file mode 100644
> index 0000000..4726924
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
> @@ -0,0 +1,24 @@
> +Qualcomm Krait Processor Sub-system (KPSS) Watchdog
> +---------------------------------------------------
> +
> +Required properties :
> +- compatible : shall contain only one of the following:
> +
> +			"qcom,kpss-wdt-msm8960"
> +			"qcom,kpss-wdt-apq8064"
> +			"qcom,kpss-wdt-ipq8064"
> +
> +- reg : shall contain base register location and length
> +- clocks : shall contain the input clock
> +
> +Optional properties :
> +- timeout-sec : shall contain the default watchdog timeout in seconds,
> +                if unset, the default timeout is 30 seconds
> +
> +Example:
> +	watchdog@208a038 {
> +		compatible = "qcom,kpss-wdt-ipq8064";
> +		reg = <0x0208a038 0x40>;
> +		clocks = <&sleep_clk>;
> +		timeout-sec = <10>;
> +	};
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
