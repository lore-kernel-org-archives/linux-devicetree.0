From: Bo Shen <voice.shen@atmel.com>
Subject: [PATCH 8/8] ARM: at91/dt: add clock properties to the wm8904 codec node
Date: Mon, 17 Mar 2014 17:45:41 +0800
Message-ID: <1395049541-28128-9-git-send-email-voice.shen@atmel.com>
References: <1395049541-28128-1-git-send-email-voice.shen@atmel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1395049541-28128-1-git-send-email-voice.shen@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, nicolas.ferre@atmel.com
Cc: Boris BREZILLON <b.brezillon@overkiz.com>, Bo Shen <voice.shen@atmel.com>, Andrew Victor <linux@maxim.org.za>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Boris BREZILLON <b.brezillon@overkiz.com>

Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>
Signed-off-by: Bo Shen <voice.shen@atmel.com>
---

 arch/arm/boot/dts/sama5d3xmb.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/sama5d3xmb.dtsi b/arch/arm/boot/dts/sama5d3xmb.dtsi
index 306eef0..d9bb413 100644
--- a/arch/arm/boot/dts/sama5d3xmb.dtsi
+++ b/arch/arm/boot/dts/sama5d3xmb.dtsi
@@ -163,6 +163,8 @@
 		compatible = "atmel,asoc-wm8904";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_pck0_as_audio_mck>;
+		clocks = <&pck0>;
+		clock-names = "pck0";
 
 		atmel,model = "wm8904 @ SAMA5D3EK";
 		atmel,audio-routing =
-- 
1.8.5.2
