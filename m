From: Sourav Poddar <sourav.poddar@ti.com>
Subject: [PATCH 2/3] arm: dts: am437x-gp-evm: Enable gpio.
Date: Wed, 27 Nov 2013 13:01:18 +0530
Message-ID: <1385537479-6959-3-git-send-email-sourav.poddar@ti.com>
References: <1385537479-6959-1-git-send-email-sourav.poddar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1385537479-6959-1-git-send-email-sourav.poddar@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: rob.herring@calxeda.com, mark.rutland@arm.com, swarren@wwwdotorg.org, devicetree@vger.kernel.org, tony@atomide.com, bcousson@baylibre.com
Cc: balbi@ti.com, linux-omap@vger.kernel.org, nsekhar@ti.com, Sourav Poddar <sourav.poddar@ti.com>
List-Id: devicetree@vger.kernel.org

Enable gpio3, gpio4, it will be used by gpio matrix keys. Also,
can be used by othe peripherals.

Signed-off-by: Sourav Poddar <sourav.poddar@ti.com>
---
 arch/arm/boot/dts/am437x-gp-evm.dts |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/am437x-gp-evm.dts b/arch/arm/boot/dts/am437x-gp-evm.dts
index a581f7d..312a51c 100644
--- a/arch/arm/boot/dts/am437x-gp-evm.dts
+++ b/arch/arm/boot/dts/am437x-gp-evm.dts
@@ -69,3 +69,11 @@
 		pinctrl-0 = <&ecap0_pins>;
 	};
 };
+
+&gpio3 {
+	status = "okay";
+};
+
+&gpio4 {
+	status = "okay";
+};
-- 
1.7.1

