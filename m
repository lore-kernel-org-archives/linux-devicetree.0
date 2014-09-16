From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH RESEND] ARM: DTS: correct the capability string for mmc0
Date: Tue, 16 Sep 2014 14:20:09 +0530
Message-ID: <1410857409-24767-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, jh80.chung@samsung.com, tgih.jun@samsung.com, javier.martinez@collabora.co.uk, khilman@linaro.org, Naveen Krishna Chatradhi <ch.naveen@samsung.com>
List-Id: devicetree@vger.kernel.org

From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>

MMC capability for HS200 is parsed in mmc/core/host.c as
dts string "mmc-hs200-1_8v".

This patch corrects the dts string for Exynos5420 based peach-pit
and Exynos5800 based peach-pi boards.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
---

Hi Kukjin,

As commented by Doug earlier for this patch, the two patches required
  -- mmc: dw_mmc: Make sure we don't get stuck when we get an error
  -- mmc: dw_mmc: change to use recommended reset procedure
are now merged in upstream.
So you can go ahead and pick this change.

 arch/arm/boot/dts/exynos5420-peach-pit.dts |    2 +-
 arch/arm/boot/dts/exynos5800-peach-pi.dts  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index 9a23382..e52ed04 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -560,7 +560,7 @@
 	status = "okay";
 	num-slots = <1>;
 	broken-cd;
-	caps2-mmc-hs200-1_8v;
+	mmc-hs200-1_8v;
 	cap-mmc-highspeed;
 	non-removable;
 	card-detect-delay = <200>;
diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index 1d31c81..8616fbd 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -548,7 +548,7 @@
 	status = "okay";
 	num-slots = <1>;
 	broken-cd;
-	caps2-mmc-hs200-1_8v;
+	mmc-hs200-1_8v;
 	cap-mmc-highspeed;
 	non-removable;
 	card-detect-delay = <200>;
-- 
1.7.10.4
