From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] of/platform: fix device naming for non-translatable addresses
Date: Thu, 8 May 2014 07:55:06 -0500
Message-ID: <CAL_JsqJEW_Xrfi7OiF6caHVup1Y6-8SvyOJawov8o3oiYiFvXQ@mail.gmail.com>
References: <1399499298-8830-1-git-send-email-robherring2@gmail.com>
	<1399499298-8830-4-git-send-email-robherring2@gmail.com>
	<4314054.Zr5Mecf9vm@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4314054.Zr5Mecf9vm@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 8, 2014 at 5:41 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Wednesday 07 May 2014 16:48:17 Rob Herring wrote:
>> From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>
>> Using non-translatable addresses in platform device names is wrong
>> because they may not be globally unique. Just use the default naming with
>> a global index if the address cannot be translated instead.
>>
>> of_can_translate_address has the same checks as of_translate_address, so
>> we can remove it here as well.
>
> Have you checked that this doesn't break platforms using clkdev lookup
> based on names with local addresses? It's quite possible that nobody
> does that, but it would be good to have someone confirm it.

I had not, but now I have. There don't appear to be any cases of that.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
