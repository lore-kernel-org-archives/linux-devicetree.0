From: Guodong Xu <guodong.xu@linaro.org>
Subject: [PATCH v2 08/16] arm64: dts: hikey: enable i2c0 and i2c1 for working with mezzanine boards
Date: Sat,  2 Apr 2016 17:29:35 +0800
Message-ID: <1459589383-16914-9-git-send-email-guodong.xu@linaro.org>
References: <1459589383-16914-1-git-send-email-guodong.xu@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459589383-16914-1-git-send-email-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: xuwei5@hisilicon.com, mark.rutland@arm.com, robh@kernel.org, grant.likely@secretlab.ca, linus.walleij@linaro.org, arnd.bergmann@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kong.kongxinwei@hisilicon.com, Guodong Xu <guodong.xu@linaro.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Guodong Xu <guodong.xu@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index 5c9ee31..e00e9ec 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -42,6 +42,15 @@
 		      <0x00000000 0x06e00000 0x00000000 0x0060f000>,
 		      <0x00000000 0x07410000 0x00000000 0x36bf0000>;
 	};
+
+	soc {
+		i2c0: i2c@f7100000 {
+			status = "ok";
+		};
+		i2c1: i2c@f7101000 {
+			status = "ok";
+		};
+	};
 };
 
 &uart2 {
-- 
1.9.1
