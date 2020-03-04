Return-Path: <SRS0=c2W6=4V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73BEC3F2D8
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Mar 2020 06:42:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8770E21744
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Mar 2020 06:42:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725825AbgCDGmT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Mar 2020 01:42:19 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:13923 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725773AbgCDGmT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Mar 2020 01:42:19 -0500
X-IronPort-AV: E=Sophos;i="5.70,513,1574089200"; 
   d="scan'208";a="40717172"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 04 Mar 2020 15:42:18 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4454941CBB61;
        Wed,  4 Mar 2020 15:42:18 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v4 0/4] clk: renesas: rcar-usb2-clock-sel: Fix clks/resets handling
Date:   Wed,  4 Mar 2020 15:42:13 +0900
Message-Id: <1583304137-28482-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch series is based on the latest renesas-drivers.git /
renesas-drivers-2020-02-25-v5.6-rc3 branch.
The hardware also needs multiple clocks/resets management like
renesas_usbhs driver [1], so this patch series fixes it.

[1]
3df0e24 usb: renesas_usbhs: Add multiple clocks management
f181dbb usb: renesas_usbhs: Add reset_control

Changes from v3:
 - Add reset-names property in patch 2/4.
 - Use devm_clk_bulk_get() instead of multiple devm_clk_get() in patch 3/4.
 - Add Geert's Reviewed-by into the patch 4/4.
 https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=196577

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

 .../bindings/clock/renesas,rcar-usb2-clock-sel.txt | 17 +++++++--
 drivers/clk/renesas/Kconfig                        |  1 +
 drivers/clk/renesas/rcar-usb2-clock-sel.c          | 40 ++++++++++++++++++++--
 3 files changed, 53 insertions(+), 5 deletions(-)

-- 
2.7.4

