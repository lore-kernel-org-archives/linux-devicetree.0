From: Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Subject: Re: st_fdma: Firmware filename in DT?
Date: Fri, 4 Sep 2015 08:27:05 -0600
Message-ID: <5E0DCAA5-DB90-4682-92F2-061A07FE973E@bsdimp.com>
References: <20150903144944.GC7093@griffinp-ThinkPad-X1-Carbon-2nd> <CAL_JsqKQqbAQCPR6xuR2Ke5gEdX4kQYb29-W3qNaZqjM_JBoYg@mail.gmail.com> <20150904065916.GZ4796@x1> <20150904092005.GA2990@griffinp-ThinkPad-X1-Carbon-2nd> <20150904102130.GA4796@x1>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Content-Type: multipart/signed; boundary="Apple-Mail=_4746A553-53CF-4A54-A2B1-50C1C6ECC5DB"; protocol="application/pgp-signature"; micalg=pgp-sha512
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150904102130.GA4796@x1>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Apple-Mail=_4746A553-53CF-4A54-A2B1-50C1C6ECC5DB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Sep 4, 2015, at 4:21 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>=20
>>>>> We could do it by parsing the node name e.g. fdma0-audio, or by =
adding
>>>>> a "instance" DT property to the node?
>>>>=20
>>>> Generally we try to avoid caring about node names. Having some =
index
>>>> or numbering also comes up which we also try to avoid. Generally, =
if
>>>> you care about which instance you use for something, then there is
>>>> some property you care about and should add.
>>>=20
>>> Right, the alternative is a property like the ones already used.
>>> However, as these are becoming more prevalent I suggested
>>> standardising the property to avoid all these vendor specific =
firmware
>>> properties cluttering up the place.
>>=20
>> I agree a proliferation of vendor specific firmware properties isn't
>> s good way forward.
>>=20
>>>  firmware =3D "firmwarename.fw";
>>> OR
>>>  firmware-name =3D "firmwarename.fw";
>>>=20
>>> ... seems appropriate.
>>=20
>> Either of those is fine with me.
>=20
> Just need a DT nod and I'll happily code it up.

=46rom a FreeBSD perspective, having a filename for the firmware to
load for this node is fine. It doesn=E2=80=99t impose a substantial =
burden on
the OS so long as the choices of where that file lives is up to the OS
and not encoded in the property. A note saying =E2=80=98this firmware =
should
be loaded=E2=80=99 seems a reasonable description of the hardware since
the DT tells us many things about the device, and those things may
well be dependent on which firmware is loaded. Having an explicit
name is good since it helps insulate from DT and doesn=E2=80=99t force =
vendors
to do silly renames. It also allows for multiple devices of the same
type to have different firmware loaded.

FreeBSD would generally put these things in /boot/firmware and
it has a generalized mechanism to load the firmware at run time
that=E2=80=99s based on this. While the path names are flexible, having
the firmware live in a central place is useful from an automation
point of view. Having just a name, and not a full path, enables
this policy, while still allowing others to have other policies.

Linux distributions would be free to do whatever they wanted
and implement other policies than FreeBSD.

So a property like this, with the semantics discussed, seems to
meet the OS independent test.

Warner


--Apple-Mail=_4746A553-53CF-4A54-A2B1-50C1C6ECC5DB
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJV6ao6AAoJEGwc0Sh9sBEAuUIQANTESxYkz6KSEzhpNRhVmtH7
qcozM5GVJtwFxZ3fcx5VfIsoGfsphLhWjwiz/ufpTiZavZiWkbVxmL8c4iwzzZWD
lazJZPq1VugMU2PvCbzJ4NGAkOvB4z1TMNPqrPdewPGuwOyYX9logFw0R9dyhvsU
HPTPjKqlryEBZN2vlmG/cDVmma85Qgdokr3QsQSaOqHuKx8oCRAMS3YSZVZNB5eQ
DA5UygpCA0/dOUNlf1NGHMSNOi4AP5S9ZGsX0mhs4e+WgVvC/yJa0LLOoo4gpb3p
LTHnmWqx7XyysXg+dW0Kpm6VlFZp7MT73/xLsIGCl7Fw5kD5eOqYJ44cnNW+DRO+
TTNChBh2Qov/8U0briiRs2hTH6bdXs+N1L/N/SL06szrdp6L5GPiRBaAHz1zGrlI
euLRLymTUGSI75WkkqafyenovzIV3Wx6LoITK8cpg/Csmsb6XLOK95hlnmfs5dtp
wco2mknOLx4A/69wbI3XEs5sA/RiUaALxhzidm5A27Znkz0uC45S3FGejtFRy3qD
ct6AJN+DWGWRHnB2OA2A0d/fbuo+b+f6Ukumo93daSt9nD78ueXsZOuBc1XA2Vdd
1o8/9AWPY4MlRWaf9GfotOaiSL7mZOEP53TyZIljk3CsSCM99wcunV+s6O0e+7Xs
uL4yNUgfQ3WRK6wL/vXQ
=wLDJ
-----END PGP SIGNATURE-----

--Apple-Mail=_4746A553-53CF-4A54-A2B1-50C1C6ECC5DB--
