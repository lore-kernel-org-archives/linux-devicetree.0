From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] phy: work around 'phys' references to usb-nop-xceiv devices
Date: Fri, 19 Jan 2018 16:14:23 +0100
Message-ID: <CAK8P3a2FEdhVXGHT3VE43LE9Rn-WNp+woasb9EwVAr8twVw2Dw@mail.gmail.com>
References: <20180112101223.3661181-1-arnd@arndb.de> <CAL_JsqKi30aUiJUdjnen+sty_2horaTVs5LFaFJdxACsvEQpkg@mail.gmail.com>
 <c38e54f7-4dbd-72dc-e1fb-9003435cbe0e@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c38e54f7-4dbd-72dc-e1fb-9003435cbe0e-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Andrzej Pietrasiewicz <andrzej.p-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 19, 2018 at 11:35 AM, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> wrote:
> Am 12.01.2018 um 20:54 schrieb Rob Herring:
>> On Fri, Jan 12, 2018 at 4:12 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:

>>> ---
>>> Hans tested the earlier version of this patch, I'd like one more
>>> confirmation from Hans or Stefan (or anyone else) that this version
>>> addresses the regression as well before this gets merged.
>>>
>>> Greg, can you pick this up into usb-linus for v4.15 once the fix
>>> has been confirmed, or should I merge it through arm-soc?
>>> ---
>>>  drivers/phy/phy-core.c | 4 ++++
>>>  1 file changed, 4 insertions(+)
>> Thanks for fixing this.
>>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>
>> Rob
>
> ping ...

I ended up putting it into arm-soc/fixes. I assume that Greg missed it
while he was
busy getting the latest stable kernels out. I'll send a pull request
to Linus and
explain it there today.

     Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
