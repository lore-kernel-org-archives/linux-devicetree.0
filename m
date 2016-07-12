From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 1/4] rtc: support for amlogic meson rtc
Date: Tue, 12 Jul 2016 19:22:35 +0200
Message-ID: <20160712172235.GU22202@piout.net>
References: <1467748122-14833-1-git-send-email-ben.dooks@codethink.co.uk>
 <1467748122-14833-3-git-send-email-ben.dooks@codethink.co.uk>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBCKYNX7Y3IMBBXGOSS6AKGQEXOMHGLQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1467748122-14833-3-git-send-email-ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Cc: linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Very few comments below

On 05/07/2016 at 20:48:41 +0100, Ben Dooks wrote :
> +/* registers accessed from cpu bus */
> +#define RTC_REG(x)		((x) * 4)	/* rtc registers 0-4 */
> +
> +#define LINE_SDI		(1 << 2)
> +#define LINE_SEN		(1 << 1)
> +#define LINE_SCLK		(1 << 0)
> +

Maybe use BIT() here.

> +/* RTC interface layer functions */
> +
> +static int meson_rtc_gettime(struct device *dev, struct rtc_time *tm)
> +{
> +	struct meson_rtc *rtc = dev_get_drvdata(dev);
> +	int ret;
> +	u32 time;
> +
> +	mutex_lock(&rtc->lock);
> +
> +	ret = meson_rtc_read(rtc, RTC_COUNTER, &time);
> +	if (!ret) {
> +		rtc_time_to_tm(time, tm);

Can you use the 64bit version?

> +		dev_dbg(dev, "read time %lu\n", (unsigned long)time);
> +	}
> +
> +	mutex_unlock(&rtc->lock);
> +	return ret;
> +}
> +
> +static int meson_rtc_settime(struct device *dev, struct rtc_time *tm)
> +{
> +	struct meson_rtc *rtc = dev_get_drvdata(dev);
> +	unsigned long time;
> +	int ret;
> +
> +	mutex_lock(&rtc->lock);
> +
> +	rtc_tm_to_time(tm, &time);

Ditto.


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
