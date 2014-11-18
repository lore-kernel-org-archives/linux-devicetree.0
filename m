From: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v1 1/2] efuse: IMG Pistachio eFuse Controller
Date: Tue, 18 Nov 2014 10:32:31 +0000
Message-ID: <546B203F.8060808@imgtec.com>
References: <1416237576-21542-1-git-send-email-arul.ramasamy@imgtec.com> <CAL1qeaHSevOJ-o=nFqgze8utMgTk-Mh7Y9uRMa6wnjeofji98w@mail.gmail.com> <546B152D.1010804@imgtec.com> <1877949.WaxRIbih3M@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="n2A5cI3rGnLmOlX2xLf81rT7PMj6aF92q"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1877949.WaxRIbih3M@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Naidu Tellapati <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Arul Ramasamy <Arul.Ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, James Hartley <James.Hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Ezequiel Garcia <Ezequiel.Garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jude Abraham <Jude.Abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Zubair <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--n2A5cI3rGnLmOlX2xLf81rT7PMj6aF92q
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 18/11/14 10:03, Arnd Bergmann wrote:
> On Tuesday 18 November 2014 09:45:17 James Hogan wrote:
>> On 18/11/14 00:26, Andrew Bresticker wrote:
>>> Hi Naidu,
>>>
>>> On Mon, Nov 17, 2014 at 4:12 PM, Naidu Tellapati
>>> <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:
>>>> Hi Andrew,
>>>>
>>>> (We will respond to James Hogan's remaining review comments in a sep=
arate email)
>>>>
>>>>>>
>>>>>> +obj-$(CONFIG_SOC_IMG)           +=3D pistachio/
>>>>
>>>>> What is CONFIG_SOC_IMG? It sounds very generic.
>>>>
>>>> May I have your suggestions on the above.
>>>>
>>>> (Assuming we create drivers/soc/img/ instead of drivers/soc/pistachi=
o/)
>>
>> What would "belong" in there?
>> Basically anything that doesn't belong in some particular subsystem?
>>
>>
>=20
> I think we have reached the threshold of needing a proper subsystem for=

> efuse/otp devices, and we should move the existing drivers into one
> common directory and find a maintainer who can generalize the interface=
s.

In case anybody is interested, Zubair summarised sunxi and JZ4780 efuse
contents here:
https://groups.google.com/d/msg/mips-creator-ci20-dev/-PeqbbifWAQ/Y-tQQfn=
HqEwJ

It'd be interesting to hear what the IMG one is intended to hold.

Cheers
James


--n2A5cI3rGnLmOlX2xLf81rT7PMj6aF92q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUayA/AAoJEGwLaZPeOHZ6e18QAIqXhlvCM7s4+Ul1lB9TNuYk
NUYrDK+AA6zq71INyZI9fHWFBOnExfLO9JN5/2HjxuncuFaKCDVCzzOAJvBb5Htp
jDpARe7fdWm250iyIaDdZ4WUOTfRzaha26nEdRbXe3rJpNTXDWE4UoXt8lL/5RnO
SZowMXlGn+KbbtM/xA9ZD8O1AEhjRyIo0usXrrnjI9limkWIrbJNYoc9FYNTXWov
WQE7ZzGvLoF3zv478DYgIXXLPU/ECMIxPuaGgeUqanUEUCVNSxrKhVDaoXQM9l5f
+xeUp912qY0m9WPtOMWJgNLSpcGe0w67TplzoIURj/UFicxECdbQulw4+60JvXvA
JmmJPC2JmQimCCT3CJT5StggM/OzOYWIgSBc705bzHCX++XtpYV+zO3Y8+lbBG/9
Q5bNj1+MYXNpX7/BVXo8CcH5NnH6Eg6wgkAQ7TJqRIC3yJmsFwTEmOjQxf0ueXSV
NWYxjOouSKhwj9nRYiDZmtn8cXNSgmj5BIX73Lru8pqMZkQR7KNkYqowKJJDYCrr
lWv/4CUAiCI33DNWt3DAX/vXL0GG+pQ7Fh8GXriS4rm/N28c+YZkr3fyS8V5UUWs
HXkNrY+jdjf9NE+bB3C+il2GG4gKtvhJ7zcEabrU2VGqhnbWm1EKEHwsEfBFB0z3
tLo3Ptmpjspq7kzIe4Tl
=CB3m
-----END PGP SIGNATURE-----

--n2A5cI3rGnLmOlX2xLf81rT7PMj6aF92q--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
