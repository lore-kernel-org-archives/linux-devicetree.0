Return-Path: <SRS0=jfmr=HZ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:52882 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751091AbeEFJVe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 6 May 2018 05:21:34 -0400
Received: by mail-wm0-f65.google.com with SMTP id w194so9661745wmf.2
        for <devicetree@vger.kernel.org>; Sun, 06 May 2018 02:21:34 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 5/6] ARM: dts: meson8: add the uart_A pins
Date: Sun,  6 May 2018 11:21:18 +0200
Message-Id: <20180506092119.467-6-martin.blumenstingl@googlemail.com>
In-Reply-To: <20180506092119.467-1-martin.blumenstingl@googlemail.com>
References: <20180506092119.467-1-martin.blumenstingl@googlemail.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, khilman@baylibre.com, carlo@caione.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: balbes-150@yandex.ru, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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

