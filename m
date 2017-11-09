From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/2] rtc: sprd: Add Spreadtrum RTC driver
Date: Thu, 9 Nov 2017 02:26:53 +0100
Message-ID: <20171109012653.32zkqyh5p4jqhftr@piout.net>
References: <c65b61e5e37cb43214973cb3e479ce06c4a73395.1510132279.git.baolin.wang@spreadtrum.com>
 <6482283a3ae8c6ec35d0a7a078420151a69b8aca.1510132279.git.baolin.wang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <6482283a3ae8c6ec35d0a7a078420151a69b8aca.1510132279.git.baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Cc: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 08/11/2017 at 17:16:15 +0800, Baolin Wang wrote:
> +static int sprd_rtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct sprd_rtc *rtc = dev_get_drvdata(dev);
> +	time64_t secs;
> +	int ret;
> +

I would have expected a check for SPRD_RTC_POWER_RESET_FLAG here.


> +	ret = sprd_rtc_get_secs(rtc, SPRD_RTC_TIME, &secs);
> +	if (ret)
> +		return ret;
> +
> +	rtc_time64_to_tm(secs, tm);
> +	return rtc_valid_tm(tm);
> +}
> +
> +static int sprd_rtc_set_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct sprd_rtc *rtc = dev_get_drvdata(dev);
> +	time64_t secs = rtc_tm_to_time64(tm);
> +

And you need to reset SPRD_RTC_POWER_RESET_FLAG here

> +	return sprd_rtc_set_secs(rtc, SPRD_RTC_TIME, secs);
> +}
> +
-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
