From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 2/2] mmc: pwrseq: Update document with multiple gpios support
Date: Wed, 28 Jan 2015 13:17:08 +0000
Message-ID: <1422451028-9417-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1422450981-9328-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <1422450981-9328-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-mmc-owner@vger.kernel.org
To: linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch updates the text and examples the mmc pwrseq document with multiple
gpios support. Typical example is WLAN and BT chips on SDIO bus.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.txt | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.txt b/Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.txt
index da333d9..1a86efa 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.txt
+++ b/Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.txt
@@ -8,13 +8,14 @@ Required properties:
 - compatible : contains "mmc-pwrseq-simple".
 
 Optional properties:
-- reset-gpios : contains a GPIO specifier. The reset GPIO is asserted at
-	initialization and prior we start the power up procedure of the card. It
+- reset-gpios : contains list of GPIO specifiers. The reset GPIOs are asserted at
+	initialization and prior we start the power up procedure of the card. They
 	will be de-asserted right after the power has been provided to the card.
 
 Example:
 
 	sdhci0_pwrseq {
 		compatible = "mmc-pwrseq-simple";
-		reset-gpios = <&gpio1 12 0>;
+		/* WLAN and BT reset */
+		reset-gpios = <&gpio1 12 0>, <&gpio1 14 0>;
 	}
-- 
1.9.1

