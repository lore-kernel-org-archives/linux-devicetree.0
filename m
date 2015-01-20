From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH] of: Custom printk format specifier for device node
Date: Tue, 20 Jan 2015 17:27:42 +0200
Message-ID: <25E49021-E94D-4DFA-AC37-1D4A3AAE9F88@konsulko.com>
References: <1421764441-11928-1-git-send-email-pantelis.antoniou@konsulko.com> <CAL_JsqLVJjq3Ov=J-5LtXiTQPLvR5Y=+tB1i16k_rN3j5dODFQ@mail.gmail.com> <CAMuHMdWnjawtgkKGuL8b4A17EhDS6B0L-1_uhSnvEXXk5dNjwQ@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWnjawtgkKGuL8b4A17EhDS6B0L-1_uhSnvEXXk5dNjwQ@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robherring2@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Grant Likely <grant.likely@secretlab.ca>, Randy Dunlap <rdunlap@infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

> On Jan 20, 2015, at 17:24 , Geert Uytterhoeven <geert@linux-m68k.org>=
 wrote:
>=20
> On Tue, Jan 20, 2015 at 3:47 PM, Rob Herring <robherring2@gmail.com> =
wrote:
>>> +       Examples:
>>> +
>>> +       %pO     /foo/bar@0              - Node full name
>>> +       %pO0    /foo/bar@0              - Same as above
>>> +       %pO1    /foo/bar@0[10]          - Node full name + phandle
>>> +       %pO2    /foo/bar@0[10:DdPB]     - Node full name + phandle =
+ node flags
>>> +                                        D - dynamic
>>> +                                        d - detached
>>> +                                        P - Populated
>>> +                                        B - Populated bus
>>=20
>> We should think about what else we want to print for a node. Perhaps
>> 'On' for name, 'Oc' for compatible, etc.
>=20
> I was just going to say "The least verbose variant is name, not full_=
name=E2=80=9D.
>=20

Unfortunately in the context of device tree nodes =E2=80=98name' is usu=
ally not what
you want to print to identify the node in question. =E2=80=98name=E2=80=
=99 is usually not unique.

We can add a format specifier for it though.

> Gr{oetje,eeting}s,
>=20
>                        Geert
>=20
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linu=
x-m68k.org
>=20
> In personal conversations with technical people, I call myself a hack=
er. But
> when I'm talking to journalists I just say "programmer" or something =
like that.
>                                -- Linus Torvalds

Regards

=E2=80=94 Pantelis

