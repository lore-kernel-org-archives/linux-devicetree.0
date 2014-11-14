From: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [PATCH V2 4/7] arm64: dts: Add Designware GPIO dts binding to APM
 X-Gene platform
Date: Fri, 14 Nov 2014 11:26:04 -0800
Message-ID: <CAL85gmDYM2V=TCtA5iBazj+k6rfvpd6c2dnqaA2jfifyxeZR_w@mail.gmail.com>
References: <1415924401-3013-1-git-send-email-fkan@apm.com>
	<1415924401-3013-5-git-send-email-fkan@apm.com>
	<1829495.FoDfH1G36W@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1829495.FoDfH1G36W@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, patches <patches-qTEPVZfXA3Y@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 14, 2014 at 7:06 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Thursday 13 November 2014 16:19:58 Feng Kan wrote:
>> +               dwgpio: dwgpio@1c024000 {
>> +                       compatible = "snps,dw-apb-gpio";
>> +                       reg = <0x0 0x1c024000 0x0 0x1000>;
>> +                       reg-io-width = <4>;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>>
>
> Same comment as patch 1: make the node name 'gpio', not 'dwgpio'.

I can make this change.
>
>         Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
