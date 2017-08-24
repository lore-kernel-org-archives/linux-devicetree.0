From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH 1/4] arm: dts: gr-peach: Remove empty line
Date: Thu, 24 Aug 2017 10:48:40 +0200
Message-ID: <1503564523-31899-2-git-send-email-jacopo+renesas@jmondi.org>
References: <1503564523-31899-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1503564523-31899-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Remove an empty line in gr-peach device tree source file.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm/boot/dts/r7s72100-gr-peach.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/r7s72100-gr-peach.dts b/arch/arm/boot/dts/r7s72100-gr-peach.dts
index a1b2aef9..1c40a1a 100644
--- a/arch/arm/boot/dts/r7s72100-gr-peach.dts
+++ b/arch/arm/boot/dts/r7s72100-gr-peach.dts
@@ -28,7 +28,6 @@
 	memory@20000000 {
 		device_type = "memory";
 		reg = <0x20000000 0x00a00000>;
-
 	};
 
 	lbsc {
-- 
2.7.4
