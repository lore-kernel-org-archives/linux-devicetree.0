From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [RESEND PATCH] modpost: don't add a trailing wildcard for OF
 module aliases
Date: Tue, 8 Dec 2015 23:00:13 -0300
Message-ID: <56678B2D.1040905@osg.samsung.com>
References: <1449612813-27004-1-git-send-email-javier@osg.samsung.com>
 <20151208151149.50ee68b41c5b9bc833eb0c2b@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151208151149.50ee68b41c5b9bc833eb0c2b-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jean Delvare <jdelvare-l3A5Bk7waGM@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Andrew,

On 12/08/2015 08:11 PM, Andrew Morton wrote:
> On Tue,  8 Dec 2015 19:13:32 -0300 Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org> wrote:

[snip]

>>
>> I sent this patch before [0] but was never picked. MAINTAINERS doesn't
>> say who should manage patches to file2alias so maybe I didn't add the
>> right person to the cc list.
> 
> z:/usr/src/git26> perl scripts/get_maintainer.pl -f scripts/mod 
> Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org> (commit_signer:18/27=67%)
>

Yes, I use get_maintainer.pl but usually with the --no-git-fallback since
the --git-fallback option tends to be too noisy and people complain that
are cc'ed on random patches just because they touched a file in the past.

IOW, there is no way to know only by looking at get_maintainer.pl output
if Rusty has only made a lot of changes to that repo or if he acts as a
maintainer (i.e: picks patches and send pull requests).

For these cases, is good to have a proper entry in MAINTAINERS.
 
>> Documentation/development-process/5.Posting says that if there is no
>> obvious maintainer, then Andrew Morton is often the patch target so
>> I'm re-sending to him.
> 
> Yep.  If I don't handle the particular patch, I know who does ;)
>

I see that you picked the patch already, thanks a lot for your help!

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
