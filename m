From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH 11/15] gpio: rcar: Add R-Car M3-N compatible string
Date: Tue, 13 Feb 2018 10:45:58 +0100
Message-ID: <1518515162-23663-12-git-send-email-jacopo+renesas@jmondi.org>
References: <1518515162-23663-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1518515162-23663-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: geert@linux-m68k.org, horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add compatible string for R-Car M3-N (r8a77965) in gpio-rcar.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt | 1 +
 drivers/gpio/gpio-rcar.c                                     | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
index 9474138..f2af897 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
+++ b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
@@ -14,6 +14,7 @@ Required Properties:
     - "renesas,gpio-r8a7794": for R8A7794 (R-Car E2) compatible GPIO controller.
     - "renesas,gpio-r8a7795": for R8A7795 (R-Car H3) compatible GPIO controller.
     - "renesas,gpio-r8a7796": for R8A7796 (R-Car M3-W) compatible GPIO controller.
+    - "renesas,gpio-r8a77965": for R8A77965 (R-Car M3-N) compatible GPIO controller.
     - "renesas,gpio-r8a77970": for R8A77970 (R-Car V3M) compatible GPIO controller.
     - "renesas,gpio-r8a77995": for R8A77995 (R-Car D3) compatible GPIO controller.
     - "renesas,rcar-gen1-gpio": for a generic R-Car Gen1 GPIO controller.
diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index f4c9176..3ee0ada 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -360,6 +360,10 @@ static const struct of_device_id gpio_rcar_of_table[] = {
 		/* Gen3 GPIO is identical to Gen2. */
 		.data = &gpio_rcar_info_gen2,
 	}, {
+		.compatible = "renesas,gpio-r8a77965",
+		/* Gen3 GPIO is identical to Gen2. */
+		.data = &gpio_rcar_info_gen2,
+	}, {
 		.compatible = "renesas,rcar-gen1-gpio",
 		.data = &gpio_rcar_info_gen1,
 	}, {
-- 
2.7.4
