From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/5] dt-bindings: arm: idle-states: Miscellaneous improvements
Date: Fri, 30 Aug 2019 17:02:57 +0200
Message-ID: <20190830150302.20551-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Amit Kucheria <amit.kucheria@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Nicolas Pitre <nico@linaro.org>, Sebastian Capella <sebcape@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

  - Replace abbreviations "eg" and "ie" by "e.g." resp. "i.e.",
  - Correct references to wake-up delay,
  - Correct "constraints guarantees" to "constraint guarantees",
  - Add punctuation marks to improve readability,
  - Move exit-latency-us explanation to exit-latency-us section.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Split to ease review.
Feel free to squash into a single commit.

Geert Uytterhoeven (5):
  dt-bindings: arm: idle-states: Use "e.g." and "i.e." consistently
  dt-bindings: arm: idle-states: Correct references to wake-up delay
  dt-bindings: arm: idle-states: Correct "constraint guarantees"
  dt-bindings: arm: idle-states: Add punctuation to improve readability
  dt-bindings: arm: idle-states: Move exit-latency-us explanation

 .../devicetree/bindings/arm/idle-states.txt   | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
