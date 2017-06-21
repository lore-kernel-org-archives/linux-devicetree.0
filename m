From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2] gpio: rcar: Add R8A7743 (RZ/G1M) support
Date: Wed, 21 Jun 2017 15:27:09 +0100
Message-ID: <1498055229-42052-1-git-send-email-biju.das@bp.renesas.com>
References: <1497619944-61410-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1497619944-61410-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Chris Paterson <chris.paterson2@renesas.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Renesas RZ/G1M (R8A7743) SoC GPIO blocks are identical to the R-Car Gen2
family. Add support for its GPIO controllers.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
---
v1->v2
* Modified the text "RZ-G1M" to "RZ/G1M"

 Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt | 1 +
 drivers/gpio/gpio-rcar.c                                     | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
index 7c1ab3b..6826a37 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
+++ b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
@@ -3,6 +3,7 @@
 Required Properties:
 
   - compatible: should contain one of the following.
+    - "renesas,gpio-r8a7743": for R8A7743 (RZ/G1M) compatible GPIO controller.
     - "renesas,gpio-r8a7778": for R8A7778 (R-Mobile M1) compatible GPIO controller.
     - "renesas,gpio-r8a7779": for R8A7779 (R-Car H1) compatible GPIO controller.
     - "renesas,gpio-r8a7790": for R8A7790 (R-Car H2) compatible GPIO controller.
diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 31ad288..4a1536a 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -344,6 +344,10 @@ struct gpio_rcar_info {
 
 static const struct of_device_id gpio_rcar_of_table[] = {
 	{
+		.compatible = "renesas,gpio-r8a7743",
+		/* RZ/G1 GPIO is identical to R-Car Gen2. */
+		.data = &gpio_rcar_info_gen2,
+	}, {
 		.compatible = "renesas,gpio-r8a7790",
 		.data = &gpio_rcar_info_gen2,
 	}, {
-- 
1.9.1

