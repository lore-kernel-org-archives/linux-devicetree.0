From: Ray Jui <rjui@broadcom.com>
Subject: [PATCH v3 6/9] ARM: dts: Enable various peripherals on bcm958305k
Date: Mon, 21 Sep 2015 15:12:47 -0700
Message-ID: <1442873570-20947-7-git-send-email-rjui@broadcom.com>
References: <1442873570-20947-1-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442873570-20947-1-git-send-email-rjui@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>
List-Id: devicetree@vger.kernel.org

This patch enables various peripherals on Broadcom Cygnus wireless audio
board (bcm958305k). These peripherals include I2C, PCIe, and NAND

Signed-off-by: Ray Jui <rjui@broadcom.com>
Reviewed-by: Scott Branden <sbranden@broadcom.com>
---
 arch/arm/boot/dts/bcm958305k.dts | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/bcm958305k.dts b/arch/arm/boot/dts/bcm958305k.dts
index af11a8e..9863a19 100644
--- a/arch/arm/boot/dts/bcm958305k.dts
+++ b/arch/arm/boot/dts/bcm958305k.dts
@@ -44,6 +44,38 @@
 	};
 };
 
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie1 {
+	status = "okay";
+};
+
 &uart3 {
 	status = "okay";
 };
+
+&nand {
+	nandcs@1 {
+		compatible = "brcm,nandcs";
+		reg = <0>;
+		nand-on-flash-bbt;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		nand-ecc-strength = <24>;
+		nand-ecc-step-size = <1024>;
+
+		brcm,nand-oob-sector-size = <27>;
+	};
+};
-- 
1.9.1
