Return-Path: <SRS0=Xnq8=HX=vger.kernel.org=devicetree-owner@kernel.org>
Received: from m12-12.163.com ([220.181.12.12]:35573 "EHLO m12-12.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751533AbeEDJVQ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 4 May 2018 05:21:16 -0400
From: sunjg79@163.com
Subject: [PATCH 1/2] dt-bindings: usb: add bindings doc for HiSilicon STB xHCI host controller
Date: Fri,  4 May 2018 17:20:44 +0800
Message-Id: <1525425645-17246-2-git-send-email-sunjg79@163.com>
In-Reply-To: <1525425645-17246-1-git-send-email-sunjg79@163.com>
References: <1525425645-17246-1-git-send-email-sunjg79@163.com>
Sender: devicetree-owner@vger.kernel.org
To: mathias.nyman@intel.com, gregkh@linuxfoundation.org, robh+dt@kernel.org
Cc: shawn.guo@linaro.org, xuejiancheng@hisilicon.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Jianguo Sun <sunjianguo1@huawei.com>
List-ID: <devicetree@vger.kernel.org>

From: Jianguo Sun <sunjianguo1@huawei.com>

This commit adds bindings doc for HiSilicon STB xHCI host controller.

Signed-off-by: Jianguo Sun <sunjianguo1@huawei.com>
---
 .../bindings/usb/hisilicon,histb-xhci.txt          | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/hisilicon,histb-xhci.txt

diff --git a/Documentation/devicetree/bindings/usb/hisilicon,histb-xhci.txt b/Documentation/devicetree/bindings/usb/hisilicon,histb-xhci.txt
new file mode 100644
index 0000000..628225f
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/hisilicon,histb-xhci.txt
@@ -0,0 +1,40 @@
+HiSilicon STB xHCI
+
+The device node for HiSilicon STB xHCI host controller
+
+Required properties:
+ - compatible : should be "hisilicon,hi3798cv200-xhci"
+ - reg : specifies physical base address and size of the registers
+ - interrupts : interrupt used by the controller
+ - clocks : a list of phandle + clock-specifier pairs, one for each
+	entry in clock-names
+ - clock-names : must contain
+	"bus": for bus clock
+	"utmi": for utmi clock
+	"pipe": for pipeE clock
+	"suspend": for suspend clock
+ - resets: a list of phandle and reset specifier pairs as listed in
+	reset-names property.
+ - reset-names: must contain
+	"soft": for soft reset
+ - phys : a list of phandle + phy specifier pairs
+ - phy-names: must contain one of following at least:
+	"inno": for inno phy
+	"combo": for combo phy
+
+Example:
+
+xhci0: xchi@f98a0000 {
+	compatible = "hisilicon,hi3798cv200-xhci";
+	reg = <0xf98a0000 0x10000>;
+	interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&crg HISTB_USB3_BUS_CLK>,
+		 <&crg HISTB_USB3_UTMI_CLK>,
+		 <&crg HISTB_USB3_PIPE_CLK>,
+		 <&crg HISTB_USB3_SUSPEND_CLK>;
+	clock-names = "bus", "utmi", "pipe", "suspend";
+	resets = <&crg 0xb0 12>;
+	reset-names = "soft";
+	phys = <&usb2_phy1_port1 0>, <&combphy0 PHY_TYPE_USB3>;
+	phy-names = "inno", "combo";
+};
-- 
2.7.4


