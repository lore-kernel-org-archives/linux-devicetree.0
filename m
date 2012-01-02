From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCHv3 1/3] gpio: add a driver for the Synopsys DesignWare APB
 GPIO block
Date: Mon, 2 Jan 2012 13:51:45 +0000
Message-ID: <20120102135145.GA25420@page>
References: <1325508798-25439-1-git-send-email-jamie@jamieiles.com>
 <1325508798-25439-2-git-send-email-jamie@jamieiles.com>
 <20120102132500.GB18443@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120102132500.GB18443-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

On Mon, Jan 02, 2012 at 01:25:00PM +0000, Mark Brown wrote:
> On Mon, Jan 02, 2012 at 12:53:16PM +0000, Jamie Iles wrote:
> > The Synopsys DesignWare block is used in some ARM devices (picoxcell)
> > and can be configured to provide multiple banks of GPIO pins.
> > 
> > v3:	- depend on rather than select IRQ_DOMAIN
> > 	- split IRQ support into a separate patch
> > v2:	- use Rob Herring's irqdomain in generic irq chip patches
> > 	- use reg property to indicate bank index
> > 	- support irqs on both edges based on LinusW's u300 driver
> 
> Put stuff like this after the ---, it shouldn't end up in git history.

Grant (and others I believe) have asked to have it above the separator 
in the past to ensure that it does end up in the history.  This helps 
make it clear what version got applied and it's a lot easier for patch 
authors to manage rather than keeping it out of band.

> > +- #interrupt-cells : Specifies the number of cells needed to encode an
> > +interrupt.  Shall be set to 2.  The first cell defines the interrupt number,
> > +the second encodes the triger flags encoded as:
> 
> > +	bits[3:0] trigger type and level flags.
> > +		1 = low-to-high edge triggered
> > +		2 = high-to-low edge triggered
> > +		4 = active high level-sensitive
> > +		8 = active low level-sensitive
> 
> This looks like a straight mapping of the Linux constants to device
> tree.  This seems sensible and reasonable and since we're forced to use
> magic numbers by the binding it'd be really good if we could standardise
> on using this for new drivers to reduce the pain for people writing and
> reading device tree bindings.  To help with that could you factor this
> out into a separate document that other drivers can reference?

Something like this?

diff --git a/Documentation/devicetree/bindings/arm/gic.txt b/Documentation/devicetree/bindings/arm/gic.txt
index 9b4b82a..d13f7ce 100644
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
diff --git a/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt b/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
index dccc113..73adf37 100644
--- a/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
@@ -21,14 +21,8 @@ Optional properties:
 controller.
 - #interrupt-cells : Specifies the number of cells needed to encode an
 interrupt.  Shall be set to 2.  The first cell defines the interrupt number,
-the second encodes the triger flags encoded as:
-
-	bits[3:0] trigger type and level flags.
-		1 = low-to-high edge triggered
-		2 = high-to-low edge triggered
-		4 = active high level-sensitive
-		8 = active low level-sensitive
-
+the second encodes the triger flags encoded as described in
+Documentation/devicetree/bindings/interrupts.txt
 - interrupt-parent : The parent interrupt controller.
 - interrupts : The interrupts to the parent controller raised when GPIOs
 generate the interrupts.
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

Jamie
