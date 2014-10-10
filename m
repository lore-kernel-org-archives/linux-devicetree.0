From: Kever Yang <kever.yang@rock-chips.com>
Subject: [PATCH 2/2] ARM: dts: rockchip: add reset for CPU nodes
Date: Fri, 10 Oct 2014 15:25:15 -0700
Message-ID: <1412979915-19746-3-git-send-email-kever.yang@rock-chips.com>
References: <1412979915-19746-1-git-send-email-kever.yang@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1412979915-19746-1-git-send-email-kever.yang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: dianders@chromium.org, sonnyrao@chromium.org, addy.ke@rock-chips.com, cf@rock-chips.com, xjq@rock-chips.com, hj@rock-chips.com, huangtao@rock-chips.com, linux-rockchip@lists.infradead.org, Kever Yang <kever.yang@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch add reset for CPU nodes to use the reset controller.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

 arch/arm/boot/dts/rk3288.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 5e9c56d..291014d 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -53,21 +53,25 @@
 			device_type = "cpu";
 			compatible = "arm,cortex-a12";
 			reg = <0x500>;
+			resets = <&cru SRST_CORE0>;
 		};
 		cpu@501 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a12";
 			reg = <0x501>;
+			resets = <&cru SRST_CORE1>;
 		};
 		cpu@502 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a12";
 			reg = <0x502>;
+			resets = <&cru SRST_CORE2>;
 		};
 		cpu@503 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a12";
 			reg = <0x503>;
+			resets = <&cru SRST_CORE3>;
 		};
 	};
 
-- 
1.9.1
