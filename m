From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [RFC] yamldt v0.5, now a DTS compiler too
Date: Mon, 9 Oct 2017 17:59:04 +0300
Message-ID: <3D2E2DE3-3A5E-4185-852D-C91A70EA62F7@konsulko.com>
References: <1506628736.28192.9.camel@hp800z>
 <CAL_Jsq+Hxjf8PecU+ZpCoFqbKAYJtzHpFco2Wsi_KT499fb-=g@mail.gmail.com>
 <1506973580.17981.5.camel@hp800z>
 <CAL_Jsq+vrAXQbfSGdANhqM3QJ2fHTQXDT1J6qGnTJkZ4egepNw@mail.gmail.com>
 <1507039989.17981.25.camel@hp800z>
 <CAL_JsqLLJE8bp3gwdExcsAtF+U4AHkROpbqHX8_79YhYjROovQ@mail.gmail.com>
 <1507052352.17981.48.camel@hp800z>
 <CAL_JsqKtQ1LyM09EcaXnPR8zfDJanuNQW2F474k2Z_hUjXOz5Q@mail.gmail.com>
 <4D25319A-34A8-4FE6-8B14-616686D2192A@konsulko.com>
 <59DAAFD3.9070900@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <59DAAFD3.9070900@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Rob Herring <robherring2@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, David Gibson <david@gibson.dropbear.id.au>, Tom Rini <trini@konsulko.com>, Franklin S Cooper Jr <fcooper@ti.com>, Matt Porter <mporter@konsulko.com>, Simon Glass <sjg@chromium.org>, Phil Elwell <philip.j.elwell@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Marek Vasut <marex@denx.de>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Frank,

> On Oct 9, 2017, at 02:08 , Frank Rowand <frowand.list@gmail.com> =
wrote:
>=20
> On 10/07/17 03:23, Pantelis Antoniou wrote:
>> Hi Rob,
>>=20
>>> On Oct 6, 2017, at 16:55 , Rob Herring <robherring2@gmail.com> =
wrote:
>>>=20
>>> On Tue, Oct 3, 2017 at 12:39 PM, Pantelis Antoniou
>>> <pantelis.antoniou@konsulko.com> wrote:
>>>> Hi Rob,
>=20
> < snip >
>=20
>>>> eBPF is portable, can be serialized after compiling in the schema =
file
>>>> and can be executed in the kernel.
>>>=20
>>> Executing in the kernel is a non-goal for me.
>=20
> Executing in the kernel is an anti-goal for me.
>=20
> We are trying to reduce the device tree footprint inside the kernel,
> not increase it.
>=20
> 99.99% of the validation should be possible statically, in the compile
> phase.
>=20

That=E2=80=99s not possible when you dynamically alter the tree at =
runtime.

>=20
>>>> By stripping out all documentation related properties and nodes =
keeping
>>>> only the compiled filters you can generate a dtb blob that passed =
to
>>>> kernel can be used for verification of all runtime changes in the
>>>> kernel's live tree. eBPF is enforcing an execution model that is =
'safe'
>>>> so we can be sure that no foul play is possible.
>=20
> Run time changes can be assumed correct (short of bugs in the overlay
> application code), if the base tree is validated, the overlay is =
validated,
> and the interface between the live tree and the overlay is a =
connector.
>=20

You can validate the base tree statically but not the overlays.

In fact a large percentage of overlay usage simply modifies a status =
property
to turn on or off a device. There is nothing to validate in such case.

The portable connector is still a long ways off and I haven=E2=80=99t =
seen anything that
could handle something trickier that a few GPIOs and I2C or SPI busses.

My goal is something that works covering all the cases without any =
surprising
gotchas.

>=20
>>> Humm, if you wanted to ensure dtb's are safe, I'd think that we just
>>> sign them like you would for the kernel or modules.
>>>=20
>>=20
>> That=E2=80=99s a problem when deploying; the runtime validation is =
for making sure
>> developers don=E2=80=99t get bogged down chasing problems when =
working on their
>> own platforms/drivers.
>>=20
>> We have absolutely zero checks for stopping badly configured DT blobs
>> hanging the kernel. With runtime validation a bug that might take a =
few
>> days to figure out can be cut down to a few minutes.
>=20
> Same reply as above.
>=20
>=20
>>>> That means that you can a) run it at boot-time, verifying the dtb =
blob
>>>> passed by the bootloader for errors (potentially disabling devices
>>>> that their nodes fail) and b) run it when applying overlays to =
reject
>>>> any that result in an invalid tree.
>>>=20
>>> Let's get verification at build time working first, then we can =
worry
>>> about something like this.
>=20
> < snip >
>=20

Right, let=E2=80=99s get build verification working first.

> -Frank

Regards

=E2=80=94 Pantelis
