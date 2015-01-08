From: Feng Kan <fkan@apm.com>
Subject: [PATCH V3 5/7] arm64: dts: Add APM X-Gene SoC GFC GPIO controller DTS entries
Date: Wed,  7 Jan 2015 17:33:36 -0700
Message-ID: <1420677218-30743-6-git-send-email-fkan@apm.com>
References: <1420677218-30743-1-git-send-email-fkan@apm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1420677218-30743-1-git-send-email-fkan@apm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: patches@apm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Feng Kan <fkan@apm.com>
List-Id: devicetree@vger.kernel.org

Add the flash controller muxed gpio dts node for APM X-Gene SoC platform.

Signed-off-by: Feng Kan <fkan@apm.com>
---
 arch/arm64/boot/dts/apm/apm-storm.dtsi |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index a58f9a2..adea254 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -540,6 +540,13 @@
 			};
 		};
 
+		gfcgpio: gpio0@1701c000 {
+			compatible = "apm,xgene-gpio";
+			reg = <0x0 0x1701c000 0x0 0x40>;
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
 		phy1: phy@1f21a000 {
 			compatible = "apm,xgene-phy";
 			reg = <0x0 0x1f21a000 0x0 0x100>;
-- 
1.7.1
