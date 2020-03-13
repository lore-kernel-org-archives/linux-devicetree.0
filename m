Return-Path: <SRS0=byNV=46=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB2EC5ACC0
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Mar 2020 00:58:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8E7822071C
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Mar 2020 00:58:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgCMA6j (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Mar 2020 20:58:39 -0400
Received: from mx.socionext.com ([202.248.49.38]:4532 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727070AbgCMA6j (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 12 Mar 2020 20:58:39 -0400
Received: from unknown (HELO iyokan-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 13 Mar 2020 09:58:37 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
        by iyokan-ex.css.socionext.com (Postfix) with ESMTP id 11939603AB;
        Fri, 13 Mar 2020 09:58:38 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Fri, 13 Mar 2020 09:58:38 +0900
Received: from plum.e01.socionext.com (unknown [10.213.132.32])
        by kinkan.css.socionext.com (Postfix) with ESMTP id 74BFA1A01BB;
        Fri, 13 Mar 2020 09:58:36 +0900 (JST)
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH 03/10] ARM: dts: uniphier: Add USB3 controller nodes for Pro5
Date:   Fri, 13 Mar 2020 09:58:09 +0900
Message-Id: <1584061096-23686-4-git-send-email-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584061096-23686-1-git-send-email-hayashi.kunihiko@socionext.com>
References: <1584061096-23686-1-git-send-email-hayashi.kunihiko@socionext.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add USB3 controller nodes for Pro5 SoC and the boards.

Pro5 SoC has 2 controllers. USB0 includes 1 SS-PHY and 1 HS-PHY, and USB1
includes 1 SS-PHY and 2 HS-PHY.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 arch/arm/boot/dts/uniphier-pro5.dtsi | 148 +++++++++++++++++++++++++++++++++++
 1 file changed, 148 insertions(+)

diff --git a/arch/arm/boot/dts/uniphier-pro5.dtsi b/arch/arm/boot/dts/uniphier-pro5.dtsi
index ecab061..fe8d306 100644
--- a/arch/arm/boot/dts/uniphier-pro5.dtsi
+++ b/arch/arm/boot/dts/uniphier-pro5.dtsi
@@ -461,6 +461,154 @@
 			};
 		};
 
+		usb0: usb@65a00000 {
+			compatible = "socionext,uniphier-dwc3", "snps,dwc3";
+			status = "disabled";
+			reg = <0x65a00000 0xcd00>;
+			interrupt-names = "host";
+			interrupts = <0 134 4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_usb0>;
+			clock-names = "ref", "bus_early", "suspend";
+			clocks = <&sys_clk 12>, <&sys_clk 12>, <&sys_clk 12>;
+			resets = <&usb0_rst 15>;
+			phys = <&usb0_hsphy0>, <&usb0_ssphy0>;
+			dr_mode = "host";
+		};
+
+		usb-glue@65b00000 {
+			compatible = "socionext,uniphier-pro5-dwc3-glue",
+				     "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x65b00000 0x400>;
+
+			usb0_rst: reset@0 {
+				compatible = "socionext,uniphier-pro5-usb3-reset";
+				reg = <0x0 0x4>;
+				#reset-cells = <1>;
+				clock-names = "gio", "link";
+				clocks = <&sys_clk 12>, <&sys_clk 14>;
+				reset-names = "gio", "link";
+				resets = <&sys_rst 12>, <&sys_rst 14>;
+			};
+
+			usb0_vbus0: regulator@100 {
+				compatible = "socionext,uniphier-pro5-usb3-regulator";
+				reg = <0x100 0x10>;
+				clock-names = "gio", "link";
+				clocks = <&sys_clk 12>, <&sys_clk 14>;
+				reset-names = "gio", "link";
+				resets = <&sys_rst 12>, <&sys_rst 14>;
+			};
+
+			usb0_hsphy0: hs-phy@280 {
+				compatible = "socionext,uniphier-pro5-usb3-hsphy";
+				reg = <0x280 0x10>;
+				#phy-cells = <0>;
+				clock-names = "gio", "link";
+				clocks = <&sys_clk 12>, <&sys_clk 14>;
+				reset-names = "gio", "link";
+				resets = <&sys_rst 12>, <&sys_rst 14>;
+				vbus-supply = <&usb0_vbus0>;
+			};
+
+			usb0_ssphy0: ss-phy@380 {
+				compatible = "socionext,uniphier-pro5-usb3-ssphy";
+				reg = <0x380 0x10>;
+				#phy-cells = <0>;
+				clock-names = "gio", "link";
+				clocks = <&sys_clk 12>, <&sys_clk 14>;
+				reset-names = "gio", "link";
+				resets = <&sys_rst 12>, <&sys_rst 14>;
+				vbus-supply = <&usb0_vbus0>;
+			};
+		};
+
+		usb1: usb@65c00000 {
+			compatible = "socionext,uniphier-dwc3", "snps,dwc3";
+			status = "disabled";
+			reg = <0x65c00000 0xcd00>;
+			interrupt-names = "host";
+			interrupts = <0 137 4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_usb1>, <&pinctrl_usb2>;
+			clock-names = "ref", "bus_early", "suspend";
+			clocks = <&sys_clk 12>, <&sys_clk 12>, <&sys_clk 12>;
+			resets = <&usb1_rst 15>;
+			phys = <&usb1_hsphy0>, <&usb1_hsphy1>, <&usb1_ssphy0>;
+			dr_mode = "host";
+		};
+
+		usb-glue@65d00000 {
+			compatible = "socionext,uniphier-pro5-dwc3-glue",
+				     "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x65d00000 0x400>;
+
+			usb1_rst: reset@0 {
+				compatible = "socionext,uniphier-pro5-usb3-reset";
+				reg = <0x0 0x4>;
+				#reset-cells = <1>;
+				clock-names = "gio", "link";
+				clocks = <&sys_clk 12>, <&sys_clk 15>;
+				reset-names = "gio", "link";
+				resets = <&sys_rst 12>, <&sys_rst 15>;
+			};
+
+			usb1_vbus0: regulator@100 {
+				compatible = "socionext,uniphier-pro5-usb3-regulator";
+				reg = <0x100 0x10>;
+				clock-names = "gio", "link";
+				clocks = <&sys_clk 12>, <&sys_clk 15>;
+				reset-names = "gio", "link";
+				resets = <&sys_rst 12>, <&sys_rst 15>;
+			};
+
+			usb1_vbus1: regulator@110 {
+				compatible = "socionext,uniphier-pro5-usb3-regulator";
+				reg = <0x110 0x10>;
+				clock-names = "gio", "link";
+				clocks = <&sys_clk 12>, <&sys_clk 15>;
+				reset-names = "gio", "link";
+				resets = <&sys_rst 12>, <&sys_rst 15>;
+			};
+
+			usb1_hsphy0: hs-phy@280 {
+				compatible = "socionext,uniphier-pro5-usb3-hsphy";
+				reg = <0x280 0x10>;
+				#phy-cells = <0>;
+				clock-names = "gio", "link";
+				clocks = <&sys_clk 12>, <&sys_clk 15>;
+				reset-names = "gio", "link";
+				resets = <&sys_rst 12>, <&sys_rst 15>;
+				vbus-supply = <&usb1_vbus0>;
+			};
+
+			usb1_hsphy1: hs-phy@290 {
+				compatible = "socionext,uniphier-pro5-usb3-hsphy";
+				reg = <0x290 0x10>;
+				#phy-cells = <0>;
+				clock-names = "gio", "link";
+				clocks = <&sys_clk 12>, <&sys_clk 15>;
+				reset-names = "gio", "link";
+				resets = <&sys_rst 12>, <&sys_rst 15>;
+				vbus-supply = <&usb1_vbus1>;
+			};
+
+			usb1_ssphy0: ss-phy@380 {
+				compatible = "socionext,uniphier-pro5-usb3-ssphy";
+				reg = <0x380 0x10>;
+				#phy-cells = <0>;
+				clock-names = "gio", "link";
+				clocks = <&sys_clk 12>, <&sys_clk 15>;
+				reset-names = "gio", "link";
+				resets = <&sys_rst 12>, <&sys_rst 15>;
+				vbus-supply = <&usb1_vbus0>;
+			};
+		};
+
 		nand: nand@68000000 {
 			compatible = "socionext,uniphier-denali-nand-v5b";
 			status = "disabled";
-- 
2.7.4

