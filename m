From: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Subject: [PATCH v5 4/5] watchdog: davinci: add "timeout-sec" property
Date: Wed, 4 Dec 2013 21:39:29 +0200
Message-ID: <1386185970-14488-5-git-send-email-ivan.khoronzhuk@ti.com>
References: <1386185970-14488-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1386185970-14488-1-git-send-email-ivan.khoronzhuk@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Santosh Shilimkar <santosh.shilimkar@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, wim@iguana.be, nsekhar@ti.com, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, Pawel.Moll@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, galak@kernel.crashing.org, rob.herring@calxeda.com, linux-kernel@vger.kernel.org, grant.likely@linaro.org, grygorii.strashko@ti.com, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
List-Id: devicetree@vger.kernel.org

Since Davinci WDT has been switched to use WDT core, it became able
to support timeout-sec property, so add it to it's binding description.

Acked-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
---
 .../devicetree/bindings/watchdog/davinci-wdt.txt   |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/davinci-wdt.txt b/Documentation/devicetree/bindings/watchdog/davinci-wdt.txt
index 75558cc..e450134 100644
--- a/Documentation/devicetree/bindings/watchdog/davinci-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/davinci-wdt.txt
@@ -4,9 +4,13 @@ Required properties:
 - compatible : Should be "ti,davinci-wdt"
 - reg : Should contain WDT registers location and length
 
+Optional properties:
+- timeout-sec : Contains the watchdog timeout in seconds
+
 Examples:
 
 wdt: wdt@2320000 {
 	compatible = "ti,davinci-wdt";
 	reg = <0x02320000 0x80>;
+	timeout-sec = <30>;
 };
-- 
1.7.9.5
