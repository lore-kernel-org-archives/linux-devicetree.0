From: Alban Bedel <albeu@free.fr>
Subject: [PATCH v2 4/5] MIPS: ath79: Add the EHCI controller and USB phy to the AR9132 dtsi
Date: Mon, 16 Nov 2015 22:22:03 +0100
Message-ID: <1447708924-15076-5-git-send-email-albeu@free.fr>
References: <1447708924-15076-1-git-send-email-albeu@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447708924-15076-1-git-send-email-albeu@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ralf Baechle <ralf@linux-mips.org>, Kishon Vijay Abraham I <kishon@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alban Bedel <albeu@free.fr>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Alban Bedel <albeu@free.fr>
---
Changelog:
v2: * Fix the USB controller node name to follow ePAPR
    * Set the USB phy as disabled like the USB controller
---
 arch/mips/boot/dts/qca/ar9132.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/mips/boot/dts/qca/ar9132.dtsi b/arch/mips/boot/dts/qca/ar9132.dtsi
index fb7734e..857ca48 100644
--- a/arch/mips/boot/dts/qca/ar9132.dtsi
+++ b/arch/mips/boot/dts/qca/ar9132.dtsi
@@ -125,6 +125,21 @@
 			};
 		};
 
+		usb@1b000100 {
+			compatible = "qca,ar7100-ehci", "generic-ehci";
+			reg = <0x1b000100 0x100>;
+
+			interrupts = <3>;
+			resets = <&rst 5>;
+
+			has-transaction-translator;
+
+			phy-names = "usb";
+			phys = <&usb_phy>;
+
+			status = "disabled";
+		};
+
 		spi@1f000000 {
 			compatible = "qca,ar9132-spi", "qca,ar7100-spi";
 			reg = <0x1f000000 0x10>;
@@ -138,4 +153,15 @@
 			#size-cells = <0>;
 		};
 	};
+
+	usb_phy: usb-phy {
+		compatible = "qca,ar7100-usb-phy";
+
+		reset-names = "usb-phy", "usb-suspend-override";
+		resets = <&rst 4>, <&rst 3>;
+
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
 };
-- 
2.0.0
