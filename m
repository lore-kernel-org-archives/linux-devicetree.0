From: Quan Nguyen <qnguyen@apm.com>
Subject: [PATCH v7 3/3] arm64: dts: Update X-Gene standby GPIO controller DTS entries
Date: Wed, 17 Feb 2016 20:15:09 +0700
Message-ID: <1455714909-3027-4-git-send-email-qnguyen@apm.com>
References: <1455714909-3027-1-git-send-email-qnguyen@apm.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1455714909-3027-1-git-send-email-qnguyen@apm.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Y Vo <yvo@apm.com>, Phong Vo <pvo@apm.com>, Loc Ho <lho@apm.com>, Feng Kan <fkan@apm.com>, Duc Dang <dhdang@apm.com>, Iyappan Subramanian <isubramanian@apm.com>, patches@apm.com, Quan Nguyen <qnguyen@apm.com>
List-Id: devicetree@vger.kernel.org

Update APM X-Gene standby GPIO controller DTS entries to enable it
as interrupt controller.

Signed-off-by: Y Vo <yvo@apm.com>
Signed-off-by: Quan Nguyen <qnguyen@apm.com>
---
 arch/arm64/boot/dts/apm/apm-storm.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index fe30f76..0f733da 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -883,6 +883,9 @@
 					<0x0 0x2b 0x1>,
 					<0x0 0x2c 0x1>,
 					<0x0 0x2d 0x1>;
+			interrupt-parent = <&gic>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
 		};
 
 		rtc: rtc@10510000 {
-- 
1.7.12.4

