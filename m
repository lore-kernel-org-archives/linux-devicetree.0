From: Corey Minyard <minyard-HInyCGIudOg@public.gmane.org>
Subject: Re: [PATCH 1/3] ipmi/bt-bmc: change compatible node to
 'aspeed,ast2400-ibt-bmc'
Date: Tue, 8 Nov 2016 12:15:57 -0600
Message-ID: <c749ff0a-bc71-bc9f-0e8c-326db2cea0fb@acm.org>
References: <1478073426-3714-1-git-send-email-clg@kaod.org>
 <CACPK8XcM1_xmmUu-cCZrSR67Y_qeXuSJ4Xmd_2gcgDT321LdBQ@mail.gmail.com>
 <ebeba60f-429f-fb84-b9da-c27d11d23094@kaod.org> <2368736.y6FyG1ESuP@wuerfel>
 <a886778e-a85e-758e-3a61-c4909652e39d@kaod.org>
Reply-To: minyard-HInyCGIudOg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a886778e-a85e-758e-3a61-c4909652e39d-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, openipmi-developer-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/08/2016 09:52 AM, Cédric Le Goater wrote:
> O
snip

>>>> While we're modifying the binding, should we add a compat string for
>>>> the ast2500?
>>> Well, if the change in this patch is fine for all, may be we can add
>>> the ast2500 compat string in a followup patch ?
>> Sounds good to me.
> OK. So, how do we proceed with this patch ? Who would include it in its
> tree ?

I don't have anything for 4.9 at the moment.  Arnd, if you have 
something, can
you take this?  Otherwise I will.

And I guess I should add:

Acked-by: Corey Minyard <cminyard-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>

-corey

> Thanks,
>
> C.
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
