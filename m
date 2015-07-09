From: Zhi Li <lznuaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/7] ARM: imx: add i.mx6ul msl support
Date: Thu, 9 Jul 2015 13:41:29 -0500
Message-ID: <CAHrpEqTA4LeTdMFCb1jzbzDrUT2oE61uM7bmhKFgM7TKJmaDjA@mail.gmail.com>
References: <1436462204-32654-1-git-send-email-Frank.Li@freescale.com>
	<1436462204-32654-2-git-send-email-Frank.Li@freescale.com>
	<20150709183917.GK12326@tarshish>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150709183917.GK12326@tarshish>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Cc: "Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 9, 2015 at 1:39 PM, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org> wrote:
> Hi Frank,
>
> On Fri, Jul 10, 2015 at 01:16:38AM +0800, Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org wrote:
>> +DT_MACHINE_START(IMX7D, "Freescale i.MX6 Ultralite (Device Tree)")
>
> IMX7D?

Good capture. I will update it.
Strange. why system can boot?

>
>> +     .init_irq       = imx6ul_init_irq,
>> +     .init_machine   = imx6ul_init_machine,
>> +     .dt_compat      = imx6ul_dt_compat,
>> +MACHINE_END
>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org - tel: +972.2.679.5364, http://www.tkos.co.il -
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
