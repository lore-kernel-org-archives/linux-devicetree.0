From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH-REPOST] regulator: gpio: fix default of regulator-type property
Date: Wed, 30 Jul 2014 19:21:08 +0530
Message-ID: <1406728268-17725-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@linaro.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

As per driver, the absense of "regulator-type" default to voltage
type. Correct the document to say default is voltage instead of
current.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
Seems somehow this is missed for review, reposting it.

 Documentation/devicetree/bindings/regulator/gpio-regulator.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/gpio-regulator.txt b/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
index e5cac1e..dd1ed78 100644
--- a/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
@@ -13,7 +13,7 @@ Optional properties:
 - startup-delay-us	: Startup time in microseconds.
 - enable-active-high	: Polarity of GPIO is active high (default is low).
 - regulator-type	: Specifies what is being regulated, must be either
-			  "voltage" or "current", defaults to current.
+			  "voltage" or "current", defaults to voltage.
 
 Any property defined as part of the core regulator binding defined in
 regulator.txt can also be used.
-- 
1.8.1.5
