From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/3] arm64: dts: juno: add arm,primecell-periphid override
Date: Thu, 16 Jun 2016 15:42:27 +0100
Message-ID: <5762BAD3.6050405@arm.com>
References: <1465228765-14038-1-git-send-email-sudeep.holla@arm.com>
 <1465228765-14038-3-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465228765-14038-3-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 06/06/16 16:59, Sudeep Holla wrote:
> The Linux AMBA framework probes the peripheral ids when adding the amba
> devices very early on the boot. Generally they are on APB bus and just
> require APB clocks to be on even when most of the core logic of the IP
> is powered down.
>
> However on Juno, the entire debugsys domain needs to be ON to access
> those CID/PID registers and hence broken by design. Accessing those
> while debugsys power domain is off will lead to the bridge stalling the
> transactions instead of returning the slave error.
>
> Since keeping the power domain on by default affects the core power(by
> preventing cores entering deeper idle states), it's not feasible
> solution. Instead we can provide arm,primecell-periphid override in the
> device tree that prevents accessing the device early in the boot.
>

OK, I recently found out that AMBA bus/infrastructure can deal with 
powered off domains even while adding the devices. That makes this patch 
redundant. I had missed it initially as I tested with !CONFIG_PM
option.

So I raised the issue with !CONFIG_PM option[1] and it was suggested to 
make platform select the same[2] as there's no simple way to deal with
that.

Hence I will drop this patch but will post patch to select PM from
ARCH_VEXPRESS to ensure we always have it enabled to deal with this
platform issue.

-- 
Regards,
Sudeep


[1] http://marc.info/?l=linux-pm&m=146607608629880&w=2
[2] http://marc.info/?l=linux-pm&m=146608125731479&w=2
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
