From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/2] rtc: add rtc-lpc24xx driver
Date: Mon, 13 Jul 2015 22:18:08 +0200
Message-ID: <CAGhQ9VyJw6+6ALYtw_Lu3OO4SMdT1hJxB1+aZHtOfC-0OU4Bnw@mail.gmail.com>
References: <1436635730-15617-1-git-send-email-manabian@gmail.com>
	<1436635730-15617-2-git-send-email-manabian@gmail.com>
	<20150713173739.GF25028@jcartwri.amer.corp.natinst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150713173739.GF25028-ew3lsbMjNqt5wtABiV/Xjqyly8cj88Ttqxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org>
Cc: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 13 July 2015 at 19:37, Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org> wrote:
> On Sat, Jul 11, 2015 at 07:28:49PM +0200, Joachim Eastwood wrote:
>> Add driver for the RTC found on NXP LPC178x/18xx/408x/43xx devices.
>> The RTC provides calendar and clock functionality together with
>> alarm interrupt support.
>>
>> Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
> [..]
>> +static int lpc24xx_rtc_remove(struct platform_device *pdev)
>> +{
>> +     struct lpc24xx_rtc *rtc = platform_get_drvdata(pdev);
>> +
>> +     /* Ensure all interrupt sources are masked */
>> +     rtc_writel(rtc, LPC24XX_AMR, LPC24XX_ALARM_DISABLE);
>> +     rtc_writel(rtc, LPC24XX_CIIR, 0);
>> +
>> +     rtc_writel(rtc, LPC24XX_CCR, LPC178X_CCALEN);
>> +
>> +     clk_disable_unprepare(rtc->clk_rtc);
>> +     clk_disable_unprepare(rtc->clk_reg);
>> +
>> +     return 0;
>> +}
>> +
>> +static const struct of_device_id lpc24xx_rtc_match[] = {
>> +     { .compatible = "nxp,lpc1788-rtc" },
>> +     { }
>> +};
>> +MODULE_DEVICE_TABLE(of, lpc24xx_rtc_match);
>> +
>> +static struct platform_driver lpc24xx_rtc_driver = {
>> +     .probe  = lpc24xx_rtc_probe,
>> +     .remove = lpc24xx_rtc_remove,
>> +     .driver = {
>> +             .name = "lpc24xx-rtc",
>> +             .of_match_table = lpc24xx_rtc_match,
>> +     },
>> +};
>> +module_platform_driver(lpc24xx_rtc_driver);
>> +
>> +MODULE_AUTHOR("Kevin Wells <wellsk40-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org");
>
> Missing closing '>'.

Ops. Well spotted.

> Otherwise,
>
> Reviewed-by: Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org>

Thanks, Josh.

I'll wait and see if Alexandre has any other comments before sending a
new version.


regards,
Joachim Eastwood
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
