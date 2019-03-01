From: Christoph Muellner <christoph.muellner@theobroma-systems.com>
Subject: [PATCH 3/3] arm64: dts: rockchip: Decrease emmc-phy's drive impedance
 on rk3399-puma
Date: Fri,  1 Mar 2019 16:33:45 +0100
Message-ID: <20190301153348.29870-3-christoph.muellner@theobroma-systems.com>
References: <20190301153348.29870-1-christoph.muellner@theobroma-systems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190301153348.29870-1-christoph.muellner@theobroma-systems.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, heiko@sntech.de, shawn.lin@rock-chips.com
Cc: devicetree@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>, linux-kernel@vger.kernel.org, Ezequiel Garcia <ezequiel@collabora.com>, Viresh Kumar <viresh.kumar@linaro.org>, Brian Norris <briannorris@chromium.org>, Douglas Anderson <dianders@chromium.org>, Vicente Bergas <vicencb@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org, Tony Xie <tony.xie@rock-chips.com>, Klaus Goger <klaus.goger@theobroma-systems.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Randy Li <ayaka@soulik.info>, Philipp Tomsich <philipp.tomsich@theobroma-systems.com>, Shunqian Zheng <zhengsq@rock-chips.com>, linux-arm-kernel@lists.infradead.org, Christoph Muellner <christoph.muellner@theobroma-systems.com>
List-Id: devicetree@vger.kernel.org

The RK3399-Q7 (Puma) requires 33 Ohm drive strength to ensure signal
integrity at HS-400 (200MHz clock, DDR signalling).

A repeated EMC testing run validates that this increase does not
negatively impact EMC compliance (emissions have ample distance to
the regulatory limits).

Signed-off-by: Christoph Muellner <christoph.muellner@theobroma-systems.com>
Signed-off-by: Philipp Tomsich <philipp.tomsich@theobroma-systems.com>
Tested-by: Jakob Unterwurzacher <jakob.unterwurzacher@theobroma-systems.com>
Tested-by: Klaus Goger <klaus.goger@theobroma-systems.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
index 0130b9f98c9d..4f75bb6b2f14 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
@@ -146,6 +146,7 @@
 
 &emmc_phy {
 	status = "okay";
+	drive-impedance-ohm = <33>;
 };
 
 &gmac {
-- 
2.11.0
