From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [PATCH v8 0/4] edac: Add APM X-Gene SoC memory controller EDAC driver
Date: Wed, 6 May 2015 11:17:21 -0700
Message-ID: <CAPw-ZTmC-KpOxEuZsL6BNsf44st_L356uY9y+ssYbxud8zeyZg@mail.gmail.com>
References: <1430884947-16787-1-git-send-email-lho@apm.com>
	<20150506084143.GA22949@pd.tnic>
	<CAPw-ZT=LepJr2Smjy81yhcTANdMRw99x1vR9rMoYsnHW_P3HPg@mail.gmail.com>
	<20150506171242.GG22949@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150506171242.GG22949-fF5Pk5pvG8Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Cc: Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

>> It was discussed with Rob already in previous email. As we don't touch
>> the shared status registers besides reading status, it will just
>> register as shared interrupt.
>
> I don't see why that justifies the addition of an
> edac_xgene-<functional_unit> compilation unit and thus an .ko module per
> shared interrupt handler.

If you are concern about multiple module files, I can either combine
them as previous version or combine the multiple ko to an single ko
file.

-Loc
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
