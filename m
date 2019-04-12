From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 4/4] ARM: dts: rockchip: Add quirk for resetting rk3288's dwc2 host on wakeup
Date: Fri, 12 Apr 2019 15:41:49 -0700
Message-ID: <20190412224149.106971-5-dianders@chromium.org>
References: <20190412224149.106971-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412224149.106971-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>, Heiko Stuebner <heiko@sntech.de>, Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: amstan@chromium.org, linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org, Randy Li <ayaka@soulik.info>, mka@chromium.org, ryandcase@chromium.org, jwerner@chromium.org, Elaine Zhang <zhangqing@rock-chips.com>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The "host" USB port on rk3288 has a hardware errata where we've got to
assert a PHY reset whenever we see a remote wakeup.  Add that quirk
property to the device tree.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm/boot/dts/rk3288.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 92e0600595f8..6367c1b50fd7 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -617,6 +617,7 @@
 		dr_mode = "host";
 		phys = <&usbphy2>;
 		phy-names = "usb2-phy";
+		snps,reset-phy-on-wake;
 		status = "disabled";
 	};
 
-- 
2.21.0.392.gf8f6787159e-goog
