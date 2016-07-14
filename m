From: Tai Tri Nguyen <ttnguyen-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [PATCH v9 3/4] perf: xgene: Add APM X-Gene SoC Performance
 Monitoring Unit driver
Date: Thu, 14 Jul 2016 11:05:48 -0700
Message-ID: <CACgAJHw7UMFKY=j8UBKUi=hNHfyzVoNMr_A5qOahhbgM+14KBQ@mail.gmail.com>
References: <1468517266-1642-1-git-send-email-ttnguyen@apm.com>
 <1468517266-1642-4-git-send-email-ttnguyen@apm.com> <1468518428.8745.43.camel@perches.com>
 <CACgAJHwzWG_6iWG4OcL3v5QcUF892DwBcJxayqbH4f2kd7=kQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACgAJHwzWG_6iWG4OcL3v5QcUF892DwBcJxayqbH4f2kd7=kQQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, catalin.marinas-5wv7dgnIgG8@public.gmane.org, Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, Duc Dang <dhdang-qTEPVZfXA3Y@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, patches <patches-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Joe,

On Thu, Jul 14, 2016 at 10:54 AM, Tai Tri Nguyen <ttnguyen-qTEPVZfXA3Y@public.gmane.org> wrote:
> Hi Joe,
>
> On Thu, Jul 14, 2016 at 10:47 AM, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org> wrote:
>> On Thu, 2016-07-14 at 10:27 -0700, Tai Nguyen wrote:
>>> This patch adds a driver for the SoC-wide (AKA uncore) PMU hardware
>>> found in APM X-Gene SoCs.
>>
>> trivia:
>>
>>> diff --git a/drivers/perf/xgene_pmu.c b/drivers/perf/xgene_pmu.c
>> []
>>> +struct xgene_pmu_dev_ctx {
>>> +     char *name;
>>> +     struct list_head next;
>>> +     struct xgene_pmu_dev *pmu_dev;
>>> +     struct hw_pmu_info inf;
>>> +};
>>
>> Probably better to use something like
>>         char    name[20];
>> as the kasprintf can fail and this doesn't
>> seem to be freed anywhere.
>
> Okay. I'll fix it shortly.
>

I take it back.
I refer many other drivers using kasprintf and they do the same way I do.
Can you please check it again?

Thanks,
-- 
Tai
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
