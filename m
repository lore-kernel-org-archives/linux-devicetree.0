From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v2 07/15] ARM: dts: rockchip: remove address from pinctrl nodes
Date: Sun, 27 Jul 2014 01:18:23 +0200
Message-ID: <1406416711-28006-8-git-send-email-heiko@sntech.de>
References: <1406416711-28006-1-git-send-email-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1406416711-28006-1-git-send-email-heiko@sntech.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arnd@arndb.de, linux-arm-kernel@lists.infradead.org, olof@lixom.net, devicetree@vger.kernel.org, b.galvani@gmail.com, max.schwarz@online.de
Cc: Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

The pincontroller uses the GRF and PMU syscons nowadays, so should not
contain an address in its device node.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/boot/dts/rk3066a.dtsi | 2 +-
 arch/arm/boot/dts/rk3188.dtsi  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/rk3066a.dtsi b/arch/arm/boot/dts/rk3066a.dtsi
index 460932b2..3198394 100644
--- a/arch/arm/boot/dts/rk3066a.dtsi
+++ b/arch/arm/boot/dts/rk3066a.dtsi
@@ -86,7 +86,7 @@
 		#reset-cells = <1>;
 	};
 
-	pinctrl: pinctrl@20008000 {
+	pinctrl: pinctrl {
 		compatible = "rockchip,rk3066a-pinctrl";
 		rockchip,grf = <&grf>;
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/rk3188.dtsi b/arch/arm/boot/dts/rk3188.dtsi
index 4a9f702..dd7f61f 100644
--- a/arch/arm/boot/dts/rk3188.dtsi
+++ b/arch/arm/boot/dts/rk3188.dtsi
@@ -74,7 +74,7 @@
 		#reset-cells = <1>;
 	};
 
-	pinctrl: pinctrl@20008000 {
+	pinctrl: pinctrl {
 		compatible = "rockchip,rk3188-pinctrl";
 		rockchip,grf = <&grf>;
 		rockchip,pmu = <&pmu>;
-- 
2.0.1
