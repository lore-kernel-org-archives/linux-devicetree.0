Return-Path: <SRS0=b/Hz=6B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA6BC2BB55
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Apr 2020 07:05:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9ACA621D94
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Apr 2020 07:05:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728563AbgDQHFf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Apr 2020 03:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728604AbgDQHFe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Apr 2020 03:05:34 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 543F4C0610D6
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2020 00:05:34 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jPL45-0008Nn-3o; Fri, 17 Apr 2020 09:05:29 +0200
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jPL44-000327-Dh; Fri, 17 Apr 2020 09:05:28 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Rohit Visavalia <rohit.visavalia@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dhaval Shah <dshah@xilinx.com>, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v3 0/6] soc: xilinx: vcu: provide interfaces for other drivers
Date:   Fri, 17 Apr 2020 09:05:20 +0200
Message-Id: <20200417070526.7178-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello,

This is v3 of the series to add interfaces that can be used by other drivers
to the xlnx_vcu driver. See [0] for the full motivation for this patch series.

v2 accidentally contained the unused xvcu_reset() function. I removed the
function again.

Michael

[0] https://lore.kernel.org/linux-arm-kernel/20200317094115.15896-1-m.tretter@pengutronix.de/

Changelog:

v2 -> v3:
- drop unused xvcu_reset() function

v1 -> v2:
- drop custom select for syscon
- unregister registered clocks on driver remove


Michael Tretter (6):
  soc: xilinx: vcu: drop useless success message
  ARM: dts: define indexes for output clocks
  soc: xilinx: vcu: implement clock provider for output clocks
  dt-bindings: soc: xlnx: extract xlnx,vcu-settings to separate binding
  soc: xilinx: vcu: use vcu-settings syscon registers
  soc: xilinx: vcu: add missing register NUM_CORE

 .../soc/xilinx/xlnx,vcu-settings.yaml         |  34 ++++
 .../bindings/soc/xilinx/xlnx,vcu.txt          |   9 +-
 drivers/soc/xilinx/Kconfig                    |   3 +-
 drivers/soc/xilinx/xlnx_vcu.c                 | 158 ++++++++++++------
 include/dt-bindings/clock/xlnx-vcu.h          |  15 ++
 include/linux/mfd/syscon/xlnx-vcu.h           |  39 +++++
 6 files changed, 200 insertions(+), 58 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu-settings.yaml
 create mode 100644 include/dt-bindings/clock/xlnx-vcu.h
 create mode 100644 include/linux/mfd/syscon/xlnx-vcu.h

-- 
2.20.1

