From: kernel@martin.sperl.org
Subject: [PATCH V7 4/6] ARM64: bcm2835: dts: add thermal node to device-tree of bcm2837
Date: Wed, 21 Sep 2016 08:23:45 +0000
Message-ID: <1474446227-1147-5-git-send-email-kernel@martin.sperl.org>
References: <1474446227-1147-1-git-send-email-kernel@martin.sperl.org>
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1474446227-1147-1-git-send-email-kernel@martin.sperl.org>
Sender: linux-pm-owner@vger.kernel.org
To: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Russell King <linux@arm.linux.org.uk>, Florian Fainelli <f.fainelli@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Stefan Wahren <stefan.wahren@i2se.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: Martin Sperl <kernel@martin.sperl.org>
List-Id: devicetree@vger.kernel.org

From: Martin Sperl <kernel@martin.sperl.org>

Add the node for the thermal sensor of the bcm2837-soc
to the device tree.

Signed-off-by: Martin Sperl <kernel@martin.sperl.org>
---
 arch/arm64/boot/dts/broadcom/bcm2837.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2837.dtsi b/arch/arm64/boot/dts/broadcom/bcm2837.dtsi
index f2a31d0..2b0cfc7 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2837.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2837.dtsi
@@ -74,3 +74,9 @@
 	interrupt-parent = <&local_intc>;
 	interrupts = <8>;
 };
+
+/* enable thermal sensor with the correct compatible property set */
+&thermal {
+	compatible = "brcm,bcm2837-thermal";
+	status = "okay";
+};
-- 
2.1.4

