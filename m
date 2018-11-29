Return-Path: <SRS0=gYPT=OI=vger.kernel.org=devicetree-owner@kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:33442 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727114AbeK2WBT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 29 Nov 2018 17:01:19 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/6] soc: renesas: Miscellaneous fixes
Date: Thu, 29 Nov 2018 11:56:13 +0100
Message-Id: <20181129105619.10695-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Vladimir Barinov <vladimir.barinov@cogentembedded.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

	Hi Simon, Magnus,

This patch series contains several fixes for the Renesas SYSC (power
domain) drivers and DT bindings:
  - Removal of non-existent power domains,
  - Correction of power domain names and hierarchy.
These are the result of skimming the Hardware Manual Errata.

Note that the last patch (marked RFC) cannot be applied yet, as there is
an existing (but incorrect) user of the removed definition.

Thanks!

Geert Uytterhoeven (6):
  soc: renesas: r8a77965-sysc: Remove non-existent A3IR power domain
  soc: renesas: r8a77970-sysc: Remove non-existent CR7 power domain
  soc: renesas: r8a77970-sysc: Correct names of A2DP/A2CN power domains
  soc: renesas: r8a77980-sysc: Correct names of A2DP[01] power domains
  soc: renesas: r8a77980-sysc: Correct A3VIP[012] power domain hierarchy
  [RFC] dt-bindings: power: r8a77965: Remove non-existent A3IR power
    domain

 drivers/soc/renesas/r8a77965-sysc.c       |  1 -
 drivers/soc/renesas/r8a77970-sysc.c       |  5 ++---
 drivers/soc/renesas/r8a77980-sysc.c       | 10 +++++-----
 include/dt-bindings/power/r8a77965-sysc.h |  1 -
 include/dt-bindings/power/r8a77970-sysc.h |  7 +++----
 include/dt-bindings/power/r8a77980-sysc.h |  6 +++---
 6 files changed, 13 insertions(+), 17 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
