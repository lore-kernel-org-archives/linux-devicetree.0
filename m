Return-Path: <SRS0=Wk4Z=ZO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D95C432C0
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 07:11:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8B3CA205C9
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 07:11:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfKVHLG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 22 Nov 2019 02:11:06 -0500
Received: from mail-sh.amlogic.com ([58.32.228.43]:61411 "EHLO
        mail-sh.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbfKVHLG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 22 Nov 2019 02:11:06 -0500
X-Greylist: delayed 902 seconds by postgrey-1.27 at vger.kernel.org; Fri, 22 Nov 2019 02:11:01 EST
Received: from droid10.amlogic.com (10.18.11.213) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.1591.10; Fri, 22 Nov 2019
 14:56:24 +0800
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
Subject: [PATCH 2/6] dt-bindings: usb: dwc3: Add the Amlogic A1 Family DWC3 Glue Bindings
Date:   Fri, 22 Nov 2019 14:55:53 +0800
Message-ID: <1574405757-76184-3-git-send-email-hanjie.lin@amlogic.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574405757-76184-1-git-send-email-hanjie.lin@amlogic.com>
References: <1574405757-76184-1-git-send-email-hanjie.lin@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.18.11.213]
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The Amlogic A1 SoC Family embeds 1 USB Controllers:
 - a DWC3 IP configured as Host for USB2 and USB3

A glue connects the controllers to the USB2 PHY of A1 SoC.

Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
Signed-off-by: Yue Wang <yue.wang@amlogic.com>
---
 .../devicetree/bindings/usb/amlogic,dwc3.txt       | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt b/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
index 6ffb09b..63dc60b 100644
--- a/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
@@ -128,3 +128,56 @@ Example device nodes:
 				snps,quirk-frame-length-adjustment;
 			};
 	};
+
+Amlogic Meson A1 DWC3 USB SoC Controller Glue
+
+The Amlogic A1 embeds a DWC3 USB IP Core configured for USB2 in
+host-only mode.
+
+Required properties:
+- compatible:	Should be "amlogic,meson-a1-usb-ctrl"
+- clocks:       The clocks needed by the usb controller
+- clock-names:  Should contain the name of the clocks: "usb_ctrl", "usb_bus",
+                "xtal_usb_phy", "xtal_usb_ctrl"
+- resets:	a handle for the shared "USB" reset line
+- reg:		The base address and length of the registers
+- phys: 	handle to used PHYs on the system
+	- a <0> phandle can be used if a PHY is not used
+- phy-names:	names of the used PHYs on the system :
+	- "usb2-phy0" for USB2 PHY if USBHOST port is used
+
+Required child nodes:
+
+A child node must exist to represent the core DWC3 IP block. The name of
+the node is not important. The content of the node is defined in dwc3.txt.
+
+PHY documentation is provided in the following places:
+- Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml
+
+Example device nodes:
+	usb: usb@ffe09000 {
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
+			clock-names = "usb_ctrl", "usb_bus", "xtal_usb_phy", "xtal_usb_ctrl";
+			resets = <&reset RESET_USBCTRL>;
+			phys = <&usb2_phy0>;
+			phy-names = "usb2-phy0";
+
+			dwc3: usb@ff400000 {
+					compatible = "snps,dwc3";
+					reg = <0x0 0xff400000 0x0 0x100000>;
+					interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+					dr_mode = "host";
+					snps,dis_u2_susphy_quirk;
+					snps,quirk-frame-length-adjustment = <0x20>;
+			};
+	};
-- 
2.7.4

