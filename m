From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 11/12] ARM: dts: sk-rzg1e: add Ether support
Date: Wed, 2 Nov 2016 11:26:53 +0100
Message-ID: <CAMuHMdUXPouB=+ZxXLxvVB+pbR=BpCR6DYOm90h2b8cDkgPkOQ@mail.gmail.com>
References: <4121805.SRTmqJtRfv@wasted.cogentembedded.com> <1653044.nY120UqMZW@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1653044.nY120UqMZW@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sat, Oct 29, 2016 at 12:31 AM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Define the SK-RZG1E board dependent part of the Ether device node.
> Enable DHCP and NFS root  for the kernel booting.
>
> Based on the original (and large) patch by Dmitry Shifrin
> <dmitry.shifrin@cogentembedded.com>.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Subject is off-by-one (the series has only 11 patches)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
