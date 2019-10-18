Return-Path: <SRS0=cZLa=YL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E975CA9EA9
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 16:32:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB54520659
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 16:32:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440098AbfJRQcd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 18 Oct 2019 12:32:33 -0400
Received: from muru.com ([72.249.23.125]:38112 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2443108AbfJRQca (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 18 Oct 2019 12:32:30 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 47121809F;
        Fri, 18 Oct 2019 16:33:04 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 00/10] Drop even more legacy platform data for omaps
Date:   Fri, 18 Oct 2019 09:32:10 -0700
Message-Id: <20191018163220.3504-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi all,

This series of changes remove even more legacy platform data and
ti,hwmods devitree property for omap variants.

The patches are against v5.4-rc1 on top of the previous set:

[PATCH 00/21] Drop more legacy platform data for omaps

Please note that the earlier watchdog changes depend on the following
patch:

[PATCH] bus: ti-sysc: Fix watchdog quirk handling

Regards,

Tony


Tony Lindgren (10):
  ARM: OMAP2+: Drop legacy platform data for omap4 mcbsp
  ARM: OMAP2+: Drop legacy platform data for omap5 mcbsp
  ARM: OMAP2+: Drop legacy platform data for am4 hdq1w
  ARM: OMAP2+: Drop legacy platform data for dra7 hdq1w
  ARM: OMAP2+: Drop legacy platform data for omap4 hdq1w
  ARM: OMAP2+: Drop legacy platform data for am3 and am4 rng
  ARM: OMAP2+: Drop legacy platform data for dra7 rng
  ARM: OMAP2+: Drop legacy platform data for am3 and am4 mcasp
  ARM: OMAP2+: Drop legacy platform data for omap4 mcasp
  ARM: OMAP2+: Drop legacy platform data for musb on omap4

 arch/arm/boot/dts/am33xx-l4.dtsi              |   3 -
 arch/arm/boot/dts/am437x-l4.dtsi              |   4 -
 arch/arm/boot/dts/dra7-l4.dtsi                |   2 -
 arch/arm/boot/dts/omap4-l4-abe.dtsi           |   4 -
 arch/arm/boot/dts/omap4-l4.dtsi               |   3 -
 arch/arm/boot/dts/omap5-l4-abe.dtsi           |   3 -
 .../omap_hwmod_33xx_43xx_common_data.h        |   4 -
 .../omap_hwmod_33xx_43xx_interconnect_data.c  |  10 -
 .../omap_hwmod_33xx_43xx_ipblock_data.c       |  74 -----
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |   1 -
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    |  37 ---
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c    | 302 ------------------
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c    | 113 -------
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c     |  79 -----
 14 files changed, 639 deletions(-)

-- 
2.23.0
