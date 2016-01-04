From: Tiffany Lin <tiffany.lin@mediatek.com>
Subject: [PATCH v3 3/8] arm64: dts: mediatek: Add node for Mediatek Video
 Processor Unit
Date: Mon, 4 Jan 2016 18:11:51 +0800
Message-ID: <1451902316-55931-4-git-send-email-tiffany.lin@mediatek.com>
References: <1451902316-55931-1-git-send-email-tiffany.lin@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1451902316-55931-1-git-send-email-tiffany.lin@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: daniel.thompson@linaro.org, Rob Herring <robh+dt@kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, linux-kernel@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>, linux-mediatek@lists.infradead.org, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add VPU drivers for MT8173

Signed-off-by: Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Signed-off-by: Tiffany Lin <tiffany.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 60a1284..b3636cd 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -422,6 +422,17 @@
 			clocks = <&infracfg CLK_INFRA_CEC>;
 		};
 
+		vpu: vpu@10020000 {
+			compatible = "mediatek,mt8173-vpu";
+			reg = <0 0x10020000 0 0x30000>,
+			      <0 0x10050000 0 0x100>;
+			reg-names = "tcm", "cfg_reg";
+			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&topckgen CLK_TOP_SCP_SEL>;
+			clock-names = "main";
+			iommus = <&iommu M4U_PORT_VENC_RCPU>;
+		};
+
 		sysirq: intpol-controller@10200620 {
 			compatible = "mediatek,mt8173-sysirq",
 				     "mediatek,mt6577-sysirq";
-- 
1.7.9.5
