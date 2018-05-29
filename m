Return-Path: <SRS0=fx7s=IQ=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <95b945f7-1e6c-39f1-e101-06ed748ccec2@cogentembedded.com>
References: <95b945f7-1e6c-39f1-e101-06ed748ccec2@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 May 2018 18:34:48 +0200
Message-ID: <CAMuHMdWe5uZ6rX6a6NWL3O+VZfDhCaVtUbfqEkvqWEPqx7eLMA@mail.gmail.com>
Subject: Re: [PATCH] i2c: rcar: document R8A77980 bindings
Content-Type: text/plain; charset="UTF-8"
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, Linux I2C <linux-i2c@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, May 28, 2018 at 9:39 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> R-Car V3H (R8A77980) SoC also has the R-Car gen3 compatible I2C controller,
> so document the SoC  specific bindings.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
> The patch is against Wolfram Sang's 'linux.git' repo's 'i2c/for-next' branch
> but I wouldn't mind if it was applied to the 'i2c/for-current' branch. :-)

Who cares? A trivial DT binding update is not critical.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
