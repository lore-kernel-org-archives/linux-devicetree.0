From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3] ARM: dts: mt8173: support arm64 cpuidle-dt
Date: Fri, 29 May 2015 15:55:52 +0100
Message-ID: <20150529145552.GD18512@red-moon>
References: <1432882906-7940-1-git-send-email-howard.chen@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1432882906-7940-1-git-send-email-howard.chen-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Howard Chen <howard.chen-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org" <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Bobby Batacharia <Bobby.Batacharia-5wv7dgnIgG8@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 29, 2015 at 08:01:46AM +0100, Howard Chen wrote:
> This patch adds an idle-states node to describe the mt8173 idle states and
> also adds references to the idle-states node in all CPU nodes.
> 
> Signed-off-by: Howard Chen <howard.chen-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
You should have added a list of incremental changes (v1->v2->v3) here
otherwise there is no point in adding a patch version, we are not
supposed to remember what you have changed.

>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index 924fdb6..47e8d56 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -49,6 +49,8 @@
>  			device_type = "cpu";
>  			compatible = "arm,cortex-a53";
>  			reg = <0x000>;
> +			enable-method = "psci";
> +			cpu-idle-states = <&CPU_SLEEP_0>;
>  		};
>  
>  		cpu1: cpu@1 {
> @@ -56,6 +58,7 @@
>  			compatible = "arm,cortex-a53";
>  			reg = <0x001>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&CPU_SLEEP_0>;
>  		};
>  
>  		cpu2: cpu@100 {
> @@ -63,6 +66,7 @@
>  			compatible = "arm,cortex-a57";
>  			reg = <0x100>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&CPU_SLEEP_0>;
>  		};
>  
>  		cpu3: cpu@101 {
> @@ -70,6 +74,20 @@
>  			compatible = "arm,cortex-a57";
>  			reg = <0x101>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&CPU_SLEEP_0>;
> +		};
> +
> +		idle-states {
> +			entry-method = "arm,psci";
> +
> +			CPU_SLEEP_0: cpu-sleep-0 {
> +				compatible = "arm,idle-state";

UltraNit: please move local-timer-stop here to keep the property ordering
as in the bindings.

More importantly, IIRC the idle state was not local-timer-stop in v2,
what changed in the interim ? v1->v2 the cluster idle state disappeared,
now the local timer seems to stop when it was not before (and that is
the same HW), I hope things are settled now.

https://lkml.org/lkml/2015/4/7/76

> +				arm,psci-suspend-param = <0x0010000>;

Move this property as last on the list, let's keep the generic
properties first.

> +				entry-latency-us = <639>;
> +				exit-latency-us = <680>;
> +				min-residency-us = <1088>;
> +				local-timer-stop;
> +			};
>  		};
>  	};

I guess there is no hope of seeing the cluster state restored (?).

I would like some explanation regarding local-timer-stop change, apart
from that you can add:

Acked-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
