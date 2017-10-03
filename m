From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC] yamldt v0.5, now a DTS compiler too
Date: Tue, 3 Oct 2017 09:17:31 +0200
Message-ID: <CAMuHMdUNrAv4oYk1kwikGwKBXLBHO7p=CrHK4w0-BSQ2gQNx3g@mail.gmail.com>
References: <1506628736.28192.9.camel@hp800z> <CAL_Jsq+Hxjf8PecU+ZpCoFqbKAYJtzHpFco2Wsi_KT499fb-=g@mail.gmail.com>
 <1506973580.17981.5.camel@hp800z>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1506973580.17981.5.camel@hp800z>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Rob Herring <robherring2@gmail.com>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, David Gibson <david@gibson.dropbear.id.au>, Tom Rini <trini@konsulko.com>, Franklin S Cooper Jr <fcooper@ti.com>, Matt Porter <mporter@konsulko.com>, Simon Glass <sjg@chromium.org>, Phil Elwell <philip.j.elwell@gmail.com>, Marek Vasut <marex@denx.de>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Pantelis,

On Mon, Oct 2, 2017 at 9:46 PM, Pantelis Antoniou
<pantelis.antoniou@konsulko.com> wrote:
>     # Note that the YAML example must be validated against this binding
>     # to be an accepted entry

Indeed ;-)

>       yaml: |
>         sk11@0:
>           compatible: "skel,sk11"
>           reg: 0
>           sip-max-frequency: 1000000

s/sip-max-frequency/spi-max-frequency/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
