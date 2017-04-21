From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/8] [RFC] arm64: dts: renesas: Add R-Car H3 SiP (4 x 1
 GiB) support
Date: Fri, 21 Apr 2017 09:04:48 +0200
Message-ID: <CAMuHMdUbhONx9=mf=EG_soLEAkrb-jsZD_pAkkovc5wMDdv8hg@mail.gmail.com>
References: <1492593351-13835-1-git-send-email-geert+renesas@glider.be>
 <1492593351-13835-3-git-send-email-geert+renesas@glider.be> <20170421054201.GR28868@bigcity.dyn.berto.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170421054201.GR28868@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Niklas,

On Fri, Apr 21, 2017 at 7:42 AM, Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/renesas/r8j7795-4x1g.dtsi
>> @@ -0,0 +1,36 @@
>> +/*
>> + * Device Tree Source for the r8j7795 SiP with 4 channels of 1 GiB RAM
>> + *
>> + * Copyright (C) 2015 Renesas Electronics Corp.
>
> 2017 right? If so same comment for patches 3 and 4.

As I just moved statements from an existing file, I retained the original
copyright information.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
