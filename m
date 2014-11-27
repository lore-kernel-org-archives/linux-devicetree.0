From: Ray Jui <rjui@broadcom.com>
Subject: [PATCH 4/4] ARM: dts: enable pinctrl for Broadcom Cygnus
Date: Thu, 27 Nov 2014 15:46:30 -0800
Message-ID: <1417131990-17954-5-git-send-email-rjui@broadcom.com>
References: <Ray Jui <rjui@broadcom.com>
 <1417131990-17954-1-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1417131990-17954-1-git-send-email-rjui@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Scott Branden <sbranden@broadcom.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>
List-Id: devicetree@vger.kernel.org

This enables the pinctrl support for Broadcom Cygnus SoC

Signed-off-by: Ray Jui <rjui@broadcom.com>
---
 arch/arm/boot/dts/bcm-cygnus.dtsi |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
index 5126f9e..4c6bf4d 100644
--- a/arch/arm/boot/dts/bcm-cygnus.dtsi
+++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
@@ -54,6 +54,11 @@
 
 	/include/ "bcm-cygnus-clock.dtsi"
 
+	pinctrl: pinctrl@0x0301d0c8 {
+		compatible = "brcm,cygnus-pinctrl";
+		reg = <0x0301d0c8 0x2c>;
+	};
+
 	amba {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
1.7.9.5
