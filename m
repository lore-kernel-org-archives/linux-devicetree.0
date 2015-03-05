From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 08/10] dt/bindings: Add binding for BCM2835 mailbox property channel driver
Date: Thu, 05 Mar 2015 11:50:38 -0800
Message-ID: <87wq2v6x69.fsf@eliezer.anholt.net>
References: <1425329684-23968-1-git-send-email-eric@anholt.net> <1425329684-23968-9-git-send-email-eric@anholt.net> <54F681CE.2070801@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54F681CE.2070801-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:

> On 03/02/2015 01:54 PM, Eric Anholt wrote:
>> I was tempted to have the mailbox property channel support just be in
>> the 2835 mailbox driver itself, but mbox_request_channel() wants its
>> device to have the "mboxes" node, and that appears to be only intended
>> for mailbox clients, not controllers.
>
> This is more of a particular format/protocol of messages you can send
> over the mailbox HW than a device. I wonder if it actually makes sense
> to represent it in DT as a device at all?
>
> If we do represent this as a device in DT, shouldn't it also look like a
> mailbox device so that other drivers (clock, display, ...) can bind to
> it and send messages using the mailbox API?

I don't think it makes sense as a mailbox device.  mailbox devices can
only have one client per channel, while there's no reason to have that
limitation on the property channel.  You could imagine having the
individual tags be channels, except that again there's no reason to have
the one-client limitation, but more importantly the indivudual messages
to the firmware are composed of N tags.

> I might have expected to just add property support directly into the
> basic bcm2835 mailbox driver itself. Perhaps some attempt might be made
> to isolate the HW register level access in one file/driver, and expose
> both the regular and property mailbox protocols as a higher level that
> uses the low-level mailbox functionality? The concept of the lower 4
> bits of mailbox data being a channel ID might belong in the higher
> protocol level rather than the lower HW layer?

Yes, the lower 4 bits being the channel is firmware protocol.

The reason I didn't have it in the same device as the mailbox is that
you need the channel reference in order to set up a mailbox client, and
I didn't think it made sense to have the mailbox device dt reference
itself.

The higher-level interface I think might make sense would be a send_data
replacement that took your device and mbox channel index, and a u32 of
data (low 4 bits unused), and synchronously returned a u32 of response.
It would do the client setup/send/wait_for_completion/teardown for you.

I'm skeptical of putting much more work into mailboxes on this platform,
though.  All we've got for channels are:

0: power (present in this series)
1: fb (Won't be used in Linux)
2: unused
3: VCHIQ (I've heard skepticism that the kernel community would accept this
          interface)
4: unused
5: unused
6: unused
7: settings (not sure if there's anything here not exposed in properties)
8: property (present in this series)
9-15: unused

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJU+LOOAAoJELXWKTbR/J7oGs0QAJViS2lQGj3dQkT35DmoeOsr
9lf0Mtpzo9Zkm05w1jSgGu8qDyzdj7gkRAP81VmZnBzqfzPK86aHOZ4U9pDOqE9U
C1Cc/1eZZ4J5ogKVI/vwWqQcz48WrcNGosykh9MzD5/n6mS8uf1foYO9VOOzq+Px
QuV52Me1nu0bQPZ75I5mUE32Vv7oQDZ0fGZOzurvuokdViXyW0iy0DrJPzDRR4vQ
7ZUBAR1xC4uoBYLYGkJ4Xmk3fJqrjxNM8EF8yChV1RoeStt9VGnok3pSrViJp58K
6iIVpR7nZaZ8NOh9IylWlPgJYw1osLQXH11XCENiBDqZcj+96osRNto92ZiPfVfS
n/5BBIKJdRBrk5tnAcF/mjZrk8he1nkFJQSOxiet17XKooZ9nVyiZWWwRf3cDYro
h4cO+FE2e4tOfh70jgpBC8mVGVS1exUy9jYYzaLkXSlhjtRLz1QJ7u/JRF41mzC6
WIiwzzrBkWXHnnlZQnhYVjBY8s1xqsTtYYTrusfRAh/BjBVHmHlzLKaDxV5sOzOl
ISd1/doBS9gl6BEqXoX5TpbJ7oeoh9aL83u+dLAnTLKkhAAJOUPhR0718C8gUAL3
ICOZ6rt/FA0s+FbBoY92lyo6kDK5YXDd6aoiANHmUUylm0WV8IdSUhIVNZtWpG7R
R6mxVOQNeFrmbRrvdpR+
=0wvi
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
