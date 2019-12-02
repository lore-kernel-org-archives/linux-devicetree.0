Return-Path: <SRS0=pYa2=ZY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97778C43215
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 14:46:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5C66520833
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 14:46:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IL49D1OR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727435AbfLBOqG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 09:46:06 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:43095 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727418AbfLBOqF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 09:46:05 -0500
Received: by mail-pj1-f65.google.com with SMTP id g4so4183722pjs.10
        for <devicetree@vger.kernel.org>; Mon, 02 Dec 2019 06:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=EgBc9VM9B5hJ1sbfALHA6E1zLVyhAXo1MFpBabae6qw=;
        b=IL49D1ORHBkEdylQCbcNyzrvk/s+gfJ3eVsYP6RsGiV7EE1k6MxMgfqF6jxlyIg9Mr
         LuQMh32Ztk/TegedcU++/D2/w3wQeIS6OMSzufbBrS2nhUcS2Eu22wFKZq8bU15gvKma
         PaecF9ntDUa12mIcfoQZVRwObp6W7NAuHDZypBEldvUa2hyxdgdySLETEhLGOxsGR3K5
         2U/Pdm4XlZsgQC56HI928JmsRUEZ7HiTjjr5LEckMbFtB3RVeoD72m8VDt8+/LFLSPgp
         9qyC5mxd8+89fRAQQCtZ2JDxc1MA9fRUbK4DTdoIe3RpOiImO4NRy99US2lTuRk8v6xt
         iApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=EgBc9VM9B5hJ1sbfALHA6E1zLVyhAXo1MFpBabae6qw=;
        b=TXLlRnDH5P+P1ZIFMPBXm+ryuUZuTmLf2opzQNChztZSCzADMxyFrUsjh01a9X/x/o
         DfAL4ZHgGuxgvhFy3HZroWe87PJzGM6MXKM21hXv3xUCATEALKNJr4yBQeCdffD7FUNS
         VopNtP8mqwl7P3CBBPLe6HeTBWgw6AcYbpbydWDWah+MF02W1dJUADustsB+0PgsH+Uq
         Dd7i6Uovgho++9hAY8Bw3V4OAQJEzPhGf05h/Yf1yD93GDyi1xAMh+LlWgAdmWhYwRS9
         vFd8n/KIy3mYX/MsCUcsR4VN0cPEJKfufR9o2mHTmnyIdxXRgYFCXz4+En+0Gh8X82No
         yEHg==
X-Gm-Message-State: APjAAAUfoS7qgJkgukfu/azuoJT8sFCSF31mvTglgzq1spAHx4urMMBf
        Zpxz/31Oql9S6CXaB3mjGiACxA==
X-Google-Smtp-Source: APXvYqx4po8E82VeygFNfDxWOAhVE4Y4E3I4YFNShd+lN7Z3Y+pV99JNLF/PHhiBTzaj70JsQBmr1Q==
X-Received: by 2002:a17:90a:353:: with SMTP id 19mr37365251pjf.128.1575297963291;
        Mon, 02 Dec 2019 06:46:03 -0800 (PST)
Received: from localhost.localdomain (li519-153.members.linode.com. [66.175.222.153])
        by smtp.gmail.com with ESMTPSA id f10sm34347813pfd.28.2019.12.02.06.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 06:46:02 -0800 (PST)
From:   Jun Nie <jun.nie@linaro.org>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, xuwei5@hisilicon.com, p.zabel@pengutronix.de,
        opensource@jilayne.com, swinslow@gmail.com, jun.nie@linaro.org,
        allison@lohutok.net, yuehaibing@huawei.com, tglx@linutronix.de,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, xuejiancheng@hisilicon.com
Subject: [PATCH 3/3] ARM: dts: Update reset for hi3519 and hi3798cv200
Date:   Mon,  2 Dec 2019 22:45:24 +0800
Message-Id: <20191202144524.5391-4-jun.nie@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191202144524.5391-1-jun.nie@linaro.org>
References: <20191202144524.5391-1-jun.nie@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Update reset for hi3519 and hi3798cv200 as driver is extended to
support configurable reset operation type.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 arch/arm/boot/dts/hi3519.dtsi                 |  2 +-
 .../arm64/boot/dts/hisilicon/hi3798cv200.dtsi | 47 +++++++++++--------
 2 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/arch/arm/boot/dts/hi3519.dtsi b/arch/arm/boot/dts/hi3519.dtsi
index 410409a0ed66..2335c8443d2d 100644
--- a/arch/arm/boot/dts/hi3519.dtsi
+++ b/arch/arm/boot/dts/hi3519.dtsi
@@ -37,7 +37,7 @@
 	crg: clock-reset-controller@12010000 {
 		compatible = "hisilicon,hi3519-crg";
 		#clock-cells = <1>;
-		#reset-cells = <2>;
+		#reset-cells = <3>;
 		reg = <0x12010000 0x10000>;
 	};
 
diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
index 13821a0ff524..0a30aaae6bf2 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
@@ -9,8 +9,10 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy.h>
+#include <dt-bindings/reset/hisilicon-resets.h>
 #include <dt-bindings/reset/ti-syscon.h>
 
+
 / {
 	compatible = "hisilicon,hi3798cv200";
 	interrupt-parent = <&gic>;
@@ -86,7 +88,7 @@
 			compatible = "hisilicon,hi3798cv200-crg", "syscon", "simple-mfd";
 			reg = <0x8a22000 0x1000>;
 			#clock-cells = <1>;
-			#reset-cells = <2>;
+			#reset-cells = <3>;
 
 			gmacphyrst: reset-controller {
 				compatible = "ti,syscon-reset";
@@ -103,7 +105,7 @@
 			compatible = "hisilicon,hi3798cv200-sysctrl", "syscon";
 			reg = <0x8000000 0x1000>;
 			#clock-cells = <1>;
-			#reset-cells = <2>;
+			#reset-cells = <3>;
 		};
 
 		perictrl: peripheral-controller@8a20000 {
@@ -118,20 +120,22 @@
 				compatible = "hisilicon,hi3798cv200-usb2-phy";
 				reg = <0x120 0x4>;
 				clocks = <&crg HISTB_USB2_PHY1_REF_CLK>;
-				resets = <&crg 0xbc 4>;
+				resets = <&crg 0xbc 4 HISI_RESET_DEFAULT>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 
 				usb2_phy1_port0: phy@0 {
 					reg = <0>;
 					#phy-cells = <0>;
-					resets = <&crg 0xbc 8>;
+					resets = <&crg 0xbc 8
+						  HISI_RESET_DEFAULT>;
 				};
 
 				usb2_phy1_port1: phy@1 {
 					reg = <1>;
 					#phy-cells = <0>;
-					resets = <&crg 0xbc 9>;
+					resets = <&crg 0xbc 9
+						  HISI_RESET_DEFAULT>;
 				};
 			};
 
@@ -139,14 +143,15 @@
 				compatible = "hisilicon,hi3798cv200-usb2-phy";
 				reg = <0x124 0x4>;
 				clocks = <&crg HISTB_USB2_PHY2_REF_CLK>;
-				resets = <&crg 0xbc 6>;
+				resets = <&crg 0xbc 6 HISI_RESET_DEFAULT>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 
 				usb2_phy2_port0: phy@0 {
 					reg = <0>;
 					#phy-cells = <0>;
-					resets = <&crg 0xbc 10>;
+					resets = <&crg 0xbc 10
+						  HISI_RESET_DEFAULT>;
 				};
 			};
 
@@ -155,7 +160,7 @@
 				reg = <0x850 0x8>;
 				#phy-cells = <1>;
 				clocks = <&crg HISTB_COMBPHY0_CLK>;
-				resets = <&crg 0x188 4>;
+				resets = <&crg 0x188 4 HISI_RESET_DEFAULT>;
 				assigned-clocks = <&crg HISTB_COMBPHY0_CLK>;
 				assigned-clock-rates = <100000000>;
 				hisilicon,fixed-mode = <PHY_TYPE_USB3>;
@@ -166,7 +171,7 @@
 				reg = <0x858 0x8>;
 				#phy-cells = <1>;
 				clocks = <&crg HISTB_COMBPHY1_CLK>;
-				resets = <&crg 0x188 12>;
+				resets = <&crg 0x188 12 HISI_RESET_DEFAULT>;
 				assigned-clocks = <&crg HISTB_COMBPHY1_CLK>;
 				assigned-clock-rates = <100000000>;
 				hisilicon,mode-select-bits = <0x0008 11 (0x3 << 11)>;
@@ -306,7 +311,7 @@
 			clocks = <&crg HISTB_SDIO0_CIU_CLK>,
 				 <&crg HISTB_SDIO0_BIU_CLK>;
 			clock-names = "ciu", "biu";
-			resets = <&crg 0x9c 4>;
+			resets = <&crg 0x9c 4 HISI_RESET_DEFAULT>;
 			reset-names = "reset";
 			status = "disabled";
 		};
@@ -320,7 +325,7 @@
 				 <&crg HISTB_MMC_SAMPLE_CLK>,
 				 <&crg HISTB_MMC_DRV_CLK>;
 			clock-names = "ciu", "biu", "ciu-sample", "ciu-drive";
-			resets = <&crg 0xa0 4>;
+			resets = <&crg 0xa0 4 HISI_RESET_DEFAULT>;
 			reset-names = "reset";
 			status = "disabled";
 		};
@@ -525,8 +530,8 @@
 			clocks = <&crg HISTB_ETH0_MAC_CLK>,
 				 <&crg HISTB_ETH0_MACIF_CLK>;
 			clock-names = "mac_core", "mac_ifc";
-			resets = <&crg 0xcc 8>,
-				 <&crg 0xcc 10>,
+			resets = <&crg 0xcc 8 HISI_RESET_DEFAULT>,
+				 <&crg 0xcc 10 HISI_RESET_DEFAULT>,
 				 <&gmacphyrst 0>;
 			reset-names = "mac_core", "mac_ifc", "phy";
 			status = "disabled";
@@ -540,8 +545,8 @@
 			clocks = <&crg HISTB_ETH1_MAC_CLK>,
 				 <&crg HISTB_ETH1_MACIF_CLK>;
 			clock-names = "mac_core", "mac_ifc";
-			resets = <&crg 0xcc 9>,
-				 <&crg 0xcc 11>,
+			resets = <&crg 0xcc 9 HISI_RESET_DEFAULT>,
+				 <&crg 0xcc 11 HISI_RESET_DEFAULT>,
 				 <&gmacphyrst 1>;
 			reset-names = "mac_core", "mac_ifc", "phy";
 			status = "disabled";
@@ -578,7 +583,9 @@
 				 <&crg HISTB_PCIE_SYS_CLK>,
 				 <&crg HISTB_PCIE_BUS_CLK>;
 			clock-names = "aux", "pipe", "sys", "bus";
-			resets = <&crg 0x18c 6>, <&crg 0x18c 5>, <&crg 0x18c 4>;
+			resets = <&crg 0x18c 6 HISI_RESET_DEFAULT>,
+				 <&crg 0x18c 5 HISI_RESET_DEFAULT>,
+				 <&crg 0x18c 4 HISI_RESET_DEFAULT>;
 			reset-names = "soft", "sys", "bus";
 			phys = <&combphy1 PHY_TYPE_PCIE>;
 			phy-names = "phy";
@@ -593,7 +600,7 @@
 				 <&crg HISTB_USB2_12M_CLK>,
 				 <&crg HISTB_USB2_48M_CLK>;
 			clock-names = "bus", "clk12", "clk48";
-			resets = <&crg 0xb8 12>;
+			resets = <&crg 0xb8 12 HISI_RESET_DEFAULT>;
 			reset-names = "bus";
 			phys = <&usb2_phy1_port0>;
 			phy-names = "usb";
@@ -608,9 +615,9 @@
 				 <&crg HISTB_USB2_PHY_CLK>,
 				 <&crg HISTB_USB2_UTMI_CLK>;
 			clock-names = "bus", "phy", "utmi";
-			resets = <&crg 0xb8 12>,
-				 <&crg 0xb8 16>,
-				 <&crg 0xb8 13>;
+			resets = <&crg 0xb8 12 HISI_RESET_DEFAULT>,
+				 <&crg 0xb8 16 HISI_RESET_DEFAULT>,
+				 <&crg 0xb8 13 HISI_RESET_DEFAULT>;
 			reset-names = "bus", "phy", "utmi";
 			phys = <&usb2_phy1_port0>;
 			phy-names = "usb";
-- 
2.17.1

