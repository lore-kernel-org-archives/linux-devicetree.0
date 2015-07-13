From: Zhi Li <lznuaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/7] ARM: imx: add i.mx6ul msl support
Date: Mon, 13 Jul 2015 10:19:23 -0500
Message-ID: <CAHrpEqQywcFGk9YjStxuwjDeZjigeymqYiSq4RAaNcdePS9ptg@mail.gmail.com>
References: <1436462204-32654-1-git-send-email-Frank.Li@freescale.com>
	<1436462204-32654-2-git-send-email-Frank.Li@freescale.com>
	<20150709183917.GK12326@tarshish>
	<CAHrpEqTA4LeTdMFCb1jzbzDrUT2oE61uM7bmhKFgM7TKJmaDjA@mail.gmail.com>
	<20150713151455.GC26642@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150713151455.GC26642@tiger>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 13, 2015 at 10:14 AM, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Jul 09, 2015 at 01:41:29PM -0500, Zhi Li wrote:
>> On Thu, Jul 9, 2015 at 1:39 PM, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org> wrote:
>> > Hi Frank,
>> >
>> > On Fri, Jul 10, 2015 at 01:16:38AM +0800, Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org wrote:
>> >> +DT_MACHINE_START(IMX7D, "Freescale i.MX6 Ultralite (Device Tree)")
>> >
>> > IMX7D?
>>
>> Good capture. I will update it.
>> Strange. why system can boot?
>
> As long as the compatible string in imx6ul_dt_compat matches device
> tree, system can boot.

Thank you very much.
I have fixed it at V3.

best regards
Frank Li

>
> Shawn
>
>>
>> >
>> >> +     .init_irq       = imx6ul_init_irq,
>> >> +     .init_machine   = imx6ul_init_machine,
>> >> +     .dt_compat      = imx6ul_dt_compat,
>> >> +MACHINE_END
>> >
>> > baruch
>> >
>> > --
>> >      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
>> > =}------------------------------------------------ooO--U--Ooo------------{=
>> >    - baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org - tel: +972.2.679.5364, http://www.tkos.co.il -
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
