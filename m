From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/3] media: rc: add driver for Amlogic Meson IR remote receiver
Date: Wed, 26 Nov 2014 16:11:35 +0100
Message-ID: <CAOQ7t2ZTLM6=-V-m5RX6fhY4-Jc-bMkmXspXUYHpCgyE-ui4iQ@mail.gmail.com>
References: <1416342155-26820-1-git-send-email-b.galvani@gmail.com>
	<1416342155-26820-3-git-send-email-b.galvani@gmail.com>
	<20141126130451.5789e7f9@recife.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141126130451.5789e7f9-+RedX5hVuTR+urZeOPWqwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean Young <sean-hENCXIMQXOg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jerry Cao <jerry.cao-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, Victor Wan <victor.wan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 26, 2014 at 4:04 PM, Mauro Carvalho Chehab
<mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org> wrote:
> Em Tue, 18 Nov 2014 21:22:34 +0100
> Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> escreveu:
>
>> Amlogic Meson SoCs include a infrared remote control receiver that can
>> operate in two modes: "NEC" mode in which the hardware decodes frames
>> using the NEC IR protocol, and "general" mode in which the receiver
>> simply reports the duration of pulses and spaces for software
>> decoding.
>>
>> This is a driver for the IR receiver that implements software decoding
>> of received frames.
>>
>> Signed-off-by: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  MAINTAINERS                 |   1 +
>>  drivers/media/rc/Kconfig    |  11 +++
>>  drivers/media/rc/Makefile   |   1 +
>>  drivers/media/rc/meson-ir.c | 216 ++++++++++++++++++++++++++++++++++++++++++++
>>  4 files changed, 229 insertions(+)
>>  create mode 100644 drivers/media/rc/meson-ir.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 0662378..f1bc045 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -850,6 +850,7 @@ ARM/Amlogic MesonX SoC support
>>  M:   Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
>>  L:   linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated for non-subscribers)
>>  S:   Maintained
>> +F:   drivers/media/rc/meson-ir.c
>>  N:   meson[x68]
>
> Hmm... you're putting this driver at Carlo's maintenance shoulders.
>
> I need his ack in order to apply this patch.

Acked-by: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>


-- 
Carlo Caione
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
