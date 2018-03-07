From: Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 3/6] dt-bindings: soc: Add a binding for the Broadcom VCHIQ
 services.
Date: Wed,  7 Mar 2018 10:57:13 -0800
Message-ID: <20180307185716.17449-3-eric@anholt.net>
References: <20180307185716.17449-1-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180307185716.17449-1-eric@anholt.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Phil Elwell <phil@raspberrypi.org>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The VCHIQ communication channel can be provided by BCM283x and Capri
SoCs, to communicate with the VPU-side OS services.

Signed-off-by: Eric Anholt <eric@anholt.net>
---

v2: dropped firmware property, added cache-line-size.

 .../bindings/soc/bcm/brcm,bcm2835-vchiq.txt        | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt

diff --git a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt
new file mode 100644
index 000000000000..cdef4abc5e47
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt
@@ -0,0 +1,28 @@
+Broadcom VCHIQ firmware services
+
+Required properties:
+
+- compatible:	Should be "brcm,bcm2835-vchiq"
+- reg:		Physical base address and length of the doorbell register pair
+- interrupts:	The interrupt number
+		  See bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
+
+Optional properties:
+
+- cache-line-size:
+		Size of L2 cache lines.  The VPU firmware detects
+		  this property and overrides it with the actual L2
+		  cache line size it's using when loading the
+		  device-tree.  Determines the required alignment of
+		  offsets/sizes of VCHIQ pagelists.  If missing, the
+		  firmware assumes an older kernel using 32-byte
+		  alignment.
+
+Example:
+
+vchiq@7e00b840 {
+	compatible = "brcm,bcm2835-vchiq";
+	reg = <0x7e00b840 0xf>;
+	interrupts = <0 2>;
+	cache-line-size: <32>;
+};
-- 
2.16.2
