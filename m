From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 1/3 v5] dt/bindings: Add binding for the BCM2835 mailbox driver
Date: Wed, 29 Apr 2015 09:39:23 -0700
Message-ID: <87vbgeq478.fsf@eliezer.anholt.net>
References: <1430173644-19099-2-git-send-email-eric@anholt.net> <1430253868-11138-1-git-send-email-eric@anholt.net> <55403446.1040207@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55403446.1040207-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:

> On 04/28/2015 02:44 PM, Eric Anholt wrote:
>> From: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
>>=20
>> Signed-off-by: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
>> Signed-off-by: Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>
>> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
>> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
>> ---
>>=20
>> v2: Split into a separate patch for submitting to the devicetree list.
>>     Consistently start node docs with a capital letter. device's
>>     address in the example shouldn't have "0x". Drop machine-specific
>>     interrupt numbers from the docs.  (changes by anholt).
>>=20
>> v3: Move the file to just bcm2835-mbox.txt, clean up formatting
>>     (changes by anholt, from review by Lee Jones).
>>=20
>> v4: Move file back by consensus from various Broadcom platform
>>     maintainers (changes by anholt, acked by Lee Jones).
>>=20
>> v5: Document that the mailbox cell should be 0 in clients, and add an
>>     example of a client (changes by anholt, from review by Jassi).
>
> Some mention of what you changed in the patch might be nice, since it
> was originally authored by someone else, and there's quite a changelog.

I've been taking this changelog stuff out of the patch and putting it
below '---' because when I was submitting this series before, I got
chided for putting it in the patch!

>> diff --git a/Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox=
.txt b/Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt
>
>> +- #mbox-cells:	Specifies the number of cells needed to encode a mailbox
>> +		  channel. The value shall be 1.  Clients should supply a value
>> +		  of 0 for the mailbox channel, because there is only one
>> +		  exposed
>
> Can't you use #mbox-cells =3D <0> if there's no data to provide?

of_mbox_index_xlate looks like it's always dereferencing the first arg.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVQQk7AAoJELXWKTbR/J7oZhgP/3gp3yXJtOfQkMj/DHOtMqil
HoPhfQDAqBQ2doGINtzgPmRtUI+sBxZNQHqXJcrLrJUg6VzEauEH8TsPXXxpJE2Z
OL/cowWmks4u1PeLMUzEZxe6ggCl26+vNM3Xbk2qveZkVOhwjMKxbYEa9cB33/SU
a3J2XHKsovTMK7rsMBtG7lPWBo5+VrzsXiiBgp36b62tL297R5tBUwUnu+XLemD5
zMgrphiTi9WYa0CZJJiPLmvoL8DbiqZQnzM85w4nWssfsJ9aaazcASTuoUZXN+FF
046lMeh6zNO/yPUZPcaEAuKDOdDQRFrXvKXwrwpu4iJQsdkjmKFGi133uKvmnWBW
UAIX9lCHvR1/3TpjUTnEkUAK+/8whDw2JJmB5F+uiutwXvRH880l+UdC4j2QySi3
/YAhwaGq0gaIlXzGpL6oh9yiQuk7y2gXWQQ2wm4VDGkNMpDW7/Vht64t12k+djhl
cYXGCwhJ2MUhKxLjkYS9NeODI/2FRt59XD61h94EdJ0Jt/TXx1XXcwT/K2D6o00A
Ay61BHqPpZa56ARd49wwPbEWvuVDSgHaIl6NZvbMF/hhHVrjTYWpIFuWQfF4bRYf
vskUaCKERWKg2t0euj3wc01JY06CR+Rl/1EGAvnLcKeEdDG+WceADJnl95+08A1c
yJyT6UnhhtDAIX1UeuBI
=84Ob
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
