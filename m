From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/2] rtc: rtc-pic32: Add PIC32 real time clock driver
Date: Wed, 24 Feb 2016 23:25:55 +0100
Message-ID: <20160224222555.GA12073@piout.net>
References: <1455905390-3491-2-git-send-email-joshua.henderson@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455905390-3491-2-git-send-email-joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 19/02/2016 at 11:09:45 -0700, Joshua Henderson wrote :
> +static int pic32_rtc_gettime(struct device *dev, struct rtc_time *rtc_tm)
> +{
> +	struct pic32_rtc_dev *pdata = dev_get_drvdata(dev);
> +	void __iomem *base = pdata->reg_base;
> +	unsigned int tries = 0;
> +
> +	clk_enable(pdata->clk);
> +
> +	do {
> +		rtc_tm->tm_hour = readb(base + PIC32_RTCHOUR);
> +		rtc_tm->tm_min = readb(base + PIC32_RTCMIN);
> +		rtc_tm->tm_mon  = readb(base + PIC32_RTCMON);
> +		rtc_tm->tm_mday = readb(base + PIC32_RTCDAY);
> +		rtc_tm->tm_year = readb(base + PIC32_RTCYEAR);
> +		rtc_tm->tm_sec  = readb(base + PIC32_RTCSEC);
> +
> +		/*
> +		 * The only way to work out whether the system was mid-update
> +		 * when we read it is to check the second counter, and if it
> +		 * is zero, then we re-try the entire read.
> +		 */
> +		tries = 1;
> +	} while (rtc_tm->tm_sec == 0 && tries < 2);
> +

This doesn't seem right. It will wait up to a second as tries will
always be less than 2, this is probably not what you want.

> +	rtc_tm->tm_sec = bcd2bin(rtc_tm->tm_sec);
> +	rtc_tm->tm_min = bcd2bin(rtc_tm->tm_min);
> +	rtc_tm->tm_hour = bcd2bin(rtc_tm->tm_hour);
> +	rtc_tm->tm_mday = bcd2bin(rtc_tm->tm_mday);
> +	rtc_tm->tm_mon = bcd2bin(rtc_tm->tm_mon) - 1;
> +	rtc_tm->tm_year = bcd2bin(rtc_tm->tm_year);
> +
> +	rtc_tm->tm_year += 100;
> +
> +	dev_dbg(dev, "read time %04d.%02d.%02d %02d:%02d:%02d\n",
> +		1900 + rtc_tm->tm_year, rtc_tm->tm_mon, rtc_tm->tm_mday,
> +		rtc_tm->tm_hour, rtc_tm->tm_min, rtc_tm->tm_sec);
> +
> +	clk_disable(pdata->clk);
> +	return rtc_valid_tm(rtc_tm);
> +}
> +

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
