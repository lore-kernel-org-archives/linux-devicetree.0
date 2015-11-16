From: Alban Bedel <albeu@free.fr>
Subject: [PATCH v2 5/5] MIPS: ath79: Enable the USB port on the TL-WR1043ND
Date: Mon, 16 Nov 2015 22:22:04 +0100
Message-ID: <1447708924-15076-6-git-send-email-albeu@free.fr>
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
    * Enable the USB phy as it is now disabled per default
---
 arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts b/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
index 003015a..e535ee3 100644
--- a/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
+++ b/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
@@ -35,6 +35,10 @@
 			};
 		};
 
+		usb@1b000100 {
+			status = "okay";
+		};
+
 		spi@1f000000 {
 			status = "okay";
 			num-cs = <1>;
@@ -65,6 +69,10 @@
 		};
 	};
 
+	usb-phy {
+		status = "okay";
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys-polled";
 		#address-cells = <1>;
-- 
2.0.0
