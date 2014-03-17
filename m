From: Bo Shen <voice.shen@atmel.com>
Subject: [PATCH 4/8] ARM: at91: sama5d3: add the missing property
Date: Mon, 17 Mar 2014 17:45:37 +0800
Message-ID: <1395049541-28128-5-git-send-email-voice.shen@atmel.com>
References: <1395049541-28128-1-git-send-email-voice.shen@atmel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1395049541-28128-1-git-send-email-voice.shen@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, nicolas.ferre@atmel.com
Cc: Bo Shen <voice.shen@atmel.com>, Andrew Victor <linux@maxim.org.za>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

If without the MICBIAS routing, the record don't work.
Add the missing MICBIAS routing to let record from mic working.

Signed-off-by: Bo Shen <voice.shen@atmel.com>
---

 arch/arm/boot/dts/sama5d3xmb.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/sama5d3xmb.dtsi b/arch/arm/boot/dts/sama5d3xmb.dtsi
index e1bd5767..0600153 100644
--- a/arch/arm/boot/dts/sama5d3xmb.dtsi
+++ b/arch/arm/boot/dts/sama5d3xmb.dtsi
@@ -166,6 +166,7 @@
 			"Headphone Jack", "HPOUTR",
 			"IN2L", "Line In Jack",
 			"IN2R", "Line In Jack",
+			"MICBIAS", "IN1L",
 			"IN1L", "Mic";
 
 		atmel,ssc-controller = <&ssc0>;
-- 
1.8.5.2
