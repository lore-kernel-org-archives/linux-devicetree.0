From: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v5 0/4] add slow clock support for SAM9X60
Date: Thu, 27 Jun 2019 17:47:17 +0300
Message-ID: <1561646841-7663-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: devicetree@vger.kernel.org

Hi,

This series add slow clock support for SAM9X60. Apart from previous IPs, this
one uses different offsets in control register for different functionalities.
The series adapt current driver to work for all IPs using per IP
configurations initialized at probe.

Stephen,

I send a new version of this since I'm not seeing the patches on clk-next
and I though you may had issues with the previous version of this series.

Thank you,
Claudiu Beznea

Changes in v5:
- get rid of Content-Transfer-Encoding: base64
- collect Ack-by tag

Changes in v4:
- remove macros which were used to access IP specific bits for control
  register
- collect Acked-by, Reviewed-by tags

Changes in v3:
- add patch 1/1 that remove bypass code in the code specific to SAMA5D4
  (there is no bypass support on SAMA5D4)
- adapt review comments
- register clock with of_clk_hw_onecell_get to emphasize that this IP has
  2 output clocks MD_SLKC and TD_SLCK (I considered not necessary to
  introduce new constants to be shared b/w driver and DT bindings; if
  you consider otherwise, let me know)
- adapt dt-binding patch with clock-cells changes (thus didn't introduced
  Reviewed-by tag)
- renamed struct clk_slow_offsets to struct clk_slow_bits and the
  corresponding instances of it

Changes in v2:
- split patch 1/1 from v1 in 2 patches: one adding register bit offsets
  support (patch 1/3 from this series), one adding support for SAM9X60
  (patch 2/3 from this series)
- fix compatible string from "microchip,at91sam9x60-sckc" to
  "microchip,sam9x60-sckc"

Claudiu Beznea (4):
  clk: at91: sckc: sama5d4 has no bypass support
  clk: at91: sckc: add support to specify registers bit offsets
  dt-bindings: clk: at91: add bindings for SAM9X60's slow clock
    controller
  clk: at91: sckc: add support for SAM9X60

 .../devicetree/bindings/clock/at91-clock.txt       |   7 +-
 drivers/clk/at91/sckc.c                            | 173 ++++++++++++++++-----
 2 files changed, 139 insertions(+), 41 deletions(-)

-- 
2.7.4
