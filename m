From: =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@bootlin.com>
Subject: [PATCH v9 04/12] ARM: dts: sun8i: Add R_CPUCFG device node for the A83T dtsi
Date: Fri,  4 May 2018 21:05:37 +0200
Message-ID: <20180504190545.5114-5-mylene.josserand@bootlin.com>
References: <20180504190545.5114-1-mylene.josserand@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180504190545.5114-1-mylene.josserand@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux@armlinux.org.uk, maxime.ripard@bootlin.com, wens@csie.org, marc.zyngier@arm.com, mark.rutland@arm.com, robh+dt@kernel.org, horms@verge.net.au, geert@linux-m68k.org, magnus.damm@gmail.com
Cc: f.fainelli@gmail.com, opendmb@gmail.com, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, clabbe.montjoie@gmail.com, quentin.schulz@bootlin.com, thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, mylene.josserand@bootlin.com
List-Id: devicetree@vger.kernel.org

The R_CPUCFG is a collection of registers needed for SMP bringup
on clusters and cluster's reset.
For the moment, documentation about this register is found in
Allwinner's code only.

Signed-off-by: Mylène Josserand <mylene.josserand@bootlin.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index a50ccb475de8..53ace066b7dc 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -938,6 +938,11 @@
 			#reset-cells = <1>;
 		};
 
+		r_cpucfg@1f01c00 {
+			compatible = "allwinner,sun8i-a83t-r-cpucfg";
+			reg = <0x1f01c00 0x400>;
+		};
+
 		r_pio: pinctrl@1f02c00 {
 			compatible = "allwinner,sun8i-a83t-r-pinctrl";
 			reg = <0x01f02c00 0x400>;
-- 
2.11.0
