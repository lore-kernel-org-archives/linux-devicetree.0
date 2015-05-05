From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/2] reset driver for NXP LPC18xx family
Date: Tue, 5 May 2015 10:45:15 +0200
Message-ID: <CAGhQ9VzsyVVZS6kNV3YeFq89=f3CaEX0NDFd8hTb9RU0PrXsEQ@mail.gmail.com>
References: <1430779956-12490-1-git-send-email-manabian@gmail.com>
	<1430814827.3035.10.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430814827.3035.10.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ariel D'Alessandro <ariel.dalessandro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 5 May 2015 at 10:33, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> Am Dienstag, den 05.05.2015, 00:52 +0200 schrieb Joachim Eastwood:
>> This patch set adds a reset driver for NXP LPC18xx/43xx devices.
>>
>> Changes in v2:
>> * clean up header includes
>> * prefix M0 reset defines with LPC43XX
>> * fix comment about M0 reset lines
>> * reorganize reset call chains
>> * add reset number table to dt doc
>
> I am satisfied with the changes.

Excellent!

> I'd like a short patch description in both patches before applying them.

ah, yes, the commit messages are a bit lacking...

I'll send out a v3 later today.

regards,
Joachim Eastwood
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
