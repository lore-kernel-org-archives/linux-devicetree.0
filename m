From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH v3 3/4] ARM: dts: UniPhier: add support for UniPhier SoCs
 and boards
Date: Tue, 21 Apr 2015 16:23:12 +0900
Message-ID: <CAK7LNAQoS4vbU_ZEsf=F8Sy8be8xn8N2taTVkEeJ3ROBQmar=g@mail.gmail.com>
References: <1429285698-11829-1-git-send-email-yamada.masahiro@socionext.com>
	<1429285698-11829-4-git-send-email-yamada.masahiro@socionext.com>
	<2809229.iRV9NgGGKe@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2809229.iRV9NgGGKe@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,


2015-04-18 0:56 GMT+09:00 Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>:
> On Saturday 18 April 2015 00:48:17 Masahiro Yamada wrote:
>> +
>> +               smp_syscon@59801208 {
>> +                       compatible = "socionext,uniphier-smp-reg", "syscon";
>> +                       reg = <0x59801208 0x4>;
>> +               };
>> +
>>
>
> Using syscon here is a good idea, but please name the register area
> according to what it is called in the data sheet, not according to how
> it is used in Linux, and list all the registers that belong in this
> device. It's quite possible that another driver needs a second
> register from the same syscon.
>
> E.g. if there is a device called a foo controller, make this device
>
>         foo-controller@0x59800000 {
>                 compatible = "socionext,uniphier-foo-controller", "syscon";
>                 reg = <0x59800000 0x4000>;
>         };
>
> then hardcode the 0x1208 offset in the smp code, or add it as an
> argument to the property containing the phandle.
>

OK, I updated this part in v4.


-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
