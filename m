From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH RFC v2 0/12] Add R8A7743/SK-RZG1M board support
Date: Sat, 1 Oct 2016 13:29:48 +0200
Message-ID: <CAMuHMdX1vNH5SYNuQ4UdvjcVump+GP=MN3ri3DF4JpH48hX3vQ@mail.gmail.com>
References: <1987532.PE2ex6PrJ5@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1987532.PE2ex6PrJ5@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Fri, Sep 30, 2016 at 12:14 AM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
>    Here's the set of 12 patches against Simon Horman's 'renesas.git' repo,
> 'renesas-devel-20160926-v4.8-rc8' tag. I'm adding the device tree support for
> the R8A7743-based SK-RZG1M board. The SoC is close to R8A7791 and the board
> seems  identical to the R8A7791/Porter board. This version includes the Ether,
> so the board should boot with NFS root now. I tried to address all the comments
> to the version 1 (except the need to use the new CPG/MSSR drivers -- this one
> will be addressed RSN). The DMAC/SCIF/IRQC bindings patches posted recently are

There's an (old) version of an r8a7791 CPG/MSSR driver at
https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/cpg-mssr-v4

To handle it cleanly, this is going to need "[PATCH/RFC v3 00/22] soc:
renesas: Add R-Car RST driver for obtaining mode pin state"...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
