From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 0/3] of: Increase compile coverage
Date: Sun,  5 Apr 2015 16:59:22 +0200
Message-ID: <1428245965-19618-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

	Hi,

Currently the OF configuration symbol is explicitly selected on
architectures that support device trees and/or Open Firmware.
However, there's no technical reason to limit the device tree
infrastructure to these architectures.

Hence this series allows to enable OF when compile testing, to increase
compile coverage. It also fixes the fallout I encountered when IRQ
domain support is not enabled.

Geert Uytterhoeven (3):
  of: Allow OF to be enabled if COMPILE_TEST to increase coverage
  of: OF_IRQ should depend on IRQ_DOMAIN
  of: Add dummy of_irq_to_resource_table() for IRQ_OF=n

 drivers/of/Kconfig     | 8 ++++++--
 include/linux/of_irq.h | 9 +++++++--
 2 files changed, 13 insertions(+), 4 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
