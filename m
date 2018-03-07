From: Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 4/6] ARM: dts: bcm2835: Add VCHIQ node to the Raspberry Pi boards.
Date: Wed,  7 Mar 2018 10:57:14 -0800
Message-ID: <20180307185716.17449-4-eric@anholt.net>
References: <20180307185716.17449-1-eric@anholt.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180307185716.17449-1-eric@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Phil Elwell <phil@raspberrypi.org>
Cc: linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>, bcm-kernel-feedback-list@broadcom.com, Eric Anholt <eric@anholt.net>
List-Id: devicetree@vger.kernel.org

The VCHIQ firmware communication channel operates in parallel with our
other mailbox-based channel.  This is the communication channel that
exposes the firmware's media decode/encode and ISP interfaces.

Signed-off-by: Eric Anholt <eric@anholt.net>
---

v2: dropped firmware property, added cache-line-size.

 arch/arm/boot/dts/bcm2835-rpi.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
index e36c392a2b8f..ba6dd25ac93f 100644
--- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
@@ -27,6 +27,17 @@
 			firmware = <&firmware>;
 			#power-domain-cells = <1>;
 		};
+
+		vchiq@7e00b840 {
+			compatible = "brcm,bcm2835-vchiq";
+			reg = <0x7e00b840 0xf>;
+			interrupts = <0 2>;
+			/* The VPU firmware will override this DT property
+			 * (if present) with the L2 cache line size value it
+			 * wants to use.
+			 */
+			cache-line-size = <32>;
+		};
 	};
 };
 
-- 
2.16.2
