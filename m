From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: [PATCHv5 1/4] of: document common interrupt controller details
Date: Thu,  5 Jan 2012 01:23:36 +0000
Message-ID: <1325726619-31796-2-git-send-email-jamie@jamieiles.com>
References: <1325726619-31796-1-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1325726619-31796-1-git-send-email-jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

It's common for interrupt controllers to need to encode interrupt
trigger types and the Linux specific types seem common.  Document these
in a centralized place so that they don't get reinvented each time a new
controller is added.

Suggested-by: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/gic.txt    |    8 ++------
 Documentation/devicetree/bindings/interrupts.txt |   17 +++++++++++++++++
 2 files changed, 19 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupts.txt

diff --git a/Documentation/devicetree/bindings/arm/gic.txt b/Documentation/devicetree/bindings/arm/gic.txt
index 52916b4..50f991f 100644
--- a/Documentation/devicetree/bindings/arm/gic.txt
+++ b/Documentation/devicetree/bindings/arm/gic.txt
@@ -24,12 +24,8 @@ Main node required properties:
   SPI interrupts are in the range [0-987].  PPI interrupts are in the
   range [0-15].
 
-  The 3rd cell is the flags, encoded as follows:
-	bits[3:0] trigger type and level flags.
-		1 = low-to-high edge triggered
-		2 = high-to-low edge triggered
-		4 = active high level-sensitive
-		8 = active low level-sensitive
+  The 3rd cell is the flags, encoded as the trigger masks from
+  Documentation/devicetree/bindings/interrupts.txt and:
 	bits[15:8] PPI interrupt cpu mask.  Each bit corresponds to each of
 	the 8 possible cpus attached to the GIC.  A bit set to '1' indicated
 	the interrupt is wired to that CPU.  Only valid for PPI interrupts.
diff --git a/Documentation/devicetree/bindings/interrupts.txt b/Documentation/devicetree/bindings/interrupts.txt
new file mode 100644
index 0000000..1545941
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupts.txt
@@ -0,0 +1,17 @@
+Common Interrupt Binding Details
+
+For controllers that need to encode trigger types and senses, where possible
+it is encouraged to use the following encoding (a direct mapping of the
+IRQF_TRIGGER_* constants in include/linux/interrupt.h):
+
+	bits[3:0] trigger type and level flags.
+		1 = low-to-high edge triggered
+		2 = high-to-low edge triggered
+		4 = active high level-sensitive
+		8 = active low level-sensitive
+
+For example, an interrupt may be encoded as (with #interrupt-cells = <2>):
+
+	interrupts = <4 0x3>;
+
+to have interrupt 4 raise an interrupt on both edges of the input.
-- 
1.7.5.4
