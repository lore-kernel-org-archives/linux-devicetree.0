From: Jeffy Chen <jeffy.chen@rock-chips.com>
Subject: [PATCH 3/3] arm64: dts: rockchip: Avoid wakeup when inserting the pen
Date: Fri,  9 Feb 2018 19:55:10 +0800
Message-ID: <20180209115510.11868-4-jeffy.chen@rock-chips.com>
References: <20180209115510.11868-1-jeffy.chen@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180209115510.11868-1-jeffy.chen@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: briannorris@google.com, dtor@google.com, dianders@google.com, Jeffy Chen <jeffy.chen@rock-chips.com>, Matthias Kaehlcke <mka@chromium.org>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Emil Renner Berthing <kernel@esmil.dk>, Heiko Stuebner <heiko@sntech.de>, Brian Norris <briannorris@chromium.org>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-arm-kernel@lists.infradead.org, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>
List-Id: devicetree@vger.kernel.org

Add wakeup interrupt trigger type for Pen Insert gpio key, to avoid
wakeup when inserting the pen.

Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
---

 arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts b/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
index 191a6bcb1704..5edfbd288b2f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
@@ -134,6 +134,8 @@
 		gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
 		linux,code = <SW_PEN_INSERTED>;
 		linux,input-type = <EV_SW>;
+		/* Wakeup only when ejecting */
+		wakeup-trigger-type = <IRQ_TYPE_EDGE_RISING>;
 		wakeup-source;
 	};
 };
-- 
2.11.0
