From: Jeffy Chen <jeffy.chen@rock-chips.com>
Subject: [PATCH v3 3/3] arm64: dts: rockchip: Avoid wakeup when inserting the pen
Date: Fri,  2 Mar 2018 11:51:02 +0800
Message-ID: <20180302035102.10084-4-jeffy.chen@rock-chips.com>
References: <20180302035102.10084-1-jeffy.chen@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180302035102.10084-1-jeffy.chen@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: briannorris@google.com, heiko@sntech.de, dtor@google.com, dianders@google.com, Jeffy Chen <jeffy.chen@rock-chips.com>, Matthias Kaehlcke <mka@chromium.org>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Mark Yao <markyao0591@gmail.com>, Brian Norris <briannorris@chromium.org>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Will Deacon <will.deacon@arm.com>, Emil Renner Berthing <kernel@esmil.dk>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>
List-Id: devicetree@vger.kernel.org

Add wakeup event action for Pen Insert gpio key, to avoid wakeup when
inserting the pen.

Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
---

Changes in v3: None
Changes in v2:
Specify wakeup event action instead of irq trigger type as Brian
suggested.

 arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts b/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
index 191a6bcb1704..ef2de0057c5c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
@@ -134,6 +134,8 @@
 		gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
 		linux,code = <SW_PEN_INSERTED>;
 		linux,input-type = <EV_SW>;
+		/* Wakeup only when ejecting */
+		wakeup-event-action = <EV_ACT_DEASSERTED>;
 		wakeup-source;
 	};
 };
-- 
2.11.0
