Return-Path: <SRS0=v9pK=IB=163.com=sunjg79@kernel.org>
From: sunjg79@163.com
Subject: [PATCH v3 1/2] dt-bindings: usb: add bindings doc for HiSilicon STB xHCI host controller
Date: Mon, 14 May 2018 14:20:41 +0800
Message-Id: <1526278842-13883-2-git-send-email-sunjg79@163.com>
In-Reply-To: <1526278842-13883-1-git-send-email-sunjg79@163.com>
References: <1526278842-13883-1-git-send-email-sunjg79@163.com>
To: mathias.nyman@intel.com, gregkh@linuxfoundation.org, robh+dt@kernel.org
Cc: shawn.guo@linaro.org, xuejiancheng@hisilicon.com, chunfeng.yun@mediatek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Jianguo Sun <sunjianguo1@huawei.com>
List-ID: <devicetree@vger.kernel.org>

From: Jianguo Sun <sunjianguo1@huawei.com>

This commit adds bindings doc for HiSilicon STB xHCI host controller.

Signed-off-by: Jianguo Sun <sunjianguo1@huawei.com>
---
 .../bindings/usb/hisilicon,histb-xhci.txt          | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/hisilicon,histb-xhci.txt

diff --git a/Documentation/devicetree/bindings/usb/hisilicon,histb-xhci.txt b/Documentation/devicetree/bindings/usb/hisilicon,histb-xhci.txt
new file mode 100644
index 0000000..f463349
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/hisilicon,histb-xhci.txt
@@ -0,0 +1,45 @@
+HiSilicon STB xHCI
+
+The device node for HiSilicon STB xHCI host controller
+
+Required properties:
+ - compatible: should be "hisilicon,hi3798cv200-xhci"
+ - reg: specifies physical base address and size of the registers
+ - interrupts : interrupt used by the controller
+ - clocks: a list of phandle + clock-specifier pairs, one for each
+	entry in clock-names
+ - clock-names: must contain
+	"bus": for bus clock
+	"utmi": for utmi clock
+	"pipe": for pipe clock
+	"suspend": for suspend clock
+ - resets: a list of phandle and reset specifier pairs as listed in
+	reset-names property.
+ - reset-names: must contain
+	"soft": for soft reset
+ - phys: a list of phandle + phy specifier pairs
+ - phy-names: must contain at least one of following:
+	"inno": for inno phy
+	"combo": for combo phy
+
+Optional properties:
+  - usb2-lpm-disable: indicate if we don't want to enable USB2 HW LPM
+  - usb3-lpm-capable: determines if platform is USB3 LPM capable
+  - imod-interval-ns: default interrupt moderation interval is 40000ns
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
