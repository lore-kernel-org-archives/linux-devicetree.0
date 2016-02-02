From: Caesar Wang <wxt@rock-chips.com>
Subject: [PATCH v5 4/8] ARM: dts: rockchip: add mclk for rt5616 on kylin board
Date: Tue,  2 Feb 2016 11:40:52 +0800
Message-ID: <1454384453-7127-3-git-send-email-wxt@rock-chips.com>
References: <1454384032-6794-1-git-send-email-wxt@rock-chips.com>
 <1454384453-7127-1-git-send-email-wxt@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454384453-7127-1-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, keescook@google.com, linux-kernel@vger.kernel.org, jeffy.chen@rock-chips.com, leozwang@google.com, Caesar Wang <wxt@rock-chips.com>
List-Id: devicetree@vger.kernel.org

The I2S block that provide the output clock as the mclk for rt5616,
That will be the master clock  input.

Signed-off-by: Caesar Wang <wxt@rock-chips.com>

---

Changes in v5: None
Changes in v4:
- AS the previous discussed by them, add the mclk for codec.
 (https://patchwork.kernel.org/patch/8041001/)

 arch/arm/boot/dts/rk3036-kylin.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/rk3036-kylin.dts b/arch/arm/boot/dts/rk3036-kylin.dts
index cd45434..b0473bc 100644
--- a/arch/arm/boot/dts/rk3036-kylin.dts
+++ b/arch/arm/boot/dts/rk3036-kylin.dts
@@ -328,6 +328,8 @@
 	rt5616: rt5616@1b {
 		compatible = "rt5616";
 		reg = <0x1b>;
+		clocks = <&cru SCLK_I2S_OUT>;
+		clock-names = "mclk";
 		#sound-dai-cells = <0>;
 	};
 };
-- 
1.9.1
