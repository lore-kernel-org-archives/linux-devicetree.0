From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [RFC] yamldt v0.5, now a DTS compiler too
Date: Mon, 2 Oct 2017 10:36:09 +0300
Message-ID: <9E7F3A15-C60F-4CC9-9063-9DDAB0FCD451@konsulko.com>
References: <1506628736.28192.9.camel@hp800z>
 <CAL_Jsq+Hxjf8PecU+ZpCoFqbKAYJtzHpFco2Wsi_KT499fb-=g@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+Hxjf8PecU+ZpCoFqbKAYJtzHpFco2Wsi_KT499fb-=g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, David Gibson <david@gibson.dropbear.id.au>, Tom Rini <trini@konsulko.com>, Franklin S Cooper Jr <fcooper@ti.com>, Matt Porter <mporter@konsulko.com>, Simon Glass <sjg@chromium.org>, Phil Elwell <philip.j.elwell@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Marek Vasut <marex@denx.de>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


> On Oct 2, 2017, at 01:00 , Rob Herring <robherring2@gmail.com> wrote:
>=20
> On Thu, Sep 28, 2017 at 2:58 PM, Pantelis Antoniou
> <pantelis.antoniou@konsulko.com> wrote:
>> Hello again,
>>=20
>> Significant progress has been made on yamldt and is now capable of
>> not only generating yaml from DTS source but also compiling DTS =
sources
>> and being almost fully compatible with DTC.
>=20
> Can you quantify "almost=E2=80=9D?

The =E2=80=94sort option and /include-bin/ doesn=E2=80=99t work yet.

It=E2=80=99s a day or so to add them but there are no kernel dtb files =
that rely on them.

>=20

>> Compiling the kernel's DTBs using yamldt is as simple as using a
>> DTC=3Dyamldt.
>=20
> Good.
>=20
>>=20
>> Error reporting is accurate and validation against a YAML based =
schema
>> works as well. In a short while I will begin posting patches with
>> fixes on bindings and DTS files in the kernel.
>=20
> What I would like to see is the schema format posted for review.
>=20

It is based on your binding schema you=E2=80=99ve posted but tweaked =
slightly to
be parseable by the YAML subset that matches the DTS style.

In particular bare sequences do not map to DT at all, so:

- name: foo

is changed to
name: foo

And so on.

> I would also like to see the bindings for top-level compatible strings
> (aka boards) as an example. That's something that's simple enough that
> I'd think we could agree on a format and start moving towards defining
> board bindings that way.
>=20

I=E2=80=99ll see what I can do.


> Rob

Regards

=E2=80=94 Pantelis
