From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] arm64: dts: h3ulcb: Update memory node to 4 GiB map
Date: Wed, 1 Feb 2017 13:40:08 +0100
Message-ID: <CAMuHMdV8Mn83rpkqaB655GPSjw1E_QLCcRJKoU+QYyogMEv1mw@mail.gmail.com>
References: <1485443606-22566-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1485443632-22612-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1485443632-22612-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 26, 2017 at 4:13 PM, Vladimir Barinov
<vladimir.barinov@cogentembedded.com> wrote:
> From: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
>
> This patch adds memory region:
>
>   - After changes, the H3ULCB board has the following map:
>     Bank0: 1GiB RAM : 0x000048000000 -> 0x0007fffffff
>     Bank1: 1GiB RAM : 0x000500000000 -> 0x0053fffffff
>     Bank2: 1GiB RAM : 0x000600000000 -> 0x0063fffffff
>     Bank3: 1GiB RAM : 0x000700000000 -> 0x0073fffffff
>
>   - Before changes, the old map looked like this:
>     Bank0: 1GiB RAM : 0x000048000000 -> 0x0007fffffff
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
