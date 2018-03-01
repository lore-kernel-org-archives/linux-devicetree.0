From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v2 6/6] arm64: dts: rockchip: enable typec-phy0 for rk3399-puma-haikou.
Date: Thu,  1 Mar 2018 16:25:15 +0100
Message-ID: <20180301152515.20940-7-enric.balletbo@collabora.com>
References: <20180301152515.20940-1-enric.balletbo@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180301152515.20940-1-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com, heiko@sntech.de
Cc: groeck@chromium.org, gwendal@chromium.org, kernel@collabora.com, vicencb@gmail.com, devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Klaus Goger <klaus.goger@theobroma-systems.com>, linux-kernel@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Icenowy Zheng <icenowy@aosc.io>, Will Deacon <will.deacon@arm.com>, Rask Ingemann Lambertsen <rask@formelder.dk>, Catalin Marinas <catalin.marinas@arm.com>, Chen-Yu Tsai <wens@csie.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Commit c301b327aea898af ("arm64: dts: rockchip: add usb3-phy otg-port
support for rk3399") caused a regression regarding the USB3. During
boot, the following message appears a few times:

    dwc3: failed to initialize core

The driver is deferred waiting for the typec-phy, but this never
happens beause is disabled. So, enable it.

Fixes: c301b327aea898af ("arm64: dts: rockchip: add usb3-phy otg-port support for rk3399")
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

Changes in v2: None

 arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts
index 9a7486058455..2c9c696d1383 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts
@@ -191,6 +191,10 @@
 	status = "okay";
 };
 
+&tcphy0 {
+	status = "okay";
+};
+
 &u2phy0 {
 	status = "okay";
 };
-- 
2.16.1
