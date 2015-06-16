From: Caesar Wang <wxt@rock-chips.com>
Subject: [PATCH v2 3/3] ARM: dts: Add RK3288 efuse node
Date: Tue, 16 Jun 2015 15:27:45 +0800
Message-ID: <1434439665-27781-4-git-send-email-wxt@rock-chips.com>
References: <1434439665-27781-1-git-send-email-wxt@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434439665-27781-1-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: devicetree@vger.kernel.org, jay.xu@rock-chips.com, linus.walleij@linaro.org, galak@codeaurora.org, linux-kernel@vger.kernel.org, ijc+devicetree@hellion.org.uk, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, matthias.bgg@gmail.com, pawel.moll@arm.com, mark.rutland@arm.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, wxt@rock-chips.com
List-Id: devicetree@vger.kernel.org

Add the efuse node on RK3288, we can get some information
when enable the efuse driver.
e.g.: the CPU version, leakage.....

Signed-off-by: Caesar Wang <wxt@rock-chips.com>

---

Changes in v2:
- Add the dts node on RK3288.

 arch/arm/boot/dts/rk3288.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 165968d..423355e 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -691,6 +691,11 @@
 		};
 	};
 
+	efuse: efuse@ffb40000 {
+		compatible = "rockchip,rk3066-efuse";
+		reg = <0xffb40000 0x10000>;
+	};
+
 	gic: interrupt-controller@ffc01000 {
 		compatible = "arm,gic-400";
 		interrupt-controller;
-- 
1.9.1
