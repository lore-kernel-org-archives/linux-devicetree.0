From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/5] MFD/OF: document MFD devices and handle simple-mfd
Date: Tue, 17 Mar 2015 11:38:54 +0100
Message-ID: <CACRpkdYptEuJYsSGJqmnDrewDcafzx5tqa8E+FC7BETon7X9fQ@mail.gmail.com>
References: <1425375148-4369-1-git-send-email-linus.walleij@linaro.org>
	<1425375148-4369-2-git-send-email-linus.walleij@linaro.org>
	<20150312091427.GA4329@piout.net>
	<CACRpkdacQ-MR+Sziu-TQXWr+1UCtBphZ5eNSWbJ2ZpCnH+o9JA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdacQ-MR+Sziu-TQXWr+1UCtBphZ5eNSWbJ2ZpCnH+o9JA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 17, 2015 at 11:28 AM, Linus Walleij
<linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Mar 12, 2015 at 10:14 AM, Alexandre Belloni
> <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>
>> As part of the system timer cleanup, I'll actually be needing that
>> patch. Is it scheduled for inclusion or should I use "simple-bus" in the
>> meantime?
>
> No replies to the thread so I will send a pull request to ARM SoC cleanup
> branch.

Ah well I had some pending changes requested by Lee. Once Lee
ACK it for MFD and (hopefully) Bryan pitches in for LEDs, I'll post
a pull request.

BTW: Alexandre: your ACK or Reviewed-by would be appreciated ;)

Antione: if you're also using this, pls provide your ACK on the series.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
