From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v3 04/11] mfd: syscon: Add Atmel SMC binding doc
Date: Mon,  1 Dec 2014 11:27:20 +0100
Message-ID: <1417429647-3419-5-git-send-email-boris.brezillon@free-electrons.com>
References: <1417429647-3419-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1417429647-3419-1-git-send-email-boris.brezillon@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Andrew Victor <linux@maxim.org.za>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Boris Brezillon <boris.brezillon@free-electrons.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The SMC registers are used to configure Atmel EBI (External Bus Interface)
to interface with standard memory devices (NAND, NOR, SRAM or specialized
devices like FPGAs).

Declare this memory region as a syscon, so that different drivers can
configure the SMC interface (mostly timing configuration) according to
their need.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Acked-by: Lee Jones <lee.jones@linaro.org>
---
 Documentation/devicetree/bindings/mfd/atmel-smc.txt | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/atmel-smc.txt

diff --git a/Documentation/devicetree/bindings/mfd/atmel-smc.txt b/Documentation/devicetree/bindings/mfd/atmel-smc.txt
new file mode 100644
index 0000000..26eeed3
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/atmel-smc.txt
@@ -0,0 +1,19 @@
+* Device tree bindings for Atmel SMC (Static Memory Controller)
+
+The SMC registers are used to configure Atmel EBI (External Bus Interface)
+to interface with standard memory devices (NAND, NOR, SRAM or specialized
+devices like FPGAs).
+
+Required properties:
+- compatible:		Should be one of the following
+			"atmel,at91sam9260-smc", "syscon"
+			"atmel,sama5d3-smc", "syscon"
+- reg:			Contains offset/length value of the SMC memory
+			region.
+
+Example:
+
+smc: smc@ffffc000 {
+	compatible = "atmel,sama5d3-smc", "syscon";
+	reg = <0xffffc000 0x1000>;
+};
-- 
1.9.1
