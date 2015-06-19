From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH v2 5/6] ARM: dts: pxa: fix power i2c definition
Date: Fri, 19 Jun 2015 20:38:21 +0200
Message-ID: <1434739102-26217-5-git-send-email-robert.jarzmik@free.fr>
References: <1434739102-26217-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434739102-26217-1-git-send-email-robert.jarzmik@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: devicetree@vger.kernel.org

Add the correct address and size to the device-tree description.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 arch/arm/boot/dts/pxa27x.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/pxa27x.dtsi b/arch/arm/boot/dts/pxa27x.dtsi
index 1402e23..fc79df9 100644
--- a/arch/arm/boot/dts/pxa27x.dtsi
+++ b/arch/arm/boot/dts/pxa27x.dtsi
@@ -59,6 +59,8 @@
 			reg = <0x40f00180 0x24>;
 			interrupts = <6>;
 			clocks = <&clks CLK_PWRI2C>;
+			#address-cells = <0x1>;
+			#size-cells = <0>;
 			status = "disabled";
 		};
 
-- 
2.1.4
