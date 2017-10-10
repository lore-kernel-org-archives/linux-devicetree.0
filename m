From: Alan Tull <atull@kernel.org>
Subject: [PATCH 1/2] arm64: dts: stratix10: add gpio header
Date: Tue, 10 Oct 2017 16:25:37 -0500
Message-ID: <20171010212538.3331-1-atull@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Alan Tull <atull@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the gpio header to the base stratix10 dtsi.

Signed-off-by: Alan Tull <atull@kernel.org>
---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index 6804936..721b91a 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -16,6 +16,7 @@
 
 /dts-v1/;
 #include <dt-bindings/reset/altr,rst-mgr-s10.h>
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	compatible = "altr,socfpga-stratix10";
-- 
2.7.4
