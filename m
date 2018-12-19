From: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 2/2] arm64: dts: meson: add g12a x96 max board
Date: Wed, 19 Dec 2018 15:35:19 -0800
Message-ID: <20181219233519.35287-2-khilman@baylibre.com>
References: <20181219233519.35287-1-khilman@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181219233519.35287-1-khilman@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-amlogic@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add the G12a (S905X2) based X96 Max board[1].

There is no branding for the manufacturer anywhere on the product, so it
took some digging to find the manufacturer.  But since there's nothing
about the maker on the product I've left it out of the DT name because
1) nobody will know that name and 2) keeps the DT filename shorter.

[1] https://www.cnx-software.com/2018/09/25/x96-max-amlogic-s905x2-tv-box/

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
new file mode 100644
index 000000000000..c62d3d5706ff
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2018 BayLibre SAS. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "meson-g12a.dtsi"
+
+/ {
+	compatible = "amediatech,x96-max", "amlogic,u200", "amlogic,g12a";
+	model = "Shenzhen Amediatech Technology Co., Ltd X96 Max";
+
+	aliases {
+		serial0 = &uart_AO;
+	};
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x40000000>;
+	};
+};
+
+&uart_AO {
+	status = "okay";
+};
-- 
2.19.2
