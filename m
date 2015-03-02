From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 05/10] ARM: bcm2835: Add the mailbox power channel driver.
Date: Mon, 02 Mar 2015 14:02:18 -0800
Message-ID: <87vbij5a8l.fsf@eliezer.anholt.net>
References: <1425329684-23968-1-git-send-email-eric@anholt.net> <1425329684-23968-6-git-send-email-eric@anholt.net> <2161376.WXTGbypp2V@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2161376.WXTGbypp2V@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> writes:

> On Monday 02 March 2015 12:54:39 Eric Anholt wrote:
>> +/*
>> + * Submits a set of concatenated tags to the VPU firmware through the
>> + * mailbox power interface.
>> + *
>> + * The buffer header and the ending tag are added by this function and
>> + * don't need to be supplied, just the actual tags for your operation.
>> + * See struct bcm_mbox_power_tag_header for the per-tag structure.
>> + */
>> +static int bcm_mbox_set_power(uint32_t power_enables)
>> +{
>> +       int ret;
>> +
>> +       reinit_completion(&mbox_power->c);
>> +       ret =3D mbox_send_message(mbox_power->chan,
>> +                               (void *)(power_enables << BCM_MBOX_DATA_=
SHIFT));
>> +       if (ret >=3D 0)
>> +               wait_for_completion(&mbox_power->c);
>> +
>> +       return ret;
>>=20
>
> Please don't abuse the pointer argument to send an integer.
>
> Instead, pass a pointer to the data argument as intended. As this
> is a recurring problem, we may want to add a different interface
> to pass fixed-length inline data, maybe
>
> mbox_send_message_u32(struct mbox_chan *chan, u32 msg);
>
> and possibly add a length argument to the existing mbox_send_message.

Good point.  I've adjusted this code to do this (and to use "msg"
instead of "mssg" -- is "mssg" supposed to mean something besides an
unusual abbreviation of "message"?), and since it was the same number of
lines of code, I don't think it makes sense to define a new API.  I
suspect this awkward style just arose from following the lead of the
omap driver.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJU9N3qAAoJELXWKTbR/J7ohA0P/2hm/czEAI5IImmyyV0F/Pws
MY3ankRBx3n+596PGr18bNfkB741mSzzoN8dqlfDyTQ4VDviiqK/A8zMgbVJrh4L
ZrCKYWUSGef3XKFMjNaV4GsEGotx07Ie1R096CvVTONWerRka5x6FrSolYqDKD8n
NgurqH5qBTTsK0OjD4wBHtsCfagcR8O0qo3P+WCiBn2xl9+Zidigw5j3MofLIYCS
WrmkYfEuvR5PMJZHi7HKIF+vdH3+1sNnjnQqmq+RGxqrzPR5DbLA2cOBuQpOmIuV
hrx0a7RO7+r8wJgCNAR/9q8XaAhuWl6/pt2aieUNsjdYw0ducI1Qu9ft17gxSLfM
sTe7DjYQqNZ2cTzpKLqdAX0NJc9BkWUWSlx9EwG2JIKnj9QMWKKbl1M3+QTWiwoh
VBo4y09BLD5O1KtoA4kVNKIjTSxXbDIHou/gYKSO8PryUwixdBxFwTqFC/uQbHRz
HRtX8B+0HTOuu/nzeIheNN67McS97hZJikSGdCNEwHiP6OcRJP9O1SqC59yK3XbW
dXKZYn2wzjiYk1m8L6Fw2l5JUp4E7SLRDcCWYzVcqvBa0MkSjdZEjFF0TqGe8EXm
rzuSBYK25mOO5Nb5cDa16U2uH8t393MLG8//323IEXGA27cygdvYlC3hTQ2MXBp8
dkz4OJRHzpYmEtErlWKK
=LEBm
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
