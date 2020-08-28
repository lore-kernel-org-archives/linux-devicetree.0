Return-Path: <SRS0=L07u=CG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC43FC433E6
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 13:01:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9FCD320825
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 13:01:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729363AbgH1NAz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 28 Aug 2020 09:00:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729350AbgH1NAo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 28 Aug 2020 09:00:44 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34852C061264
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2020 06:00:44 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <has@pengutronix.de>)
        id 1kBdzh-0006LG-AF; Fri, 28 Aug 2020 15:00:37 +0200
Received: from has by dude02.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <has@pengutronix.de>)
        id 1kBdzf-0005JG-Ou; Fri, 28 Aug 2020 15:00:36 +0200
From:   Holger Assmann <h.assmann@pengutronix.de>
To:     Rob Herring <robh+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>
Cc:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Holger Assmann <h.assmann@pengutronix.de>,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: stm32: lxa-mc1: enable DDR50 mode on eMMC
Date:   Fri, 28 Aug 2020 15:00:02 +0200
Message-Id: <20200828130002.1701-1-h.assmann@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: has@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Ahmad Fatoum <a.fatoum@pengutronix.de>

The "eMMC high-speed DDR mode (3.3V I/O)" at 50MHz is supported on
the eMMC-interface of the lxa-mc1. Set it in the device tree to
benefit from the speed improvement.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Signed-off-by: Holger Assmann <h.assmann@pengutronix.de>
---
 arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
index b85025d00943..1e5333fd437f 100644
--- a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
@@ -212,6 +212,7 @@
 	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_b>;
 	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_b>;
 	bus-width = <8>;
+	mmc-ddr-3_3v;
 	no-1-8-v;
 	no-sd;
 	no-sdio;
-- 
2.20.1

