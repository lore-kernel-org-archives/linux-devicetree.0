From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] simplefb: Fix build failure on Sparc
Date: Mon, 5 Jan 2015 14:13:06 +0200
Message-ID: <54AA7FD2.7040701@ti.com>
References: <1420445716-13468-1-git-send-email-hdegoede@redhat.com> <54AA72CB.1020303@ti.com> <54AA73D1.3@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="2s9He6u5Xxb0QaJBxqmOP5L2paBIlaHKA"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54AA73D1.3-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: kbuild test robot <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--2s9He6u5Xxb0QaJBxqmOP5L2paBIlaHKA
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 05/01/15 13:21, Hans de Goede wrote:
> Hi,
>=20
> On 05-01-15 12:17, Tomi Valkeinen wrote:
>> On 05/01/15 10:15, Hans de Goede wrote:
>>> of_platform_device_create is only defined when CONFIG_OF_ADDRESS is s=
et,
>>> which is normally always the case when CONFIG_OF is defined, except
>>> on Sparc,
>>> so explicitly check for CONFIG_OF_ADDRESS rather then for CONFIG_OF.
>>>
>>> Reported-by: kbuild test robot <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
>>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>   drivers/video/fbdev/simplefb.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/video/fbdev/simplefb.c
>>> b/drivers/video/fbdev/simplefb.c
>>> index 92cac80..1085c04 100644
>>> --- a/drivers/video/fbdev/simplefb.c
>>> +++ b/drivers/video/fbdev/simplefb.c
>>> @@ -402,7 +402,7 @@ static int __init simplefb_init(void)
>>>       if (ret)
>>>           return ret;
>>>
>>> -    if (IS_ENABLED(CONFIG_OF) && of_chosen) {
>>> +    if (IS_ENABLED(CONFIG_OF_ADDRESS) && of_chosen) {
>>>           for_each_child_of_node(of_chosen, np) {
>>>               if (of_device_is_compatible(np, "simple-framebuffer"))
>>>                   of_platform_device_create(np, NULL, NULL);
>>>
>>
>> Doesn't this depend on the compiler optimizing the
>> of_platform_device_create call away?
>=20
> Yes it does.
>=20
>> Isn't that rather dangerous assumption?
>=20
> The kernel relies on being build with optimization enabled in various
> places,
> this specific construction was suggested during review (by Grant Likely=

> IIRC)
> I initially had an #ifdef here. Note that this construction is used in
> various
> places throughout the kernel and it seems to be used more and more ofte=
n.

Ok. Well, I can't say I'm very happy about that, but if that's the
common accepted way, I'm fine. I'll queue this for fbdev fixes.

 Tomi



--2s9He6u5Xxb0QaJBxqmOP5L2paBIlaHKA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUqn/SAAoJEPo9qoy8lh712FIP/0Q9axkBLxpbGzd4MvYGckmn
w0n7id+8hzF1NzXOIB1zBy2AvzQ0p4bURMklqEYYFW1Vdm1xjO+AZnBrmWJ8p/Vq
Apwx7jC4NAcYS4wP0utEeKENoiEsxUUAbuOwM62lYKj4nBIFUJdUqCWccgF1Gg0j
xtTElcXeYa9ch7r2/uD5UTzdCqyKcGEC7mp8B4cPf73cI0Ewy25u9ICAl0DAIRRy
r9AOSAHrYYMFASX2T3GapShhKttJGTwJqFab3GVRgT33l7F7dpv2hC/wMol6uTOJ
oWBuaSDkHoHhNLYuY/yyVVqhduiq4cwz1ZNm0vMqwG6DuFslVjd1XevT63ZhLFqh
26s2NIkj4gmQgfOhmz/QTFZvJrMD4Y329hnzWXLdyY0u99k8v0A+DPzZiktJJaGO
Fcfv8mJUuhXh6uxttABC+1qmE7G6sOWdl4FAPidyYUUEKyNpG9B7CFPAeCEnuoOa
2qbYg6qhop+lptPTTA25zvQ2ohRLmOI7XSzdFLx9qfsDHr9IrygpzKXKfxi47Vj3
CJLRSoeKqqRkVwXXSsIuiR31Xs7kAsUWWg62o9pk7YG1dnyrX66WPHH7kcoAo7Zs
7GhCM9gTXDhpC4Y39SgywXYDiPuw14lvTjdIV7L5SR99Icn7TAQ2yrYo5s6nynmL
k0Qnozm3vf/wW9vjuJ10
=VB5N
-----END PGP SIGNATURE-----

--2s9He6u5Xxb0QaJBxqmOP5L2paBIlaHKA--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
