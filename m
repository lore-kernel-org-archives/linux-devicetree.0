From: Carlo Caione <carlo@caione.org>
Subject: [PATCH v2 1/7] ARM: DTS: Amlogic: Extend L2 cache controller node for Meson8b
Date: Wed,  2 Dec 2015 18:22:27 +0100
Message-ID: <1449076953-5058-2-git-send-email-carlo@caione.org>
References: <1449076953-5058-1-git-send-email-carlo@caione.org>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1449076953-5058-1-git-send-email-carlo@caione.org>
Sender: linux-clk-owner@vger.kernel.org
To: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux@arm.linux.org.uk, linux-meson@googlegroups.com, drake@endlessm.com, jerry.cao@amlogic.com, victor.wan@amlogic.com, pawel.moll@arm.com, arnd@arndb.de
Cc: Carlo Caione <carlo@endlessm.com>
List-Id: devicetree@vger.kernel.org

From: Carlo Caione <carlo@endlessm.com>

This patch extends the L2 cache controller node for Amlogic Meson8b
SoCs with some missing parameters.

Signed-off-by: Carlo Caione <carlo@endlessm.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index ee352bf..b1990dc 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -93,6 +93,9 @@
 		L2: l2-cache-controller@c4200000 {
 			compatible = "arm,pl310-cache";
 			reg = <0xc4200000 0x1000>;
+			arm,data-latency = <3 3 3>;
+			arm,tag-latency = <2 2 2>;
+			arm,filter-ranges = <0x100000 0xc0000000>;
 			cache-unified;
 			cache-level = <2>;
 		};
-- 
2.5.0

