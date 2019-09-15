From: Louis Kuo <louis.kuo@mediatek.com>
Subject: [RFC PATCH V4 4/4] dts: arm64: mt8183: Add sensor interface nodes
Date: Sun, 15 Sep 2019 14:50:04 +0800
Message-ID: <20190915065004.20257-5-louis.kuo@mediatek.com>
References: <20190915065004.20257-1-louis.kuo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190915065004.20257-1-louis.kuo@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com, tfiga@chromium.org, keiichiw@chromium.org, matthias.bgg@gmail.com, mchehab@kernel.org
Cc: devicetree@vger.kernel.org, Sean.Cheng@mediatek.com, Rynn.Wu@mediatek.com, srv_heupstream@mediatek.com, Jerry-ch.Chen@mediatek.com, jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org, linux-mediatek@lists.infradead.org, zwisler@chromium.org, louis.kuo@mediatek.com, christie.yu@mediatek.com, frederic.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add nodes for Mediatek's sensor interface device. Sensor interface module
embedded in Mediatek SOCs, works as a HW camera interface controller
intended for image and data transmission between cameras and host devices.

Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 66aaa07f6cec..f1d081b99867 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -506,4 +506,18 @@
 			#clock-cells = <1>;
 		};
 	};
+
+	seninf: seninf@1a040000 {
+		compatible = "mediatek,mt8183-seninf";
+		reg = <0 0x1a040000 0 0x8000>,
+		      <0 0x11C80000 0 0x6000>;
+		reg-names = "base_reg", "rx_reg";
+		interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_LOW>;
+		power-domains = <&scpsys MT8183_POWER_DOMAIN_CAM>;
+		clocks = <&camsys CLK_CAM_SENINF>,
+			 <&topckgen CLK_TOP_MUX_SENINF>;
+		clock-names = "CLK_CAM_SENINF", "CLK_TOP_MUX_SENINF";
+		status = "disabled";
+		};
+	};
 };
-- 
2.18.0
