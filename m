From: Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Subject: Re: Device Tree Blob (DTB) licence
Date: Sun, 31 May 2015 01:12:03 -0600
Message-ID: <8F98C0FD-D60D-46CB-A42D-10690A097573@bsdimp.com>
References: <1430820315.19516.26.camel@opteya.com> <CAL_Jsq+T5c7qornpRVCduEjUSCeM+0xqbtVYovtH76y=4BqhLQ@mail.gmail.com> <1432289148.5304.58.camel@opteya.com> <556A169E.8030909@myspectrum.nl>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: multipart/signed; boundary="Apple-Mail=_2960D190-7035-4866-90F8-CB926248C282"; protocol="application/pgp-signature"; micalg=pgp-sha512
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <556A169E.8030909-D9wZyEIIrd305oU+jsXUgg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeroen Hofstee <linux-arm-D9wZyEIIrd305oU+jsXUgg@public.gmane.org>
Cc: Yann Droneaud <ydroneaud-RlY5vtjFyJ3QT0dZR+AlfA@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, freebsd-arm-h+KGxgPPiopAfugRpC6u6w@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Apple-Mail=_2960D190-7035-4866-90F8-CB926248C282
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On May 30, 2015, at 1:59 PM, Jeroen Hofstee <linux-arm-D9wZyEIIrd305oU+jsXUgg@public.gmane.org> =
wrote:
>=20
> Hi,
>=20
> On 22-05-15 12:05, Yann Droneaud wrote:
>> Le mardi 05 mai 2015 =C3=A0 11:41 -0500, Rob Herring a =C3=A9crit :
>>> On Tue, May 5, 2015 at 5:05 AM, Yann Droneaud <ydroneaud-RlY5vtjFyJ3QT0dZR+AlfA@public.gmane.org>
>>> wrote:
>>>> I believe Device Tree Blob (.dtb file) built from kernel's Device
>>>> Tree
>>>> Sources (.dts, which #include .dtsi, which #include .h) using
>>>> Device
>>>> Tree Compiler (dtc) are covered by GNU General Public Licence v2
>>>> (GPLv2), but cannot find any reference.
>>> By default yes, but we've been steering people to dual license them
>>> GPL/BSD.
>>>=20
>>=20
>=20
> obviously these files should be reusable. If there is a license issue
> with that it should be fixed. cc-ing freebsd-arm-h+KGxgPPioqbup2nOX2J7Q@public.gmane.org

FreeBSD segregates the files that its contributors have written and
are under BSDL from those that are received from upstream and
may be under BSDL+GPL or just GPL in its source tree.

The source is shipped, the binaries are not, at least by the FreeBSD
project. The FreeBSD project used to create its own custom dts
files that were incompatible with anything except FreeBSD. However,
apart from a few stragglers, we=E2=80=99ve converted all our supported =
platforms
to using the =E2=80=98vendor supplied=E2=80=99 dts files, which means we =
follow the
documented conventions found in Linux, as well as many of the
strange Linuxisms that seep into this or that .dts file. Following the
standard here and accepting some potentially GPLd code into the
tree given its limited scope and already segregated nature.

It is an open question to what extent the mere-aggregation clause
would apply to the typical use of placing the dtb into a filesystem
that u-boot then passes along applies. And if that same reasoning
applies to a binary bundle containing both the kernel and the dtb
file. It=E2=80=99s also an open question the extent to which copyright =
applies
to the dts files since they are, in theory at least, just an expression =
of
facts and there=E2=80=99s generally only one way to correctly express =
those
facts in a dts file. The GPL=E2=80=99d files aren=E2=80=99t stopping =
anybody from creating
proprietary software. People that really care will rewrite the files
from scratch anyway. People that don=E2=80=99t care.. well, one need =
look
no further than the difficulty of getting source code to different SoC
support packages for the kernel in the Android world to see how
much some people care about GPL compliance and how much
it really stops them from doing what they want.

Than again, I=E2=80=99m not a lawyer, and this isn=E2=80=99t legal =
advice.

Warner

--Apple-Mail=_2960D190-7035-4866-90F8-CB926248C282
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJVarREAAoJEGwc0Sh9sBEAKL4P/1YbK+3LRuBImjlERUmmqYOY
DXKAJxwINF/VkjUo3Z+/T92G+41N32f+fa2LpWsD/trRYnG1xBTnHVULBLNQsOtw
gz6YSietcdzSx6xyHqtD4AzdROWh1NYzjhA/dxm3l0/YeLx3g2XuRMqWaYN0NPG/
7UlMraYOCaGhU4DaoiDcMj7hVrNwIrbLDLMrItfb+Jq7MIdi+H0GIaNtQy2mvUZv
8DU6ycB8isCZSoUIIRfdfmiLdFhQNYUInGWjcgw8s7zPPo/703Vegf0wtRqZ1JcS
PUIt56tauJoJlPkckCR12WciWnfsz7EHGEYLTsuV7fiMixOkRJH1eY1VaI9zSYU+
i0qWZSF1GGZEXEdVpKwbqCBgJiGhnyaFz7plKcmudXUiXbWAkPkrxV7CIPQb7xHs
ZLe6rP3wVOE+yad+69k8WhznQjWoszUNPwnm82jwIJy3LF8Ew6rGSOpxvVZgnLbl
juf7ee8Q5N683kUy9scyR1EY+NyyHu2NApeFnOpuD2w5CBY/b6eOqWwpDTgF0qn5
GctT0WfY9vfkG2YPudhZMQbhaoVgFMwmfKzevly1ymXYAwwmm2CtYklVX1JlQD4u
CqkfaGnEVHsteQOsYII1KtfQT9be58ZzpFmh2gnNlhgL/Q2xl1fEdNhmeX9jMjvv
Hv+Hq31kimjlzH6B6hD2
=etBv
-----END PGP SIGNATURE-----

--Apple-Mail=_2960D190-7035-4866-90F8-CB926248C282--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
