From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] bindings: update imx and mxs #gpio-cells
Date: Thu, 28 Jun 2012 11:15:37 +0800
Message-ID: <1340853337-4406-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Hui Wang <jason77.wang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The of_get_named_gpio_flags can retrieve the second cell of
gpio-specifier as the "flags".  The imx and mxs gpio driver do not
have their own .xlate callback, which means of_gpio_simple_xlate is
used and it's a 1:1 mapping between gpio controller flags and Linux
"enum of_gpio_flags".

Update imx and mxs bindings document to make it clear.

Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/gpio/fsl-imx-gpio.txt      |    5 +++--
 .../devicetree/bindings/gpio/gpio-mxs.txt          |    5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.txt b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.txt
index 4363ae4..5f360e7 100644
--- a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.txt
@@ -8,8 +8,9 @@ Required properties:
   by low 16 pins and the second one is for high 16 pins.
 - gpio-controller : Marks the device node as a gpio controller.
 - #gpio-cells : Should be two.  The first cell is the pin number and
-  the second cell is used to specify optional parameters (currently
-  unused).
+  the second cell is used to specify the gpio polarity:
+      0 = active high
+      1 = active low
 
 Example:
 
diff --git a/Documentation/devicetree/bindings/gpio/gpio-mxs.txt b/Documentation/devicetree/bindings/gpio/gpio-mxs.txt
index 0c35673..1e677a4 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mxs.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-mxs.txt
@@ -13,8 +13,9 @@ Required properties for GPIO node:
 - interrupts : Should be the port interrupt shared by all 32 pins.
 - gpio-controller : Marks the device node as a gpio controller.
 - #gpio-cells : Should be two.  The first cell is the pin number and
-  the second cell is used to specify optional parameters (currently
-  unused).
+  the second cell is used to specify the gpio polarity:
+      0 = active high
+      1 = active low
 - interrupt-controller: Marks the device node as an interrupt controller.
 - #interrupt-cells : Should be 2.  The first cell is the GPIO number.
   The second cell bits[3:0] is used to specify trigger type and level flags:
-- 
1.7.5.4
