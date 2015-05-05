From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 0/2] reset driver for NXP LPC18xx family
Date: Tue, 05 May 2015 10:33:47 +0200
Message-ID: <1430814827.3035.10.camel@pengutronix.de>
References: <1430779956-12490-1-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430779956-12490-1-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ariel.dalessandro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, den 05.05.2015, 00:52 +0200 schrieb Joachim Eastwood:
> This patch set adds a reset driver for NXP LPC18xx/43xx devices.
> 
> Changes in v2:
> * clean up header includes
> * prefix M0 reset defines with LPC43XX
> * fix comment about M0 reset lines
> * reorganize reset call chains
> * add reset number table to dt doc

I am satisfied with the changes.
I'd like a short patch description in both patches before applying them.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
