From: Jon Mason <jonmason@broadcom.com>
Subject: [PATCH 2/2] ARM: dts: NSP: Add I2C support to the DT
Date: Tue, 17 Nov 2015 14:55:27 -0500
Message-ID: <1447790127-27237-3-git-send-email-jonmason@broadcom.com>
References: <1447790127-27237-1-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447790127-27237-1-git-send-email-jonmason@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

Add I2C support to the Broadcom Northstar Plus Device Tree.  Since no
driver changes are needed to enable this hardware, only the device tree
changes are required to make this functional.

Signed-off-by: Jon Mason <jonmason@broadcom.com>
---
 arch/arm/boot/dts/bcm-nsp.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/bcm-nsp.dtsi b/arch/arm/boot/dts/bcm-nsp.dtsi
index 7335a74..b74438c 100644
--- a/arch/arm/boot/dts/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/bcm-nsp.dtsi
@@ -217,5 +217,14 @@
 
 			brcm,nand-has-wp;
 		};
+
+		i2c0: i2c@38000 {
+			compatible = "brcm,iproc-i2c";
+			reg = <0x38000 0x50>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 89 IRQ_TYPE_NONE>;
+			clock-frequency = <100000>;
+		};
 	};
 };
-- 
1.9.1
