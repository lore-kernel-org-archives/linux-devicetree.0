From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 2/2] rtc: Add Amlogic Virtual Wake RTC
Date: Thu, 20 Jun 2019 23:17:36 +0200
Message-ID: <20190620211736.GF23549@piout.net>
References: <20190607194343.18359-1-khilman@kernel.org>
 <20190607194343.18359-2-khilman@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190607194343.18359-2-khilman@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>
Cc: linux-rtc@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
List-Id: devicetree@vger.kernel.org

Hello Kevin,

On 07/06/2019 12:43:43-0700, Kevin Hilman wrote:
> +static int meson_vrtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	unsigned long local_time;
> +	struct timespec64 time;
> +
> +	ktime_get_raw_ts64(&time);
> +	local_time = time.tv_sec - (sys_tz.tz_minuteswest * 60);
The RTC is supposed to be set to UTC so the TZ adjustment is not
necessary.

> +	rtc_time_to_tm(local_time, tm);
> +

Please use the 64 bit version.

> +	return 0;
> +}
> +
> +static void meson_vrtc_set_wakeup_time(struct meson_vrtc_data *vrtc,
> +				       unsigned long time)
> +{
> +	writel_relaxed(time, vrtc->io_alarm);
> +
> +	dev_dbg(&vrtc->pdev->dev, "set_wakeup_time: %lu\n", time);
> +}
> +
> +static int meson_vrtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
> +{
> +	struct meson_vrtc_data *vrtc = dev_get_drvdata(dev);
> +	struct timespec64 time;
> +	unsigned long local_time;
> +	unsigned long alarm_secs;
> +	int ret;
> +
> +	if (alarm->enabled) {
> +		ret = rtc_tm_to_time(&alarm->time, &alarm_secs);
> +		if (ret)
> +			return ret;
> +

Use the 64bit version which makes it clear that it never fails (checking
ret is useless).

> +		ktime_get_raw_ts64(&time);
> +		local_time = time.tv_sec - (sys_tz.tz_minuteswest * 60);
> +
> +		vrtc->alarm_time = alarm_secs;
> +
> +		if (alarm_secs >= local_time) {

This is already ensured by the core so no need to check here.

> +			alarm_secs = alarm_secs - local_time;
> +
> +			meson_vrtc_set_wakeup_time(vrtc, alarm_secs);
> +
> +			pr_debug("system will wakeup %lus later\n", alarm_secs);
> +		}
> +	} else {
> +		vrtc->alarm_time = 0;
> +		meson_vrtc_set_wakeup_time(vrtc, 0);
> +	}
> +
> +	return 0;
> +}
> +
> +static int meson_vrtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
> +{
> +	struct meson_vrtc_data *vrtc = dev_get_drvdata(dev);
> +
> +	if (!vrtc->alarm_time) {

I think this test is inverted.

> +		alm->enabled = true;
> +
> +		rtc_time_to_tm(vrtc->alarm_time, &alm->time);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct rtc_class_ops meson_vrtc_ops = {
> +	.read_time = meson_vrtc_read_time,
> +	.set_alarm = meson_vrtc_set_alarm,
> +	.read_alarm = meson_vrtc_read_alarm,
> +};
> +
> +static int meson_vrtc_probe(struct platform_device *pdev)
> +{
> +	struct meson_vrtc_data *vrtc;
> +	struct resource *res;
> +
> +	vrtc = devm_kzalloc(&pdev->dev, sizeof(*vrtc), GFP_KERNEL);
> +	if (!vrtc)
> +		return -ENOMEM;
> +
> +	vrtc->pdev = pdev;
> +
> +	/* Alarm registers */
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	vrtc->io_alarm = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(vrtc->io_alarm))
> +		return PTR_ERR(vrtc->io_alarm);
> +
> +	device_init_wakeup(&pdev->dev, 1);
> +
> +	platform_set_drvdata(pdev, vrtc);
> +
> +	vrtc->rtc = devm_rtc_device_register(&pdev->dev, "meson-vrtc",
> +					     &meson_vrtc_ops, THIS_MODULE);
> +	if (IS_ERR(vrtc->rtc))
> +		return PTR_ERR(vrtc->rtc);
> +

Please use devm_rtc_allocate_device and rtc_register_device. This
doesn't help much but my plan is to get rid of devm_rtc_device_register.

I suppose you don't get any interrupt for the alarm?


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
