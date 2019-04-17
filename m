From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v5 4/5] ARM: dts: da850-evm: enable cpufreq
Date: Wed, 17 Apr 2019 17:27:00 +0200
Message-ID: <20190417152701.23391-5-brgl@bgdev.pl>
References: <20190417152701.23391-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190417152701.23391-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Lechner <david@lechnology.com>, Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Enable cpufreq-dt support for da850-evm. The cvdd is supplied by the
tps65070 pmic with configurable output voltage. By default da850-evm
boards support frequencies up to 375MHz so enable this operating
point.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Adam Ford <aford173@gmail.com>
---
 arch/arm/boot/dts/da850-evm.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-evm.dts
index f04bc3e15332..f94bb38fdad9 100644
--- a/arch/arm/boot/dts/da850-evm.dts
+++ b/arch/arm/boot/dts/da850-evm.dts
@@ -191,6 +191,19 @@
 	};
 };
 
+&cpu {
+	cpu-supply = <&vdcdc3_reg>;
+};
+
+/*
+ * The standard da850-evm kits and SOM's are 375MHz so enable this operating
+ * point by default. Higher frequencies must be enabled for custom boards with
+ * other variants of the SoC.
+ */
+&opp_375 {
+	status = "okay";
+};
+
 &sata {
 	status = "okay";
 };
-- 
2.21.0
