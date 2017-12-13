From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/3] dt-bindings: timer: renesas, cmt: Document r8a774[35]
 CMT support
Date: Wed, 13 Dec 2017 10:59:01 +0100
Message-ID: <CAMuHMdW5yCnq2wuetj4EtUM=obxpCoXprOk02Uo4LM60sMrqXQ@mail.gmail.com>
References: <1513104579-6333-1-git-send-email-fabrizio.castro@bp.renesas.com> <1513104579-6333-2-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1513104579-6333-2-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Fabrizio,
On Tue, Dec 12, 2017 at 7:49 PM, Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Document SoC specific compatible strings for r8a7743 and r8a7745.
> No driver change is needed as the fallback strings will activate
> the right code.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>

With the issues pointed out by Simon fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
