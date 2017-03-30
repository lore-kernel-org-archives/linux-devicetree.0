From: Jeffy Chen <jeffy.chen@rock-chips.com>
Subject: [PATCH 2/2] ARM: dts: cros-ec-keyboard: Enable as wakeup source
Date: Thu, 30 Mar 2017 17:50:50 +0800
Message-ID: <1490867450-31765-3-git-send-email-jeffy.chen@rock-chips.com>
References: <1490867450-31765-1-git-send-email-jeffy.chen@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1490867450-31765-1-git-send-email-jeffy.chen@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: briannorris@chromium.org, dmitry.torokhov@gmail.com, dbasehore@google.com, dianders@chromium.org, Jeffy Chen <jeffy.chen@rock-chips.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Enable cros-ec-keyboard as a wakeup source.

Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
---

 arch/arm/boot/dts/cros-ec-keyboard.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/cros-ec-keyboard.dtsi b/arch/arm/boot/dts/cros-ec-keyboard.dtsi
index c0451051..3168a5e 100644
--- a/arch/arm/boot/dts/cros-ec-keyboard.dtsi
+++ b/arch/arm/boot/dts/cros-ec-keyboard.dtsi
@@ -16,6 +16,7 @@
 		keypad,num-rows = <8>;
 		keypad,num-columns = <13>;
 		google,needs-ghost-filter;
+		wakeup-source;
 
 		linux,keymap = <
 			MATRIX_KEY(0x00, 0x01, KEY_LEFTMETA)
-- 
2.1.4
