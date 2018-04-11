From: <sean.wang@mediatek.com>
Subject: [PATCH v2 04/12] arm: dts: mt7623: fix available memory size on bananapi-r2
Date: Wed, 11 Apr 2018 16:53:57 +0800
Message-ID: <705d03d06a7668d66689777bb90806953e0744b3.1523434758.git.sean.wang@mediatek.com>
References: <cover.1523434757.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1523434757.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

There is 2GB DDR3 available on bananapi-r2 board as [1] specified.

[1] http://www.banana-pi.org/r2.html

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>
---
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
index 5938e4c..d2a354e 100644
--- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
+++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
@@ -110,7 +110,7 @@
 
 	memory@80000000 {
 		device_type = "memory";
-		reg = <0 0x80000000 0 0x40000000>;
+		reg = <0 0x80000000 0 0x80000000>;
 	};
 };
 
-- 
2.7.4
