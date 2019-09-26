From: Luca Weiss <luca@z3ntu.xyz>
Subject: [PATCH 2/2] ARM: dts: msm8974-FP2: Increase load on l20 for sdhci
Date: Thu, 26 Sep 2019 20:44:35 +0200
Message-ID: <20190926184436.1078314-2-luca@z3ntu.xyz>
References: <20190926184436.1078314-1-luca@z3ntu.xyz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190926184436.1078314-1-luca@z3ntu.xyz>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Before this change, trying to boot from the internal storage would
result in a lot of errors like:

[   11.224046] mmc0: cache flush error -110
[   11.224180] blk_update_request: I/O error, dev mmcblk0, sector 0 op 0x1:(WRITE) flags 0x800 phys_seg 0 prio class 0

or:

[  137.544673] mmc0: tuning execution failed: -5
[  137.569832] mmcblk0: error -110 requesting status
[  137.593558] mmcblk0: recovery failed!

With this patch, there are no more sdhci errors and booting works fine.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts b/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
index 2869be16bc6e..dfab2518df60 100644
--- a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
@@ -221,6 +221,8 @@
 						regulator-max-microvolt = <2950000>;
 
 						regulator-boot-on;
+						regulator-system-load = <200000>;
+						regulator-allow-set-load;
 					};
 
 					l21 {
-- 
2.23.0
