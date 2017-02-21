From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH V2 1/3] arm64: dts: Add basic DT to support Spreadtrum's
 SP9860G
Date: Tue, 21 Feb 2017 10:57:38 +0000
Message-ID: <c47ce1ce-3e3f-ba5e-c45d-fd68d6cd5537@arm.com>
References: <1487660104-15693-1-git-send-email-chunyan.zhang@spreadtrum.com>
 <1487660104-15693-2-git-send-email-chunyan.zhang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487660104-15693-2-git-send-email-chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunyan Zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, orson.zhai-lxIno14LUO0EEoCn2XhGlw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 21/02/17 06:55, Chunyan Zhang wrote:
> From: Orson Zhai <orson.zhai-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
> 
> SC9860G is a 8 cores of A53 SoC with 4G LTE support SoC from Spreadtrum.
> 
> According to regular hierarchy of sprd dts, whale2.dtsi contains SoC
> peripherals IP nodes, sc9860.dtsi contains stuff related to ARM core stuff
> and sp9860g dts is for the board level.
> 
> Signed-off-by: Orson Zhai <orson.zhai-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
> Signed-off-by: Chunyan Zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
> ---
>  arch/arm64/boot/dts/sprd/Makefile         |   3 +-
>  arch/arm64/boot/dts/sprd/sc9860.dtsi      | 531 ++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/sprd/sp9860g-1h10.dts |  56 ++++
>  arch/arm64/boot/dts/sprd/whale2.dtsi      |  70 ++++
>  4 files changed, 659 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/sprd/sc9860.dtsi
>  create mode 100644 arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
>  create mode 100644 arch/arm64/boot/dts/sprd/whale2.dtsi
> 

[...]

> diff --git a/arch/arm64/boot/dts/sprd/sc9860.dtsi b/arch/arm64/boot/dts/sprd/sc9860.dtsi
> new file mode 100644
> index 0000000..73deb4e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/sprd/sc9860.dtsi
> @@ -0,0 +1,531 @@
> +/*
> + * Spreadtrum SP9860 SoC DTS file
> + *
> + * Copyright (C) 2016, Spreadtrum Communications Inc.
> + *
> + * This file is licensed under a dual GPLv2 or X11 license.
> + */
> +

[...]

> +
> +	idle-states{
> +		entry-method = "arm,psci";
> +
> +		CORE_PD: core_pd {
> +			compatible = "arm,idle-state";
> +			entry-latency-us = <1000>;
> +			exit-latency-us = <700>;
> +			min-residency-us = <2500>;
> +			local-timer-stop;
> +			arm,psci-suspend-param = <0x00010002>;
> +		};
> +
> +		CLUSTER_PD: cluster_pd {
> +			compatible = "arm,idle-state";
> +			entry-latency-us = <1000>;
> +			exit-latency-us = <1000>;
> +			min-residency-us = <3000>;
> +			local-timer-stop;
> +			arm,psci-suspend-param = <0x01010003>;
> +		};

Thanks for dropping the hacked up "deep sleep" state :)
This version looks fine to me.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
