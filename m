From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH/RFC 00/12] ARM: shmobile: dts: Add overlays for various serial ports
Date: Wed, 13 May 2015 11:20:53 +0300
Message-ID: <E6970DEC-BA7C-4D97-AEA7-1874983414D4@konsulko.com>
References: <1431452235-11692-1-git-send-email-geert+renesas@glider.be> <D9B202C5-6460-4217-9F58-67078C3DB9B1@konsulko.com> <CAMuHMdXhLUJqpdAZc7X==s6cyeBdf7TVdJi7JtA1jC_V=hEXsQ@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXhLUJqpdAZc7X==s6cyeBdf7TVdJi7JtA1jC_V=hEXsQ@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-sh list <linux-sh@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

> On May 13, 2015, at 11:19 , Geert Uytterhoeven <geert@linux-m68k.org>=
 wrote:
>=20
> Hi Pantelis,
>=20
> On Wed, May 13, 2015 at 10:16 AM, Pantelis Antoniou
> <pantelis.antoniou@konsulko.com> wrote:
>>> - The overlay sources use full paths to refer to the device nodes f=
or
>>>   creating aliases, as path references (unlike phandle references) =
are
>>>   not yet supported by overlays.
>>=20
>> Hmm, phandle references are completely supported. You just have to r=
emember
>> to build your base tree with the -@ option to generate the fixups :)

> The aliases need _path_ references.
>=20

Ugh, yeah, that=E2=80=99s a problem :)

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

