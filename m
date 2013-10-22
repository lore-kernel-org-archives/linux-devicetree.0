From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH RESEND v5 4/5] ARM: rockchip: add power-management-unit dt node
Date: Tue, 22 Oct 2013 17:27:50 +0200
Message-ID: <201310221727.50698.heiko@sntech.de>
References: <201310221724.21550.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201310221724.21550.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: arm@kernel.org, Grant Likely <grant.likely@linaro.org>, Rob Herring <robherring2@gmail.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ulrich Prinz <ulrich.prinz@googlemail.com>, Matt Sealey <neko@bakuhatsu.net>, Fabio Estevam <festevam@gmail.com>
List-Id: devicetree@vger.kernel.org

The pmu is needed to bring up the cores during smp operations.
Therefore add a node and documentation for it.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Ulrich Prinz <ulrich.prinz@googlemail.com>
---
 Documentation/devicetree/bindings/arm/rockchip/pmu.txt |   16 ++++++++++++++++
 arch/arm/boot/dts/rk3xxx.dtsi                          |    5 +++++
 2 files changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/rockchip/pmu.txt

diff --git a/Documentation/devicetree/bindings/arm/rockchip/pmu.txt b/Documentation/devicetree/bindings/arm/rockchip/pmu.txt
new file mode 100644
index 0000000..3ee9b42
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/rockchip/pmu.txt
@@ -0,0 +1,16 @@
+Rockchip power-management-unit:
+-------------------------------
+
+The pmu is used to turn off and on different power domains of the SoCs
+This includes the power to the CPU cores.
+
+Required node properties:
+- compatible value : = "rockchip,rk3066-pmu";
+- reg : physical base address and the size of the registers window
+
+Example:
+
+	pmu@20004000 {
+		compatible = "rockchip,rk3066-pmu";
+		reg = <0x20004000 0x100>;
+	};
diff --git a/arch/arm/boot/dts/rk3xxx.dtsi b/arch/arm/boot/dts/rk3xxx.dtsi
index 0a3d5b1..26e5a96 100644
--- a/arch/arm/boot/dts/rk3xxx.dtsi
+++ b/arch/arm/boot/dts/rk3xxx.dtsi
@@ -31,6 +31,11 @@
 			reg = <0x1013c000 0x100>;
 		};
 
+		pmu@20004000 {
+			compatible = "rockchip,rk3066-pmu";
+			reg = <0x20004000 0x100>;
+		};
+
 		gic: interrupt-controller@1013d000 {
 			compatible = "arm,cortex-a9-gic";
 			interrupt-controller;
-- 
1.7.10.4
