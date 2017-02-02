From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/4] arm64: dts: m3ulcb: Update memory node to 2 GiB map
Date: Thu, 2 Feb 2017 19:19:41 +0100
Message-ID: <CAMuHMdU7dHC3rCeYGVbEPQ0riNU9PEptxT-0WhmLJp0S7CS1LQ@mail.gmail.com>
References: <1485442422-18259-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1485442460-18339-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1485442460-18339-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Vladimir,

On Thu, Jan 26, 2017 at 3:54 PM, Vladimir Barinov
<vladimir.barinov@cogentembedded.com> wrote:
> From: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
>
> This patch updates memory region:
>
>   - After changes, the new map of the m3ulcb board on R8A7796 SoC
>     Bank0: 1GiB RAM : 0x000048000000 -> 0x0007fffffff
>     Bank1: 1GiB RAM : 0x000600000000 -> 0x0063fffffff
>
>   - Before changes, the old map looked like this:
>     Bank0: 1GiB RAM : 0x000048000000 -> 0x0007fffffff

BTW, this means M3ULCB has a different R-Car M3 SiP than Salvator-X,
with half the RAM?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
