Return-Path: <SRS0=Nyxc=IT=cogentembedded.com=sergei.shtylyov@kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] gpio-rcar: document R8A77980 bindings
Message-ID: <529bc49b-e258-20ae-fe97-6d0abcec39ec@cogentembedded.com>
Date: Fri, 1 Jun 2018 23:13:47 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
List-ID: <devicetree@vger.kernel.org>

Renesas R-Car V3H (R8A77980) SoC also has the R-Car gen3 compatible GPIO
controllers, so document the SoC specific bindings.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'devel' branch of Linus Walleij's 'linux-gpio.git'
repo.

 Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt |    1 +
 1 file changed, 1 insertion(+)

Index: linux-gpio/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
===================================================================
--- linux-gpio.orig/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
+++ linux-gpio/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
@@ -17,6 +17,7 @@ Required Properties:
     - "renesas,gpio-r8a7796": for R8A7796 (R-Car M3-W) compatible GPIO controller.
     - "renesas,gpio-r8a77965": for R8A77965 (R-Car M3-N) compatible GPIO controller.
     - "renesas,gpio-r8a77970": for R8A77970 (R-Car V3M) compatible GPIO controller.
+    - "renesas,gpio-r8a77980": for R8A77980 (R-Car V3H) compatible GPIO controller.
     - "renesas,gpio-r8a77990": for R8A77990 (R-Car E3) compatible GPIO controller.
     - "renesas,gpio-r8a77995": for R8A77995 (R-Car D3) compatible GPIO controller.
     - "renesas,rcar-gen1-gpio": for a generic R-Car Gen1 GPIO controller.
