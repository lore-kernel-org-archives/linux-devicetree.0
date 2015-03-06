From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 08/10] dt/bindings: Add binding for BCM2835 mailbox
 property channel driver
Date: Fri, 6 Mar 2015 11:35:10 +0530
Message-ID: <CABb+yY33514qxdybmwEtqjb2qYHyEwF48kd5oz0sTBE-qsJ0ow@mail.gmail.com>
References: <1425329684-23968-1-git-send-email-eric@anholt.net>
	<1425329684-23968-9-git-send-email-eric@anholt.net>
	<54F681CE.2070801@wwwdotorg.org>
	<87wq2v6x69.fsf@eliezer.anholt.net>
	<54F937DF.3020001@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54F937DF.3020001-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 6, 2015 at 10:45 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 03/05/2015 12:50 PM, Eric Anholt wrote:
>> Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:
>>
>>> On 03/02/2015 01:54 PM, Eric Anholt wrote:
>>>> I was tempted to have the mailbox property channel support just
>>>> be in the 2835 mailbox driver itself, but
>>>> mbox_request_channel() wants its device to have the "mboxes"
>>>> node, and that appears to be only intended for mailbox clients,
>>>> not controllers.
>>>
>>> This is more of a particular format/protocol of messages you can
>>> send over the mailbox HW than a device. I wonder if it actually
>>> makes sense to represent it in DT as a device at all?
>>>
>>> If we do represent this as a device in DT, shouldn't it also look
>>> like a mailbox device so that other drivers (clock, display, ...)
>>> can bind to it and send messages using the mailbox API?
>>
>> I don't think it makes sense as a mailbox device.  mailbox devices
>> can only have one client per channel, while there's no reason to
>> have that limitation on the property channel.  You could imagine
>> having the individual tags be channels, except that again there's
>> no reason to have the one-client limitation, but more importantly
>> the indivudual messages to the firmware are composed of N tags.
>
> My inclination would be to structure everything as:
>
> a) A mailbox driver/device. This doesn't implement any of the protocol
> code. The device appears in DT, since it's real HW.
>
Exactly.

> b) A RPi firmware protocol implementation. This is the only code that
> talks directly to the mailbox driver. This would implement support for
> all aspects of the RPi firmware protocol; both the non-property and
> property channels; they're just different aspects of the one RPi firmware.
>
Yes, I usually call that the 'server' driver - a gobal client driver
that serves other client subsystems.

> I guess there could be a DT node that represents the existence of the
> RPi firmware. It would be a bit of a "virtual device" rather than an
> actual piece of physical HW, but since firmware is an interface that
> the SW interacts with, I guess a DT node makes sense.
>
> This DT node would contain a property pointing at the physical mailbox
> provider, so it could send messages.
>
Yes, as long as a device has one physical resource IRQ, register,
clock I think it has the right to be in DT.
It will be a physical mailbox channel, so it qualifies.

> c) Client drivers (clocks, power domains, ...) All client drivers talk
> to (b) not (a). The DT nodes for this code might contain a property
> that points at (b), but the API from c->b would likely be something
> custom rather than the mailbox API, since the RPi firmware protocol
> implements something custom rather than standard.
>
Yes, c<->b protocol will be Linux specific.  b<->a will be
pre-determined by the remote firmware.

I haven't had the time to look deeply but from quick overview:
1) bcm2835-mailbox-power.c and bcm2835-mailbox-property.c are client
drivers and shouldn't reside in drivers/mailbox/

2) The bcm2835-mailbox-power should probably be a part of platform's
USB support - which should try to call remote to enable power upon
init. Or even better, let the 'server' driver (b) manage that mailbox
as well, if it could be used for other purposes on some other
platform.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
