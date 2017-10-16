From: Jagan Teki <jagannadh.teki@gmail.com>
Subject: [PATCH 8/9] ARM: dts: rockchip: Add io domains for rk3288-vyasa
Date: Mon, 16 Oct 2017 17:46:26 +0530
Message-ID: <1508156187-27519-9-git-send-email-jagan@amarulasolutions.com>
References: <1508156187-27519-1-git-send-email-jagan@amarulasolutions.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508156187-27519-1-git-send-email-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Michael Trimarchi <michael@amarulasolutions.com>, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Add io domains supported by rk3288-vyasa board.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 arch/arm/boot/dts/rk3288-vyasa.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-vyasa.dts b/arch/arm/boot/dts/rk3288-vyasa.dts
index 2f1389a..0e0995f 100644
--- a/arch/arm/boot/dts/rk3288-vyasa.dts
+++ b/arch/arm/boot/dts/rk3288-vyasa.dts
@@ -374,6 +374,21 @@
 	};
 };
 
+&io_domains {
+	status = "okay";
+
+	audio-supply = <&vcc_18>;
+	bb-supply = <&vcc_io>;
+	dvp-supply = <&vcc_io>;
+	flash0-suuply = <&vcc_18>;
+	flash1-supply = <&vcc_lan>;
+	gpio30-supply = <&vcc_io>;
+	gpio1830 = <&vcc_io>;
+	lcdc-supply = <&vcc_io>;
+	sdcard-supply = <&vccio_sd>;
+	wifi-supply = <&vcc_18>;
+};
+
 &i2c2 {
 	status = "okay";
 };
-- 
2.7.4
