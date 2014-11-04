From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: [PATCH v5 4/8] ARM: mediatek: add dts for MT8135 evaluation board.
Date: Tue, 4 Nov 2014 15:30:51 +0800
Message-ID: <1415086255-5555-5-git-send-email-yingjoe.chen@mediatek.com>
References: <1415086255-5555-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1415086255-5555-1-git-send-email-yingjoe.chen@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>, arm@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, srv_heupstream@mediatek.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, hc.yen@mediatek.com, yh.chen@mediatek.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, nathan.chung@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, "Joe.C" <yingjoe.chen@mediatek.com>, eddie.huang@mediatek.com, yingjoe.chen@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: "Joe.C" <yingjoe.chen@mediatek.com>

Evbp1 is a tablet evaluation board based on MT8135 SoC.

Signed-off-by: Joe.C <yingjoe.chen@mediatek.com>
---
 arch/arm/boot/dts/mt8135-evbp1.dts | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 arch/arm/boot/dts/mt8135-evbp1.dts

diff --git a/arch/arm/boot/dts/mt8135-evbp1.dts b/arch/arm/boot/dts/mt8135-evbp1.dts
new file mode 100644
index 0000000..5b43500
--- /dev/null
+++ b/arch/arm/boot/dts/mt8135-evbp1.dts
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
+#include "mt8135.dtsi"
+
+/ {
+	model = "MediaTek MT8135 evaluation board";
+	compatible = "mediatek,mt8135-evbp1", "mediatek,mt8135";
+
+	memory {
+		reg = <0x80000000 0x40000000>;
+	};
+};
-- 
1.8.1.1.dirty
