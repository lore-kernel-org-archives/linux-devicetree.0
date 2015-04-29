From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 2/3 v5] mailbox: Enable BCM2835 mailbox support
Date: Wed, 29 Apr 2015 10:05:37 -0700
Message-ID: <87sibiq2zi.fsf@eliezer.anholt.net>
References: <1430173644-19099-1-git-send-email-eric@anholt.net> <1430173644-19099-3-git-send-email-eric@anholt.net> <CABb+yY2u_v1uSDrBgP2DRAOrDkXETfs_zmLACm=uRFALVYFjmA@mail.gmail.com> <87618g6nk8.fsf@eliezer.anholt.net> <CABb+yY2OLOPNf=9YyEmw_9m4h4a+sx5FAOkRK9Yc1ZKxDMFd1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABb+yY2OLOPNf=9YyEmw_9m4h4a+sx5FAOkRK9Yc1ZKxDMFd1Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> On Wed, Apr 29, 2015 at 1:19 AM, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org> wrote:
>> Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>>
>>>> +
>>>> +struct bcm2835_mbox {
>>>> +       struct device *dev;
>>>> +       void __iomem *regs;
>>>> +       spinlock_t lock;
>>>> +       bool started;
>>>> +       struct mbox_controller controller;
>>>> +};
>>>> +
>>>> +struct bcm2835_mbox *mbox;
>>>> +
>>> Bad omen. You assume any platform will ever have just one instance of
>>> the mailbox controller. Which may come true, but still is a taboo to
>>> think of.
>>
>> On the other hand, when I've submitted to other subsystems people have
>> complained about how I have these extra lookups/container_ofs, instead
>> of just storing the obviously-only-one-of-them thing in a global.
>>
>> I think a global makes definite sense for this driver.
>>
> 0) Why is 'mbox' not even static?

Typo.

> 1) It makes sense for system wide entities like stack/protocol
> instance. But this is _one_ controller instance with _one_ mailbox
> instance. You think any platform will ever only need one mailbox or
> use two classes of controllers?

Yes, I think there will only ever be one or zero instances of this
driver.  I give it 10:1 odds.

>>>> +       if (readl(mbox->regs + MAIL0_STA) & ARM_MS_FULL) {
>>>> +               ret = -EBUSY;
>>>> +               goto end;
>>>> +       }
>>>>
>>> This check is unnecessary too. API would have already called
>>> last_tx_done() already to make sure this never hits.
>>
>> Dropped.
>>
> I see it's not yet.

Misread this while going through the ->stopped removals.  Fixed now.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVQQ9hAAoJELXWKTbR/J7o24EQAJBf0EOHw86GltM37AQCL+M8
yyac9VxygAmpNwRK3U+Oasf8AiR28Lhf3FYy7h6J0bcGQiTkaiFD1ZIMbMhaN3T9
ZjUfgS4J++iMULNaAhIuioR8nhp73SDVjllpJXzIeaCrSyqFo5M4CC/7BLHHF8s+
o7vS1CePr52MqVr0AGACeiELuauF5Cv/nDpnooGyIo+a/2McSkFLrUZK8OCVqoPE
BhuDled7waCMOyA5U3StNgJAnowpThEY6BNBIdAA81+dPFmnK6lYLTJyfNwX8qai
GSt1oNDAJSUxtBrmQkCvZuSi/JVUcYxhzw6IlZd3Wz1ytVlXWRyRd7LYTS13GtY+
e44K09RR3DrUkQEwO5Cjx49FV6sqDo2bHOGyZSrvT+P7a3CPWJ+EpQHCUzv3DxtD
7jUB0LyPc+9xO4+J6pVODeWPCOuowxHoRq8d/A+qPfUoHR37FR6iFLUkEhinsbwJ
fl4kgjY5e0HpPIL5h/zHtClhMEny5Tcg9gfgyT4M6sfKjkgCJAPgDLbsRfz6dwtK
bCDUs4GK234IjZ6QxWWUlkRgD+5CpcY+ZGOjNygYQXmjPHjGM6/orLdWHL2pVp/d
b3qtenWq+28ZiMOGLBhkIYZlgPtucP+kPzh8u1kv/KfWRj/+BUuvzm2np5QUrG/Y
X1vvkw9NwHvA5dvC0Co3
=XPDZ
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
