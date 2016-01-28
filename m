From: Caesar Wang <wxt@rock-chips.com>
Subject: [PATCH v4 5/9] ARM: dts: rockchip: add mclk for rt5616 on kylin board
Date: Thu, 28 Jan 2016 16:43:34 +0800
Message-ID: <1453970618-4383-6-git-send-email-wxt@rock-chips.com>
References: <1453970618-4383-1-git-send-email-wxt@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453970618-4383-1-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org
Cc: hl@rock-chips.com, jay.xu@rock-chips.com, jeffy.chen@rock-chips.com, linux-rockchip@lists.infradead.org, keescook@google.com, cf@rock-chips.com, sonnyrao@chromium.org, leozwang@google.com, Caesar Wang <wxt@rock-chips.com>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The I2S block that provide the output clock as the mclk for rt5616,
That will be the master clock  input.

Signed-off-by: Caesar Wang <wxt@rock-chips.com>

---

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
