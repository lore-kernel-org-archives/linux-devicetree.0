From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 08/10] dt/bindings: Add binding for BCM2835 mailbox property
 channel driver
Date: Thu, 05 Mar 2015 22:15:11 -0700
Message-ID: <54F937DF.3020001@wwwdotorg.org>
References: <1425329684-23968-1-git-send-email-eric@anholt.net> <1425329684-23968-9-git-send-email-eric@anholt.net> <54F681CE.2070801@wwwdotorg.org> <87wq2v6x69.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87wq2v6x69.fsf-omZaPlIz5HhaEpDpdNBo/KxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/05/2015 12:50 PM, Eric Anholt wrote:
> Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:
> 
>> On 03/02/2015 01:54 PM, Eric Anholt wrote:
>>> I was tempted to have the mailbox property channel support just
>>> be in the 2835 mailbox driver itself, but
>>> mbox_request_channel() wants its device to have the "mboxes"
>>> node, and that appears to be only intended for mailbox clients,
>>> not controllers.
>> 
>> This is more of a particular format/protocol of messages you can
>> send over the mailbox HW than a device. I wonder if it actually
>> makes sense to represent it in DT as a device at all?
>> 
>> If we do represent this as a device in DT, shouldn't it also look
>> like a mailbox device so that other drivers (clock, display, ...)
>> can bind to it and send messages using the mailbox API?
> 
> I don't think it makes sense as a mailbox device.  mailbox devices
> can only have one client per channel, while there's no reason to
> have that limitation on the property channel.  You could imagine
> having the individual tags be channels, except that again there's
> no reason to have the one-client limitation, but more importantly
> the indivudual messages to the firmware are composed of N tags.

My inclination would be to structure everything as:

a) A mailbox driver/device. This doesn't implement any of the protocol
code. The device appears in DT, since it's real HW.

b) A RPi firmware protocol implementation. This is the only code that
talks directly to the mailbox driver. This would implement support for
all aspects of the RPi firmware protocol; both the non-property and
property channels; they're just different aspects of the one RPi firmware.

I guess there could be a DT node that represents the existence of the
RPi firmware. It would be a bit of a "virtual device" rather than an
actual piece of physical HW, but since firmware is an interface that
the SW interacts with, I guess a DT node makes sense.

This DT node would contain a property pointing at the physical mailbox
provider, so it could send messages.

c) Client drivers (clocks, power domains, ...) All client drivers talk
to (b) not (a). The DT nodes for this code might contain a property
that points at (b), but the API from c->b would likely be something
custom rather than the mailbox API, since the RPi firmware protocol
implements something custom rather than standard.

I'd be interested to hear opinions from people much more familiar with
other mailbox HW and protocol drivers. Perhaps they're all lumped
together on other platforms?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
