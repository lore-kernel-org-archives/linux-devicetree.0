From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH 8/9] arm64: dts: m3ulcb: enable WDT
Date: Thu,  3 Nov 2016 21:08:12 +0300
Message-ID: <1478196492-1480-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1478196375-1131-1-git-send-email-vladimir.barinov@cogentembedded.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1478196375-1131-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

This supports watchdog timer for M3ULCB board

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
---
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
index 6936288..bc3d8d5 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
@@ -146,3 +146,8 @@
 	clock-frequency = <14745600>;
 	status = "okay";
 };
+
+&wdt0 {
+	timeout-sec = <60>;
+	status = "okay";
+};
-- 
1.9.1
