From: Frank Wang <frank.wang@rock-chips.com>
Subject: [PATCH v2 2/6] ARM: dts: rockchip: add cpu-supply property for cpu
 node of rk3229-evb
Date: Wed,  5 Jul 2017 16:30:17 +0800
Message-ID: <1499243421-21460-3-git-send-email-frank.wang@rock-chips.com>
References: <1499243421-21460-1-git-send-email-frank.wang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1499243421-21460-1-git-send-email-frank.wang@rock-chips.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: heiko@sntech.de
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, huangtao@rock-chips.com, wmc@rock-chips.com, zhangqing@rock-chips.com, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, finley.xiao@rock-chips.com, david.wu@rock-chips.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Finley Xiao <finley.xiao@rock-chips.com>

This patch adds the cpu-supply property so that cpu can do dvfs
on rk3229-evb board.

Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
---
 arch/arm/boot/dts/rk3229-evb.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/rk3229-evb.dts b/arch/arm/boot/dts/rk3229-evb.dts
index 394be63..17385d8 100644
--- a/arch/arm/boot/dts/rk3229-evb.dts
+++ b/arch/arm/boot/dts/rk3229-evb.dts
@@ -141,6 +141,10 @@
 	};
 };
 
+&cpu0 {
+	cpu-supply = <&vdd_arm>;
+};
+
 &gmac {
 	assigned-clocks = <&cru SCLK_MAC_EXTCLK>, <&cru SCLK_MAC>;
 	assigned-clock-parents = <&ext_gmac>, <&cru SCLK_MAC_EXTCLK>;
-- 
2.0.0
