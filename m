From: David Lechner <david@lechnology.com>
Subject: [PATCH v2 4/4] ARM: davinci: da850: There are 101 interrupts.
Date: Sat, 16 Apr 2016 12:00:20 -0500
Message-ID: <1460826020-1256-5-git-send-email-david@lechnology.com>
References: <1460826020-1256-1-git-send-email-david@lechnology.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460826020-1256-1-git-send-email-david@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>
Cc: David Lechner <david@lechnology.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kevin Hilman <khilman@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Fix off by one error in da850 device tree.

Signed-off-by: David Lechner <david@lechnology.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
---

no change

 arch/arm/boot/dts/da850.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index 26fc0812..cf1aad8 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -19,7 +19,7 @@
 			compatible = "ti,cp-intc";
 			interrupt-controller;
 			#interrupt-cells = <1>;
-			ti,intc-size = <100>;
+			ti,intc-size = <101>;
 			reg = <0xfffee000 0x2000>;
 		};
 	};
-- 
1.9.1
