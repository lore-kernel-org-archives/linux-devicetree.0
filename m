From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 5/5] arm64: dts: renesas: ulcb: Enable HDMI output
Date: Mon, 10 Jul 2017 10:37:42 +0200
Message-ID: <CAMuHMdWgun1e35xcO20vswnGNd9S05fwjxPujUcWv2V3syqUsg@mail.gmail.com>
References: <1499394976-14201-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1499395068-14412-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1499395068-14412-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 7, 2017 at 4:37 AM, Vladimir Barinov
<vladimir.barinov@cogentembedded.com> wrote:
> From: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
>
> Enable the HDMI encoder for ULCB board and hook it up to the HDMI connector.
>
> The HDMI encoder and connector are available on both the H3 and M3-W ULCB boards.
> Add them to the ulcb.dtsi file.
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
