Return-Path: <SRS0=9w3Z=YZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3AE0CA9ECF
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 Nov 2019 07:03:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C5B2421734
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 Nov 2019 07:03:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728888AbfKAHDN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 1 Nov 2019 03:03:13 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:63273 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728529AbfKAHDM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 1 Nov 2019 03:03:12 -0400
X-IronPort-AV: E=Sophos;i="5.68,254,1569250800"; 
   d="scan'208";a="30605227"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Nov 2019 16:03:11 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 94E2E419B1D2;
        Fri,  1 Nov 2019 16:03:11 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, geert+renesas@glider.be
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 0/4] clk: renesas: rcar-usb2-clock-sel: Fix clks/resets handling
Date:   Fri,  1 Nov 2019 16:03:07 +0900
Message-Id: <1572591791-11280-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch series is based on the latest renesas-drivers.git /
clk-renesas-for-v5.5 branch.
The hardware also needs multiple clocks/resets management like
renesas_usbhs driver [1], so this patch series fixes it.

[1]
3df0e24 usb: renesas_usbhs: Add multiple clocks management
f181dbb usb: renesas_usbhs: Add reset_control

Changes from v2:
 - Add Rob's Reviewed-by into the patch [12]/4.
 - Fix typo in patch 2/4.
 https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=194309

Changes from v1:
 - Add Reviewed-by into this series' patch 1/4.
 - (new) Add resets and power-domains properties into the patch 2/4.
 - Use clk_bulk_* APIs (except clk_bulk_get() because this driver has
   4 clocks and used only 2 clocks).
 - Add "select RESET_CONTROLLER" into Kconfig
 - Use devm_reset_control_array_get() instead of optional API.
 https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=192869

Yoshihiro Shimoda (4):
  dt-bindings: clock: renesas: rcar-usb2-clock-sel: Fix clock[-name]s
    properties
  dt-bindings: clock: renesas: rcar-usb2-clock-sel: Add power-domains
    and resets properties
  clk: renesas: rcar-usb2-clock-sel: Add multiple clocks management
  clk: renesas: rcar-usb2-clock-sel: Add reset_control

 .../bindings/clock/renesas,rcar-usb2-clock-sel.txt | 13 +++++--
 drivers/clk/renesas/Kconfig                        |  1 +
 drivers/clk/renesas/rcar-usb2-clock-sel.c          | 43 +++++++++++++++++++++-
 3 files changed, 52 insertions(+), 5 deletions(-)

-- 
2.7.4

