From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v10 4/5] Watchdog: introduce ARM SBSA watchdog driver
Date: Thu, 4 Feb 2016 16:31:02 +0000
Message-ID: <20160204163101.GH17257@arm.com>
References: <1454519923-25230-1-git-send-email-fu.wei@linaro.org>
 <1454519923-25230-5-git-send-email-fu.wei@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1454519923-25230-5-git-send-email-fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, rruigrok-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, dyoung-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, leo.duran-5C7GfCeVMHo@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 04, 2016 at 01:18:42AM +0800, fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org wrote:
> +static int sbsa_gwdt_keepalive(struct watchdog_device *wdd)
> +{
> +	struct sbsa_gwdt *gwdt = to_sbsa_gwdt(wdd);
> +
> +	/*
> +	* Writing WRR for an explicit watchdog refresh.
> +	* You can write anyting(like 0xc0ffee).
> +	*/
> +	writel(0xc0ffee, gwdt->refresh_base + SBSA_GWDT_WRR);
> +
> +	return 0;
> +}

You might get in trouble for that. 0xd09f00d is probably less poisonous.

http://www.petpoisonhelpline.com/poison/caffeine/

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
