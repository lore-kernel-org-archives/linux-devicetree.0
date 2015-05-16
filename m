From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH/RFC] kbuild: Create a rule for building device tree overlay
 objects
Date: Fri, 15 May 2015 17:47:38 -0700
Message-ID: <555693AA.1000105@gmail.com>
References: <1431431816-24612-1-git-send-email-geert+renesas@glider.be> <D4386733-8722-478F-8BB6-FB86597D9E37@gmail.com>
Reply-To: frowand.list@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <D4386733-8722-478F-8BB6-FB86597D9E37@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-kbuild@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 5/12/2015 7:33 AM, Pantelis Antoniou wrote:
> Hi Geert,
>=20
>> On May 12, 2015, at 14:56 , Geert Uytterhoeven <geert+renesas@glider=
=2Ebe> wrote:
>>
>> This allows to handle device tree overlays like plain device trees.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> Questions:
>>  - Do we want dtso files under arch/<arch>/boot/dts/, too?
>>  - Do we want to move the dts files outside the kernel repository
>>    first?
>>
>=20
> Oh that=E2=80=99s a nice hornet=E2=80=99s nest you=E2=80=99ve kicked =
here.
>=20
> arch/<arch>/boot/dts should not be the place, cause overlays are not =
related with boot per se.
> As they are right now are board (family) specific.

Aren't overlays meant to describe child boards (capes, shields, whateve=
r) that may
vary from system to system, but are not expected to be hot-plugged whil=
e the OS
is up?  Or is hot-plug a design goal?

If no hot-plug, then to me an overlay is just as related to boot as the=
 base dts.
It is a mere implementation detail that overlays are "loaded" from user=
space
instead of by the booting kernel (I don't really know the details of us=
ing
overlays, so please correct me if I am wrong about how the kernel becom=
es aware
of an overlay).

>=20
> I think we should try to keep an external kernel repo with them for n=
ow until we
> figure out where to put them.
>=20
>> scripts/Makefile.lib | 3 +++
>> 1 file changed, 3 insertions(+)
>>
>> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
>> index 79e86613712f2230..4b14eef1d4b2ce8f 100644
>> --- a/scripts/Makefile.lib
>> +++ b/scripts/Makefile.lib
>> @@ -292,6 +292,9 @@ cmd_dtc =3D mkdir -p $(dir ${dtc-tmp}) ; \
>> $(obj)/%.dtb: $(src)/%.dts FORCE
>> 	$(call if_changed_dep,dtc)
>>
>> +$(obj)/%.dtbo: $(src)/%.dtso FORCE
>> +	$(call if_changed_dep,dtc)
>> +
>> dtc-tmp =3D $(subst $(comma),_,$(dot-target).dts.tmp)
>>
>> # Bzip2
>> --=20
>> 1.9.1
>=20
> Regards
>=20
> =E2=80=94 Pantelis
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-kbuild"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
