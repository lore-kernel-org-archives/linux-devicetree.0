From: Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH] ARM: dts: rockchip: Enable HDMI CEC on rk3288-tinker-s
Date: Sun, 24 Feb 2019 20:10:06 +0000
Message-ID: <AM3PR03MB096695687A4BDD432428A977AC790@AM3PR03MB0966.eurprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jonas Karlman <jonas@kwiboo.se>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

This patch enables HDMI CEC on Tinker Board S

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 arch/arm/boot/dts/rk3288-tinker-s.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-tinker-s.dts b/arch/arm/boot/dts/rk3288-tinker-s.dts
index 37093922b482..590e3b06bbc4 100644
--- a/arch/arm/boot/dts/rk3288-tinker-s.dts
+++ b/arch/arm/boot/dts/rk3288-tinker-s.dts
@@ -24,3 +24,8 @@
 	mmc-ddr-1_8v;
 	status = "okay";
 };
+
+&hdmi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmi_cec_c0>;
+};
-- 
2.17.1
