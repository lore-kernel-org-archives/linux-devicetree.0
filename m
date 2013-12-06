From: Tim Kryger <tim.kryger@linaro.org>
Subject: [PATCH 2/2] ARM: dts: bcm28155-ap: Enable all the i2c busses
Date: Fri, 6 Dec 2013 15:45:28 -0800
Message-ID: <1386373528-13045-3-git-send-email-tim.kryger@linaro.org>
References: <1386373528-13045-1-git-send-email-tim.kryger@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1386373528-13045-1-git-send-email-tim.kryger@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Daudt <bcm@fixthebug.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Tim Kryger <tim.kryger@linaro.org>, Broadcom Kernel Feedback List <bcm-kernel-feedback-list@broadcom.com>, Device Tree List <devicetree@vger.kernel.org>, Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linaro Patches List <patches@linaro.org>
List-Id: devicetree@vger.kernel.org

Enable all available i2c busses.

Signed-off-by: Tim Kryger <tim.kryger@linaro.org>
Reviewed-by: Christian Daudt <csd@broadcom.com>
Reviewed-by: Matt Porter <matt.porter@linaro.org>
Reviewed-by: Markus Mayer <markus.mayer@linaro.org>
---
 arch/arm/boot/dts/bcm28155-ap.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/bcm28155-ap.dts b/arch/arm/boot/dts/bcm28155-ap.dts
index 08e47c2..bab302d 100644
--- a/arch/arm/boot/dts/bcm28155-ap.dts
+++ b/arch/arm/boot/dts/bcm28155-ap.dts
@@ -27,6 +27,26 @@
 		status = "okay";
 	};
 
+	i2c@3e016000 {
+		status="okay";
+		clock-frequency = <400000>;
+	};
+
+	i2c@3e017000 {
+		status="okay";
+		clock-frequency = <400000>;
+	};
+
+	i2c@3e018000 {
+		status="okay";
+		clock-frequency = <400000>;
+	};
+
+	i2c@3500d000 {
+		status="okay";
+		clock-frequency = <400000>;
+	};
+
 	sdio1: sdio@3f180000 {
 		max-frequency = <48000000>;
 		status = "okay";
-- 
1.8.0.1
