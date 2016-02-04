From: Wenyou Yang <wenyou.yang@atmel.com>
Subject: [PATCH v2 4/4] Documentation: atmel-pmc: add DT bindings for fast startup
Date: Thu, 4 Feb 2016 15:37:51 +0800
Message-ID: <1454571471-4434-5-git-send-email-wenyou.yang@atmel.com>
References: <1454571471-4434-1-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1454571471-4434-1-git-send-email-wenyou.yang@atmel.com>
Sender: linux-clk-owner@vger.kernel.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Russell King <linux@arm.linux.org.uk>
Cc: linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Brown <broonie@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Wenyou Yang <wenyou.yang@atmel.com>
List-Id: devicetree@vger.kernel.org

Add DT bindings to configurate the PMC_FSMR and PMC_FSPR registers
to trigger a fast restart signal to PMC.

Signed-off-by: Wenyou Yang <wenyou.yang@atmel.com>
---

Changes in v2:
 - change the property name and property description.

 .../devicetree/bindings/arm/atmel-pmc.txt          |   63 ++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel-pmc.txt b/Documentation/devicetree/bindings/arm/atmel-pmc.txt
index 795cc78..1b3833b 100644
--- a/Documentation/devicetree/bindings/arm/atmel-pmc.txt
+++ b/Documentation/devicetree/bindings/arm/atmel-pmc.txt
@@ -12,3 +12,66 @@ Examples:
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
+- compatible: Should be "atmel,sama5d2-pmc-fast-startup".
+
+optional properties:
+- atmel,wkup-trigger: boolean, WKUP input can trigger a fast restart signal.
+- atmel,secumod-trigger: boolean, SECUMOD can trigger a fast restart signal.
+- atmel,piobu0-trigger: boolean, PIOBU0 input can trigger a fast restart signal.
+- atmel,piobu1-trigger: boolean, PIOBU1 input can trigger a fast restart signal.
+- atmel,piobu2-trigger: boolean, PIOBU2 input can trigger a fast restart signal.
+- atmel,piobu3-trigger: boolean, PIOBU3 input can trigger a fast restart signal.
+- atmel,piobu4-trigger: boolean, PIOBU4 input can trigger a fast restart signal.
+- atmel,piobu5-trigger: boolean, PIOBU5 input can trigger a fast restart signal.
+- atmel,piobu6-trigger: boolean, PIOBU6 input can trigger a fast restart signal.
+- atmel,piobu7-trigger: boolean, PIOBU7 input can trigger a fast restart signal.
+- atmel,gmac-wol-trigger: boolean, GMAC_WOL can trigger a fast restart signal.
+- atmel,rtc-alarm-trigger: boolean, RTC alarm can trigger a fast restart signal.
+- atmel,usb-resume-trigger: boolean, USB resume can trigger a fast restart
+  signal.
+- atmel,sdmmc-cd-trigger: boolean, SDMMC card detect can trigger a fast
+  restart signal.
+- atmel,rxlp-match-trigger: boolean, Matching condition on RXLP can trigger
+  a fast restart signal.
+- atmel,acc-comparison-trigger: boolean, ACC comparison can trigger a fast
+  restart signal.
+
+- atmel,wkup-trigger-level: string, defines the active polarity of the wake-up
+  input. Supported values are: "high" or "low".
+- atmel,piobu0-trigger-level: string, defines the active polarity of
+  the corresponding PIOBU0 input. Supported values are: "high" or "low".
+- atmel,piobu1-trigger-level: string, defines the active polarity of
+  the corresponding PIOBU1 input. Supported values are: "high" or "low".
+- atmel,piobu2-trigger-level: string, defines the active polarity of
+  the corresponding PIOBU2 input. Supported values are: "high" or "low".
+- atmel,piobu3-trigger-level: string, defines the active polarity of
+  the corresponding PIOBU3 input. Supported values are: "high" or "low".
+- atmel,piobu4-trigger-level: string, defines the active polarity of
+  the corresponding PIOBU4 input. Supported values are: "high" or "low".
+- atmel,piobu5-trigger-level: string, defines the active polarity of
+  the corresponding PIOBU5 input. Supported values are: "high" or "low".
+- atmel,piobu6-trigger-level: string, defines the active polarity of
+  the corresponding PIOBU6 input. Supported values are: "high" or "low".
+- atmel,piobu7-trigger-level: string, defines the active polarity of
+  the corresponding PIOBU7 input. Supported values are: "high" or "low".
+
+Example:
+
+	pmc: pmc@f0014000 {
+		compatible = "atmel,sama5d2-pmc";
+		reg = <0xf0014000 0x160>;
+
+		pmc_fast_restart {
+			compatible = "atmel,sama5d2-pmc-fast-startup";
+			atmel,wkup-trigger;
+			atmel,rtc-alarm-trigger;
+			atmel,wkup-trigger-level = "low";
+		};
+	};
-- 
1.7.9.5

