From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL] Mediatek: 32-bit DT update for v4.15
Date: Fri, 3 Nov 2017 16:21:33 +0100
Message-ID: <CAK8P3a1oP98K3mzK3MfFvJ27y5fgYsTnOdPpjukQGXOLAQYhyA@mail.gmail.com>
References: <c7145c00-b2b9-780c-0bfd-15f7d8a08dd6@gmail.com>
 <CAK8P3a3NWwoe0mX45WrFONyiHt9eWTTMziEc+rjqSfr5QZv8xQ@mail.gmail.com>
 <1509423579.10793.10.camel@mtkswgap22> <e8fdd9a9-ce13-8804-aea0-46becc6f9730@gmail.com>
 <CAK8P3a0+9fChSbObS9boR8okHtO8u8_hr2Te+RjfRD0T54QYWQ@mail.gmail.com>
 <1509673038.19220.19.camel@mtkswgap22> <CAK8P3a1doHCH4ucC1AUR5HiH5qvMXeoqsav-9dsvhM2KPh3FNw@mail.gmail.com>
 <1509709967.15691.25.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1509709967.15691.25.camel@mtkswgap22>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Weiqing Kong <weiqing.kong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 3, 2017 at 12:52 PM, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> On Fri, 2017-11-03 at 10:40 +0100, Arnd Bergmann wrote:
>> On Fri, Nov 3, 2017 at 2:37 AM, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:

>> This should have the exact same effect as what you have in your tree,
>> but if that works,
>> we can merge that version and try to figure out why the kernel thinks
>> they are different.
>
> I've tried this approach by using the 4-ports network card and got the
> result:
> pcieport 0000:00:01.0: assign IRQ: got 220
> pcieport 0000:00:01.0: assigning IRQ 220
> pcieport 0000:00:01.0: enabling device (0140 -> 0142)
> pcieport 0000:00:01.0: enabling bus mastering
> pcieport 0000:00:01.0: Signaling PME with IRQ 220
> ....
> igb 0000:01:00.0: assign IRQ: got 221
> igb 0000:01:00.0: assigning IRQ 221
> igb 0000:01:00.1: assign IRQ: got 221
> igb 0000:01:00.1: assigning IRQ 221
> igb 0000:01:00.2: assign IRQ: got 221
> igb 0000:01:00.2: assigning IRQ 221
> igb 0000:01:00.3: assign IRQ: got 221
> igb 0000:01:00.3: assigning IRQ 221
>
> I think slot 1 should share its IRQ (220) with every device in the
> hierarchy below this root port.

Agreed, that is what I expected, too. I've looked at the of_pci_irq.c
in more detail but couldn't come up with what happened. Can you
try running with this patch or something like that to figure out where
it takes the wrong turn?

https://pastebin.com/MrMzwcmw

     Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
