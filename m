From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 2/2] ARM: dts: rskrza1: add sdhi1 DT support
Date: Mon, 26 Sep 2016 16:40:32 -0400
Message-ID: <20160926204032.12260-3-chris.brandt@renesas.com>
References: <20160926204032.12260-1-chris.brandt@renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20160926204032.12260-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
v2:
* added bus-width
---
 arch/arm/boot/dts/r7s72100-rskrza1.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-rskrza1.dts b/arch/arm/boot/dts/r7s72100-rskrza1.dts
index e5dea5b..dd44181 100644
--- a/arch/arm/boot/dts/r7s72100-rskrza1.dts
+++ b/arch/arm/boot/dts/r7s72100-rskrza1.dts
@@ -56,6 +56,11 @@
 	};
 };
 
+&sdhi1 {
+	bus-width = <4>;
+	status = "okay";
+};
+
 &scif2 {
 	status = "okay";
 };
-- 
2.9.2
