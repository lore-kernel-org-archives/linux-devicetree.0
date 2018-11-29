Return-Path: <SRS0=gYPT=OI=vger.kernel.org=devicetree-owner@kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:59350 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727402AbeK2Vjl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 29 Nov 2018 16:39:41 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] arm64: dts: renesas: Miscellaneous IPMMU fixes
Date: Thu, 29 Nov 2018 11:34:33 +0100
Message-Id: <20181129103435.9260-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

	Hi Simon, Magnus,

This patch series contains two IPMMU-related fixes for the R-Car M3-N
and R-Car H3 ES1.x SoCs.

The first patch is a dependency for a later fix.

Thanks!

Geert Uytterhoeven (2):
  arm64: dts: renesas: r8a77965: Remove non-existent IPMMU-IR
  arm64: dts: renesas: r8a7795-es1: Add missing power domains to IPMMU
    nodes

 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 2 ++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi    | 8 --------
 2 files changed, 2 insertions(+), 8 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
