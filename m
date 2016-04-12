From: Guodong Xu <guodong.xu@linaro.org>
Subject: [PATCH v4 08/16] arm64: dts: hikey: enable i2c0 and i2c1 for working with mezzanine boards
Date: Wed, 13 Apr 2016 07:55:44 +0800
Message-ID: <1460505352-13157-9-git-send-email-guodong.xu@linaro.org>
References: <1460505352-13157-1-git-send-email-guodong.xu@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460505352-13157-1-git-send-email-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: xuwei5@hisilicon.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, catalin.marinas@arm.com, will.deacon@arm.com, haojian.zhuang@linaro.org, linus.walleij@linaro.org, tony@atomide.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Guodong Xu <guodong.xu@linaro.org>
List-Id: devicetree@vger.kernel.org

In HiKey board dts file, enable i2c0 and i2c1 for working with 96boards' LS
mezzanine.

Signed-off-by: Guodong Xu <guodong.xu@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index 7545e36..3dbf51b 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -45,6 +45,14 @@
 		spi0: spi@f7106000 {
 			status = "ok";
 		};
+
+		i2c0: i2c@f7100000 {
+			status = "ok";
+		};
+
+		i2c1: i2c@f7101000 {
+			status = "ok";
+		};
 	};
 };
 
-- 
1.9.1
