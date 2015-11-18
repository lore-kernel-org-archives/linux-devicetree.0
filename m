From: Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v3 5/5] ARM64: dts: rockchip: add reboot node
Date: Wed, 18 Nov 2015 18:05:20 +0800
Message-ID: <1447841120-19959-1-git-send-email-andy.yan@rock-chips.com>
References: <1447840044-19689-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447840044-19689-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, galak@codeaurora.org, linux@arm.linux.org.uk, linux-rockchip@lists.infradead.org, ijc+devicetree@hellion.org.uk, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, khilman@linaro.org, treding@nvidia.com, wxt@rock-chips.com, sjg@chromium.org, benchan@google.com, olof@lixom.net, will.deacon@arm.com, Andy Yan <andy.yan@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Add reboot notifier driver DT node for rk3368 platform

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v3:
 - add DT node

Changes in v2: None

 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index a712bea..c390f61 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -202,6 +202,12 @@
 		method = "smc";
 	};
 
+	reboot {
+		compatible = "rockchip,reboot";
+		rockchip,regmap = <&pmugrf>;
+		offset = <0x200>;
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13
-- 
1.9.1
