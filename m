Return-Path: <SRS0=OUWO=OP=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1544086559-47141-1-git-send-email-biju.das@bp.renesas.com> <1544086559-47141-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1544086559-47141-2-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Dec 2018 10:13:43 +0100
Message-ID: <CAMuHMdV5tsqNN+_vR47J2OTCt5W0QqFLEm0u1JV+UAC+_vFn6g@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: rtc: pcf85363: Document pcf85263
 real-time clock
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-rtc@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, Dec 6, 2018 at 10:04 AM Biju Das <biju.das@bp.renesas.com> wrote:
> The pcf85263 RTC is compatible with the pcf85363 RTC.
>
> The difference between the pcf85263 and pcf85363 RTC is that the latter has
> 64 bytes more RAM. This renders them incompatible from a DT point of view.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
