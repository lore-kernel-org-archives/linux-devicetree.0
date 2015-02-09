From: Bo Shen <voice.shen@atmel.com>
Subject: [PATCH 3/3] ARM: at91: dt: at91sam9n12ek: enable udp
Date: Mon, 9 Feb 2015 17:02:52 +0800
Message-ID: <1423472572-19824-4-git-send-email-voice.shen@atmel.com>
References: <1423472572-19824-1-git-send-email-voice.shen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423472572-19824-1-git-send-email-voice.shen@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@ti.com, nicolas.ferre@atmel.com
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bo Shen <voice.shen@atmel.com>
List-Id: devicetree@vger.kernel.org

Enable usb device port on at91sam9n12ek board.

Signed-off-by: Bo Shen <voice.shen@atmel.com>
---

 arch/arm/boot/dts/at91sam9n12ek.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/at91sam9n12ek.dts b/arch/arm/boot/dts/at91sam9n12ek.dts
index 13bb24e..3e572e5 100644
--- a/arch/arm/boot/dts/at91sam9n12ek.dts
+++ b/arch/arm/boot/dts/at91sam9n12ek.dts
@@ -120,6 +120,11 @@
 				};
 			};
 
+			usb1: gadget@f803c000 {
+				atmel,vbus-gpio = <&pioB 16 GPIO_ACTIVE_HIGH>;
+				status = "okay";
+			};
+
 			watchdog@fffffe40 {
 				status = "okay";
 			};
-- 
2.3.0.rc0
