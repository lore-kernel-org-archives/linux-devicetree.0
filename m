From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v3 7/7] ARM: dts: rskrza1: add rtc DT support
Date: Wed, 29 Mar 2017 10:30:35 -0700
Message-ID: <20170329173035.67477-8-chris.brandt@renesas.com>
References: <20170329173035.67477-1-chris.brandt@renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170329173035.67477-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms+renesas@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: rtc-linux@googlegroups.com, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-Id: devicetree@vger.kernel.org

Enable the realtime clock.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s72100-rskrza1.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-rskrza1.dts b/arch/arm/boot/dts/r7s72100-rskrza1.dts
index cab5857bfb41..72df20a04320 100644
--- a/arch/arm/boot/dts/r7s72100-rskrza1.dts
+++ b/arch/arm/boot/dts/r7s72100-rskrza1.dts
@@ -73,6 +73,10 @@
 	status = "okay";
 };
 
+&rtc {
+	status = "okay";
+};
+
 &scif2 {
 	status = "okay";
 };
-- 
2.11.0
