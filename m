Return-Path: <SRS0=NbWy=4X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 695CAC3F2D6
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Mar 2020 08:50:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3FD9A208C3
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Mar 2020 08:50:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbgCFIun (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 6 Mar 2020 03:50:43 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:50840 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbgCFIun (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 6 Mar 2020 03:50:43 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id Awqg2200B5USYZQ01wqgPz; Fri, 06 Mar 2020 09:50:40 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jA8gq-0002XH-8g; Fri, 06 Mar 2020 09:50:40 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jA8gq-00027a-3z; Fri, 06 Mar 2020 09:50:40 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 0/2] spi: dt-bindings: spi-controller: Slave mode fixes
Date:   Fri,  6 Mar 2020 09:50:36 +0100
Message-Id: <20200306085038.8111-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

	Hi Mark, Rob, Maxime,

This patch series contains two fixes for the SPI controller DT bindings
regarding SPI controllers configured for slave mode.

Changes compared to v2[1]:
  - Make #address-cells mutually-exclusive with spi-slave,

Changes compared to v1[2]:
  - Use "enum: [0, 1]" instead of min/max limit,
  - use "- spi-slave" instead of "[ spi-slave ]".
  - New fix for spi-[rt]x-bus-width.

Thanks!

[1] https://lore.kernel.org/linux-devicetree/20200303094522.23180-1-geert+renesas@glider.be/
[2] https://lore.kernel.org/linux-devicetree/20200227130323.15327-1-geert+renesas@glider.be/

Geert Uytterhoeven (2):
  spi: dt-bindings: spi-controller: Fix #address-cells for slave mode
  spi: dt-bindings: spi-controller: Fix spi-[rt]x-bus-width for slave
    mode

 .../devicetree/bindings/spi/spi-controller.yaml        | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
