From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [PATCH v2 0/3] edac: Add L3/SoC support to the APM X-Gene SoC
 EDAC driver
Date: Mon, 10 Aug 2015 13:15:49 -0700
Message-ID: <CAPw-ZT=9Eq0yc7tzqJAdCvsQTgRkMmGzNOSXgawBTY0gAijr4Q@mail.gmail.com>
References: <1437808063-17592-1-git-send-email-lho@apm.com>
	<CALdTtnv7P5d0Y6wyKe1SOqXedNhQxMsFZY=m-rxK3zouLcFv-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALdTtnv7P5d0Y6wyKe1SOqXedNhQxMsFZY=m-rxK3zouLcFv-Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dann Frazier <dann.frazier-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, patches <patches-qTEPVZfXA3Y@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Dann,

>> v2:
>> * Update binding documentation accordingly
>> * Change all single bit defines to BIT(x)
>> * Add support for L3 version 1 and 2 HW's
>> * Change to use debug file system for error injection
>> * In L3/SoC instance add function, allocate EDAC context after all
>>   initalization successed
>> * Support raw or detail info for SoC EDAC error reporting
>>
>> v1:
>> * Add L3/SoC support to the APM X-Gene SoC EDAC driver
>
> Loc,
>   I tested 4.2-rc5 on a Mustang board with one DIMM, and it hangs (RCU
> stall) in xgene_edac_mc_irq_ctl() on modprobe. Same board with 2 DIMMs
> boots fine. (U-boot 1.15.12).

I just removed one of the two 16GB DIMM... with 4.2.0-rc1 and some
code clean up in EDAC driver, it boots just fine... I don't believe
the code clean up would affect it. Do you have the dump log?

[root@dhcp-10-76-213-247 ~]# uname -a
Linux dhcp-10-76-213-247 4.2.0-rc1+ #33 SMP PREEMPT Mon Aug 10
13:23:03 MDT 2015 aarch64 GNU/Linux

-Loc
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
