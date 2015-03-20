From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4 v4] mailbox: Enable BCM2835 mailbox support
Date: Fri, 20 Mar 2015 10:42:35 +0530
Message-ID: <CABb+yY0qN4KcZ9kc6eurSUWPn38f2keKe4FB2efKBAVjREcZbg@mail.gmail.com>
References: <1426213936-4139-1-git-send-email-eric@anholt.net>
	<1426213936-4139-3-git-send-email-eric@anholt.net>
	<5507A095.5090805@wwwdotorg.org>
	<87619xq414.fsf@eliezer.anholt.net>
	<550BA6B4.3030604@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <550BA6B4.3030604-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 20, 2015 at 10:18 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 03/18/2015 05:28 PM, Eric Anholt wrote:
>> Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:
>>
>>> On 03/12/2015 08:32 PM, Eric Anholt wrote:
>>>> diff --git a/drivers/mailbox/bcm2835-mailbox.c
>>>> b/drivers/mailbox/bcm2835-mailbox.c
>>>
>>>> +#define MBOX_MSG(chan, data28)             (((data28) & ~0xf) | ((chan) &
>>>> 0xf)) +#define MBOX_CHAN(msg)                       ((msg) & 0xf) +#define
>>>> MBOX_DATA28(msg)            ((msg) & ~0xf)
>>>
>>> Even the concept of storing channel IDs in the LSBs feels like it
>>> might be RPi-firmware-specific rather than HW-specific?
>>
>> I guess?  If we found another firmware protocol, we could have
>> that device's dt just specify a different compatible string.  But
>> in the absence of another firmware to talk to, I'm not sure what
>> you want here.
>
> I would expect the mailbox driver to expose a single channel that just
> transports 32-bit values, since the HW doesn't impose any kind of
> structure on the values it transports AFAIK. Clients of the mailbox
> driver would formulate the messages they send through the mailox using
> the macros above.
>
Yes, it should be so.

> I'm not sure whether the mailbox core allows multiple clients for the
> same mailbox channel though? This HW appears to require it.
>
There were tradeoffs to granting shared vs exclusive access, we chose
latter. The platform could have a global client that serializes
requests and dispatch received data to exact destination rather than
mbox core iterating over all users of the channel. Some platform may
require to execute 2 or more commands 'atomically', which would be
messy if channels are shared.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
