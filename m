Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A816FC6195
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 16:33:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 073C121D7E
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 16:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573230818;
	bh=UeMscuwn+pcOaqcivEWoY6tTzZ4IfIrgBaezsSFhZeE=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=KDswZTb3bf5C8FwmY0soouRpkMCkHvwlpTwuxlAcuAD69W3TNd8jByFWxJ2GwH3FM
	 xOU/Fp/SAdiPUi/y5cRgHpkIURL2/ZGtWbOgfZ4hNX8tI0yJ1S8eCAq8u+MPRywAVz
	 l+tnhDr9X5QZcvQ3c1jcb8v3xYrL8Vg4jzx0KQdI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727296AbfKHQdh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 Nov 2019 11:33:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:35680 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726039AbfKHQdc (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 8 Nov 2019 11:33:32 -0500
Received: from localhost.localdomain (cpe-70-114-128-244.austin.res.rr.com [70.114.128.244])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9A19021848;
        Fri,  8 Nov 2019 16:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573230812;
        bh=UeMscuwn+pcOaqcivEWoY6tTzZ4IfIrgBaezsSFhZeE=;
        h=From:To:Cc:Subject:Date:From;
        b=MsFmpA8UMcc4gCKXNcREaOAyWn7Xyz8toa0izII15ieUS7v8qRkcEIZnGv8zYgd/Z
         191w1SUiv6rdIOuSx5yYbYxvtjv75RlDu8lD+IBwjKQQ3ITYuVHcKXSy4EVZJvkCeh
         LwQ9Epsa6S6/weuqbLeXhZxNtOwlvpWr4hyAWx5U=
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     dinguyen@kernel.org, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org, mark.rutland@arm.com
Subject: [PATCH 1/2] arm64: dts: agilex: add NAND IP to base dts
Date:   Fri,  8 Nov 2019 10:33:26 -0600
Message-Id: <20191108163327.2917-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add NAND entry to base DTSI.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index 94090c6fb946..f9565e76a9d1 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -249,6 +249,18 @@
 			status = "disabled";
 		};
 
+		nand: nand@ffb90000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "altr,socfpga-denali-nand";
+			reg = <0xffb90000 0x10000>,
+			      <0xffb80000 0x1000>;
+			reg-names = "nand_data", "denali_reg";
+			interrupts = <0 97 4>;
+			resets = <&rst NAND_RESET>, <&rst NAND_OCP_RESET>;
+			status = "disabled";
+		};
+
 		ocram: sram@ffe00000 {
 			compatible = "mmio-sram";
 			reg = <0xffe00000 0x40000>;
-- 
2.20.0

