From: Caesar Wang <wxt@rock-chips.com>
Subject: [PATCH v2 05/12] mmc: pwrseq: Document optional exteral vcc for the simple power sequence
Date: Thu,  7 Jan 2016 16:25:48 +0800
Message-ID: <1452155155-16232-6-git-send-email-wxt@rock-chips.com>
References: <1452155155-16232-1-git-send-email-wxt@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452155155-16232-1-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-rockchip@lists.infradead.org, leecam@google.com, leozwang@google.com, keescook@google.com, Caesar Wang <wxt@rock-chips.com>, Javier Martinez Canillas <javier@osg.samsung.com>, devicetree@vger.kernel.org, Andreas Fenkart <afenkart@gmail.com>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

This patch adds the exteral vcc optional for the simple power sequence.

Some WLAN chips attached to a SDIO interface, need an external vcc
to be operational. Since this is very common, extend the simple MMC
power sequence DT binding to support an optional exteral vcc.

Signed-off-by: Caesar Wang <wxt@rock-chips.com>
---

Changes in v2: None

 Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.txt b/Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.txt
index ce0e767..fdcc6a1 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.txt
+++ b/Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.txt
@@ -12,6 +12,7 @@ Optional properties:
 	at initialization and prior we start the power up procedure of the card.
 	They will be de-asserted right after the power has been provided to the
 	card.
+- ext-vcc-supply : Regulator to drive (independent) card VCC.
 - clocks : Must contain an entry for the entry in clock-names.
   See ../clocks/clock-bindings.txt for details.
 - clock-names : Must include the following entry:
@@ -19,9 +20,17 @@ Optional properties:
 
 Example:
 
+	wifi_regulator: wifi-regulator {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio0 26 GPIO_ACTIVE_HIGH>;
+		regulator-name = "wifi_regulator";
+	};
+
 	sdhci0_pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&gpio1 12 GPIO_ACTIVE_LOW>;
+		ext-vcc-supply = <&wifi_regulator>;
 		clocks = <&clk_32768_ck>;
 		clock-names = "ext_clock";
 	}
-- 
1.9.1
