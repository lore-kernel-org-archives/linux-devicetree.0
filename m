From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: timer: renesas, cmt: Add CMT0234 to
 sh73a0 and r8a7740
Date: Thu, 22 Aug 2019 09:07:43 +0200
Message-ID: <CAMuHMdX2MLeAHGMCAcsc1CnMrUYfJzsv4ut=dn435B8Zw_49gg@mail.gmail.com>
References: <156630449239.17444.11157306180861080402.sendpatchset@octo> <156630450374.17444.10813153921641289392.sendpatchset@octo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <156630450374.17444.10813153921641289392.sendpatchset@octo>
Sender: linux-kernel-owner@vger.kernel.org
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Daniel Lezcano <daniel.lezcano@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Simon Horman <horms+renesas@verge.net.au>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 20, 2019 at 2:33 PM Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Document the on-chip CMT devices included in r8a7740 and sh73a0.
>
> Included in this patch is DT binding documentation for 32-bit CMTs
> CMT0, CMT2, CMT3 and CMT4. They all contain a single channel and are
> quite similar however some minor differences still exist:
>  - "Counter input clock" (clock input and on-device divider)
>     One example is that RCLK 1/1 is supported by CMT2, CMT3 and CMT4.
>  - "Wakeup request" (supported by CMT0 and CMT2)
>
> Because of this one unique compat string per CMT device is selected.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
