From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] bus: add Broadcom GISB bus arbiter timeout/error handler
Date: Wed, 14 May 2014 12:26:49 -0700
Message-ID: <CAGVrzcZK0P8b_8B9wgfh180KWE1+1KN-dypoj8v4VGuZ8R-hew@mail.gmail.com>
References: <1400094649-11193-1-git-send-email-f.fainelli@gmail.com>
 <1400094649-11193-3-git-send-email-f.fainelli@gmail.com> <5373C2EB.8020806@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5373C2EB.8020806-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "open list:DOCUMENTATION <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list:OPEN
	FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2014-05-14 12:24 GMT-07:00 Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>:
> On 05/14/2014 12:10 PM, Florian Fainelli wrote:
>> This patch adds support for the Broadcom GISB arbiter bus timeout/error
>> handler. GISB is a proprietary bus used by Broadcom Set Top Box
>> System-on-a-chip devices (BCM7xxx) which allows multiple masters and
>> clients to be interfaced with each other.
>>
>> The bus arbiter offers support for generating two interrupts towards the
>> host CPU, thus allowing us to "catch" clock gated masters, or masters
>> being volontarily blocked for powersaving purposes, or do general system
>> troubleshooting.
>>
>> We also register a hook with the ARM fault exception handling to allow
>> printing a more informative message than "imprecise external abort at
>> 0x00000000" for instance.
>>
>> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/bus/Kconfig        |  11 +-
>>  drivers/bus/Makefile       |   1 +
>>  drivers/bus/brcmstb_gisb.c | 289 +++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 300 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/bus/brcmstb_gisb.c
>>
>> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
>> index 552373c4e362..985db51c0b11 100644
>> --- a/drivers/bus/Kconfig
>> +++ b/drivers/bus/Kconfig
>> @@ -40,5 +40,14 @@ config ARM_CCI
>>       depends on ARM
>>       help
>>         Driver supporting the CCI cache coherent interconnect for ARM
>> -       platforms.
>> +       kplatforms.
>
> Is that a typo?  if not, what are kplatforms?

This is indeed a typo.
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
