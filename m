From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC] arm64: Add cpu-return-addr to dts files
Date: Mon, 18 Aug 2014 10:23:58 +0100
Message-ID: <20140818092357.GB14559@leverpostej>
References: <1408132130.22761.64.camel@smoke>
 <1408132229.22761.66.camel@smoke>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1408132229.22761.66.camel@smoke>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geoff Levand <geoff-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 15, 2014 at 08:50:29PM +0100, Geoff Levand wrote:
> Add entries for the new device tree property cpu-return-addr to the
> existing arm64 dts files.
> 
> Signed-off-by: Geoff Levand <geoff-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
> ---
> 
> Just FYI.
> 
>  arch/arm64/boot/dts/apm-storm.dtsi     | 8 ++++++++
>  arch/arm64/boot/dts/foundation-v8.dts  | 4 ++++
>  arch/arm64/boot/dts/rtsm_ve-aemv8a.dts | 4 ++++
>  3 files changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apm-storm.dtsi b/arch/arm64/boot/dts/apm-storm.dtsi
> index 40aa96c..c40e25f 100644
> --- a/arch/arm64/boot/dts/apm-storm.dtsi
> +++ b/arch/arm64/boot/dts/apm-storm.dtsi
> @@ -25,6 +25,7 @@
>  			reg = <0x0 0x000>;
>  			enable-method = "spin-table";
>  			cpu-release-addr = <0x1 0x0000fff8>;
> +			cpu-return-addr = <0x0 0x0>; /* Updated by bootloader */

Following from the way we handle PSCI in the bootwrapper, if we were to
support these I expect we'd inject the proeprties entirely. So there's
no need to have a property with an invalid value here -- the property
should be valid if present (consider that zero could be a valid PA to
jump back to).

Cheers,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
