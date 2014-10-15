From: Kever Yang <kever.yang@rock-chips.com>
Subject: [PATCH v5 3/6] ARM: dts: rockchip: add pmu references to cpus nodes
Date: Wed, 15 Oct 2014 10:23:02 -0700
Message-ID: <1413393785-26783-4-git-send-email-kever.yang@rock-chips.com>
References: <1413393785-26783-1-git-send-email-kever.yang@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1413393785-26783-1-git-send-email-kever.yang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: dianders@chromium.org, sonnyrao@chromium.org, addy.ke@rock-chips.com, cf@rock-chips.com, xjq@rock-chips.com, hj@rock-chips.com, huangtao@rock-chips.com, linux-rockchip@lists.infradead.org, Kever Yang <kever.yang@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch add pmu reference and enable-method for smp

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

Changes in v5: None
Changes in v4: None
Changes in v3:
- add this patch

Changes in v2: None

 arch/arm/boot/dts/rk3288.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 874e66d..bcfde19 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -46,6 +46,8 @@
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
+		enable-method = "rockchip,rk3066-smp";
+		rockchip,pmu = <&pmu>;
 
 		cpu@500 {
 			device_type = "cpu";
-- 
1.9.1
