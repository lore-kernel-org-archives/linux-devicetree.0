From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 4/4] ARM: dts: rockchip: Add quirk for resetting rk3288's dwc2 host on wakeup
Date: Tue, 16 Apr 2019 14:53:51 -0700
Message-ID: <20190416215351.242246-5-dianders@chromium.org>
References: <20190416215351.242246-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190416215351.242246-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>, Heiko Stuebner <heiko@sntech.de>, Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: amstan@chromium.org, linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org, Randy Li <ayaka@soulik.info>, mka@chromium.org, ryandcase@chromium.org, jwerner@chromium.org, Elaine Zhang <zhangqing@rock-chips.com>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The "host" USB port on rk3288 has a hardware errata where we've got to
assert a PHY reset whenever we see a remote wakeup.  Add that quirk
property to the device tree.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v2: None

 arch/arm/boot/dts/rk3288.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 7e70ecf2b95a..aa017abf4f42 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -621,6 +621,7 @@
 		dr_mode = "host";
 		phys = <&usbphy2>;
 		phy-names = "usb2-phy";
+		snps,reset-phy-on-wake;
 		status = "disabled";
 	};
 
-- 
2.21.0.593.g511ec345e18-goog
