From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH 4/8] arm64: dts: renesas: eagle: Add thc63 LVDS map
Date: Thu, 19 Apr 2018 11:31:05 +0200
Message-ID: <1524130269-32688-5-git-send-email-jacopo+renesas@jmondi.org>
References: <1524130269-32688-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524130269-32688-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: architt@codeaurora.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, airlied@linux.ie
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, daniel@ffwll.ch, peda@axentia.se, linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add LVDS map mode description property to THC63LVD1024 LVDS decoder in
R-Car V3M-Eagle board device tree.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
index ebfbb51..2609fa3 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -56,6 +56,7 @@
 		compatible = "thine,thc63lvd1024";
 
 		vcc-supply = <&d3p3>;
+		thine,map = <1>;
 
 		ports {
 			#address-cells = <1>;
-- 
2.7.4
