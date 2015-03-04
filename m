From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 08/10] dt/bindings: Add binding for BCM2835 mailbox property
 channel driver
Date: Tue, 03 Mar 2015 20:53:50 -0700
Message-ID: <54F681CE.2070801@wwwdotorg.org>
References: <1425329684-23968-1-git-send-email-eric@anholt.net> <1425329684-23968-9-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425329684-23968-9-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/02/2015 01:54 PM, Eric Anholt wrote:
> I was tempted to have the mailbox property channel support just be in
> the 2835 mailbox driver itself, but mbox_request_channel() wants its
> device to have the "mboxes" node, and that appears to be only intended
> for mailbox clients, not controllers.

This is more of a particular format/protocol of messages you can send
over the mailbox HW than a device. I wonder if it actually makes sense
to represent it in DT as a device at all?

If we do represent this as a device in DT, shouldn't it also look like a
mailbox device so that other drivers (clock, display, ...) can bind to
it and send messages using the mailbox API?

I might have expected to just add property support directly into the
basic bcm2835 mailbox driver itself. Perhaps some attempt might be made
to isolate the HW register level access in one file/driver, and expose
both the regular and property mailbox protocols as a higher level that
uses the low-level mailbox functionality? The concept of the lower 4
bits of mailbox data being a channel ID might belong in the higher
protocol level rather than the lower HW layer?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
