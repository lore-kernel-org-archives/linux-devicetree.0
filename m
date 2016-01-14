From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH] of: drop symbols declared by _OF_DECLARE() from modules
Date: Thu, 14 Jan 2016 19:21:21 +0900
Message-ID: <CAK7LNATQB1ZBHM26HGSb=hHYsjROppAaOfWGE+M6TvadR71JQg@mail.gmail.com>
References: <1452745987-22146-1-git-send-email-yamada.masahiro@socionext.com>
	<34759085.vISMJm6PEF@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <34759085.vISMJm6PEF@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

2016-01-14 19:14 GMT+09:00 Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>:
> On Thursday 14 January 2016 13:33:06 Masahiro Yamada wrote:
>>
>> -#ifdef CONFIG_OF
>> +#if defined(CONFIG_OF) && !defined(MODULE)
>>  #define _OF_DECLARE(table, name, compat, fn, fn_type)                  \
>>         static const struct of_device_id __of_table_##name              \
>>                 __used __section(__##table##_of_table)                  \
>> --
>>
>
> Doesn't this lead to "unused function" warnings? Maybe we can change the "__used"
> into "__unused" when MODULE is set,

Yes, this is my intention.

I think this patch does so,
unless I am missing something...


  #if defined(CONFIG_OF) && !defined(MODULE)
          __used
  #else
          __unused
  #endif



> so the compiler will automatically
> drop all code that is only referenced from the entry.


-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
