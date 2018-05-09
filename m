Return-Path: <SRS0=X3x8=H4=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33911 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965408AbeEIXux (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 9 May 2018 19:50:53 -0400
Received: by mail-wm0-f68.google.com with SMTP id a137-v6so25280685wme.1
        for <devicetree@vger.kernel.org>; Wed, 09 May 2018 16:50:53 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 3/4] ARM: dts: meson8: add the uart_A pins
Date: Thu, 10 May 2018 01:50:36 +0200
Message-Id: <20180509235037.5876-4-martin.blumenstingl@googlemail.com>
In-Reply-To: <20180509235037.5876-1-martin.blumenstingl@googlemail.com>
References: <20180509235037.5876-1-martin.blumenstingl@googlemail.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com, carlo@caione.org
Cc: devicetree@vger.kernel.org, balbes-150@yandex.ru, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-ID: <devicetree@vger.kernel.org>

This adds the pins for uart_A, which is used to connect to the Bluetooth
module on some devices.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 7b16ea61e914..d77dcf890cfc 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -281,6 +281,22 @@
 				function = "pwm_e";
 			};
 		};
+
+		uart_a1_pins: uart-a1 {
+			mux {
+				groups = "uart_tx_a1",
+				       "uart_rx_a1";
+				function = "uart_a";
+			};
+		};
+
+		uart_a1_cts_rts_pins: uart-a1-cts-rts {
+			mux {
+				groups = "uart_cts_a1",
+				       "uart_rts_a1";
+				function = "uart_a";
+			};
+		};
 	};
 };
 
-- 
2.17.0

