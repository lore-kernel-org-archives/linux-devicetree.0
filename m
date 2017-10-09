From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC] yamldt v0.5, now a DTS compiler too
Date: Mon, 9 Oct 2017 18:07:28 +0300
Message-ID: <8306BF82-3141-4994-8EFE-D5D2052F9FE1@konsulko.com>
References: <1506628736.28192.9.camel@hp800z>
 <CAL_Jsq+Hxjf8PecU+ZpCoFqbKAYJtzHpFco2Wsi_KT499fb-=g@mail.gmail.com>
 <1506973580.17981.5.camel@hp800z>
 <CAL_Jsq+vrAXQbfSGdANhqM3QJ2fHTQXDT1J6qGnTJkZ4egepNw@mail.gmail.com>
 <1507039989.17981.25.camel@hp800z>
 <CAL_JsqLLJE8bp3gwdExcsAtF+U4AHkROpbqHX8_79YhYjROovQ@mail.gmail.com>
 <1507052352.17981.48.camel@hp800z>
 <CAL_JsqKtQ1LyM09EcaXnPR8zfDJanuNQW2F474k2Z_hUjXOz5Q@mail.gmail.com>
 <4D25319A-34A8-4FE6-8B14-616686D2192A@konsulko.com>
 <59DAAFD3.9070900@gmail.com> <20171009000053.GQ10050@umbus.fritz.box>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171009000053.GQ10050-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi David,

> On Oct 9, 2017, at 03:00 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
>=20
> On Sun, Oct 08, 2017 at 04:08:03PM -0700, Frank Rowand wrote:
>> On 10/07/17 03:23, Pantelis Antoniou wrote:
>>> Hi Rob,
>>>=20
>>>> On Oct 6, 2017, at 16:55 , Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
wrote:
>>>>=20
>>>> On Tue, Oct 3, 2017 at 12:39 PM, Pantelis Antoniou
>>>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>>>> Hi Rob,
>>=20
>> < snip >
>>=20
>>>>> eBPF is portable, can be serialized after compiling in the schema =
file
>>>>> and can be executed in the kernel.
>>>>=20
>>>> Executing in the kernel is a non-goal for me.
>>=20
>> Executing in the kernel is an anti-goal for me.
>>=20
>> We are trying to reduce the device tree footprint inside the kernel,
>> not increase it.
>>=20
>> 99.99% of the validation should be possible statically, in the =
compile
>> phase.
>>=20
>>=20
>>>>> By stripping out all documentation related properties and nodes =
keeping
>>>>> only the compiled filters you can generate a dtb blob that passed =
to
>>>>> kernel can be used for verification of all runtime changes in the
>>>>> kernel's live tree. eBPF is enforcing an execution model that is =
'safe'
>>>>> so we can be sure that no foul play is possible.
>>=20
>> Run time changes can be assumed correct (short of bugs in the overlay
>> application code), if the base tree is validated, the overlay is =
validated,
>> and the interface between the live tree and the overlay is a
>> connector.
>=20
> In addition, no amount of schema validation can really protect the
> kernel from a bad DT.  Even if the schemas can 100% verify that the DT
> is "syntactically" correct, which is ambitious, it can't protect
> against a DT which is in the right form, but contains information that
> is simply wrong for the hardware in question.  That can stuff the
> kernel at least as easily as an incorrectly formatted DT.
>=20

I disagree.

There are multiple levels of validation. For now we=E2=80=99re only =
talking about
binding validation. There can be SoC level validation, board level =
validation,
revision level validation and finally application specific validation.

Binding validation is making sure properties/nodes follow the binding =
document.
For instance that for a foo device there=E2=80=99s a mandatory interrupt =
property.

Simplified

interrupt =3D <X>;

Binding validation would =E2=80=98catch=E2=80=99 errors like assigning a =
string or not having the
interrupt property available.

SoC level validation would list the available interrupt number that a =
given
SoC would support for that device.

For example that interrupt can only take the values 10 or 99 in a given =
SoC.

Board level validation would narrow this down even further to a value of =
10 for
a given board model.

Similar revision level validation would place further restriction on the =
allowed
configuration.

Finally application specific validation could place restriction based on =
the intended
application that piece of hardware is used for. For instance devices =
that should not
exceed a given power budget would have restrictions on the clock =
frequency of the processor
or bus frequencies etc.

> --=20
> David Gibson			| I'll have my music baroque, and my =
code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT =
_the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson

Regards

=E2=80=94 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
