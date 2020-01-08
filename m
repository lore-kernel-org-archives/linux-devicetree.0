Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA84C33CA1
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 09:57:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D899C20705
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 09:57:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727517AbgAHJ5O (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 04:57:14 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:39465 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726079AbgAHJ5O (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 04:57:14 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ip85L-0003Io-1T; Wed, 08 Jan 2020 10:57:07 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ip85K-000674-2E; Wed, 08 Jan 2020 10:57:06 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     support.opensource@diasemi.com, linux@roeck-us.net,
        robh+dt@kernel.org, lee.jones@linaro.org,
        stwiss.opensource@diasemi.com, Adam.Thomson.Opensource@diasemi.com
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 0/3] Explicit disable da9062 watchdog during suspend
Date:   Wed,  8 Jan 2020 10:57:01 +0100
Message-Id: <20200108095704.23233-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

this v2 contains all review comments made on [1]. Furthermore the series
includes a fix patch which is need to parse the devicetree.

[1] https://www.spinics.net/lists/linux-watchdog/msg17044.html

Regards,
  Marco

Marco Felsch (3):
  mfd: da9062: fix watchdog compatible string
  dt-bindings: watchdog: da9062: add suspend disable option
  watchdog: da9062: add power management ops

 .../bindings/watchdog/da9062-wdt.txt          |  5 +++
 drivers/mfd/da9062-core.c                     |  2 +-
 drivers/watchdog/da9062_wdt.c                 | 37 +++++++++++++++++++
 3 files changed, 43 insertions(+), 1 deletion(-)

-- 
2.20.1

