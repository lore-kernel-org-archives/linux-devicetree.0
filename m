From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [PATCH 2/3] edac: Add L3/SoC support to the APM X-Gene SoC EDAC driver
Date: Mon, 1 Jun 2015 11:59:35 -0700
Message-ID: <CAPw-ZTnER80fHsByH_WBpo5Fq4OroNyEvJG_TgPm8hcbQNzeKA@mail.gmail.com>
References: <1432937075-16558-1-git-send-email-lho@apm.com>
	<CAPw-ZTm+1hfh4b-opq=HQDek-wc4A4nT=B6DcuyUBWsm8a-ZbQ@mail.gmail.com>
	<20150601183114.GE10169@pd.tnic>
	<2884982.Ci49nmtWmA@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2884982.Ci49nmtWmA@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

>> > You are right... Let me just prints the error code instead. Anyone who
>> > care will have to do post processing.
>>
>> Don't forget about the usability of the driver. If a user has to go
>> open manuals when an error happens, you could just as well report naked
>> register values and have a tool decode them.
>>
>> And this strategy (mcelog) turned out to be a real PITA, IMO.
>>
>> > Future or existent next generation may re-define them.
>>
>> You could easily have a strings array of per-family or per-soc error
>> descriptions. For an example, take a look at drivers/edac/mce_amd.c
>> which decodes MCEs on all relevant AMD machines. This is much more
>> user-friendly than dumping register values which most people have no
>> idea of where to start looking (and they don't really need to).
>
> That would require having a way to identify the SoC with a distinct
> compatible string. I don't know if a name exists for X-Gene that could
> be used here.
>

I am not sure either but will try to figure this out. The issue with
compatible string is the requirement to have FW go and patch it up. We
don't have multiple DT's for each minor version of the chip.

-Loc
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
