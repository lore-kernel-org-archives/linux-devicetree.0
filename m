From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/2] ARM: shmobile: r8a7779/marzen CCF DT updates
Date: Fri, 23 May 2014 09:46:18 +0200
Message-ID: <1400831180-20409-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

	Hi Simon,

Here are a few updates for r8a7779/marzen CCF DT:
  - [1/2] ARM: shmobile: r8a7779 dtsi: Correct #address-cells/#size-cells
          for clocks
  - [2/2] ARM: shmobile: r8a7779 dtsi: Update unit-addresses for clocks

Compared to v1, the old "[2/2] ARM: shmobile: marzen dts: Remove
superfluous include" was dropped; a new "[2/2] ARM: shmobile: r8a7779 dtsi:
Update unit-addresses for clocks" was added.
More detailed change logs are included in the individual patches.

This was only compile-tested, due to lack of hardware.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
