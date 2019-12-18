Return-Path: <SRS0=jmN2=2I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6CAAC2D0CD
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 02:43:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 970A021835
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 02:43:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbfLRCnA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 17 Dec 2019 21:43:00 -0500
Received: from mail-sh.amlogic.com ([58.32.228.43]:34131 "EHLO
        mail-sh.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbfLRCnA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 17 Dec 2019 21:43:00 -0500
Received: from droid10.amlogic.com (10.18.11.213) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.1591.10; Wed, 18 Dec 2019
 10:43:25 +0800
From:   Hanjie Lin <hanjie.lin@amlogic.com>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Kevin Hilman <khilman@baylibre.com>
CC:     Hanjie Lin <hanjie.lin@amlogic.com>,
        Yue Wang <yue.wang@amlogic.com>,
        <linux-amlogic@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
Subject: [PATCH v2 6/6] arm64: dts: meson: a1: Enable DWC3 controller
Date:   Wed, 18 Dec 2019 10:42:24 +0800
Message-ID: <1576636944-196192-7-git-send-email-hanjie.lin@amlogic.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576636944-196192-1-git-send-email-hanjie.lin@amlogic.com>
References: <1576636944-196192-1-git-send-email-hanjie.lin@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.18.11.213]
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Enable DWC3 controller for Meson A1 SoC.

Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
Signed-off-by: Yue Wang <yue.wang@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 33 +++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index bd63374a..76f787d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -7,6 +7,8 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/meson-a1-power.h>
 #include <dt-bindings/reset/amlogic,meson-a1-reset.h>
+#include <dt-bindings/clock/a1-pll-clkc.h>
+#include <dt-bindings/clock/a1-clkc.h>
 
 / {
 	compatible = "amlogic,a1";
@@ -125,6 +127,37 @@
 			#interrupt-cells = <3>;
 			#address-cells = <0>;
 		};
+
+		usb: usb@ffe09000 {
+			status = "okay";
+			compatible = "amlogic,meson-a1-usb-ctrl";
+			reg = <0x0 0xffe09000 0x0 0xa0>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			clocks = <&clkc_periphs CLKID_USB_CTRL>,
+				 <&clkc_periphs CLKID_USB_BUS>,
+				 <&clkc_periphs CLKID_XTAL_USB_PHY>,
+				 <&clkc_periphs CLKID_XTAL_USB_CTRL>;
+			clock-names = "usb_ctrl", "usb_bus", "xtal_usb_phy",
+					"xtal_usb_ctrl";
+			resets = <&reset RESET_USBCTRL>;
+
+			dr_mode = "host";
+
+			phys = <&usb2_phy1>;
+			phy-names = "usb2-phy1";
+
+			dwc3: usb@ff400000 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0xff400000 0x0 0x100000>;
+				interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+				dr_mode = "host";
+				snps,dis_u2_susphy_quirk;
+				snps,quirk-frame-length-adjustment = <0x20>;
+			};
+		};
 	};
 
 	timer {
-- 
2.7.4

