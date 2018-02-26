Return-Path: <SRS0=m7Ph=FU=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <26e823ef-759f-16e7-f3da-ac6ce7c01ad3@cogentembedded.com>
References: <e32c511f-89cd-254b-8a53-face984abe75@cogentembedded.com> <26e823ef-759f-16e7-f3da-ac6ce7c01ad3@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Feb 2018 10:57:30 +0100
Message-ID: <CAMuHMdVhq++MCq9NSE_LjJZAAinZYGyhOGv4VOzVFkihwQGu2w@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: add PORT_GP_CFG_25() helper macro
Content-Type: text/plain; charset="UTF-8"
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-ID: <devicetree@vger.kernel.org>

On Sun, Feb 25, 2018 at 7:13 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> They follow the style of the existing PORT_GP_CFG_<n>() macros and
> will be used by a follow-up patch for the R8A77980 SoC.
>
> Based on the original (and large) patch by Vladimir Barinov.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. queuing in sh-pfc-for-v4.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
