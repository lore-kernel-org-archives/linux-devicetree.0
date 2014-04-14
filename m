From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [rtc-linux] [PATCH] rtc: Fix suspend/resume for APM X-Gene SoC
 RTC driver
Date: Mon, 14 Apr 2014 10:52:41 -0700
Message-ID: <CAPw-ZTn1qjA+1n62HhwphnSCTuqDMEE+adYeJ_L9c8n-Yqmtog@mail.gmail.com>
References: <1397259218-20494-1-git-send-email-lho@apm.com>
	<20140414172134.GB25182@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140414172134.GB25182-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

>> -     clk_prepare_enable(pdata->clk);
>> +     ret = clk_prepare_enable(pdata->clk);
>> +     if (ret)
>> +             return ret;
>>
>>       /* Turn on the clock and the crystal */
>>       writel(RTC_CCR_EN, pdata->csr_base + RTC_CCR);
>>
>> -     device_init_wakeup(&pdev->dev, 1);
>> +     ret = device_init_wakeup(&pdev->dev, 1);
>> +     if (ret)
>> +             return ret;
>>
> If the init fails you should unprepare (though I suspect the same issue
> applies to other things in the probe function anyway).  If you fix that
> then feel free to add:
>

Okay... This is the only place missed. I don't see issue with other
locations. I will post another version soon.

-Loc
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
