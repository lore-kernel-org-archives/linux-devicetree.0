From: Jagan Teki <jagannadh.teki@gmail.com>
Subject: [PATCH 2/2] ARM: dts: rockchip: rk3288-vyasa: Add hdmi ddc-i2c-bus
Date: Mon, 11 Sep 2017 13:56:22 +0530
Message-ID: <1505118382-6023-2-git-send-email-jteki@openedev.com>
References: <1505118382-6023-1-git-send-email-jteki@openedev.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1505118382-6023-1-git-send-email-jteki@openedev.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Michael Trimarchi <michael@amarulasolutions.com>, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

From: Jagan Teki <jagan@amarulasolutions.com>

HDMI DDC bus is connected via i2c2 in rk3288-vyasa board,
so add it and enable i2c22 node at same patch.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 arch/arm/boot/dts/rk3288-vyasa.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-vyasa.dts b/arch/arm/boot/dts/rk3288-vyasa.dts
index f70a52f..fdafe5c 100644
--- a/arch/arm/boot/dts/rk3288-vyasa.dts
+++ b/arch/arm/boot/dts/rk3288-vyasa.dts
@@ -83,6 +83,7 @@
 };
 
 &hdmi {
+	ddc-i2c-bus = <&i2c2>;
 	status = "okay";
 };
 
@@ -279,6 +280,10 @@
 	};
 };
 
+&i2c2 {
+	status = "okay";
+};
+
 &sdmmc {
 	status = "okay";
 
-- 
2.7.4
