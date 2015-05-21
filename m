From: Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 6/7] Watchdog: introduce ARM SBSA watchdog driver
Date: Thu, 21 May 2015 10:42:12 -0500
Message-ID: <555DFCD4.3040701@codeaurora.org>
References: <=fu.wei@linaro.org> <1432197156-16947-1-git-send-email-fu.wei@linaro.org> <1432197156-16947-7-git-send-email-fu.wei@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432197156-16947-7-git-send-email-fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org, linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, leo.duran-5C7GfCeVMHo@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/21/2015 03:32 AM, fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org wrote:

> +static void reload_timeout_to_wcv(struct watchdog_device *wdd)
> +{
> +	struct sbsa_gwdt *gwdt = to_sbsa_gwdt(wdd);
> +	u64 wcv;
> +
> +	wcv = arch_counter_get_cntvct() +
> +		(u64)(wdd->timeout - wdd->pretimeout) * gwdt->clk;
> +
> +	sbsa_gwdt_set_wcv(wdd, wcv);
> +}

...

> +static int sbsa_gwdt_set_timeout(struct watchdog_device *wdd,
> +				 unsigned int timeout)
> +{
> +	wdd->timeout = timeout;
> +
> +	return 0;
> +}

...

> +static irqreturn_t sbsa_gwdt_interrupt(int irq, void *dev_id)
> +{
> +	struct sbsa_gwdt *gwdt = (struct sbsa_gwdt *)dev_id;
> +	struct watchdog_device *wdd = &gwdt->wdd;
> +	u32 status;
> +
> +	status = sbsa_gwdt_cf_read(SBSA_GWDT_WCS, wdd);
> +
> +	if (status & SBSA_GWDT_WCS_WS0)
> +		panic("SBSA Watchdog pre-timeout");
> +
> +	return IRQ_HANDLED;
> +}

There's one thing I don't understand about your driver.  The 'timeout' 
value from the kernel is supposed to to be the number of seconds until 
the system reboots.  You are programming the WCV with that value, which 
means that the WS0 interrupt will fire when the timeout expires the 
first time.  However, you don't reboot the system during this interrupt. 
  The "panic" will cause the system to halt, but not reboot.  Instead, 
it will just sit there.  You're waiting for the WS1 timeout for the 
system to reboot, but this is not a clean reboot, and it occurs at 
2*timeout seconds.

That's why I like my driver better.  It doesn't have any of this 
pretimeout stuff, and when the timeout expires during the WS0 interrupt, 
it calls emergency_restart() which reboots the system properly.  The WS1 
hard reset is used as a "backup" reset in case emergency_restart() fails.

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
