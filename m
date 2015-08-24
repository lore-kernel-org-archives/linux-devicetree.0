From: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH-v6 0/6] mfd: 88pm800: Add Device tree support
Date: Mon, 24 Aug 2015 12:13:34 +0530
Message-ID: <55DABD16.8080309@linaro.org>
References: <1436358392-15449-1-git-send-email-vaibhav.hiremath@linaro.org> <55A40A32.8060901@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55A40A32.8060901-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Tuesday 14 July 2015 12:27 AM, Vaibhav Hiremath wrote:
>
>
> On Wednesday 08 July 2015 05:56 PM, Vaibhav Hiremath wrote:
>> This patch-series adds support for Device tree to 88PM800 mfd driver.
>> It also sets default configuration of irq clear method if board file
>> doesn't exist.
>>
>> Testing::
>>   - Boot tested on PXA1928 based platform.
>>   - probe of mfd, rtc and regulator function passing successfully.
>>   - Basic read operations on registers
>>   - irq clear configuration
>>
>> V5 => V6
>> =======
>
> I hope this will be queued for 4.2
>


Lee,

This patch-series is pending since long time, reviewed and acked.
Request to queue it up for next merge window.

Thanks,
Vaibhav
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
