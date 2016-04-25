From: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: devicetree: avoid duplicated matching code (was: Re: [PATCH 1/3] xhci: plat: adapt to unified device property interface)
Date: Mon, 25 Apr 2016 09:38:41 +0300
Message-ID: <87mvoiry4u.fsf@intel.com>
References: <1461064246-27350-1-git-send-email-heikki.krogerus@linux.intel.com> <1461064246-27350-2-git-send-email-heikki.krogerus@linux.intel.com> <87fuuf9pip.fsf@intel.com> <CAL_JsqLVAN_dEcGUbNyiBjFJTSPSPjMKzWG9QBoJ71whpfmBiA@mail.gmail.com> <874mav9i9z.fsf@intel.com> <CAL_JsqLh76fPT0CWo6r=5TGJebXO5sLZ-BOtGZ=-fd1+n5S5eA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLh76fPT0CWo6r=5TGJebXO5sLZ-BOtGZ=-fd1+n5S5eA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mathias Nyman <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:
> On Thu, Apr 21, 2016 at 8:57 AM, Felipe Balbi
> <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
>>
>> Hi,
>>
>> Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:
>>> On Thu, Apr 21, 2016 at 6:20 AM, Felipe Balbi
>>> <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
>>>>
>>>> Hi,
>>>>
>>>> Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> writes:
>>>>> @@ -197,7 +196,7 @@ static int xhci_plat_probe(struct platform_device=
 *pdev)
>>>>>       }
>>>>>
>>>>>       xhci =3D hcd_to_xhci(hcd);
>>>>> -     match =3D of_match_node(usb_xhci_of_match, node);
>>>>> +     match =3D of_match_node(usb_xhci_of_match, pdev->dev.of_node);
>>>>
>>>> Rob, it's weird that OF-based drivers have to redo the same matching
>>>> which was already done by drivers/base/platform.c::platform_match() ju=
st
>>>> to get match->data. If we know we matched, couldn't we just cache a
>>>> pointer to match->data in struct device_node.data ? Something like
>>>> below? (completely untested)
>>>
>>> Yes, it is. AIUI, there is some sort of race condition in doing what
>>> you suggest though. IIRC, Grant did that and reverted it if you look
>>> at the git history.
>>
>> looking at drivers/base/platform.c I can't find anything along these
>> lines. Adding Grant.
>>
>> Grant, any memory left of this race ?
>
> https://lkml.org/lkml/2011/5/18/384
>
> tl;dr: matching and probe is not atomic.

cool, thanks

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXHbtyAAoJEIaOsuA1yqRE2CMP/0Dti7Hr1bzh7r//GU+3a0ip
nRT6ubLX5HJRDKwblEyk3bpdCsiI/uZYPDVcB2YhL7z1/C09o1NnAPnsE180HTd3
wRY95TmoAYpXZzXmR0qg1HEHG5uCILNCnafdACWpsIE395YHlYdYeR0tP73Rr7oY
KvSYu3Afto5hTinar+iz9Cp59ArWzAErHz8IMNOPdpVOP1WlIPFkcUcE9LDwvjTF
rxt+LbswUCeLDwNKU+uSjBFavOOPTecwmfd8VUhoVhDZ2kcIgor8k6Ue2zblzF4K
Bss33kc+cA+1miXVXpZ7Vrj+GYI79asWqH+2DQVW7JFu3OJc5UpheeefVqg0zSpR
vBUj5Oe4+6wJlk1a/YdFjmcGyChzM0KI6mxfwOLcL/YbzZv8AR4jjdclYGEfOA3Y
vNwlRImaP71U0053I9Apq5Yy9RYvNzyoG6k173+hSMtSnkfjCnjayjEtwBP1/m6h
uo90ekdq8egldYSBosOwjv4/URMvowgUcmD2sGdBNjRPuMY0Td3OFW2LxQh409Gn
lGOO8wPki6J+oghS39hoZejhxz2EBz09D2pg3j+8zIYuVquDbC963XImjmdAgwBk
9dibO695flhNVMZfA4pl73HdU3EA/oIHM9t3yYZbRIYUTP+WwYdm9+LSbkIECEs0
w9srkfVmWtTp52jzpd29
=UjAJ
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
