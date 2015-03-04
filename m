From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 01/10] dt/bindings: Add binding for BCM2835 mailbox driver
Date: Wed, 04 Mar 2015 09:44:53 -0800
Message-ID: <87d24o8xnu.fsf@eliezer.anholt.net>
References: <1425329684-23968-1-git-send-email-eric@anholt.net> <1425329684-23968-2-git-send-email-eric@anholt.net> <20150303080550.GF6976@x1> <87vbih98za.fsf@eliezer.anholt.net> <54F66FDD.2040409@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54F66FDD.2040409-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:

> On 03/03/2015 12:28 PM, Eric Anholt wrote:
>> Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:
>>=20
>>> On Mon, 02 Mar 2015, Eric Anholt wrote:
>>>=20
>>>> From: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
>>>>=20
>>>> v2: Split into a separate patch for submitting to the=20
>>>> devicetree list.
> ...
>>>> ---
>
> Generally, the changelog should go below the --- since most people
> don't want to see the changelog committed into the source.

Huh.  I'm coming from drivers/gpu/drm/ (and non-kernel communities)
where people are expected to keep changelog in the commit message.  I'll
strip it out of this series.

>>>> .../devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt | 19=20
>>>> +++++++++++++++++++ 1 file changed, 19 insertions(+) create=20
>>>> mode 100644=20
>>>> Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt
>>>>
>>>>
>>>>
>>>>=20
> diff --git
> a/Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt
> b/Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt
>>>> new file mode 100644 index 0000000..f5741a0 --- /dev/null +++=20
>>>> b/Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt
>>>
>>>
>>>>
>>>>=20
> Rename these files to conform to the current naming convention.  In
>>> -next we currently have 'altera-mailbox.txt' and=20
>>> 'omap-mailbox.txt', so 'bcm2835-mbox.txt' seems appropriate.
>>=20
>> Will do.
>
> I believe all the current bcm2835 bindings use the compatible value as
> the filename. I personally prefer this to picking a different "random"
> name for the filenames. It means you only have to name the thing once,
> and then use the same value for the compatible property and binding
> document.

"git grep brcm | grep 2835" thinks that we're quite confused on whether
you put the "brcm," in the filename or not.  And then there's some that
don't follow either convention:

watchdog/brcm,bcm2835-pm-wdog.txt:	compatible =3D "brcm,bcm2835-pm-wdt";
pwm/pwm-bcm2835.txt:	compatible =3D "brcm,bcm2835-pwm";
rng/brcm,bcm2835.txt:        compatible =3D "brcm,bcm2835-rng";

>>>> +Example: + +mailbox: mailbox@7e00b800 { +	compatible =3D=20
>>>> "brcm,bcm2835-mbox"; +	reg =3D <0x7e00b880 0x40>; +	interrupts =3D=20
>>>> <0 1>; +	#mbox-cells =3D <1>; +};
>>>=20
>>> It would be good to see the client examples here as well.
>>> Please consider pulling in brcm,bcm2835-mbox-power.txt and=20
>>> brcm,bcm2835-mbox-property.txt.
>>=20
>> Oh, so have those two just smashed into this file as one set of=20
>> documentation for everything to do with mailbox on bcm2835?  That=20
>> seems good to me.  When I was adding the client drivers, the fact=20
>> that the other brcm file was named after the compatible string
>> made me generate new files under then new compatible strings, but
>> the other drivers already in the tree obviously aren't formatted
>> that way.
>
> The HW mailbox seems like a different process to the upper-layer
> protocols/message formats running over the top of it. Sure right now
> the Pi has a single firmware, but do all bcm2835-based devices share
> the same firmware? Is so, we'd be warranted in lumping the HW and
> firmware protocol together, but I rather wonder whether e.g. the
> bcm2835-based Roku uses the same firmware protocol?

I don't know the answer to that one, and I've only got RPi firmware
myself.

Ultimately, my hope is to get enough merged that we can basically get
off the firmware, other than the bits of clock management that are only
doable from the VPU.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJU90SWAAoJELXWKTbR/J7oFtQP/0tQ5E4KlCvndNfAZP2hT11A
wq1o816LjjRqtOgWsLYy5mbEeWL6uGEPCSJBTFyjpUBf2RvyOR0HY6T4fpUO4Nf3
quTa8jo3ZtqkjGq3xcRGHQwhNoMOPT6uGXf66gftJPsrBChsRwPCpPKatf+3hs4w
5TCF4OuGAb9b7Okd5kiZDHW+Rhbn6zSWT15/EI6Z4xtAjryD1m3+yf2gzUZU6j22
u/62mmSEzCEmK5Cw9yPm0y7ESbbIE0j0HiPlwXNtn0iFkqBYwDcBTf1iEcdOeEZe
XUIn2/mw01TBhgXx66qXWeMdBMnDcs+V53U+b1OfAo9brnctpfFjK3tl8xntHIp4
gkK8+wbxcb3Wyp3CwGw/3T0Xu5dRh/i1WT5XuXfv1T0DSpgxYJHuwNHTDVtYrlhw
Ai/r9Kfc2gifpl5XLBN9GVDp6P8S6kGnGt+vQ0Oeb6WTwRx1nvjx1p4xCNlVgwqm
oLB9z3OJFFh6PfGHu8ZGaAkaVa0EvjsmN8F+4+p6wF9B0txD8CllexckxSNIyvgH
0qSuGBxGPPhZuGDlKDVFO8UB8BXgj9mu+94gQqFaAf5tlJ7WykAVgxbR0W+4LOSI
v9qKEVQ7/XF06vsonxKI9l2CZCTTGi7P73582q+ZwrWbbp3R40P47yBfRd2cBis7
/HIw7vHVX7k4iamOiLbP
=L+Yk
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
