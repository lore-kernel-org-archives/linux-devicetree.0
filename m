From: Scott Shu <scott.shu@mediatek.com>
Subject: [PATCH v2 5/6] ARM: dts: mt6580: Add device nodes to the MT6580 dtsi file
Date: Fri, 10 Jul 2015 14:04:08 +0800
Message-ID: <1436508249-49338-6-git-send-email-scott.shu@mediatek.com>
References: <Scott Shu <scott.shu@gmail.com>
 <1436508249-49338-1-git-send-email-scott.shu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1436508249-49338-1-git-send-email-scott.shu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Heiko Stuebner <heiko@sntech.de>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Marc Carino <marc.ceeeee@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Radha Mohan Chintakuntla <rchintakuntla@cavium.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: loda.chou@mediatek.com, jades.shih@mediatek.com, scott.shu@gmail.com, wsd_upstream@mediatek.com, Scott Shu <scott.shu@mediatek.com>
List-Id: devicetree@vger.kernel.org

This adds the SCPSYS device node to the MT6580 dtsi file.

Signed-off-by: Scott Shu <scott.shu@mediatek.com>
---
 arch/arm/boot/dts/mt6580.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/mt6580.dtsi b/arch/arm/boot/dts/mt6580.dtsi
index 09852cd..4a9df6a 100644
--- a/arch/arm/boot/dts/mt6580.dtsi
+++ b/arch/arm/boot/dts/mt6580.dtsi
@@ -74,6 +74,11 @@
 		};
 	};
 
+	scpsys: scpsys@10006000 {
+		compatible = "mediatek,mt6580-scpsys";
+		reg = <0x10006000 0x1000>;
+	};
+
 	timer: timer@10008000 {
 		compatible = "mediatek,mt6580-timer",
 			     "mediatek,mt6577-timer";
-- 
1.8.1.1.dirty
