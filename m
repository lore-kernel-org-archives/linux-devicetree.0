From: Finlye Xiao <finley.xiao@rock-chips.com>
Subject: [PATCH v1 3/4] arm64: dts: rockchip: add efuse0 device node for rk3399
Date: Wed, 10 Aug 2016 14:50:42 +0800
Message-ID: <1470811843-42668-4-git-send-email-finley.xiao@rock-chips.com>
References: <1470811843-42668-1-git-send-email-finley.xiao@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1470811843-42668-1-git-send-email-finley.xiao@rock-chips.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: srinivas.kandagatla@linaro.org, maxime.ripard@free-electrons.com, robh+dt@kernel.org, mark.rutland@arm.com, heiko@sntech.de, linux@armlinux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, dianders@chromium.org, wbriannorris@chromium.org
Cc: huangtao@rock-chips.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, tony.xie@rock-chips.com, Finley Xiao <finley.xiao@rock-chips.com>, linux-arm-kernel@lists.infradead.org, jay.xu@rock-chips.com, cl@rock-chips.com, wxt@rock-chips.com
List-Id: devicetree@vger.kernel.org

From: Finley Xiao <finley.xiao@rock-chips.com>

Add a efuse0 node in the device tree for the ARM64 rk3399 SoC.

Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 4c84229..7f764ca 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -899,6 +899,35 @@
 		status = "disabled";
 	};
 
+	efuse0: efuse0@ff690000 {
+		compatible = "rockchip,rk3399-efuse";
+		reg = <0x0 0xff690000 0x0 0x80>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		clocks = <&cru PCLK_EFUSE1024NS>;
+		clock-names = "pclk_efuse";
+
+		/* Data cells */
+		cpul_leakage: cpul-leakage {
+			reg = <0x1a 0x1>;
+		};
+		cpub_leakage: cpub-leakage {
+			reg = <0x17 0x1>;
+		};
+		gpu_leakage: gpu-leakage {
+			reg = <0x18 0x1>;
+		};
+		center_leakage: center-leakage {
+			reg = <0x19 0x1>;
+		};
+		logic_leakage: logic-leakage {
+			reg = <0x1b 0x1>;
+		};
+		wafer_info: wafer-info {
+			reg = <0x1c 0x1>;
+		};
+	};
+
 	pmucru: pmu-clock-controller@ff750000 {
 		compatible = "rockchip,rk3399-pmucru";
 		reg = <0x0 0xff750000 0x0 0x1000>;
-- 
1.9.1
