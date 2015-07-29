From: Jianwei Wang <jianwei.wang.chn@gmail.com>
Subject: [PATCH v13 6/6]  arm:dts:ls1021a: Add a TFT LCD panel dts node
Date: Wed, 29 Jul 2015 14:54:52 +0800
Message-ID: <1438152892-11256-7-git-send-email-jianwei.wang.chn@gmail.com>
References: <1438152892-11256-1-git-send-email-jianwei.wang.chn@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438152892-11256-1-git-send-email-jianwei.wang.chn@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, airlied@linux.ie, daniel.vetter@ffwll.ch, mark.yao@rock-chips.com, scottwood@freescale.com, thierry.reding@gmail.com, shawn.guo@linaro.org, Jianwei Wang <jianwei.wang.chn@gmail.com>, Alison Wang <b18965@freescale.com>, Xiubo Li <lixiubo@cmss.chinamobile.com>
List-Id: devicetree@vger.kernel.org

Add a TFT LCD panel. the TFT LCD panel is WQVGA "480x272",
and the bpp is 24.

Signed-off-by: Alison Wang <b18965@freescale.com>
Signed-off-by: Xiubo Li <lixiubo@cmss.chinamobile.com>
Signed-off-by: Jianwei Wang <jianwei.wang.chn@gmail.com>
---
 arch/arm/boot/dts/ls1021a-twr.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/ls1021a-twr.dts b/arch/arm/boot/dts/ls1021a-twr.dts
index a2c591e..2443329 100644
--- a/arch/arm/boot/dts/ls1021a-twr.dts
+++ b/arch/arm/boot/dts/ls1021a-twr.dts
@@ -56,6 +56,17 @@
 		enet0_sgmii_phy = &sgmii_phy2;
 		enet1_sgmii_phy = &sgmii_phy0;
 	};
+
+	panel: panel {
+		compatible = "nec,nl4827hc19_05b";
+	};
+
+};
+
+&dcu {
+	fsl,panel = <&panel>;
+	status = "okay";
+
 };
 
 &dspi1 {
-- 
2.1.0.27.g96db324
