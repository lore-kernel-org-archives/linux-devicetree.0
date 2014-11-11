Return-Path: <yingjoe.chen@mediatek.com>
From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: [PATCH v5' 2/8] ARM: mediatek: add dts for 8127 Moose board
Date: Tue, 11 Nov 2014 15:53:42 +0800
Message-ID: <1415692428-18416-2-git-send-email-yingjoe.chen@mediatek.com>
In-Reply-To: <1415692428-18416-1-git-send-email-yingjoe.chen@mediatek.com>
References: <1415086255-5555-1-git-send-email-yingjoe.chen@mediatek.com>
 <1415692428-18416-1-git-send-email-yingjoe.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Arnd Bergmann <arnd@arndb.de>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, srv_heupstream@mediatek.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, hc.yen@mediatek.com, yh.chen@mediatek.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, nathan.chung@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, "Joe.C" <yingjoe.chen@mediatek.com>, eddie.huang@mediatek.com, yingjoe.chen@gmail.com
List-ID: <devicetree@vger.kernel.org>

From: "Joe.C" <yingjoe.chen@mediatek.com>

Moose is a tablet evalutation board based on MT8127 SoC.

Signed-off-by: Joe.C <yingjoe.chen@mediatek.com>
---
 arch/arm/boot/dts/mt8127-moose.dts | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 arch/arm/boot/dts/mt8127-moose.dts

diff --git a/arch/arm/boot/dts/mt8127-moose.dts b/arch/arm/boot/dts/mt8127-moose.dts
new file mode 100644
index 0000000..13cba0e
--- /dev/null
+++ b/arch/arm/boot/dts/mt8127-moose.dts
@@ -0,0 +1,25 @@
+/*
+ * Copyright (c) 2014 MediaTek Inc.
+ * Author: Joe.C <yingjoe.chen@mediatek.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+/dts-v1/;
+#include "mt8127.dtsi"
+
+/ {
+	model = "MediaTek MT8127 Moose Board";
+	compatible = "mediatek,mt8127-moose", "mediatek,mt8127";
+
+	memory {
+		reg = <0 0x80000000 0 0x40000000>;
+	};
+};
-- 
1.8.1.1.dirty
