Return-Path: <SRS0=83Av=24=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13446C33C8C
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 12:29:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E45FB2081E
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 12:29:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727177AbgAGM3O (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jan 2020 07:29:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:45642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726937AbgAGM3O (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 7 Jan 2020 07:29:14 -0500
Received: from localhost (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A809D2072A;
        Tue,  7 Jan 2020 12:29:13 +0000 (UTC)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Wei Xu <xuwei5@hisilicon.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] arm64: dts: hi3798cv200: correct PCIe 'bus-range' setting
Date:   Tue,  7 Jan 2020 20:29:08 +0800
Message-Id: <20200107122908.18025-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The PCIe 'bus-range' setting is incorrect and causing the following
message during boot.

pci_bus 0000:01: busn_res: can not insert [bus 01-ff] under [bus 00-0f] (conflicts with (null) [bus 00-0f])

Correct it to get rid of the message.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
index 0a30aaae6bf2..4d1a3d1fc31c 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
@@ -569,7 +569,7 @@
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";
-			bus-range = <0 15>;
+			bus-range = <0x00 0xff>;
 			num-lanes = <1>;
 			ranges = <0x81000000 0x0 0x00000000 0x4f00000 0x0 0x100000
 				  0x82000000 0x0 0x3000000 0x3000000 0x0 0x01f00000>;
-- 
2.17.1

