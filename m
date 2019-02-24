From: Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH 4/4] arm64: dts: rockchip: gru: Move wifi wake-up interrupt into its own subnode
Date: Sun, 24 Feb 2019 14:04:26 +0000
Message-ID: <20190224140426.3267-5-marc.zyngier@arm.com>
References: <20190224140426.3267-1-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190224140426.3267-1-marc.zyngier@arm.com>
Sender: netdev-owner@vger.kernel.org
To: Amitkumar Karwar <amitkarwar@gmail.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Ganapathi Bhat <gbhat@marvell.com>, Heiko Stuebner <heiko@sntech.de>, Kalle Valo <kvalo@codeaurora.org>, Nishant Sarmukadam <nishants@marvell.com>, Rob Herring <robh+dt@kernel.org>, Xinming Hu <huxinming820@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

In order to get PCIe legacy interrupts working on gru-based Chromebooks,
let's move the wake-up interrupt out of the way and into its own
subnode. This ensures that this interrupt specifier will not be
mistaken as a PCI interrupt.

Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
index c400be64170e..61fff688770c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
@@ -310,11 +310,13 @@ ap_i2c_tp: &i2c5 {
 		compatible = "pci1b4b,2b42";
 		reg = <0x83010000 0x0 0x00000000 0x0 0x00100000
 		       0x83010000 0x0 0x00100000 0x0 0x00100000>;
-		interrupt-parent = <&gpio0>;
-		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&wlan_host_wake_l>;
-		wakeup-source;
+		wake-up {
+			interrupt-parent = <&gpio0>;
+			interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+			wakeup-source;
+		};
 	};
 };
 
-- 
2.20.1
