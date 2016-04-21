From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v6 7/7] arm64/perf: Add Broadcom Vulcan PMU support
Date: Thu, 21 Apr 2016 14:54:50 +0100
Message-ID: <20160421135450.GO6879@leverpostej>
References: <1461243525-13603-1-git-send-email-ashoks@broadcom.com>
 <1461243525-13603-8-git-send-email-ashoks@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1461243525-13603-8-git-send-email-ashoks-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ashok Kumar <ashoks-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, Suzuki.Poulose-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, jglauber-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 21, 2016 at 05:58:45AM -0700, Ashok Kumar wrote:
> +static int armv8_vulcan_pmu_init(struct arm_pmu *cpu_pmu)
> +{
> +	armv8_pmu_init(cpu_pmu);
> +	cpu_pmu->name			= "armv8_brcm_vulcan";

Are we happy with "brcm" being the exposed userspace name? It might be
better to have this as "armv8_broadcom_vulcan".

I'll leave that to you and Will. Either way:

Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
