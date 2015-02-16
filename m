From: "Matwey V. Kornilov" <matwey-TTlVxmypnbovJsYlp49lxw@public.gmane.org>
Subject: Re: [PATCH] of: Add prompt for OF_OVERLAY config
Date: Mon, 16 Feb 2015 10:21:23 +0400
Message-ID: <CAJs94EYR1Ed1gKUxTEFhM=VjjFoSxdSkJhLW+NvKGEb2XFivSw@mail.gmail.com>
References: <1424013767-25522-1-git-send-email-matwey@sai.msu.ru> <1424030408.9418.106.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424030408.9418.106.camel@x220>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2015-02-15 23:00 GMT+03:00 Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>:
> On Sun, 2015-02-15 at 18:22 +0300, Matwey V. Kornilov wrote:
>> Signed-off-by: Matwey V. Kornilov <matwey-TTlVxmypnbovJsYlp49lxw@public.gmane.org>
>> ---
>>  drivers/of/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
>> index b5e0c87..fdca685 100644
>> --- a/drivers/of/Kconfig
>> +++ b/drivers/of/Kconfig
>> @@ -85,7 +85,7 @@ config OF_RESOLVE
>>       bool
>>
>>  config OF_OVERLAY
>> -     bool
>> +     bool "Device Tree overlays"
>>       depends on OF
>>       select OF_DYNAMIC
>>       select OF_RESOLVE
>
> Is this a bugfix (for the bug that OF_OVERLAY can't yet actually be set
> to 'y') or not? Perhaps a commit explanation would have answered that
> question.

Yes it is. I thought it was trivial, I'll add message in v2

> By the way, "depends on OF" is superfluous (the enclosing menu already
> depends on OF).

Ok, but I'll put it in separate patch


-- 
With best regards,
Matwey V. Kornilov.
Sternberg Astronomical Institute, Lomonosov Moscow State University, Russia
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
