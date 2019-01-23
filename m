From: John Stultz <john.stultz@linaro.org>
Subject: [PATCH] arm64: dts: hikey: Revert "Enable HS200 mode on eMMC"
Date: Wed, 23 Jan 2019 12:06:06 -0800
Message-ID: <1548273966-5889-1-git-send-email-john.stultz@linaro.org>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: lkml <linux-kernel@vger.kernel.org>
Cc: Alistair Strachan <astrachan@google.com>, Ryan Grachek <ryan@edited.us>, Wei Xu <xuwei5@hisilicon.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, "stable #4 . 17+" <stable@vger.kernel.org>, John Stultz <john.stultz@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Alistair Strachan <astrachan@google.com>

This reverts commit abd7d0972a192ee653efc7b151a6af69db58f2bb. This
change was already partially reverted by John Stultz in commit
9c6d26df1fae ("arm64: dts: hikey: Fix eMMC corruption regression").

This change appears to cause controller resets and block read failures
which prevents successful booting on some hikey boards.

Cc: Ryan Grachek <ryan@edited.us>
Cc: Wei Xu <xuwei5@hisilicon.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: stable <stable@vger.kernel.org> #4.17+
Signed-off-by: Alistair Strachan <astrachan@google.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index 6102350..7092460 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -300,7 +300,6 @@
 
 		dwmmc_0: dwmmc0@f723d000 {
 			cap-mmc-highspeed;
-			mmc-hs200-1_8v;
 			non-removable;
 			bus-width = <0x8>;
 			vmmc-supply = <&ldo19>;
-- 
2.7.4
