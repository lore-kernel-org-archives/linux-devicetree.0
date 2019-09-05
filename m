From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 3/5] arm64: dts: meson: g12: add a g12 layer
Date: Thu,  5 Sep 2019 14:59:54 +0200
Message-ID: <20190905125956.4384-4-jbrunet@baylibre.com>
References: <20190905125956.4384-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190905125956.4384-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

While the sm1 is very close to the g12a/b family, somethings apply
differently on the g12a/b and not the sm1. This introduce a new layer
of dtsi for part which apply to the g12a and g12b but not the sm1.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12.dtsi  | 7 +++++++
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 2 +-
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi | 2 +-
 3 files changed, 9 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12.dtsi

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
new file mode 100644
index 000000000000..1e30061fb2a7
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 BayLibre, SAS
+ * Author: Jerome Brunet <jbrunet@baylibre.com>
+ */
+
+#include "meson-g12-common.dtsi"
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index eb5d177d7a99..69339d69dfd4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -3,7 +3,7 @@
  * Copyright (c) 2018 Amlogic, Inc. All rights reserved.
  */
 
-#include "meson-g12-common.dtsi"
+#include "meson-g12.dtsi"
 #include <dt-bindings/power/meson-g12a-power.h>
 
 / {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
index 5628ccd54531..eefac0ef092b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
@@ -4,7 +4,7 @@
  * Author: Neil Armstrong <narmstrong@baylibre.com>
  */
 
-#include "meson-g12-common.dtsi"
+#include "meson-g12.dtsi"
 #include <dt-bindings/power/meson-g12a-power.h>
 
 / {
-- 
2.21.0
