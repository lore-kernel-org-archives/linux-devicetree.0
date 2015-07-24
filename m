From: Jianwei Wang <jianwei.wang.chn@gmail.com>
Subject: [PATCH v12 5/6] arm/dts/ls1021a: Add a TFT LCD panel dts node
Date: Fri, 24 Jul 2015 18:12:17 +0800
Message-ID: <1437732738-4960-6-git-send-email-jianwei.wang.chn@gmail.com>
References: <1437732738-4960-1-git-send-email-jianwei.wang.chn@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1437732738-4960-1-git-send-email-jianwei.wang.chn@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dri-devel@lists.freedesktop.org
Cc: Jianwei Wang <jianwei.wang.chn@gmail.com>, devicetree@vger.kernel.org, Xiubo Li <lixiubo@cmss.chinamobile.com>, airlied@linux.ie, daniel.vetter@ffwll.ch, Alison Wang <b18965@freescale.com>, linux-kernel@vger.kernel.org, thierry.reding@gmail.com, scottwood@freescale.com, shawn.guo@linaro.org, linux-arm-kernel@lists.infradead.org, mark.yao@rock-chips.com
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
