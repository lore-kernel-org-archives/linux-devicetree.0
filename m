From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: [PATCH 2/3] ARM: dts: at91: usb_a9g20: fix rtc node
Date: Fri, 15 Sep 2017 04:00:03 +0200
Message-ID: <20170915020004.24272-2-alexandre.belloni@free-electrons.com>
References: <20170915020004.24272-1-alexandre.belloni@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170915020004.24272-1-alexandre.belloni@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rtc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Nicolas Ferre <nicolas.ferre@microchip.com>, Michael Ellerman <mpe@ellerman.id.au>, Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

The rv3029 compatible is missing its vendor string, add it.
Also fix the node name to be a proper generic name.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 arch/arm/boot/dts/usb_a9g20_common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/usb_a9g20_common.dtsi b/arch/arm/boot/dts/usb_a9g20_common.dtsi
index 088c2c3685ab..81c3fe0465d9 100644
--- a/arch/arm/boot/dts/usb_a9g20_common.dtsi
+++ b/arch/arm/boot/dts/usb_a9g20_common.dtsi
@@ -20,8 +20,8 @@
 	};
 
 	i2c-gpio-0 {
-		rv3029c2@56 {
-			compatible = "rv3029c2";
+		rtc@56 {
+			compatible = "microcrystal,rv3029";
 			reg = <0x56>;
 		};
 	};
-- 
2.14.1
