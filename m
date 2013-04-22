From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 4/4] ARM: dts: Enable TMU on SMDK4412 board
Date: Mon, 22 Apr 2013 10:02:55 +0530
Message-ID: <1366605175-19161-4-git-send-email-sachin.kamat@linaro.org>
References: <1366605175-19161-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1366605175-19161-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

Enables TMU on SMDK4412 board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
Dependent on:
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg17630.html
---
 arch/arm/boot/dts/exynos4412-smdk4412.dts |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-smdk4412.dts b/arch/arm/boot/dts/exynos4412-smdk4412.dts
index a8ba195..d0b80f2 100644
--- a/arch/arm/boot/dts/exynos4412-smdk4412.dts
+++ b/arch/arm/boot/dts/exynos4412-smdk4412.dts
@@ -27,6 +27,10 @@
 		bootargs ="root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M console=ttySAC1,115200 init=/linuxrc";
 	};
 
+	tmu@100C0000 {
+		status = "okay";
+	};
+
 	g2d@10800000 {
 		status = "okay";
 	};
-- 
1.7.9.5
