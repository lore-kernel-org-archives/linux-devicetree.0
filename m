From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: timer: renesas, cmt: Document
 r8a774[35] CMT support
Date: Thu, 25 Jan 2018 09:21:17 +0100
Message-ID: <CAMuHMdUX8D6c_ehNJAS8nWprvY60bkoxwTekEEqT5oJcz4QGPA@mail.gmail.com>
References: <1513618743-4773-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1513618743-4773-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <SG2PR06MB088625944BCD8F4307315520C0E20@SG2PR06MB0886.apcprd06.prod.outlook.com>
 <1acdad3b-c2fd-df1d-f25b-cf80b79a9842@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1acdad3b-c2fd-df1d-f25b-cf80b79a9842@linaro.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Thomas Gleixner <tglx@linutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Daniel,

On Thu, Jan 25, 2018 at 9:09 AM, Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
> On 24/01/2018 17:49, Fabrizio Castro wrote:
>> I am sorry to bother you, just wondering if you think there are any chances for this patch to applied on top of v4.16?
>
> You can take it through the renesas tree.
>
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Thank you!

Unfortunately it's a bit late to get non-bugfixes in v4.16 through the renesas
tree and arm-soc.

Any chance it can go in through you?

Thanks again!

>>> Subject: [PATCH v2 1/3] dt-bindings: timer: renesas, cmt: Document r8a774[35] CMT support
>>>
>>> Document SoC specific compatible strings for r8a7743 and r8a7745.
>>> No driver change is needed as the fallback strings will activate
>>> the right code.
>>>
>>> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>>> Reviewed-by: Biju Das <biju.das@bp.renesas.com>
>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>> Reviewed-by: Simon Horman <horms@verge.net.au>

Gr{oetje,eeting}s,
                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
