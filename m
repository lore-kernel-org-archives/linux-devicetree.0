From: David Lechner <david@lechnology.com>
Subject: [PATCH v2 3/3] ARM: dts: da850: Add node for pullup/pulldown pinconf
Date: Mon, 28 Nov 2016 10:40:26 -0600
Message-ID: <1480351226-3332-4-git-send-email-david@lechnology.com>
References: <1480351226-3332-1-git-send-email-david@lechnology.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1480351226-3332-1-git-send-email-david@lechnology.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>
Cc: David Lechner <david@lechnology.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Axel Haslam <ahaslam@baylibre.com>, Alexandre Bailon <abailon@baylibre.com>, =?UTF-8?q?Bartosz=20Go=C5=82aszewski?= <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

This SoC has a separate pin controller for configuring pullup/pulldown
bias on groups of pins.

Signed-off-by: David Lechner <david@lechnology.com>
---

v2 changes:
* Moved pin-controller@22c00c device node after gpio@226000 (there seem to be
  more nodes in proper order here compared to the i2c@228000 node suggested by
  Sekhar)

 arch/arm/boot/dts/da850.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index 8945815..7a8d38e 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -442,6 +442,11 @@
 			ti,davinci-gpio-unbanked = <0>;
 			status = "disabled";
 		};
+		pinconf: pin-controller@22c00c {
+			compatible = "ti,da850-pupd";
+			reg = <0x22c00c 0x8>;
+			status = "disabled";
+		};
 
 		mcasp0: mcasp@100000 {
 			compatible = "ti,da830-mcasp-audio";
-- 
2.7.4

