From: Frank Wang <frank.wang@rock-chips.com>
Subject: [PATCH v2 3/3] arm: dts: rk322x: add watchdog device node.
Date: Wed, 17 May 2017 17:52:26 +0800
Message-ID: <1495014746-27621-4-git-send-email-frank.wang@rock-chips.com>
References: <1495014746-27621-1-git-send-email-frank.wang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1495014746-27621-1-git-send-email-frank.wang@rock-chips.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: heiko@sntech.de, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, wim@iguana.be, linux@roeck-us.net, ellisys@163.com
Cc: huangtao@rock-chips.com, devicetree@vger.kernel.org, charles.chen@rock-chips.com, wmc@rock-chips.com, kevan.lan@rock-chips.com, linux-kernel@vger.kernel.org, sugar.zhang@rock-chips.com, linux-rockchip@lists.infradead.org, Frank Wang <frank.wang@rock-chips.com>, cody.xie@rock-chips.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add watchdog device node for rk322x SoC.

Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
---
 arch/arm/boot/dts/rk322x.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/rk322x.dtsi b/arch/arm/boot/dts/rk322x.dtsi
index fe6530f..f7498b3 100644
--- a/arch/arm/boot/dts/rk322x.dtsi
+++ b/arch/arm/boot/dts/rk322x.dtsi
@@ -280,6 +280,14 @@
 		status = "disabled";
 	};
 
+	wdt: watchdog@110a0000 {
+		compatible = "snps,dw-wdt";
+		reg = <0x110a0000 0x100>;
+		clocks = <&cru PCLK_CPU>;
+		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+		status = "disabled";
+	};
+
 	pwm0: pwm@110b0000 {
 		compatible = "rockchip,rk3288-pwm";
 		reg = <0x110b0000 0x10>;
-- 
2.0.0
