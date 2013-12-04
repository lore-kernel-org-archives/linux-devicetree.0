From: Feng Kan <fkan@apm.com>
Subject: [PATCH 2/4] arm64: add missing dts entry for X-Gene platform.
Date: Wed,  4 Dec 2013 10:33:32 -0800
Message-ID: <1386182012-26642-1-git-send-email-fkan@apm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: patches@apm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Feng Kan <fkan@apm.com>
List-Id: devicetree@vger.kernel.org

This add missing dts entry for X-Gene reboot driver.

Signed-off-by: Feng Kan <fkan@apm.com>
---
 arch/arm64/boot/dts/apm-storm.dtsi |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/apm-storm.dtsi b/arch/arm64/boot/dts/apm-storm.dtsi
index bfdc578..4478bee 100644
--- a/arch/arm64/boot/dts/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm-storm.dtsi
@@ -112,5 +112,10 @@
 			interrupt-parent = <&gic>;
 			interrupts = <0x0 0x4c 0x4>;
 		};
+
+		reboot@17000014 {
+			compatible = "apm,xgene-reboot";
+			reg = <0x0 0x17000014 0x0 0x4>;
+		};
 	};
 };
-- 
1.7.6.1
