From: Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Subject: Re: st_fdma: Firmware filename in DT?
Date: Fri, 4 Sep 2015 08:30:25 -0600
Message-ID: <C93CEE95-AF30-4B2D-BD96-66733B282414@bsdimp.com>
References: <20150903144944.GC7093@griffinp-ThinkPad-X1-Carbon-2nd> <20150904092005.GA2990@griffinp-ThinkPad-X1-Carbon-2nd> <20150904102130.GA4796@x1> <201509041504.38412.arnd@arndb.de>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Content-Type: multipart/signed; boundary="Apple-Mail=_27018884-F6AA-41CF-9F2B-1B9E8CAB9E5D"; protocol="application/pgp-signature"; micalg=pgp-sha512
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201509041504.38412.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Apple-Mail=_27018884-F6AA-41CF-9F2B-1B9E8CAB9E5D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Sep 4, 2015, at 7:04 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>=20
> On Friday 04 September 2015, Lee Jones wrote:
>>>> If we flip it the other way round, some subsystems derive the =
firmware
>>>> name from the 'node name'.  For instance, our zeroth General =
Purpose
>>>> Co-Processor RemoteProc driver has a corresponding node called
>>>> 'st231-gp0@40000000'.  RemoteProc adds an 'rproc-' prefix and a =
'-fw'
>>>> suffix and et voil=C3=A0, we load file:
>>>>=20
>>>>  lib/firmware/rproc-st231-gp0-fw
>>>=20
>>> IMO deriving from the node name seems fragile. Also imposing a =
linux'ism
>>> "rproc" prefix on the firmware name doesn't seem correct as the =
firmwares
>>> can be shared across OS's. Although this is how remoteproc subsys =
core
>>> is currently working. It seems a generic DT firmware binding would =
actually
>>> be most useful for the remoteproc subsystem.
>>=20
>> The "rproc-%s-fw", where %s =3D=3D driver name, is only a fall-back.  =
The
>> RProc driver is welcome to supply a different firmware name if it
>> desires.  This is where I think a generic 'firmware' property would =
be
>> of use.
>=20
> The firmware file name is agreed on between the device driver and the
> file system, so encoding the linux driver name in it seems =
appropriate.

Encoding the driver name is not OS independent. It fosters the
impression that DT isn=E2=80=99t OS independent, but rather some silly
Linux toy and hurts wider adaptation.

> Generally speaking, I'd say a good policy would be to try basing
> the firmware name on the "compatible" property strings. That property
> already contains a hierarchical list of models, which makes it =
particularly
> easy to have firmware files for specific models or those that are =
shared
> across multiple variations if necessary. Just ask for the most =
specific
> compatible string first and try the more specific compatible strings
> (with an appropriate prefix and/or postfix added by the driver) until
> a file is found.

I think this is a horrible policy. It is an ugly kludge that is fragile =
to change.
While it sounds cool, I don=E2=80=99t think it is really a viable one. =
It requires
different compatibility names for different bits of hardware that might =
otherwise
be the same just to get different firmware. Sometimes this may be OK,
but it does seem needlessly limiting for systems that may have firmware
=E2=80=9Cimages=E2=80=9D that are loaded into one hardware block, but =
actually control
other blocks indirectly (where the different compat strings would be).

Warner


--Apple-Mail=_27018884-F6AA-41CF-9F2B-1B9E8CAB9E5D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJV6asBAAoJEGwc0Sh9sBEAW2wQAOGOctZ0djmD2UOoZuS8Uu0s
yGxZARc5nsM0KPHkbdipBM6PIFHo9SPP1O576LPheVYsPLR5CWnlWnePlyLUbO10
qeE/OGslopCTs1O+hPX6skmXEN1iLqkjvmjVDqBunSPeE2Vnp/x8TKDyBPDJpmXe
LhN0Ow49/HSGghkjMSkF6anm4Kw7hrC/KRK9Rvl9QOXiy7e+RSiJud4UVyX/sMSS
BmAPTM7NP7jS0M8UhfWU8jXTqZ8iBnpowF2U2ystEmxrZAt6o4F2VOoOqkYn1JL6
bB+ZMf7CvXj51f5arm5RIa4WVpwHoN2CjN4Nc5SNY+wvqAeZK3IFSd5odCp/MJ2c
7Ew1juTDKk//yxBd4nHT/+Pc7eMN0gsv7A+Jz9c585PvaNpt9YuDvPmrZfxwqHtT
5vHfBbae6Cbq5+5xOPeapY0k8qFEjFo9VcAL8YnHK9ThbBJL7z/aPCNLJAQpf6L8
H1BmPnggQR2JcBbEyyIDe0REl3A8HIvgam9OIOLYt7kJi/JgBt63nLIwG1N+ajR1
8jieJto1+qNS09KclTlSTSb4cu/HYLCEsHE3qL9k/msv/cAvMkCskToM72nRnVyS
yjp3owM+sPQw+QKx/sZhrfYQ/RheYuzELPb3E36YM+aWEHurpVABb7dv3dNBo/8P
Yfe+KvQxPKgqwGxcC0aT
=5Ww4
-----END PGP SIGNATURE-----

--Apple-Mail=_27018884-F6AA-41CF-9F2B-1B9E8CAB9E5D--
