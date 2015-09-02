From: Alexandru M Stan <amstan@chromium.org>
Subject: [PATCH v2 1/2] ARM: dts: rockchip: pull up cts lines on rk3288
Date: Wed,  2 Sep 2015 16:27:58 -0700
Message-ID: <1441236479-4941-2-git-send-email-amstan@chromium.org>
References: <1441236479-4941-1-git-send-email-amstan@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441236479-4941-1-git-send-email-amstan@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Romain Perier <romain.perier@gmail.com>, FUKAUMI Naoki <naobsd@gmail.com>, Neil Hendin <nhendin@chromium.org>, Douglas Anderson <dianders@chromium.org>, Jeffy Chen <jeffy.chen@rock-chips.com>, Caesar Wang <wxt@rock-chips.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Alexandru M Stan <amstan@chromium.org>
List-Id: devicetree@vger.kernel.org

The flow control lines from a user accessible UART are optional,
the user might not have anything connected to those pins.
In order to prevent random interrupts happening and noise affecting
the cts pin should be pulled up.

Note that the default state for that pin on the rk3288 is pulled up,
so this patch merely restores them.

This is similar to what we're already doing with the RX pin,
so it should be safe. At worst it might be a slightly higher power usage
(through ~50 kohms) when the cts is low.

Suggested-by: Neil Hendin <nhendin@chromium.org>
Signed-off-by: Alexandru M Stan <amstan@chromium.org>
---
Changes in v2: None

 arch/arm/boot/dts/rk3288.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 906e938..0e8fd53 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -1211,7 +1211,7 @@
 			};
 
 			uart0_cts: uart0-cts {
-				rockchip,pins = <4 18 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <4 18 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
 			uart0_rts: uart0-rts {
@@ -1226,7 +1226,7 @@
 			};
 
 			uart1_cts: uart1-cts {
-				rockchip,pins = <5 10 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <5 10 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
 			uart1_rts: uart1-rts {
@@ -1249,7 +1249,7 @@
 			};
 
 			uart3_cts: uart3-cts {
-				rockchip,pins = <7 9 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <7 9 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
 			uart3_rts: uart3-rts {
@@ -1264,7 +1264,7 @@
 			};
 
 			uart4_cts: uart4-cts {
-				rockchip,pins = <5 14 3 &pcfg_pull_none>;
+				rockchip,pins = <5 14 3 &pcfg_pull_up>;
 			};
 
 			uart4_rts: uart4-rts {
-- 
2.5.0.457.gab17608
