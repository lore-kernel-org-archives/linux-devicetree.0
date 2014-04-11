From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [PATCH v4 2/3] rtc: Add APM X-Gene SoC RTC driver
Date: Thu, 10 Apr 2014 21:22:43 -0700
Message-ID: <CAPw-ZTns1EOT0inn0hq0Xh+CdjMkxhOkvL+_BnRThnm7HQC=BQ@mail.gmail.com>
References: <1397155678-26607-1-git-send-email-lho@apm.com>
	<1397155678-26607-2-git-send-email-lho@apm.com>
	<1397155678-26607-3-git-send-email-lho@apm.com>
	<20140410224244.GH6518@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140410224244.GH6518-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

>
>> +     if (device_may_wakeup(&pdev->dev)) {
>> +             if (!enable_irq_wake(irq))
>> +                     pdata->irq_wake = 1;
>> +     } else {
>> +             pdata->irq_enabled = xgene_rtc_alarm_irq_enabled(dev);
>> +             xgene_rtc_alarm_irq_enable(dev, 0);
>> +             clk_disable(pdata->clk);
>> +     }
>> +     clk_unprepare(pdata->clk);
>
> This will unconditionally unprepare the clock even if it wasn't disabled
> which looks like a bug - I would have expected the disable to be a
> clk_disable_unprepare() instead?  Similarly for the resume path.
>

I was modeled after driver rtc-coh901331.c. It seems like all I need
here is to call clk_disable_unprepare() instead clk_disable for
suspend. For resume, call clk_prepare_disable() instead clk_enable().
No need to split them up. Am I correct?

Given that Andrew Morton applied v2, should I post an patch against v2
going forward?

-Loc
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
