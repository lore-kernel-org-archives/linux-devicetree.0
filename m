From: Guillaume La Roque <glaroque@baylibre.com>
Subject: [PATCH v5 7/7] MAINTAINERS: add entry for Amlogic Thermal driver
Date: Fri, 27 Sep 2019 14:47:50 +0200
Message-ID: <20190927124750.12467-10-glaroque@baylibre.com>
References: <20190927124750.12467-1-glaroque@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927124750.12467-1-glaroque@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: amit.kucheria@linaro.org, rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add myself as maintainer for Amlogic Thermal driver.

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 390c3194ee93..bdc30d740342 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15932,6 +15932,15 @@ F:	Documentation/driver-api/thermal/cpu-cooling-api.rst
 F:	drivers/thermal/cpu_cooling.c
 F:	include/linux/cpu_cooling.h
 
+THERMAL DRIVER FOR AMLOGIC SOCS
+M:	Guillaume La Roque <glaroque@baylibre.com>
+L:	linux-pm@vger.kernel.org
+L:	linux-amlogic@lists.infradead.org
+W:	http://linux-meson.com/
+S:	Supported
+F:	drivers/thermal/amlogic_thermal.c
+F:	Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
+
 THINKPAD ACPI EXTRAS DRIVER
 M:	Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
 L:	ibm-acpi-devel@lists.sourceforge.net
-- 
2.17.1
