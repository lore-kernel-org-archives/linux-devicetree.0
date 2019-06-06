From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH net-next v2 06/10] ARM: dts: k2e-clocks: add input ext. fixed clocks tsipclka/b
Date: Thu, 6 Jun 2019 19:30:43 +0300
Message-ID: <20190606163047.31199-7-grygorii.strashko@ti.com>
References: <20190606163047.31199-1-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190606163047.31199-1-grygorii.strashko@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>, Santosh Shilimkar <ssantosh@kernel.org>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Sekhar Nori <nsekhar@ti.com>, Murali Karicheri <m-karicheri2@ti.com>, Wingman Kwok <w-kwok2@ti.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: devicetree@vger.kernel.org

Add set of fixed, external input clocks definitions for TSIPCLKA, TSIPCLKB
clocks. Such clocks can be used as reference clocks for some HW modules (as
cpts, for example) by configuring corresponding clock muxes. For these
clocks real frequencies have to be defined in board files.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
Acked-by: Richard Cochran <richardcochran@gmail.com>
---
 arch/arm/boot/dts/keystone-k2e-clocks.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/keystone-k2e-clocks.dtsi b/arch/arm/boot/dts/keystone-k2e-clocks.dtsi
index f7592155a740..cf30e007fea3 100644
--- a/arch/arm/boot/dts/keystone-k2e-clocks.dtsi
+++ b/arch/arm/boot/dts/keystone-k2e-clocks.dtsi
@@ -71,4 +71,24 @@ clocks {
 		reg-names = "control", "domain";
 		domain-id = <29>;
 	};
+
+	/*
+	 * Below are set of fixed, input clocks definitions,
+	 * for which real frequencies have to be defined in board files.
+	 * Those clocks can be used as reference clocks for some HW modules
+	 * (as cpts, for example) by configuring corresponding clock muxes.
+	 */
+	tsipclka: tsipclka {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <0>;
+		clock-output-names = "tsipclka";
+	};
+
+	tsipclkb: tsipclkb {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <0>;
+		clock-output-names = "tsipclkb";
+	};
 };
-- 
2.17.1
