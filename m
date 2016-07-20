From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH 2/4] drivers/clocksource/moxart: Refactor enable/disable
Date: Wed, 20 Jul 2016 14:47:15 +0930
Message-ID: <CACPK8XdK35p9rxr8et58omvQExjdri20yCq91LGocnPRYpGLQQ@mail.gmail.com>
References: <1462797169-14512-1-git-send-email-joel@jms.id.au>
 <1462797169-14512-3-git-send-email-joel@jms.id.au> <CACPK8XfJ2e1kr-WftidvqsoYew7LqPiNo0sw7opgh8UH=3q_3A@mail.gmail.com>
 <20160510130414.GE14952@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160510130414.GE14952-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jonas Jensen <jonas.jensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Daniel,

On Tue, May 10, 2016 at 10:34 PM, Daniel Lezcano
<daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Tue, May 10, 2016 at 08:36:50PM +0930, Joel Stanley wrote:
>> Hi Daniel,
>>
>> Here's a commit message for this patch. If you'd prefer me to resend
>> the entire series with this included then I can do that.
>
> No, it is ok (except if there are comments on the patches before I merge
> them).

I couldn't find this in your tree. Any chance I could get it merged now?

Cheers,

Joel

>
>> This patch abstracts the enable and disable register writes into their
>> own functions in preparation for future changes to use SoC specific
>> values for the writes.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
