From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH v3 11/12] arm64: dts: h3ulcb: enable USB2.0 Host channel 1
Date: Wed, 31 Aug 2016 13:04:03 +0300
Message-ID: <1472637843-15014-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1472637712-14583-1-git-send-email-vladimir.barinov@cogentembedded.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1472637712-14583-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

This supports USB2.0 Host channel 1 on H3ULCB board

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
---
Changes in version 3:
- initially added

 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
index 1750bb1..bbd7928 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
@@ -187,3 +187,11 @@
 
 	status = "okay";
 };
+
+&ehci1 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
-- 
1.9.1
