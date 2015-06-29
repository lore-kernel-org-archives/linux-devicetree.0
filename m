From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RFC 0/4] PL08x DT bindings and LPC18xx DMA support
Date: Mon, 29 Jun 2015 13:06:47 +0200
Message-ID: <CAGhQ9VxXHdPwUR0AWC8SVA9iRV8pazVC1atmrEKzP5dJx81MBw@mail.gmail.com>
References: <1434280937-8369-1-git-send-email-manabian@gmail.com>
	<CACRpkdZZBGzioO25-Sov0CVK8JuRp1uuJDEZKFtLxg9WwsSzww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdZZBGzioO25-Sov0CVK8JuRp1uuJDEZKFtLxg9WwsSzww-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On 29 June 2015 at 12:53, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Sun, Jun 14, 2015 at 1:22 PM, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> This patch set aims to add support for DMA on the NXP LPC18xx/43xx
>> (Cortex-M3/M4) platform. The platform has a PL080 controller with a
>> mux in front of the DMA request lines. This setup is quite common
>> and can be found on most other, if not all, NXP LPC devices.
>
> Nice!
>
>>  - remove channel sub-nodes from driver and dt doc.
>
> Why? It was a good approach for the Nomadik. Well I'll look
> how you do it for NXP, I guess it makes total sense for you.

Since the bus specifier (AHB1 / AHB2) property has been moved into the
DMA cell, I don't see a reason to keep channel sub-nodes stuff.

And I also agree with Arnd's other comments on the subject here:
https://www.marc.info/?l=linux-arm-kernel&m=141088461506806&w=2
(see at the bottom)

Summary:
* No other driver does this.
* Removing it make the driver a bit simpler.


regards,
Joachim Eastwood
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
