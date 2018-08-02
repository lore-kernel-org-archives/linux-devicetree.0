Return-Path: <SRS0=HJQ3=KR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ed1-f68.google.com ([209.85.208.68]:43037 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732126AbeHBNcQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Aug 2018 09:32:16 -0400
Received: by mail-ed1-f68.google.com with SMTP id b20-v6so818836edt.10
        for <devicetree@vger.kernel.org>; Thu, 02 Aug 2018 04:41:29 -0700 (PDT)
From: Silvan Murer <silvan.murer@gmail.com>
Subject: [PATCH] Change timer interrupt to edge sensitive
Date: Thu,  2 Aug 2018 13:41:14 +0200
Message-Id: <1533210074-4996-1-git-send-email-silvan.murer@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org, thor.thayer@linux.intel.com
Cc: dinguyen@kernel.org, Silvan Murer <silvan.murer@gmail.com>
List-ID: <devicetree@vger.kernel.org>

Signed-off-by: Silvan Murer <silvan.murer@gmail.com>
---
 arch/arm/boot/dts/socfpga_arria10.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index 791ca15..52a7025 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -748,7 +748,7 @@
 		timer@ffffc600 {
 			compatible = "arm,cortex-a9-twd-timer";
 			reg = <0xffffc600 0x100>;
-			interrupts = <1 13 0xf04>;
+			interrupts = <1 13 0xf01>;
 			clocks = <&mpu_periph_clk>;
 		};
 
-- 
2.7.4

