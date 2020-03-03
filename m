Return-Path: <SRS0=BDx3=4U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A004DC3F2C6
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 09:45:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7CD2321556
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 09:45:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727774AbgCCJp1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Mar 2020 04:45:27 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:52708 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727767AbgCCJp0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Mar 2020 04:45:26 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id 9llQ2200E5USYZQ01llQgN; Tue, 03 Mar 2020 10:45:25 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j947A-0006hv-Bd; Tue, 03 Mar 2020 10:45:24 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j947A-00062d-8q; Tue, 03 Mar 2020 10:45:24 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/2] spi: dt-bindings: spi-controller: Slave mode fixes
Date:   Tue,  3 Mar 2020 10:45:20 +0100
Message-Id: <20200303094522.23180-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

	Hi Mark, Rob, Maxime,

This patch series contains two fixes for the SPI controller DT bindings
regarding SPI controllers configured for slave mode.

Changes compared to v1[*]:
  - Use "enum: [0, 1]" instead of min/max limit,
  - use "- spi-slave" instead of "[ spi-slave ]".
  - New fix for spi-[rt]x-bus-width.

Thanks!

[*] https://lore.kernel.org/linux-devicetree/20200227130323.15327-1-geert+renesas@glider.be/

Geert Uytterhoeven (2):
  spi: dt-bindings: spi-controller: Fix #address-cells for slave mode
  spi: dt-bindings: spi-controller: Fix spi-[rt]x-bus-width for slave
    mode

 .../bindings/spi/spi-controller.yaml           | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
