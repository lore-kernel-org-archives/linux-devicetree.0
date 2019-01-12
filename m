From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH 2/2] powerpc: wii.dts: Add GPIO keys
Date: Sat, 12 Jan 2019 17:21:24 +0100
Message-ID: <20190112162124.3341-3-j.neuschaefer@gmx.net>
References: <20190112162124.3341-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190112162124.3341-1-j.neuschaefer@gmx.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
List-Id: devicetree@vger.kernel.org

The Wii has POWER and EJECT buttons, which are connected through
normalization logic to the GPIO controller (the length of an assertion
of these signals is always the same, regardless of how long the user
pressed the buttons).

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
---
 arch/powerpc/boot/dts/wii.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/powerpc/boot/dts/wii.dts b/arch/powerpc/boot/dts/wii.dts
index 864e5a17aa1d..64f886a6327f 100644
--- a/arch/powerpc/boot/dts/wii.dts
+++ b/arch/powerpc/boot/dts/wii.dts
@@ -14,6 +14,7 @@
 
 /dts-v1/;
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 
 /*
  * This is commented-out for now.
@@ -249,5 +250,21 @@
 			gpios = <&GPIO 8 GPIO_ACTIVE_HIGH>;
 		};
 	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		power {
+			label = "Power Button";
+			gpios = <&GPIO 0 GPIO_ACTIVE_HIGH>;
+			linux,code = <KEY_POWER>;
+		};
+
+		eject {
+			label = "Eject Button";
+			gpios = <&GPIO 6 GPIO_ACTIVE_HIGH>;
+			linux,code = <KEY_EJECTCD>;
+		};
+	};
 };
 
-- 
2.20.1
