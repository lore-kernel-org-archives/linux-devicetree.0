From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [STLinux Kernel] [PATCH v3 7/8] rtc: st: add new driver for ST's
 LPC RTC
Date: Mon, 23 Feb 2015 10:12:23 +0000
Message-ID: <20150223101223.GA14142@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1424260154-12868-1-git-send-email-lee.jones@linaro.org>
 <1424260154-12868-8-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1424260154-12868-8-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lee,

On Wed, 18 Feb 2015, Lee Jones wrote:

> ST's Low Power Controller (LPC) controls two devices; watchdog and RTC.
> Only one of the devices can be used at any one time.  This is enforced
> by the correlating MFD driver.  This portion of the driver-set controls
> the Real Time Clock.

<snip>

> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&rtc->lock, flags);
> +
> +	writel(1, rtc->ioaddr + LPC_WDT_OFF);
> +
> +	writel(msb, rtc->ioaddr + LPC_LPA_MSB_OFF);
> +	writel(lsb, rtc->ioaddr + LPC_LPA_LSB_OFF);
> +	writel(1, rtc->ioaddr + LPC_LPA_START_OFF);
> +
> +	writel(0, rtc->ioaddr + LPC_WDT_OFF);

I think all the writel IO accessors in this driver can be replaced
with the *_relaxed variant. This will avoid the overhead of taking a
spinlock in the l2 outer cache part of writel.

<snip>

> +#ifdef CONFIG_PM_SLEEP
> +static int st_rtc_suspend(struct device *dev)
> +{
> +	struct st_rtc *rtc = dev_get_drvdata(dev);
> +
> +	if (device_may_wakeup(dev))
> +		return 0;
> +
> +	writel(1, rtc->ioaddr + LPC_WDT_OFF);
> +	writel(0, rtc->ioaddr + LPC_LPA_START_OFF);
> +	writel(0, rtc->ioaddr + LPC_WDT_OFF);

Is there a reason for not disabling the IP clock in suspend / resume functions?

regards,

Peter.
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
