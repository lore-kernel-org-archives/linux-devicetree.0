From: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: juno: fix cluster sleep state entry latency
 on all SoC versions
Date: Mon, 14 Nov 2016 17:32:52 +0000
Message-ID: <20161114173252.GP10219@e106497-lin.cambridge.arm.com>
References: <1479137189-15378-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1479137189-15378-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, "Jon Medhurst (Tixy)" <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 14, 2016 at 03:26:29PM +0000, Sudeep Holla wrote:
> The core and the cluster sleep state entry latencies can't be same as
> cluster sleep involves more work compared to core level e.g. shared
> cache maintenance.
> 
> Experiments have shown on an average about 100us more latency for the
> cluster sleep state compared to the core level sleep. This patch fixes
> the entry latency for the cluster sleep state.
> 
> Fixes: 28e10a8f3a03 ("arm64: dts: juno: Add idle-states to device tree")
> Cc: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> Cc: "Jon Medhurst (Tixy)" <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>

Looks sensible to me.

Reviewed-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>

> ---
>  arch/arm64/boot/dts/arm/juno-r1.dts | 2 +-
>  arch/arm64/boot/dts/arm/juno-r2.dts | 2 +-
>  arch/arm64/boot/dts/arm/juno.dts    | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> Hi,
> 
> This was found recently when I found that core sleep was chosen when
> entering suspend-to-idle state on Juno. Since the wakeup(entry+exit)
> latency matched for the both states, cpu sleep state was chosen to enter
> in suspend-to-idle.
> 
> Regards,
> Sudeep
> 
> diff --git a/arch/arm64/boot/dts/arm/juno-r1.dts b/arch/arm64/boot/dts/arm/juno-r1.dts
> index 3be8a3ef671c..eec37feee8fc 100644
> --- a/arch/arm64/boot/dts/arm/juno-r1.dts
> +++ b/arch/arm64/boot/dts/arm/juno-r1.dts
> @@ -76,7 +76,7 @@
>  				compatible = "arm,idle-state";
>  				arm,psci-suspend-param = <0x1010000>;
>  				local-timer-stop;
> -				entry-latency-us = <300>;
> +				entry-latency-us = <400>;
>  				exit-latency-us = <1200>;
>  				min-residency-us = <2500>;
>  			};
> diff --git a/arch/arm64/boot/dts/arm/juno-r2.dts b/arch/arm64/boot/dts/arm/juno-r2.dts
> index 614fc9227943..28f40ec44090 100644
> --- a/arch/arm64/boot/dts/arm/juno-r2.dts
> +++ b/arch/arm64/boot/dts/arm/juno-r2.dts
> @@ -76,7 +76,7 @@
>  				compatible = "arm,idle-state";
>  				arm,psci-suspend-param = <0x1010000>;
>  				local-timer-stop;
> -				entry-latency-us = <300>;
> +				entry-latency-us = <400>;
>  				exit-latency-us = <1200>;
>  				min-residency-us = <2500>;
>  			};
> diff --git a/arch/arm64/boot/dts/arm/juno.dts b/arch/arm64/boot/dts/arm/juno.dts
> index 6b4135e9cfe5..ac5ceb73f45f 100644
> --- a/arch/arm64/boot/dts/arm/juno.dts
> +++ b/arch/arm64/boot/dts/arm/juno.dts
> @@ -76,7 +76,7 @@
>  				compatible = "arm,idle-state";
>  				arm,psci-suspend-param = <0x1010000>;
>  				local-timer-stop;
> -				entry-latency-us = <300>;
> +				entry-latency-us = <400>;
>  				exit-latency-us = <1200>;
>  				min-residency-us = <2500>;
>  			};
> --
> 2.7.4
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
