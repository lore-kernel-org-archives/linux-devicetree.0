From: thor.thayer@linux.intel.com
Subject: [PATCH 5/5] ARM: socfpga: dts: Add Devkit A10-SR Reset Controller
Date: Wed, 15 Feb 2017 15:50:16 -0600
Message-ID: <1487195416-23827-6-git-send-email-thor.thayer@linux.intel.com>
References: <1487195416-23827-1-git-send-email-thor.thayer@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1487195416-23827-1-git-send-email-thor.thayer@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org, linux@armlinux.org.uk, p.zabel@pengutronix.de
Cc: thor.thayer@linux.intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer@linux.intel.com>

Add the Altera Arria10 System Resource Reset Controller to the MFD

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
 arch/arm/boot/dts/socfpga_arria10_socdk.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi b/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
index c57e6ce..9329025 100644
--- a/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
@@ -121,6 +121,11 @@
 			gpio-controller;
 			#gpio-cells = <2>;
 		};
+
+		a10sr_rst: reset-controller {
+			compatible = "altr,a10sr-reset";
+			#reset-cells = <1>;
+		};
 	};
 };
 
-- 
1.9.1
