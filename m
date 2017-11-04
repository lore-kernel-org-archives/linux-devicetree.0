From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 2/3] clk: owl: add clock driver for Actions S900 SoC
Date: Sat, 4 Nov 2017 17:30:36 +0800
Message-ID: <25a2e233-f565-8baa-17e2-9c867bbbe9d0@suse.de>
References: <1509479663-8985-1-git-send-email-manivannan.sadhasivam@linaro.org>
 <1509479663-8985-3-git-send-email-manivannan.sadhasivam@linaro.org>
 <7c87aee4-dde4-ab3d-06b0-75f3686ab5dd@suse.de>
 <20171104091949.GB14705@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171104091949.GB14705-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, liuwei-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Am 04.11.2017 um 17:19 schrieb Manivannan Sadhasivam:
>>> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
>>> index c99f363..821c1e1 100644
>>> --- a/drivers/clk/Makefile
>>> +++ b/drivers/clk/Makefile
>>> @@ -75,6 +75,7 @@ endif
>>>  obj-y					+= mvebu/
>>>  obj-$(CONFIG_ARCH_MXS)			+= mxs/
>>>  obj-$(CONFIG_COMMON_CLK_NXP)		+= nxp/
>>> +obj-$(CONFIG_ARCH_ACTIONS)		+= owl/
>>>  obj-$(CONFIG_MACH_PISTACHIO)		+= pistachio/
>>>  obj-$(CONFIG_COMMON_CLK_PXA)		+= pxa/
>>>  obj-$(CONFIG_COMMON_CLK_QCOM)		+= qcom/
>>> diff --git a/drivers/clk/owl/Makefile b/drivers/clk/owl/Makefile
>>> new file mode 100644
>>> index 0000000..dbba0af
>>> --- /dev/null
>>> +++ b/drivers/clk/owl/Makefile
>>> @@ -0,0 +1,2 @@
>>> +obj-y				+= clk.o clk-pll.o clk-factor.o
>>> +obj-$(CONFIG_ARCH_ACTIONS)	+= clk-s900.o
>>
>> $(CONFIG_ARCH_ACTIONS) is superfluous here.
>>
> Okay. Since, we haven't added ARCH_ACTIONS to defconfig yet I intentionally
> made this conditional compilation.
> 
> Would like a suggestion from you on this!

My point was that the ../Makefile already uses $(CONFIG_ARCH_ACTIONS),
so $(CONFIG_ARCH_ACTIONS) can never be n here.

Instead you should probably either use $(CONFIG_ARM64) or better some
new Kconfig option (CONFIG_CLK_OWL_S900?), so that we don't
unnecessarily compile S900 on 32-bit arm and S500 on arm64.

Another point: What about S700? Does it need to duplicate clk-s900.c or
can we share any code between the two?

Cheers,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
