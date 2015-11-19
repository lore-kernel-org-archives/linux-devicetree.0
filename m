From: Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Subject: [PATCH v2 3/3] dts: arm64: Add EFUSE device node
Date: Thu, 19 Nov 2015 18:46:54 +0800
Message-ID: <1447930014-19579-4-git-send-email-andrew-ct.chen@mediatek.com>
References: <1447930014-19579-1-git-send-email-andrew-ct.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447930014-19579-1-git-send-email-andrew-ct.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com, Andrew-CT Chen <andrew-ct.chen@mediatek.com>
List-Id: devicetree@vger.kernel.org

Add Mediatek MT8173 EFUSE device node

Signed-off-by: Andrew-CT Chen <andrew-ct.chen@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 4dd5f93..d67e23b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -267,6 +267,11 @@
 			reg = <0 0x10200620 0 0x20>;
 		};
 
+		efuse: efuse@10206000 {
+			compatible = "mediatek,mt8173-efuse";
+			reg = <0 0x10206000 0 0x1000>;
+		};
+
 		apmixedsys: clock-controller@10209000 {
 			compatible = "mediatek,mt8173-apmixedsys";
 			reg = <0 0x10209000 0 0x1000>;
-- 
1.9.1
