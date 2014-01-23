From: Sherman Yin <syin@broadcom.com>
Subject: [PATCH v2 4/4] Update dtsi with new pinctrl compatible string
Date: Thu, 23 Jan 2014 12:44:47 -0800
Message-ID: <1390509887-19278-5-git-send-email-syin@broadcom.com>
References: <1390343886-25852-1-git-send-email-syin@broadcom.com>
 <1390509887-19278-1-git-send-email-syin@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1390509887-19278-1-git-send-email-syin@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Christian Daudt <bcm@fixthebug.org>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Matt Porter <matt.porter@linaro.org>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, Sherman Yin <syin@broadcom.com>
List-Id: devicetree@vger.kernel.org

This commit updates bcm11351.dtsi with the new compatible string for
the same driver.

Signed-off-by: Sherman Yin <syin@broadcom.com>
Reviewed-by: Matt Porter <mporter@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/bcm11351.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm11351.dtsi b/arch/arm/boot/dts/bcm11351.dtsi
index dd8e878..6c183f3 100644
--- a/arch/arm/boot/dts/bcm11351.dtsi
+++ b/arch/arm/boot/dts/bcm11351.dtsi
@@ -143,7 +143,7 @@
 	};
 
 	pinctrl@35004800 {
-		compatible = "brcm,capri-pinctrl";
+		compatible = "brcm,bcm11351-pinctrl";
 		reg = <0x35004800 0x430>;
 	};
 };
-- 
1.7.9.5
