From: Frank Wang <frank.wang@rock-chips.com>
Subject: [PATCH 3/3] ARM: dts: rockchip: enable usb for rv1108-evb
Date: Mon, 21 Aug 2017 16:39:28 +0800
Message-ID: <1503304768-14520-4-git-send-email-frank.wang@rock-chips.com>
References: <1503304768-14520-1-git-send-email-frank.wang@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503304768-14520-1-git-send-email-frank.wang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, huangtao@rock-chips.com, william.wu@rock-chips.com, daniel.meng@rock-chips.com, kever.yang@rock-chips.com, andy.yan@rock-chips.com, wmc@rock-chips.com, Frank Wang <frank.wang@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Rockchip's rv1108-evb board has one usb otg controller and one usb
host controller, each usb controller connect with one usb-phy port
through UTMI+ interface. This patch enables them to support usb on
rv1108-evb board.

Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
---
 arch/arm/boot/dts/rv1108-evb.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/rv1108-evb.dts b/arch/arm/boot/dts/rv1108-evb.dts
index 010763f..5a48e79 100644
--- a/arch/arm/boot/dts/rv1108-evb.dts
+++ b/arch/arm/boot/dts/rv1108-evb.dts
@@ -103,6 +103,18 @@
 	status = "okay";
 };
 
+&u2phy {
+	status = "okay";
+
+	u2phy_otg: otg-port {
+		status = "okay";
+	};
+
+	u2phy_host: host-port {
+		status = "okay";
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
@@ -114,3 +126,15 @@
 &uart2 {
 	status = "okay";
 };
+
+&usb_host_ehci {
+	status = "okay";
+};
+
+&usb_host_ohci {
+	status = "okay";
+};
+
+&usb_otg {
+	status = "okay";
+};
-- 
2.0.0
