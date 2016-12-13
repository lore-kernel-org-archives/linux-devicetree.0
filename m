From: Jon Mason <jon.mason@broadcom.com>
Subject: [PATCH 6/7] ARM: dts: NSP: Add Ethernet to NSP XMC
Date: Tue, 13 Dec 2016 13:13:50 -0500
Message-ID: <1481652831-2744-7-git-send-email-jon.mason@broadcom.com>
References: <1481652831-2744-1-git-send-email-jon.mason@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1481652831-2744-1-git-send-email-jon.mason@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Enable the ethernet in the NSP XMC (bcm958525xmc) device tree

Signed-off-by: Jon Mason <jon.mason@broadcom.com>
---
 arch/arm/boot/dts/bcm958525xmc.dts | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm958525xmc.dts b/arch/arm/boot/dts/bcm958525xmc.dts
index 89d9abc..3912269 100644
--- a/arch/arm/boot/dts/bcm958525xmc.dts
+++ b/arch/arm/boot/dts/bcm958525xmc.dts
@@ -59,7 +59,11 @@
 	};
 };
 
-/* XHCI, MMC, and Ethernet support needed to be complete */
+/* XHCI and SD/MMC support needed to be complete */
+
+&amac0 {
+	status = "okay";
+};
 
 &i2c0 {
 	temperature-sensor@4c {
-- 
2.7.4
