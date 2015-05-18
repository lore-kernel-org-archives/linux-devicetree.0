From: Pantelis Antoniou <pantelis.antoniou@gmail.com>
Subject: Re: [PATCH/RFC] kbuild: Create a rule for building device tree overlay objects
Date: Mon, 18 May 2015 17:13:21 +0300
Message-ID: <2FE8B176-8A95-457C-A9B9-D089FC525E6A@gmail.com>
References: <1431431816-24612-1-git-send-email-geert+renesas@glider.be> <D4386733-8722-478F-8BB6-FB86597D9E37@gmail.com> <555693AA.1000105@gmail.com> <5556A893.9060204@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5556A893.9060204@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: frowand.list@gmail.com
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-kbuild@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Frank,

> On May 16, 2015, at 05:16 , Frank Rowand <frowand.list@gmail.com> wro=
te:
>=20
> On 5/15/2015 5:47 PM, Frank Rowand wrote:
>> On 5/12/2015 7:33 AM, Pantelis Antoniou wrote:
>>> Hi Geert,
>>>=20
>>>> On May 12, 2015, at 14:56 , Geert Uytterhoeven <geert+renesas@glid=
er.be> wrote:
>>>>=20
>>>> This allows to handle device tree overlays like plain device trees=
=2E
>>>>=20
>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>> ---
>>>> Questions:
>>>> - Do we want dtso files under arch/<arch>/boot/dts/, too?
>>>> - Do we want to move the dts files outside the kernel repository
>>>>   first?
>>>>=20
>>>=20
>>> Oh that=E2=80=99s a nice hornet=E2=80=99s nest you=E2=80=99ve kicke=
d here.
>>>=20
>>> arch/<arch>/boot/dts should not be the place, cause overlays are no=
t related with boot per se.
>>> As they are right now are board (family) specific.
>>=20
>> Aren't overlays meant to describe child boards (capes, shields, what=
ever) that may
>> vary from system to system, but are not expected to be hot-plugged w=
hile the OS
>> is up?  Or is hot-plug a design goal?
>=20
> To reply to myself, there is a current discussion about whether to us=
e overlays to
> help with a powerpc pci desire to add and delete subtrees:
>=20
>   http://www.spinics.net/lists/linux-pci/msg40740.html
>=20
> That sound like hot-plug to me=E2=80=A6
>=20

Many people asked for overlays with hot-plugging probably busses like P=
CI and USB.

Think about an FPGA on a PCI board that needs to be instantiated after =
insertion.

Expect more activity on that particular front; probably this week.

>>=20
>> If no hot-plug, then to me an overlay is just as related to boot as =
the base dts.
>> It is a mere implementation detail that overlays are "loaded" from u=
serspace
>> instead of by the booting kernel (I don't really know the details of=
 using
>> overlays, so please correct me if I am wrong about how the kernel be=
comes aware
>> of an overlay).
>>=20
>>>=20
>>> I think we should try to keep an external kernel repo with them for=
 now until we
>>> figure out where to put them.
>>>=20
>>>> scripts/Makefile.lib | 3 +++
>>>> 1 file changed, 3 insertions(+)
>>>>=20
>>>> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
>>>> index 79e86613712f2230..4b14eef1d4b2ce8f 100644
>>>> --- a/scripts/Makefile.lib
>>>> +++ b/scripts/Makefile.lib
>>>> @@ -292,6 +292,9 @@ cmd_dtc =3D mkdir -p $(dir ${dtc-tmp}) ; \
>>>> $(obj)/%.dtb: $(src)/%.dts FORCE
>>>> 	$(call if_changed_dep,dtc)
>>>>=20
>>>> +$(obj)/%.dtbo: $(src)/%.dtso FORCE
>>>> +	$(call if_changed_dep,dtc)
>>>> +
>>>> dtc-tmp =3D $(subst $(comma),_,$(dot-target).dts.tmp)
>>>>=20
>>>> # Bzip2
>>>> --=20
>>>> 1.9.1
>>>=20
>>> Regards
>>>=20
>>> =E2=80=94 Pantelis

Regards

=E2=80=94 Pantelis
