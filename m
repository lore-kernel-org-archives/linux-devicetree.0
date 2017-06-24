From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] rtc: brcmstb-waketimer: Add Broadcom STB wake-timer
Date: Sat, 24 Jun 2017 20:59:43 +0200
Message-ID: <20170624185942.vq656pjxbqnqdhll@piout.net>
References: <20170615195904.12653-1-f.fainelli@gmail.com>
 <20170615195904.12653-3-f.fainelli@gmail.com>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <rtc-linux+bncBCKYNX7Y3IMBBH7NXLFAKGQEX5N4YSI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170615195904.12653-3-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

This seems mostly good.

On 15/06/2017 at 12:59:04 -0700, Florian Fainelli wrote:
> +static void wktmr_read(struct brcmstb_waketmr *timer,
> +		       struct wktmr_time *t)
> +{
> +	u32 tmp;
> +

To be sure, is this IP always 32bit, even on 64bit platforms?

> +	do {
> +		t->sec = readl_relaxed(timer->base + BRCMSTB_WKTMR_COUNTER);
> +		tmp = readl_relaxed(timer->base + BRCMSTB_WKTMR_PRESCALER_VAL);
> +	} while (tmp >= timer->rate);
> +
> +	t->pre = timer->rate - tmp;
> +}
> +

[...]

> +static int brcmstb_waketmr_settime(struct device *dev,
> +				   struct rtc_time *tm)
> +{
> +	struct brcmstb_waketmr *timer = dev_get_drvdata(dev);
> +	unsigned long sec;
> +	int ret;
> +
> +	ret = rtc_valid_tm(tm);
> +	if (ret)
> +		return ret;
> +

There is no way this function can be called without a valid tm. The only
caller checks before calling.

> +	rtc_tm_to_time(tm, &sec);
> +
> +	dev_dbg(dev, "%s: sec=%ld\n", __func__, sec);
> +	writel_relaxed(sec, timer->base + BRCMSTB_WKTMR_COUNTER);
> +
> +	return 0;
> +}
> +
> +static int brcmstb_waketmr_getalarm(struct device *dev,
> +				    struct rtc_wkalrm *alarm)
> +{
> +	struct brcmstb_waketmr *timer = dev_get_drvdata(dev);
> +	unsigned long sec;
> +	u32 reg;
> +
> +	sec = readl_relaxed(timer->base + BRCMSTB_WKTMR_ALARM);
> +	if (sec == 0) {
> +		/* Alarm is disabled */
> +		alarm->enabled = 0;
> +		alarm->time.tm_mon = -1;
> +		alarm->time.tm_mday = -1;
> +		alarm->time.tm_year = -1;
> +		alarm->time.tm_hour = -1;
> +		alarm->time.tm_min = -1;
> +		alarm->time.tm_sec = -1;

This is not needed since d68778b80dd7

> +		dev_dbg(dev, "%s: alarm is disabled\n", __func__);
> +	} else {
> +		/* Alarm is enabled */
> +		alarm->enabled = 1;
> +		rtc_time_to_tm(sec, &alarm->time);
> +		dev_dbg(dev, "%s: alarm is enabled\n", __func__);
> +	}
> +
> +	reg = readl_relaxed(timer->base + BRCMSTB_WKTMR_EVENT);
> +	alarm->pending = !!(reg & 1);
> +	dev_dbg(dev, "%s: alarm pending=%d\n", __func__, alarm->pending);
> +
> +	return 0;
> +}

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
