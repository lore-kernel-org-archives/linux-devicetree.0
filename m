From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/4] mfd: improve mc13xxx dt binding document
Date: Wed, 21 Dec 2011 23:00:44 +0800
Message-ID: <1324479647-4580-2-git-send-email-shawn.guo@linaro.org>
References: <1324479647-4580-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1324479647-4580-1-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

It improves mc13xxx dt binding document on how the regulator name
is being used for binding a mc13892 regulator device.

Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
 Documentation/devicetree/bindings/mfd/mc13xxx.txt |   31 +++++++++++++++++++--
 1 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mc13xxx.txt b/Documentation/devicetree/bindings/mfd/mc13xxx.txt
index 4ed46a61..19f6af4 100644
--- a/Documentation/devicetree/bindings/mfd/mc13xxx.txt
+++ b/Documentation/devicetree/bindings/mfd/mc13xxx.txt
@@ -10,9 +10,34 @@ Optional properties:
 - fsl,mc13xxx-uses-touch : Indicate the touchscreen controller is being used
 
 Sub-nodes:
-- regulators : Contain the regulator nodes.  The name of regulator node
-  is being used by mc13xxx regulator driver to find the correct relator
-  device.
+- regulators : Contain the regulator nodes.  The MC13892 regulators are
+  bound using their names as listed below with their registers and bits
+  for enabling.
+
+    vcoincell : regulator VCOINCELL (register 13, bit 23)
+    sw1       : regulator SW1	    (register 24, bit 0)
+    sw2       : regulator SW2	    (register 25, bit 0)
+    sw3       : regulator SW3	    (register 26, bit 0)
+    sw4       : regulator SW4	    (register 27, bit 0)
+    swbst     : regulator SWBST	    (register 29, bit 20)
+    vgen1     : regulator VGEN1	    (register 32, bit 0)
+    viohi     : regulator VIOHI	    (register 32, bit 3)
+    vdig      : regulator VDIG	    (register 32, bit 9)
+    vgen2     : regulator VGEN2	    (register 32, bit 12)
+    vpll      : regulator VPLL	    (register 32, bit 15)
+    vusb2     : regulator VUSB2	    (register 32, bit 18)
+    vgen3     : regulator VGEN3	    (register 33, bit 0)
+    vcam      : regulator VCAM	    (register 33, bit 6)
+    vvideo    : regulator VVIDEO    (register 33, bit 12)
+    vaudio    : regulator VAUDIO    (register 33, bit 15)
+    vsd       : regulator VSD	    (register 33, bit 18)
+    gpo1      : regulator GPO1	    (register 34, bit 6)
+    gpo2      : regulator GPO2	    (register 34, bit 8)
+    gpo3      : regulator GPO3	    (register 34, bit 10)
+    gpo4      : regulator GPO4	    (register 34, bit 12)
+    pwgt1spi  : regulator PWGT1SPI  (register 34, bit 15)
+    pwgt2spi  : regulator PWGT2SPI  (register 34, bit 16)
+    vusb      : regulator VUSB	    (register 50, bit 3)
 
   The bindings details of individual regulator device can be found in:
   Documentation/devicetree/bindings/regulator/regulator.txt
-- 
1.7.4.1
