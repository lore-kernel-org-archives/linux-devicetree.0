Return-Path: <SRS0=NbWy=4X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB1BC10DCE
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Mar 2020 21:10:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F226B20709
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Mar 2020 21:10:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbgCFVKN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 6 Mar 2020 16:10:13 -0500
Received: from gloria.sntech.de ([185.11.138.130]:36136 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726300AbgCFVKN (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 6 Mar 2020 16:10:13 -0500
Received: from ip5f5a5d2f.dynamic.kabel-deutschland.de ([95.90.93.47] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1jAKES-0003F8-ML; Fri, 06 Mar 2020 22:10:08 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     linux-rockchip@lists.infradead.org
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        mark.rutland@arm.com, christoph.muellner@theobroma-systems.com,
        robin.murphy@arm.com, heiko@sntech.de,
        linux-arm-kernel@lists.infradead.org, kever.yang@rock-chips.com,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: [PATCH 1/3] arm64: dts: rockchip: add core devicetree for rk3326
Date:   Fri,  6 Mar 2020 22:09:20 +0100
Message-Id: <20200306210922.172346-1-heiko@sntech.de>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

The rk3326 is basically a px30 without the second display controller.
So add a dtsi based on that, that just removes the affected nodes.

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
---
 arch/arm64/boot/dts/rockchip/rk3326.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3326.dtsi

diff --git a/arch/arm64/boot/dts/rockchip/rk3326.dtsi b/arch/arm64/boot/dts/rockchip/rk3326.dtsi
new file mode 100644
index 000000000000..2ba6da125137
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3326.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2020 Fuzhou Rockchip Electronics Co., Ltd
+ */
+
+#include "px30.dtsi"
+
+&display_subsystem {
+	ports = <&vopb_out>;
+};
+
+/delete-node/ &dsi_in_vopl;
+/delete-node/ &lvds_vopl_in;
+/delete-node/ &vopl;
+/delete-node/ &vopl_mmu;
-- 
2.24.1

