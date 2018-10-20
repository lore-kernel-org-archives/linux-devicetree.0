From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: enable HS200 for eMMC on rock64
Date: Sat, 20 Oct 2018 10:57:56 -0700
Message-ID: <20181020175756.28072-1-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Heiko Stuebner <heiko@sntech.de>, Katsuhiro Suzuki <katsuhiro@katsuster.net>, Matthias Brugger <mbrugger@suse.com>, Douglas Anderson <dianders@chromium.org>, Klaus Goger <klaus.goger@theobroma-systems.com>, Chen-Yu Tsai <wens@csie.org>, =?UTF-8?q?Kamil=20Trzci=C5=84ski?= <ayufan@ayufan.eu>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
List-Id: devicetree@vger.kernel.org

eMMC that's sold by Pine64 can do HS200, rk3328 can do it
as well, so update DTS to enable it.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts b/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
index dc20145dd393..bd937d68ca3b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
@@ -100,6 +100,7 @@
 &emmc {
 	bus-width = <8>;
 	cap-mmc-highspeed;
+	mmc-hs200-1_8v;
 	non-removable;
 	pinctrl-names = "default";
 	pinctrl-0 = <&emmc_clk &emmc_cmd &emmc_bus8>;
-- 
2.19.0
