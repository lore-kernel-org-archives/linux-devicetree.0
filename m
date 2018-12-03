Return-Path: <SRS0=so6l=OM=vger.kernel.org=devicetree-owner@kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:60068 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726609AbeLCPMv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Dec 2018 10:12:51 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] arm: dts: renesas: Convert remaining boards to new LVDS DT bindings
Date: Mon,  3 Dec 2018 16:12:40 +0100
Message-Id: <20181203151242.25875-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Marek Vasut <marek.vasut@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

	Hi Simon, Magnus, Laurent, Marek,

As of commit 6d2ca85279becdff ("dt-bindings: display: renesas: Deprecate
LVDS support in the DU bindings"), the internal LVDS encoder has DT
bindings separate from the DU.  Most board device trees were ported over
to the new model, but Stout with R-Car H2 and Salvator-XS with R-Car
M3-W were forgotten.

This patch series converts the remaining boards.
Both patches were compiled-tested only.

Thanks!

Geert Uytterhoeven (2):
  ARM: dts: stout: Convert to new LVDS DT bindings
  arm64: dts: renesas: r8a7796: salvator-xs: Convert to new LVDS DT
    bindings

 arch/arm/boot/dts/r8a7790-stout.dts               | 15 ++++++++++++---
 .../boot/dts/renesas/r8a7796-salvator-xs.dts      |  3 +--
 2 files changed, 13 insertions(+), 5 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
