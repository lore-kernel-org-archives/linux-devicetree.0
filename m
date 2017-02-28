From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v3 21/25] ARM: dts: s500: Set CPU enable-method
Date: Tue, 28 Feb 2017 07:35:31 +0100
Message-ID: <20170228063535.32069-22-afaerber@suse.de>
References: <20170228063535.32069-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170228063535.32069-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, mp-cs@actions-semi.com, 96boards@ucrobotics.com, support@lemaker.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Use a custom S500 enable-method for all CPUs.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 v3: new
 
 arch/arm/boot/dts/s500.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/s500.dtsi b/arch/arm/boot/dts/s500.dtsi
index 1973181..b4ebd27 100644
--- a/arch/arm/boot/dts/s500.dtsi
+++ b/arch/arm/boot/dts/s500.dtsi
@@ -22,24 +22,28 @@
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <0x0>;
+			enable-method = "actions,s500-smp";
 		};
 
 		cpu1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <0x1>;
+			enable-method = "actions,s500-smp";
 		};
 
 		cpu2: cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <0x2>;
+			enable-method = "actions,s500-smp";
 		};
 
 		cpu3: cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <0x3>;
+			enable-method = "actions,s500-smp";
 		};
 	};
 
-- 
2.10.2
