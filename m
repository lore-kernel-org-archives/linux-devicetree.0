From: Yunzhi Li <lyz@rock-chips.com>
Subject: [PATCH v6 5/5] ARM: dts: rockchip: Enable usb PHY on rk3288-evb board
Date: Thu, 11 Dec 2014 18:11:34 +0800
Message-ID: <1418292694-25724-1-git-send-email-lyz@rock-chips.com>
References: <1418291722-25448-1-git-send-email-lyz@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1418291722-25448-1-git-send-email-lyz@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lyz@rock-chips.com, heiko@sntech.de, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, jwerner@chromium.org, dianders@chromium.org, huangtao@rock-chips.com, zyw@rock-chips.com, cf@rock-chips.com
List-Id: devicetree@vger.kernel.org

Enable usb PHY for all usb ports on rk3288-evb.

Signed-off-by: Yunzhi Li <lyz@rock-chips.com>

---

Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None

 arch/arm/boot/dts/rk3288-evb.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-evb.dtsi b/arch/arm/boot/dts/rk3288-evb.dtsi
index cb83cea..992f323 100644
--- a/arch/arm/boot/dts/rk3288-evb.dtsi
+++ b/arch/arm/boot/dts/rk3288-evb.dtsi
@@ -174,6 +174,10 @@
 	};
 };
 
+&usbphy {
+	status = "okay";
+};
+
 &usb_host0_ehci {
 	status = "okay";
 };
-- 
2.0.0
