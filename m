From: Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Subject: Re: st_fdma: Firmware filename in DT?
Date: Fri, 4 Sep 2015 08:36:44 -0600
Message-ID: <E3D6542F-E788-4936-A3B1-E17549205B9E@bsdimp.com>
References: <20150903144944.GC7093@griffinp-ThinkPad-X1-Carbon-2nd> <20150904092005.GA2990@griffinp-ThinkPad-X1-Carbon-2nd> <20150904102130.GA4796@x1> <201509041504.38412.arnd@arndb.de> <20150904132617.GB4796@x1> <CAL_Jsq+XpBV+BMMq1gYnvKtv6O5mjqVw6zsP4G-4Za3cQm9PzQ@mail.gmail.com> <20150904135407.GC4796@x1>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Content-Type: multipart/signed; boundary="Apple-Mail=_2AD83DE0-7D5A-4868-BBBB-0F8B38722614"; protocol="application/pgp-signature"; micalg=pgp-sha512
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150904135407.GC4796@x1>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Apple-Mail=_2AD83DE0-7D5A-4868-BBBB-0F8B38722614
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Sep 4, 2015, at 7:54 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>=20
> On Fri, 04 Sep 2015, Rob Herring wrote:
>=20
>> On Fri, Sep 4, 2015 at 8:26 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> =
wrote:
>>> On Fri, 04 Sep 2015, Arnd Bergmann wrote:
>>>=20
>>>> On Friday 04 September 2015, Lee Jones wrote:
>>>>>>> If we flip it the other way round, some subsystems derive the =
firmware
>>>>>>> name from the 'node name'.  For instance, our zeroth General =
Purpose
>>>>>>> Co-Processor RemoteProc driver has a corresponding node called
>>>>>>> 'st231-gp0@40000000'.  RemoteProc adds an 'rproc-' prefix and a =
'-fw'
>>>>>>> suffix and et voil=C3=A0, we load file:
>>>>>>>=20
>>>>>>>  lib/firmware/rproc-st231-gp0-fw
>>>>>>=20
>>>>>> IMO deriving from the node name seems fragile. Also imposing a =
linux'ism
>>>>>> "rproc" prefix on the firmware name doesn't seem correct as the =
firmwares
>>>>>> can be shared across OS's. Although this is how remoteproc subsys =
core
>>>>>> is currently working. It seems a generic DT firmware binding =
would actually
>>>>>> be most useful for the remoteproc subsystem.
>>>>>=20
>>>>> The "rproc-%s-fw", where %s =3D=3D driver name, is only a =
fall-back.  The
>>>>> RProc driver is welcome to supply a different firmware name if it
>>>>> desires.  This is where I think a generic 'firmware' property =
would be
>>>>> of use.
>>>>=20
>>>> The firmware file name is agreed on between the device driver and =
the
>>>> file system, so encoding the linux driver name in it seems =
appropriate.
>>>>=20
>>>> Generally speaking, I'd say a good policy would be to try basing
>>>> the firmware name on the "compatible" property strings. That =
property
>>>> already contains a hierarchical list of models, which makes it =
particularly
>>>> easy to have firmware files for specific models or those that are =
shared
>>>> across multiple variations if necessary. Just ask for the most =
specific
>>>> compatible string first and try the more specific compatible =
strings
>>>> (with an appropriate prefix and/or postfix added by the driver) =
until
>>>> a file is found.
>>>=20
>>> It depends what you mean by "basing the firmware name on the
>>> \"compatible\" property" here.  If you mean actually renaming the
>>> firmware binary file to match a driver's compatible string, that's
>>> absolutely out of the question.  Firmwares are not only OS agnostic,
>>> but are also independent of any H/W description language a =
particular
>>> OS or platform might be using.  Using DT'isums to rename these
>>> binaries is not logical.
>>>=20
>>> However, if you mean simply match on compatible string and supply =
the
>>> name from within the driver, that's closer to the mark (as then we =
can
>>> at least keep it in-house [kernel]), but it's still not particularly
>>> practical for the aforementioned reasons mentioned by Peter earlier.
>>>=20
>>> Why not just create a new 'firmware' property?  Simples! [0]
>>=20
>> Someone give me some evidence that other OS's use or will use the =
same
>> names. Does *BSD use linux-firmware would be enough. With the
>> complaints I get that bindings are just Linux driver properties, I'm
>> not inclined to take this. Having a filename does imply the OS has a
>> filesystem and drivers can access the filesystem which may not always
>> be true.
>=20
> Peter already provided a real-world example of multiple OSes using the
> same Firmware based on his experience at ST.  Any vendor using this =
API
> who doesn't _soley_ use Linux is likely to use the same firmware files
> across all platforms.  The co-processor's jobs don't often change just
> because the platform is running a different OS.
>=20
> I don't know enough about the inner workings of other Operating
> Systems to comment on your final statement, but if they can get
> access to the filesystem them they'll need the name too.  If they
> don't have access to the firmware file, then they don't require the
> property and it becomes unused by them.  That's not an issue is it?

Based on my experience with FreeBSD and different firmware and
such, I=E2=80=99d have to agree with Peter. FreeBSD often uses the =
vendor
supplied firmware, just like Linux, because that firmware establishes
the ABI for talking to the device. This ABI is typically OS agnostic,
and when it isn=E2=80=99t that=E2=80=99s more the exception than the =
rule.

As for =E2=80=98not all OSes provide a filesystem=E2=80=99 Sure, but who =
cares. While
the filesystem provides a natural mapping of the property to the
binary data to load (e.g. os-firmware-path + =E2=80=9C/=E2=80=9C + =
property-name), that=E2=80=99s
not the only way to map names to binary blobs. FreeBSD itself allows
one to compile firmware images into the kernel, and those images
are addressed / found by name, even though no filesystem is involved
based on what the driver desires to load. I would imagine that an OS
minimal enough to not support a filesystem would run into this sort
of issue often enough to provide a mechanism similar to FreeBSD. Failing
that, I=E2=80=99d imagine driver writers would compile images into their
drivers on such a system and use the name to pick which one to load.

Warner

--Apple-Mail=_2AD83DE0-7D5A-4868-BBBB-0F8B38722614
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJV6ax8AAoJEGwc0Sh9sBEASGUQAI16yUZkqvmCvjQ8hGIeyzRZ
3vQFwh1dhzH/BO+8OIyKhxIaljHQrZ+/LzobvcPauGL3/iiNZMkM0EtR0dbV5i2Y
ezqXOiQBXpPcVmuVrHcfDwyamMKoqzcfL1V1bwqUCaEcLp3QsS176B7iaVGN6PKC
F+Bkwu32t105CQ6vcXSdiKyBsadxkfd3RjIKE3MapIJUI95vtXUXlOeqLt+NkTpn
wGhZcoxw3iu37PjgUMZfxS2o/nKXyUuz5zXblHDPLw8QxV2/PrbSjwxj+ZhrHvIo
FAcYmrn1rkhqYVzOMAhxzbnZeks/ghNZbT+uS5bgQqHgG3BCM2JUqXUHdnDrDlm1
ivdztt0etxMCPm8UyS2eax7WWBR56kMnkErieNUn3AhrD6eSrEn0h9/hCUY9TdmJ
qeyDyJ2atn1LiF7FM/06HlGfpQbSuVdCNurkfv7k/OpXqcDLZV/Qni5bqNHTcTEa
VIxVWHEU8ErRW98LG5J695pbmdzjlc4eE3tjSWNmGb/q5CvHMSgoczg910MDRfo+
Qj5cpSmuHqk6jybC1bESR6wfcccym+WRQ4FuZRrAc38CDUHHHrhk8G7p36hCgl0R
EKaFyvSyMsiQBkqQbWDLOAfUcqLiBFeKPiQ6D38TlwGN4KNq8509AG402M4iQKfM
do6kQDQjtkmLSi7Tyey6
=Mc7w
-----END PGP SIGNATURE-----

--Apple-Mail=_2AD83DE0-7D5A-4868-BBBB-0F8B38722614--
