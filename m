From: Scott Branden <scott.branden@broadcom.com>
Subject: [PATCH 3/6] ARM: dts: cygnus: Enable Performance Monitoring Unit
Date: Tue, 15 Aug 2017 10:26:00 -0700
Message-ID: <1502817964-8221-4-git-send-email-scott.branden@broadcom.com>
References: <1502817964-8221-1-git-send-email-scott.branden@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502817964-8221-1-git-send-email-scott.branden@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@arm.linux.org.uk>, Ray Jui <ray.jui@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jason Uy <jason.uy@broadcom.com>, Scott Branden <scott.branden@broadcom.com>
List-Id: devicetree@vger.kernel.org

From: Jason Uy <jason.uy@broadcom.com>

Add PMU capability to Cygnus so trace and performance profiling
can be used.

Signed-off-by: Jason Uy <jason.uy@broadcom.com>
Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 arch/arm/boot/dts/bcm-cygnus.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
index 2077fee..bc08987 100644
--- a/arch/arm/boot/dts/bcm-cygnus.dtsi
+++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
@@ -55,6 +55,11 @@
 
 	/include/ "bcm-cygnus-clock.dtsi"
 
+	pmu {
+		compatible = "arm,cortex-a9-pmu";
+		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
 	core {
 		compatible = "simple-bus";
 		ranges = <0x00000000 0x19000000 0x1000000>;
-- 
2.5.0
