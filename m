Return-Path: <SRS0=bPG9=YQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82441CA9EBE
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 12:29:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 577D22086D
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 12:29:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391320AbfJWM3s (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 23 Oct 2019 08:29:48 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:36694 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391315AbfJWM3s (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 23 Oct 2019 08:29:48 -0400
Received: from ramsan ([84.194.98.4])
        by albert.telenet-ops.be with bizsmtp
        id H0Vl2100b05gfCL060Vl6w; Wed, 23 Oct 2019 14:29:46 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFlp-0000eH-QF; Wed, 23 Oct 2019 14:29:45 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFlp-0003Du-Of; Wed, 23 Oct 2019 14:29:45 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/4] clk: renesas: Add r8a77961 support
Date:   Wed, 23 Oct 2019 14:29:37 +0200
Message-Id: <20191023122941.12342-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

	Hi all,

This patch series adds support for the Clock Pulse Generator / Module
Standby and Software Reset block in the Renesas R-Car M3-W+ (R8A77961)
SoC.  As R-Car M3-W+ is very similar to R-Car M3-W (R8A77960), the
existing driver for R-Car M3-W is updated to handle both.

To avoid confusion between R-Car M3-W and M3-W+, the existing config
symbol for M3-W is renamed to CLK_R8A77960 in a dependency-free way, and
references to r8a7796 are updated.

Changes compared to v1[1]:
  - Split in per-subsystem series,
  - Add Reviewed-by, Tested-by,
  - Rename CLK_R8A7796,
  - Update r8a7796 references,

I intend to queue this series in clk-renesas-for-v5.5.
The second patch will be put on a branch shared between driver and DTS.

Thanks for your comments!

[1] "[PATCH/RFC 00/19] arm64: dts: renesas: Initial support for R-Car M3-W+"
    https://lore.kernel.org/linux-renesas-soc/20191007102332.12196-1-geert+renesas@glider.be/

Geert Uytterhoeven (4):
  dt-bindings: clock: renesas: cpg-mssr: Document r8a77961 support
  dt-bindings: clock: Add r8a77961 CPG Core Clock Definitions
  clk: renesas: Rename CLK_R8A7796 to CLK_R8A77960
  clk: renesas: r8a7796: Add R8A77961 CPG/MSSR support

 .../bindings/clock/renesas,cpg-mssr.txt       | 11 ++--
 drivers/clk/renesas/Kconfig                   |  9 ++-
 drivers/clk/renesas/Makefile                  |  3 +-
 drivers/clk/renesas/r8a7796-cpg-mssr.c        | 24 +++++--
 drivers/clk/renesas/renesas-cpg-mssr.c        |  8 ++-
 include/dt-bindings/clock/r8a77961-cpg-mssr.h | 65 +++++++++++++++++++
 6 files changed, 107 insertions(+), 13 deletions(-)
 create mode 100644 include/dt-bindings/clock/r8a77961-cpg-mssr.h

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
