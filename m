From: Soren Brinkmann <soren.brinkmann@xilinx.com>
Subject: [PATCH 3/3] ARM: zynq: DT: Add Ethernet phys
Date: Wed, 20 Aug 2014 08:56:59 -0700
Message-ID: <1408550219-19825-3-git-send-email-soren.brinkmann@xilinx.com>
References: <1408550219-19825-1-git-send-email-soren.brinkmann@xilinx.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1408550219-19825-1-git-send-email-soren.brinkmann@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Soren Brinkmann <soren.brinkmann@xilinx.com>
List-Id: devicetree@vger.kernel.org

Add missing Ethernet phys to Zynq DTs.

Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
---
 arch/arm/boot/dts/zynq-zc702.dts | 6 ++++++
 arch/arm/boot/dts/zynq-zc706.dts | 6 ++++++
 arch/arm/boot/dts/zynq-zed.dts   | 6 ++++++
 3 files changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/zynq-zc702.dts b/arch/arm/boot/dts/zynq-zc702.dts
index 30bcfe20f0bc..fa810505ab8f 100644
--- a/arch/arm/boot/dts/zynq-zc702.dts
+++ b/arch/arm/boot/dts/zynq-zc702.dts
@@ -36,6 +36,12 @@
 &gem0 {
 	status = "okay";
 	phy-mode = "rgmii-id";
+	phy-handle = <&ethernet_phy>;
+
+	ethernet_phy: ethernet-phy@7 {
+		compatible = "marvell,88e1116r", "ethernet-phy-ieee802.3-c22";
+		reg = <7>;
+	};
 };
 
 &i2c0 {
diff --git a/arch/arm/boot/dts/zynq-zc706.dts b/arch/arm/boot/dts/zynq-zc706.dts
index 3d9cb023e158..d446b44d45a2 100644
--- a/arch/arm/boot/dts/zynq-zc706.dts
+++ b/arch/arm/boot/dts/zynq-zc706.dts
@@ -33,6 +33,12 @@
 &gem0 {
 	status = "okay";
 	phy-mode = "rgmii-id";
+	phy-handle = <&ethernet_phy>;
+
+	ethernet_phy: ethernet-phy@7 {
+		compatible = "marvell,88e1116r", "ethernet-phy-ieee802.3-c22";
+		reg = <7>;
+	};
 };
 
 &i2c0 {
diff --git a/arch/arm/boot/dts/zynq-zed.dts b/arch/arm/boot/dts/zynq-zed.dts
index 42deb1b7dbc8..92662eb078ce 100644
--- a/arch/arm/boot/dts/zynq-zed.dts
+++ b/arch/arm/boot/dts/zynq-zed.dts
@@ -33,6 +33,12 @@
 &gem0 {
 	status = "okay";
 	phy-mode = "rgmii-id";
+	phy-handle = <&ethernet_phy>;
+
+	ethernet_phy: ethernet-phy@0 {
+		compatible = "marvell,88e1518", "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
 };
 
 &sdhci0 {
-- 
2.0.1.1.gfbfc394
