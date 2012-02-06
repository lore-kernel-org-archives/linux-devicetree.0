From: Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
Subject: [PATCH] doc: dt: Fix broken reference in gpio-leds documentation
Date: Mon,  6 Feb 2012 18:29:15 +0100
Message-ID: <1328549355-7000-1-git-send-email-tklauser@distanz.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

The gpios property is described in Documentation/devicetree/gpio.txt, so
reference this document.

Signed-off-by: Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
---
 Documentation/devicetree/bindings/gpio/led.txt |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/led.txt b/Documentation/devicetree/bindings/gpio/led.txt
index 141087c..fd2bd56 100644
--- a/Documentation/devicetree/bindings/gpio/led.txt
+++ b/Documentation/devicetree/bindings/gpio/led.txt
@@ -7,9 +7,9 @@ Each LED is represented as a sub-node of the gpio-leds device.  Each
 node's name represents the name of the corresponding LED.
 
 LED sub-node properties:
-- gpios :  Should specify the LED's GPIO, see "Specifying GPIO information
-  for devices" in Documentation/devicetree/booting-without-of.txt.  Active
-  low LEDs should be indicated using flags in the GPIO specifier.
+- gpios :  Should specify the LED's GPIO, see "gpios property" in
+  Documentation/devicetree/gpio.txt.  Active low LEDs should be
+  indicated using flags in the GPIO specifier.
 - label :  (optional) The label for this LED.  If omitted, the label is
   taken from the node name (excluding the unit address).
 - linux,default-trigger :  (optional) This parameter, if present, is a
-- 
1.7.5.4
