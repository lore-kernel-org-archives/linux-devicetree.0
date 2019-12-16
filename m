Return-Path: <SRS0=KHEV=2G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4641FC2D0D2
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 12:47:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 12CC020725
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 12:47:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727716AbfLPMrt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Dec 2019 07:47:49 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:54834 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727605AbfLPMrt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Dec 2019 07:47:49 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id ecnh2100r5USYZQ06cnhWU; Mon, 16 Dec 2019 13:47:47 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1igpmn-0004EJ-MJ; Mon, 16 Dec 2019 13:47:41 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1igpmn-0004LK-KM; Mon, 16 Dec 2019 13:47:41 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/6] arm64: dts: renesas: r8a77961: Add more device nodes
Date:   Mon, 16 Dec 2019 13:47:34 +0100
Message-Id: <20191216124740.16647-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

	Hi all,

This patch series broadens support for the R-Car M3-W+ (aka R-Car M3-W
ES3.0) Soc (R8A77961), by adding more device nodes to its DT source
file, up to what can be tested reasonably using remote access.
For your convenience, it is available in the topic/r8a77961-v2 branch of
my renesas-drivers git repository at
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git.

Changes compared to v1:
  - Group SYS-DMAC interrupt specifiers.

This has been tested on a Salvator-XS development board.
More details can be found in the individual patches.

To be queued in renesas-devel for v5.6.
Thanks!

Geert Uytterhoeven (6):
  arm64: dts: renesas: r8a77961: Add RWDT node
  arm64: dts: renesas: r8a77961: Add GPIO nodes
  arm64: dts: renesas: r8a77961: Add RAVB node
  arm64: dts: renesas: r8a77961: Add SYS-DMAC nodes
  arm64: dts: renesas: r8a77961: Add I2C nodes
  arm64: dts: renesas: r8a77961: Add SDHI nodes

 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 390 +++++++++++++++++++++-
 1 file changed, 377 insertions(+), 13 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
