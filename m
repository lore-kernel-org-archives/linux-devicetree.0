Return-Path: <SRS0=DNrK=F7=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <464a8a05-25af-69c0-4daa-ee0ef2a0fe7f@cogentembedded.com>
References: <21306a59-8f20-ad08-fdc1-bcc6333c01d4@cogentembedded.com> <464a8a05-25af-69c0-4daa-ee0ef2a0fe7f@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Mar 2018 13:14:21 +0100
Message-ID: <CAMuHMdUH5qAbjMmpspmBxy4_mbyQF3oQoSd5q6SNLHw44aRbXA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: sh-pfc: add R8A77980 PFC support
Content-Type: text/plain; charset="UTF-8"
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-ID: <devicetree@vger.kernel.org>

Hi Sergei,

On Thu, Mar 8, 2018 at 8:14 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add the PFC support for the R8A77980 SoC including pin groups for some
> on-chip devices such as AVB, CAN-FD, GETHER, [H]SCIF, I2C, INTC-EX, MMC,
> MSIOF, PWM, and VIN...
>
> Based on the original (and large) patch by Vladimir Barinov.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

> Changes in version 2:
> - moved the CANFD_CLK and SCIF_CLK pin groups to their own functions;
> - added the DU RGB-888 pin group;
> - added the VIN0 RGB-666 pin group;
> - swapped HSYNC/VSYNC in the initializer of vin{0|1}_sync_mux[];
> - fixed up the comments to the initializer of du_rgb666_pins[];
> - added Rob's tag.

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
