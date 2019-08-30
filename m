From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH 0/5] dt-bindings: arm: idle-states: Miscellaneous improvements
Date: Fri, 30 Aug 2019 21:25:23 +0530
Message-ID: <CAP245DUWP6+2CyV2QA-Awo8JOUFjzjZmPHjM1On8XOyDbKGSHw@mail.gmail.com>
References: <20190830150302.20551-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190830150302.20551-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Nicolas Pitre <nico@linaro.org>, Sebastian Capella <sebcape@gmail.com>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 30, 2019 at 8:33 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
>   - Replace abbreviations "eg" and "ie" by "e.g." resp. "i.e.",
>   - Correct references to wake-up delay,
>   - Correct "constraints guarantees" to "constraint guarantees",
>   - Add punctuation marks to improve readability,
>   - Move exit-latency-us explanation to exit-latency-us section.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

This improves the readability of the doc. So for the series, feel free to add

Reviewed-by:  Amit Kucheria <amit.kucheria@linaro.org>

> ---
> Split to ease review.
> Feel free to squash into a single commit.
>
> Geert Uytterhoeven (5):
>   dt-bindings: arm: idle-states: Use "e.g." and "i.e." consistently
>   dt-bindings: arm: idle-states: Correct references to wake-up delay
>   dt-bindings: arm: idle-states: Correct "constraint guarantees"
>   dt-bindings: arm: idle-states: Add punctuation to improve readability
>   dt-bindings: arm: idle-states: Move exit-latency-us explanation
>
>  .../devicetree/bindings/arm/idle-states.txt   | 32 +++++++++----------
>  1 file changed, 16 insertions(+), 16 deletions(-)
>
> --
> 2.17.1
>
> Gr{oetje,eeting}s,
>
>                                                 Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                                             -- Linus Torvalds
