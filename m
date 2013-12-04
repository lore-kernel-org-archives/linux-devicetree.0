From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH 1/7] dt-bindings: add Calxeda ECX-3000 clock binding
Date: Wed,  4 Dec 2013 17:35:21 -0600
Message-ID: <1386200127-23143-2-git-send-email-robherring2@gmail.com>
References: <1386200127-23143-1-git-send-email-robherring2@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1386200127-23143-1-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mike Turquette <mturquette@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring@calxeda.com>

Add "calxeda,ecx-3000-pll-clock" compatible property for Calxeda ECX-3000
series PLLs.

Signed-off-by: Rob Herring <rob.herring@calxeda.com>
Cc: Mike Turquette <mturquette@linaro.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
---
 Documentation/devicetree/bindings/clock/calxeda.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/calxeda.txt b/Documentation/devicetree/bindings/clock/calxeda.txt
index 0a6ac1b..7ebc89c 100644
--- a/Documentation/devicetree/bindings/clock/calxeda.txt
+++ b/Documentation/devicetree/bindings/clock/calxeda.txt
@@ -6,7 +6,7 @@ This binding uses the common clock binding[1].
 
 Required properties:
 - compatible : shall be one of the following:
-	"calxeda,hb-pll-clock" - for a PLL clock
+	"calxeda,ecx-3000-pll-clock" or "calxeda,hb-pll-clock" - for a PLL clock
 	"calxeda,hb-a9periph-clock" - The A9 peripheral clock divided from the
 		A9 clock.
 	"calxeda,hb-a9bus-clock" - The A9 bus clock divided from the A9 clock.
-- 
1.8.3.2
