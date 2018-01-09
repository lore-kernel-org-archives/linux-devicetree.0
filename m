From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] ARM: dts: lager: Add CEC clock for HDMI transmitter
Date: Tue,  9 Jan 2018 17:49:04 +0100
Message-ID: <20180109164904.24523-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-Id: devicetree@vger.kernel.org

The adv7511 on the Lager board has a 12 MHz fixed clock
for the CEC block. Specify this in the dts to enable CEC support.

Based on a similar patch for Koelsch by Hans Verkuil.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm/boot/dts/r8a7790-lager.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index e3d27783b6b56b42..b8bbaa87a5ab7c99 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -670,11 +670,19 @@
 		};
 	};
 
+	cec_clock: cec-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <12000000>;
+	};
+
 	hdmi@39 {
 		compatible = "adi,adv7511w";
 		reg = <0x39>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&cec_clock>;
+		clock-names = "cec";
 
 		adi,input-depth = <8>;
 		adi,input-colorspace = "rgb";
-- 
2.15.1
