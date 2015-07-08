From: Bill Pringlemeir <bpringle-rieW9WUcm8FFJ04o6PK0Fg@public.gmane.org>
Subject: Re: [PATCH v6 4/6] ARM: vf610: enable NAND Flash Controller
Date: Wed, 8 Jul 2015 10:32:54 -0400
Message-ID: <BLU436-SMTP255283C042EDEF59D9BA0CFB8910@phx.gbl>
References: <1434668319-6651-1-git-send-email-stefan@agner.ch>
	<1434668319-6651-5-git-send-email-stefan@agner.ch>
	<20150708093801.GG28488@tiger>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150708093801.GG28488@tiger> (Shawn Guo's message of "Wed, 8
	Jul 2015 17:38:01 +0800")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marb-Z4QKGCRq86k@public.gmane.org, aaron-yuhzfaV+M/Wz3Dx2OeFgIA@public.gmane.org, bpringlemeir-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On  8 Jul 2015, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org wrote:
> On Fri, Jun 19, 2015 at 12:58:37AM +0200, Stefan Agner wrote:
>> Enable the NAND Flash Controller driver which is part of the Vybrid
>> SoC by default.
>>
>> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
>> ---
>> arch/arm/mach-imx/Kconfig | 1 +
>> 1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
>> index 3a3d3e9..9358135 100644
>> --- a/arch/arm/mach-imx/Kconfig
>> +++ b/arch/arm/mach-imx/Kconfig
>>>> -589,6 +589,7 @@ config SOC_VF610
>> 	select PINCTRL_VF610
>> 	select PL310_ERRATA_769419 if CACHE_L2X0
>> 	select SMP_ON_UP if SMP
>> +	select HAVE_NAND_VF610_NFC

> I'm not sure about the benefit of having this option, except we have
> to have this additional architecture patch.

For other SOC, like the PowerPC or ColdFire CPUs with this controller,
it was a way to mark the controller as populated.  Otherwise, the
Kconfig entry to select the controller will pop up for everybody.

Is there a better way to do this?


>>
>> 	help
>> 	  This enables support for Freescale Vybrid VF610 processor.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
