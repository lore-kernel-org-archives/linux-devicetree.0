Return-Path: <SRS0=Eo6U=FY=linux-m68k.org=geert@kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/2] dt-bindings: pwm: renesas-tpu: Misc Fixes
Date: Fri,  2 Mar 2018 15:39:43 +0100
Message-Id: <1520001585-12899-1-git-send-email-geert+renesas@glider.be>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

	Hi Thierry,

Here are two small fixes for the DT bindings of the Renesas Timer Pulse
Unit.

Changes compared to v1:
  - Dropped DTS counterpart (applied),
  - Add Acked-by, Reviewed-by.

Thanks for applying!

Geert Uytterhoeven (2):
  dt-bindings: pwm: renesas-tpu: Correct example TPU register block size
  dt-bindings: pwm: renesas-tpu: Correct SoC part numbers and family
    names

 Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
