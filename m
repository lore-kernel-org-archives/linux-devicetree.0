From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH v3 09/12] arm64: dts: h3ulcb: enable WDT
Date: Wed, 31 Aug 2016 13:03:48 +0300
Message-ID: <1472637828-14936-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1472637712-14583-1-git-send-email-vladimir.barinov@cogentembedded.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1472637712-14583-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

This supports watchdog timer for H3ULCB board

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
---
Changes in version 3:
- initially added

 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
index 6936288..bc3d8d5 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
@@ -146,6 +146,11 @@
 	status = "okay";
 };
 
+&wdt0 {
+	timeout-sec = <60>;
+	status = "okay";
+};
+
 &avb {
 	pinctrl-0 = <&avb_pins>;
 	pinctrl-names = "default";
-- 
1.9.1
