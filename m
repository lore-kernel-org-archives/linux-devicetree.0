From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 3/4 v4] mailbox: Enable BCM2835 mailbox support
Date: Fri, 20 Mar 2015 10:38:51 -0700
Message-ID: <87r3sjk1qs.fsf@eliezer.anholt.net>
References: <1426213936-4139-1-git-send-email-eric@anholt.net> <1426213936-4139-3-git-send-email-eric@anholt.net> <5507A095.5090805@wwwdotorg.org> <87619xq414.fsf@eliezer.anholt.net> <550BA6B4.3030604@wwwdotorg.org> <CABb+yY0qN4KcZ9kc6eurSUWPn38f2keKe4FB2efKBAVjREcZbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABb+yY0qN4KcZ9kc6eurSUWPn38f2keKe4FB2efKBAVjREcZbg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> On Fri, Mar 20, 2015 at 10:18 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> On 03/18/2015 05:28 PM, Eric Anholt wrote:
>>> Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:
>>>
>>>> On 03/12/2015 08:32 PM, Eric Anholt wrote:
>>>>> diff --git a/drivers/mailbox/bcm2835-mailbox.c
>>>>> b/drivers/mailbox/bcm2835-mailbox.c
>>>>
>>>>> +#define MBOX_MSG(chan, data28)             (((data28) & ~0xf) | ((chan) &
>>>>> 0xf)) +#define MBOX_CHAN(msg)                       ((msg) & 0xf) +#define
>>>>> MBOX_DATA28(msg)            ((msg) & ~0xf)
>>>>
>>>> Even the concept of storing channel IDs in the LSBs feels like it
>>>> might be RPi-firmware-specific rather than HW-specific?
>>>
>>> I guess?  If we found another firmware protocol, we could have
>>> that device's dt just specify a different compatible string.  But
>>> in the absence of another firmware to talk to, I'm not sure what
>>> you want here.
>>
>> I would expect the mailbox driver to expose a single channel that just
>> transports 32-bit values, since the HW doesn't impose any kind of
>> structure on the values it transports AFAIK. Clients of the mailbox
>> driver would formulate the messages they send through the mailox using
>> the macros above.
>>
> Yes, it should be so.

I'm getting pretty frustrated here.

So, if I build a global client serializing requests and stop presenting
channels, what exactly is the generic mailbox infrastructure gaining me?
I don't need add_to_rbuf.  I don't need tpoll_txdone.  I don't need
tx_tick.  I don't need peek_data.  I don't need channels.  It doesn't
even handle waiting on requests for me, and I keep having to do it in
clients.  There's nothing left that the generic code is doing for me.

If I have to do any more changes ot this driver (we're at 27 hours of
just my work on it so far...), I'd rather go back to the trivial driver
we had before that simply, obviously did what we wanted.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVDFsrAAoJELXWKTbR/J7oVH8QALQa77rICTU5w6BkjsAUY+H6
krUcOHa9bFGRc+6ar2lzKZJNjzdN5hLAbew+Si9PSPVgmptqMP784Kg/qk5cw7oI
fXCKKy7l0tnDOgmIUBGqmEZ7Lszln58mKHBvPYotJUGlrOBjWPRQx+sdDncLjK4P
p1szuZkqTVEmrBLAI3+jxc5XrEZ0cXFdB/zAo/UGD9j6fYNWbuOqdSD4ZULNsg+r
veAEAzPsee44u8BjWfffMOnYUb4Gy4xOVX55BYLyO4mEV1QTg7flhqcV38DwcsuZ
/Mk5voJosmZ1v9RW7QoRAiEtJzUgZtw7BlstKMlVgVKiIgt7KfRlfEscrtX0Datb
6rh1bLru2W5jBfyRJ+ovLoZ+HzyGwWnYtQUflynkQJWvcOnerEB3cpVV423s9yZb
shSu4WjAtDje3QVL31BrWUvYlHEs2KMWI70PKr7PkkuZu2aP/hWOpeZPhYZE0GaP
cwnunEPK6tKxceDuIzF2XGUMJOKTTTRMMHgGppMvzmec709hW83ynaXI4eaiMpkv
L5hjxvu67UaXgl1hiXP2RF7p7X3Fx4aymvjZXYzFMNwxH6fVS09ZJY5zhTfgnTKR
ItAC/j0rS6ylWnr44inOTHIYOUFRP28ZypsUxHFm7uXcLOfIWOJo34HXfe/ZkVzA
1t5XbO4sJgboK4vXbR+I
=mOEi
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
