From: Zhiyong Tao <zhiyong.tao@mediatek.com>
Subject: [PATCH v7 3/3] arm: dts: mt2701: Add auxadc node.
Date: Thu, 18 Aug 2016 15:11:37 +0800
Message-ID: <1471504297-26947-4-git-send-email-zhiyong.tao@mediatek.com>
References: <1471504297-26947-1-git-send-email-zhiyong.tao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1471504297-26947-1-git-send-email-zhiyong.tao@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net
Cc: srv_heupstream@mediatek.com, liguo.zhang@mediatek.com, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com, erin.lo@mediatek.com, dawei.chien@mediatek.com, matthias.bgg@gmail.com, s.hauer@pengutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, linux-mediatek@lists.infradead.org, Zhiyong Tao <zhiyong.tao@mediatek.com>
List-Id: devicetree@vger.kernel.org

The commit adds auxadc nodes to the Mediatek MT2701 dtsi file.

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
---
This patch dependents on "Add clock support for Mediatek MT2701"[1].
Please accept this patch together with [1].
[1]http://lists.infradead.org/pipermail/linux-mediatek/2016-August/006620.html
---
 arch/arm/boot/dts/mt2701.dtsi |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index 7eab6f4..8e6a18c 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -175,6 +175,15 @@
 		      <0 0x10216000 0 0x2000>;
 	};
 
+	auxadc: adc@11001000 {
+		compatible = "mediatek,mt2701-auxadc";
+		reg = <0 0x11001000 0 0x1000>;
+		clocks = <&pericfg CLK_PERI_AUXADC>;
+		clock-names = "main";
+		#io-channel-cells = <1>;
+		status = "disabled";
+	};
+
 	uart0: serial@11002000 {
 		compatible = "mediatek,mt2701-uart",
 			     "mediatek,mt6577-uart";
-- 
1.7.9.5
