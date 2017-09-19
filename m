From: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v1 1/4] arm: dts: mediatek: update audio node for mt2701 and mt7623
Date: Tue, 19 Sep 2017 14:27:21 +0800
Message-ID: <9c4a8be621ac76594fad303d5d49ed32bd530605.1505801355.git.ryder.lee@mediatek.com>
References: <cover.1505801355.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1505801355.git.ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Garlic Tseng <garlic.tseng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds interrupt-names property in audio node so that
binding can be agnostic of the IRQ order [1][2].

Signed-off-by: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
CC: Garlic Tseng <garlic.tseng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
CC: Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
CC: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
[1]https://patchwork.kernel.org/patch/9901225/
[2]https://lkml.org/lkml/2017/8/18/292
---
---
 arch/arm/boot/dts/mt2701.dtsi | 4 +++-
 arch/arm/boot/dts/mt7623.dtsi | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index afe12e5..fd88cbc 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -430,7 +430,9 @@
 		compatible = "mediatek,mt2701-audio";
 		reg = <0 0x11220000 0 0x2000>,
 		      <0 0x112a0000 0 0x20000>;
-		interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_LOW>;
+		interrupts =  <GIC_SPI 104 IRQ_TYPE_LEVEL_LOW>,
+			      <GIC_SPI 132 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names	= "afe", "asys";
 		power-domains = <&scpsys MT2701_POWER_DOMAIN_IFR_MSC>;
 
 		clocks = <&infracfg CLK_INFRA_AUDIO>,
diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index ec8a074..381843e 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -544,7 +544,9 @@
 			     "mediatek,mt2701-audio";
 		reg = <0 0x11220000 0 0x2000>,
 		      <0 0x112a0000 0 0x20000>;
-		interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_LOW>;
+		interrupts =  <GIC_SPI 104 IRQ_TYPE_LEVEL_LOW>,
+			      <GIC_SPI 132 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names	= "afe", "asys";
 		power-domains = <&scpsys MT2701_POWER_DOMAIN_IFR_MSC>;
 
 		clocks = <&infracfg CLK_INFRA_AUDIO>,
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
