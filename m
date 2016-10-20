From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: uniphier: add CPU clocks and OPP
 tables for LD20 SoC
Date: Thu, 20 Oct 2016 12:59:29 +0900
Message-ID: <CAK7LNAQj-mHoGvQ4KxoHSJa=JUAh5Bt0H8GF9SnLwZfw70_U_g@mail.gmail.com>
References: <1476926126-6079-1-git-send-email-yamada.masahiro@socionext.com>
 <1476926126-6079-2-git-send-email-yamada.masahiro@socionext.com> <20161020035542.GG11766@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161020035542.GG11766@vireshk-i7>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2016-10-20 12:55 GMT+09:00 Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
> On 20-10-16, 10:15, Masahiro Yamada wrote:
>> +             opp@666666666 {
>> +                     opp-hz = /bits/ 64 <666667000>;
>> +                     clock-latency-ns = <300>;
>> +             };
>> +             opp@733333333 {
>> +                     opp-hz = /bits/ 64 <733334000>;
>> +                     clock-latency-ns = <300>;
>> +             };
>
> Forgot changing these ? Please make sure to update all of them.
>

Oops, I missed that.

Will fix soon.

Thanks!



-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
