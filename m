From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 3/4] ARM: dts: da850-evm: enable cpufreq
Date: Fri, 22 Mar 2019 14:31:04 +0100
Message-ID: <20190322133105.5945-4-brgl@bgdev.pl>
References: <20190322133105.5945-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190322133105.5945-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Lechner <david@lechnology.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Enable cpufreq-dt support for da850-evm. The cvdd is supplied by the
tps6507 pmic with configurable output voltage, so all operating points
can be enabled.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/boot/dts/da850-evm.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-evm.dts
index f04bc3e15332..a0a1b3dccf37 100644
--- a/arch/arm/boot/dts/da850-evm.dts
+++ b/arch/arm/boot/dts/da850-evm.dts
@@ -191,6 +191,18 @@
 	};
 };
 
+&cpu {
+	cpu-supply = <&vdcdc3_reg>;
+};
+
+&opp_375 {
+	status = "okay";
+};
+
+&opp_456 {
+	status = "okay";
+};
+
 &sata {
 	status = "okay";
 };
-- 
2.20.1
