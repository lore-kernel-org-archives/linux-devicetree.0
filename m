From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] ARM: shmobile: r8a7790: add ADSP clocks
Date: Mon, 5 Jan 2015 14:42:01 +0100
Message-ID: <CAMuHMdUVyRgWYpX4ByWP45HFAfjD6YecH0jfZ=MRc9eZMR4qvg@mail.gmail.com>
References: <1909663.BCLINDXhVH@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1909663.BCLINDXhVH@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Linux-sh list <linux-sh@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 30, 2014 at 9:21 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add the ADSP clocks to the CPG and MSTP5 nodes of the R8A7790 device tree.
>
> Based on the original patch by Konstantin Kozhevnikov
> <konstantin.kozhevnikov@cogentembedded.com>.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
