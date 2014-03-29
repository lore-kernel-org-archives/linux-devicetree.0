From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv2 2/2] Documentation: DT: Document rx51-battery binding
Date: Sat, 29 Mar 2014 11:10:58 +0000
Message-ID: <5336AA42.8020606@kernel.org>
References: <1393375569-21751-1-git-send-email-sre@debian.org> <1393705366-32420-1-git-send-email-sre@debian.org> <1393705366-32420-3-git-send-email-sre@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393705366-32420-3-git-send-email-sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?ISO-8859-1?Q?Pali_Roh=E1r?= <pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/03/14 20:22, Sebastian Reichel wrote:
> Add devicetree binding documentation for rx51-battery,
> which is a simple A/D converter consumer.
>
> Signed-off-by: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Acked-by: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Clearly this set has some rather large dependencies, but its good to go
once those are in place.

Jonathan
> ---
>   .../devicetree/bindings/power/rx51-battery.txt     | 25 ++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/power/rx51-battery.txt
>
> diff --git a/Documentation/devicetree/bindings/power/rx51-battery.txt b/Documentation/devicetree/bindings/power/rx51-battery.txt
> new file mode 100644
> index 0000000..9043845
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/rx51-battery.txt
> @@ -0,0 +1,25 @@
> +Binding for Nokia N900 battery
> +
> +The Nokia N900 battery status can be read via the TWL4030's A/D converter.
> +
> +Required properties:
> +- compatible: Should contain one of the following:
> + * "nokia,n900-battery"
> +- io-channels: Should contain IIO channel specifiers
> +               for each element in io-channel-names.
> +- io-channel-names: Should contain the following values:
> + * "temp" - The ADC channel for temperature reading
> + * "bsi"  - The ADC channel for battery size identification
> + * "vbat" - The ADC channel to measure the battery voltage
> +
> +Example from Nokia N900:
> +
> +battery: n900-battery {
> +	compatible = "nokia,n900-battery";
> +	io-channels = <&twl4030_madc 0>,
> +		      <&twl4030_madc 4>,
> +		      <&twl4030_madc 12>;
> +	io-channel-names = "temp",
> +			   "bsi",
> +			   "vbat";
> +};
>
