Return-Path: <SRS0=8Gze=LR=linux-m68k.org=geert@kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] spi: sh-msiof: Document R-Car D3 and E3 support
Date: Mon,  3 Sep 2018 19:25:10 +0200
Message-Id: <20180903172512.6242-1-geert+renesas@glider.be>
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ulrich Hecht <uli+renesas@fpond.eu>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

	Hi Mark,

This patch series documents support for the MSIOF module in the Renesas
R-Car D3 (r8a77995) and E3 (r8a77990) SoCs.  No driver update is needed.
 
R-Car D3 support was tested by Ulrich on the Draak development board.
R-Car E3 support was tested by me on the Ebisu development board.

As my patch for E3 depends on Ulrich's (not yet applied) patch for D3, I
took the libert to include it.

Thanks!

Geert Uytterhoeven (1):
  spi: sh-msiof: Document R-Car E3 support

Ulrich Hecht (1):
  spi: sh-msiof: Document R-Car D3 support

 Documentation/devicetree/bindings/spi/sh-msiof.txt | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
