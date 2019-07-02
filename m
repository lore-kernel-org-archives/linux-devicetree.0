From: Ran Bi <ran.bi@mediatek.com>
Subject: [PATCH 1/3] bindings: rtc: add bindings for MT2712 RTC
Date: Tue, 2 Jul 2019 11:21:18 +0800
Message-ID: <20190702032120.16539-2-ran.bi@mediatek.com>
References: <20190702032120.16539-1-ran.bi@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190702032120.16539-1-ran.bi@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Mark Rutland <mark.rutland@arm.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, YT Shen <yt.shen@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Flora Fu <flora.fu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Ran Bi <ran.bi@mediatek.com>
List-Id: devicetree@vger.kernel.org

Document the binding for MT2712 RTC implemented by rtc-mt2712.

Signed-off-by: Ran Bi <ran.bi@mediatek.com>
---
 .../devicetree/bindings/rtc/rtc-mt2712.txt         | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-mt2712.txt

diff --git a/Documentation/devicetree/bindings/rtc/rtc-mt2712.txt b/Documentation/devicetree/bindings/rtc/rtc-mt2712.txt
new file mode 100644
index 000000000000..c33d87e5e753
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rtc-mt2712.txt
@@ -0,0 +1,14 @@
+Device-Tree bindings for MediaTek SoC based RTC
+
+Required properties:
+- compatible	    : Should be "mediatek,mt2712-rtc" : for MT2712 SoC
+- reg 		    : Specifies base physical address and size of the registers;
+- interrupts	    : Should contain the interrupt for RTC alarm;
+
+Example:
+
+rtc: rtc@10011000 {
+	compatible = "mediatek,mt2712-rtc";
+	reg = <0 0x10011000 0 0x1000>;
+	interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_LOW>;
+};
-- 
2.18.0
