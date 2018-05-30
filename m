From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v6 2/6] dt-bindings: Add the rzn1-clocks.h file
Date: Wed, 30 May 2018 15:36:44 +0200
Message-ID: <CAMuHMdV8Hey=L6jv7HFyTUbeKdcC8ygn7PFjW2akETHe44MjeQ@mail.gmail.com>
References: <1526983321-41949-1-git-send-email-michel.pollet@bp.renesas.com>
 <1526983321-41949-3-git-send-email-michel.pollet@bp.renesas.com>
 <CAMuHMdW-HUBRF4rLdfzixcyMUBg7+4XU+-3zayePoyeQiBZ8ZA@mail.gmail.com>
 <CAMMfpEyTORirKiE417AQzCLzxDTKmy83bwivpfJaHQsKUKMc_w@mail.gmail.com>
 <CAMuHMdWAU9wZkA+Z0BNAGrLV1WrCO3PgCTo2p=q3Mq9Tm6JBGA@mail.gmail.com>
 <CAMMfpEwKa90XHu_igCxRQLy_CSVHTkN8eD8f7o=wgtttSn=FqA@mail.gmail.com>
 <CAMuHMdWVde-DfbLVbvZT4rQfsVz1z7AMyQVgbO2DXrQKsEdVcw@mail.gmail.com> <TY1PR01MB1769DFD4CD9803D10CE1CA4BF56C0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <TY1PR01MB1769DFD4CD9803D10CE1CA4BF56C0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: M P <buserror@gmail.com>, Michel Pollet <michel.pollet@bp.renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Michel Pollet <buserror+upstream@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Phil,

On Wed, May 30, 2018 at 3:30 PM, Phil Edworthy
<phil.edworthy@renesas.com> wrote:
> On 25 May 2018 10:13 Geert Uytterhoeven wrote:
>  [snip]
>
>> Now, given the clock definitions for RZ/N1[DSL] are the same (although some
>> don't exist on some variants), you could keep on using RZN1_CLK_FOO for
>> the names of the defines, and store them in a common file, included by the
>> soc-specific file. But please make clear the common file cannot be included
>> directly, so the filename does not become part of the DT ABI, and you are
>> shielded from future marketing silliness (e.g. next quarter's RZ/N1X being
>> totally different).
> How does an include filename become part of the DT ABI?
> I thought the dtb is the ABI, not the dts. Am I wrong?

You're right. In se the DT ABI applies to the DTB, not to the DTS.

The definitions inside the include file are part of the DT bindings,
and thus cannot
be changed.  Your DTS files get these definitions by including the header file,
so the header filename is also part of the bindings, and thus can't be changed
that easily.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
