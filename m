From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] of: drop symbols declared by _OF_DECLARE() from modules
Date: Thu, 14 Jan 2016 11:23:37 +0100
Message-ID: <5051214.H38I57Nkpo@wuerfel>
References: <1452745987-22146-1-git-send-email-yamada.masahiro@socionext.com> <34759085.vISMJm6PEF@wuerfel> <CAK7LNATQB1ZBHM26HGSb=hHYsjROppAaOfWGE+M6TvadR71JQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK7LNATQB1ZBHM26HGSb=hHYsjROppAaOfWGE+M6TvadR71JQg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 14 January 2016 19:21:21 Masahiro Yamada wrote:
> Yes, this is my intention.
> 
> I think this patch does so,
> unless I am missing something...
> 
> 
>   #if defined(CONFIG_OF) && !defined(MODULE)
>           __used
>   #else
>           __unused
>   #endif
> 
> 

Ah, got it. You are right, I just missed that because the #else
part was not in the context that I saw in the patch and I was too lazy
to actually look at the file.

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
