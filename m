From: Wenyou Yang <wenyou.yang@atmel.com>
Subject: [PATCH v5 4/5] Documentation: atmel-pmc: add DT bindings for fast startup
Date: Wed, 16 Mar 2016 14:58:08 +0800
Message-ID: <1458111489-23774-5-git-send-email-wenyou.yang@atmel.com>
References: <1458111489-23774-1-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1458111489-23774-1-git-send-email-wenyou.yang@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Russell King <linux@arm.linux.org.uk>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Brown <broonie@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Wenyou Yang <wenyou.yang@atmel.com>
List-Id: devicetree@vger.kernel.org

Add DT bindings to configurate the PMC_FSMR and PMC_FSPR registers
to trigger a fast restart signal to PMC.

Signed-off-by: Wenyou Yang <wenyou.yang@atmel.com>
Acked-by: Rob Herring <robh+dt@kernel.org>
---

Changes in v5:
 - due to the DT property expression change, update the binding
   document.

Changes in v4:
 - add Acked-by tag.

Changes in v3:
 - update the property description.

Changes in v2:
 - change the property name and property description.

 .../devicetree/bindings/arm/atmel-pmc.txt          |   52 ++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel-pmc.txt b/Documentation/devicetree/bindings/arm/atmel-pmc.txt
index 795cc78..76fdc66 100644
--- a/Documentation/devicetree/bindings/arm/atmel-pmc.txt
+++ b/Documentation/devicetree/bindings/arm/atmel-pmc.txt
@@ -12,3 +12,55 @@ Examples:
 		compatible = "atmel,at91rm9200-pmc";
 		reg = <0xfffffc00 0x100>;
 	};
+
+PMC Fast Startup Signals
+
+The PMC Fast Start Signals are used as the wake up source to trigger the PMC
+to wake up the system from the ULP1 mode.
+
+required properties:
+- compatible: should be "atmel,sama5d2-pmc-fast-startup".
+
+optional properties:
+- atmel,wakeup-rtc-timer: boolean to enable RTC alarm wake-up.
+- atmel,wakeup-usb-resume: boolean to enable USB resume wake-up.
+- atmel,wakeup-sdmmc-cd: boolean to enable SDMMC card detect wake-up.
+- atmel,wakeup-rxlp-match: boolean to enable RXLP matching condition wake-up.
+- atmel,wakeup-acc-comparison: boolean to enable ACC comparison wake-up.
+
+The node contains child nodes for each wake-up input pin that the platform uses.
+
+Input nodes
+
+Required properties:
+- reg: should contain the wake-up input index [0 - 10], to enable
+  the corresponding wake-up input.
+
+Optional properties:
+- atmel,wakeup-active-high: boolean to declare the corresponding wake-up
+  input described by the child be active high.
+  The default is to be active low.
+
+Example:
+
+	pmc: pmc@f0014000 {
+		compatible = "atmel,sama5d2-pmc";
+		reg = <0xf0014000 0x160>;
+
+		pmc_fast_restart {
+			compatible = "atmel,sama5d2-pmc-fast-startup";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			atmel,wakeup-rtc-timer;
+
+			wkpin: input@0 {
+				reg = <0>;
+			};
+
+			gmac_wol: input@10 {
+				reg = <10>;
+				atmel,wakeup-active-high;
+			};
+		};
+	};
-- 
1.7.9.5
