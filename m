From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH 2/2] ARM: dts: raise GPU trip point temperature for speedy to 80 degC
Date: Wed, 15 May 2019 08:31:27 -0700
Message-ID: <20190515153127.24626-2-mka@chromium.org>
References: <20190515153127.24626-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190515153127.24626-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

Raise the temperature of the GPU thermal trip point for speedy
to 80°C. This is the value used by the downstream Chrome OS 3.14
kernel, the 'official' kernel for speedy.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
 arch/arm/boot/dts/rk3288-veyron-speedy.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-veyron-speedy.dts b/arch/arm/boot/dts/rk3288-veyron-speedy.dts
index 2ac8748a3a0c..394a9648faee 100644
--- a/arch/arm/boot/dts/rk3288-veyron-speedy.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-speedy.dts
@@ -64,6 +64,10 @@
 	temperature = <70000>;
 };
 
+&gpu_alert0 {
+	temperature = <80000>;
+};
+
 &edp {
 	/delete-property/pinctrl-names;
 	/delete-property/pinctrl-0;
-- 
2.21.0.1020.gf2820cf01a-goog
