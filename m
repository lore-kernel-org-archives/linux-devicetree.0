From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2 3/3] ARM: dts: raise GPU trip point temperature for speedy to 80 degC
Date: Thu, 16 May 2019 09:29:42 -0700
Message-ID: <20190516162942.154823-3-mka@chromium.org>
References: <20190516162942.154823-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190516162942.154823-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

Raise the temperature of the GPU thermal trip point for speedy
to 80°C. This is the value used by the downstream Chrome OS 3.14
kernel, the 'official' kernel for speedy.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in v2:
- add entry at position in alphabetical order
---
 arch/arm/boot/dts/rk3288-veyron-speedy.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-veyron-speedy.dts b/arch/arm/boot/dts/rk3288-veyron-speedy.dts
index 3d2769f1bef2..6f870d89866b 100644
--- a/arch/arm/boot/dts/rk3288-veyron-speedy.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-speedy.dts
@@ -75,6 +75,10 @@
 	force-hpd;
 };
 
+&gpu_alert0 {
+	temperature = <80000>;
+};
+
 &gpu_crit {
 	temperature = <90000>;
 };
-- 
2.21.0.1020.gf2820cf01a-goog
