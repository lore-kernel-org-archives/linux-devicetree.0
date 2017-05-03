From: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: [PATCH v5 5/5] ARM: dts: rockchip: enable ARM Mali GPU on rk3288-veyron
Date: Wed,  3 May 2017 10:56:29 +0100
Message-ID: <000831729017aaf278618b76205a4f1029c2575b.1493804968.git.guillaume.tucker@collabora.com>
References: <cover.1493804968.git.guillaume.tucker@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1493804968.git.guillaume.tucker@collabora.com>
In-Reply-To: <cover.1493804968.git.guillaume.tucker@collabora.com>
References: <cover.1493804968.git.guillaume.tucker@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Neil Armstrong <narmstrong@baylibre.com>
Cc: Sjoerd Simons <sjoerd.simons@collabora.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, John Reitan <john.reitan@arm.com>, Wookey <wookey@wookware.org>, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Guillaume Tucker <guillaume.tucker@collabora.com>
List-Id: devicetree@vger.kernel.org

From: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Add reference to the Mali GPU device tree node on rk3288-veyron.
Tested on Minnie and Jerry boards.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
---
 arch/arm/boot/dts/rk3288-veyron.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-veyron.dtsi b/arch/arm/boot/dts/rk3288-veyron.dtsi
index 5d1eb0a25827..9847d5c6db3b 100644
--- a/arch/arm/boot/dts/rk3288-veyron.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron.dtsi
@@ -447,6 +447,11 @@
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&vdd_gpu>;
+	status = "okay";
+};
+
 &wdt {
 	status = "okay";
 };
-- 
2.11.0
